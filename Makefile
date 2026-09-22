NAME		= ft_turing
BUILD_DIR	= _build
EXEC		= $(BUILD_DIR)/default/src/main.exe

all: check_deps
	@opam exec -- dune build
	@cp $(EXEC) $(NAME)
	@echo "Build successful: ./$(NAME)"

check_deps:
	@chmod +x scripts/setup.sh
	@./scripts/setup.sh

clean:
	@opam exec -- dune clean 2>/dev/null || true

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re check_deps