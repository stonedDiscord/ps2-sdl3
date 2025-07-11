EE_OBJS = geometry.o
EE_BIN = geometry.elf

EE_INCS = -I/usr/local/include -L$(GSKIT)/include -I/usr/local/ps2dev/ps2sdk/ports/include
EE_LDFLAGS = -L/usr/local/lib -L$(GSKIT)/lib -L/usr/local/ps2dev/ps2sdk/ports/lib
EE_LIBS = -lSDL3 -lps2_drivers -lgskit -ldmakit -laudsrv -lpad -lmtap -lm -lcdvd -lmc -lc -lstdc++

EE_IRX_SRCS = $(addsuffix _irx.c, $(basename $(EE_IRX_FILES)))
EE_IRX_OBJS = $(addsuffix _irx.o, $(basename $(EE_IRX_FILES)))
EE_OBJS += $(EE_IRX_OBJS)

# Where to find the IRX files
vpath %.irx $(PS2SDK)/iop/irx/

# Rule to generate them
%_irx.o: %.irx
	bin2c $< $*_irx.c $*_irx
	$(EE_CC) -c $*_irx.c -o $*_irx.o

# This is for the sbv patch
SBVLITE = $(PS2SDK)/sbv
EE_INCS += -I$(SBVLITE)/include
EE_LDFLAGS += -L$(SBVLITE)/lib
EE_LIBS += -lpatches

all: $(EE_BIN)

clean:
	rm -f $(EE_OBJS) $(EE_BIN) $(EE_IRX_SRCS)

include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal
