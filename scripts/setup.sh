#!/usr/bin/env bash

set -e

echo "=== Verification / Installation des dependances Linux ==="

# 1. Installation d'Opam si absent
if ! command -v opam > /dev/null 2>&1; then
    echo "Opam non trouve. Installation..."
    if [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt install -y opam build-essential pkg-config
    elif [ -f /etc/arch-release ]; then
        sudo pacman -Sy --needed opam base-devel pkg-config
    elif [ -f /etc/fedora-release ]; then
        sudo dnf install -y opam gcc make pkg-config
    else
        echo "Distribution non supportee. Installez opam manuellement."
        exit 1
    fi
    opam init --bare -a -y
fi

# 2. Verification du switch OCaml
if ! opam switch show > /dev/null 2>&1; then
    echo "Creation du switch OCaml (4.14.0)..."
    opam switch create 4.14.0
fi

eval $(opam env)

# 3. Installation des paquets OCaml
if ! command -v dune > /dev/null 2>&1; then
    echo "Installation de dune..."
    opam install -y dune
fi

if ! ocamlfind query yojson > /dev/null 2>&1; then
    echo "Installation de yojson..."
    opam install -y yojson
fi

# 4. Preparation des fichiers Dune
if [ ! -f dune-project ]; then
    echo "Generation de dune-project..."
    echo '(lang dune 3.0)' > dune-project
    echo '(name ft_turing)' >> dune-project
fi

if [ ! -f src/dune ]; then
    echo "Generation de src/dune..."
    mkdir -p src
    echo '(executable' > src/dune
    echo ' (name main)' >> src/dune
    echo ' (libraries yojson))' >> src/dune
fi