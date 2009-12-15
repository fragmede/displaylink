
lib: 
	#libdlo-0.1.2.tar.gz
	gzip -dc libdlo-0.1.2.tar.gz | tar -x
	cd libdlo-0.1.2 && ./configure
	make -C libdlo-0.1.2/
	#make
