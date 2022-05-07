NAME = menu

all: $(NAME).o
	ld -s -o $(NAME) $(NAME).o
	rm -rf *.o;
	clear
	./$(NAME)
	rm -r ./$(NAME)

%.o: %.asm
	nasm -f elf64 $<