EE_OBJS = geometry.o
EE_BIN = geometry.elf

EE_INCS = -I/usr/local/include -L$(GSKIT)/include
EE_LDFLAGS = -L/usr/local/lib -L$(GSKIT)/lib
EE_LIBS = -lSDL3 -lgskit -ldmakit -lm -lcdvd -lmc -lc -lstdc++

all: $(EE_BIN)

clean:
	rm -f $(EE_OBJS) $(EE_BIN) $(EE_IRX_SRCS)

include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal
