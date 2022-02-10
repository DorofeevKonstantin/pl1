main: main.o utils.o
	gcc main.o utils.o -o main
main.o: main.c
	gcc -c main.c
utils.o: utils.c
	gcc -c utils.c
clean:
	rm -rf *.o main.exe