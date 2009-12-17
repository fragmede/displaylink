
all: lib showbmp/showbmp

lib: libdlo-0.1.2.tar.gz
	gzip -dc libdlo-0.1.2.tar.gz | tar -x
	cd libdlo-0.1.2 && ./configure
	make -C libdlo-0.1.2/

showbmp/showbmp: showbmp/showbmp.c
	make -C showbmp

bmp:
	(echo IP Addresses:; \
		/sbin/ifconfig | grep inet.a | sed 's/Bcast.*$$//'; \
		echo Listening Ports:; netstat -nat | grep '^[^:]*:90[09][019]' | awk '{print $$4}' | sed 's/^.*:/    /' | sort -n | tr -d '\n'; \
		echo -e '\n'Flow Processes:; \
		(for name in `ps xauw | grep flow[-] | awk '{print $$11}'`; \
			do echo `basename $$name`; \
		done;) | sed 's/^/    /' )  | convert -background lightblue -fill blue -pointsize 32 -size 800x480 caption:@- bar.bmp
