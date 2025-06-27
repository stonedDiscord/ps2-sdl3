EE_OBJS = geometry.o
EE_BIN = geometry.elf

EE_INCS = -ISDL/include

all: $(EE_BIN)

clean:
	rm -f $(EE_OBJS) $(EE_BIN) $(EE_IRX_SRCS)

include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal
