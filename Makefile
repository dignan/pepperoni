#
#	Author: Patrick Dignan
#	Makefile for Pepperoni
#
sources = main.vala DocumentArea.vala DocumentWindow.vala
CC = valac -g
name = pepperoni
reqs = --pkg gtk+-2.0 --pkg gdk-2.0 --pkg pangocairo --pkg pango

pepperoni: $(sources)
	$(CC) $(reqs) $(sources) -o $(name)
    
.PHONY: clean
clean:
	rm -rf *.o *.c $(name) 
