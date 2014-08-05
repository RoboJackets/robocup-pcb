CC=gcc
CXXFLAGS=-O2 -g3 -Wall
LDFLAGS=

TARGET=make_state_table
OBJS=make_state_table.o ../states.o

.PHONY: all clean

all:		$(TARGET)

clean:
		rm -f $(TARGET) $(OBJS)

$(TARGET):	$(OBJS)
		$(CXX) $(LDFLAGS) -o $(TARGET) $(OBJS)

