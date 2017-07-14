SOURCES=$(shell find . -name '*.c')

test: $(SOURCES)
	$(CC) $(SOURCES) -g -o $@ -Dever=";;" -I. -I../ -DREMOTE
