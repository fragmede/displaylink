
showbmp: showbmp.c
	gcc -c -g showbmp.c -L ../libdlo-0.1.2/src
	gcc -o showbmp -lusb showbmp.o ../libdlo-0.1.2/src/.libs/libdlo.a

run:
	sudo ./showbmp foo.bmp
