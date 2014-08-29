CROSS_COMPILE=arm-hisiv200-linux-
CC=${CROSS_COMPILE}gcc
AR=${CROSS_COMPILE}ar

CURDIR=.
CFLAGS += -I${CURDIR}/include -I${CURDIR}

LIBS := libhi_mmz
OBJS := mpi_mmz.o


#===============================================================================
# rules
#===============================================================================
.PHONY: all clean

all: $(LIBS)

clean:
	-rm -f $(OBJS)
	-rm -f $(LIBS).a
	-rm -f $(LIBS).so

$(LIBS): $(OBJS)
	$(AR) -rcs $@.a $^
	$(CC) -shared $(CFLAGS) -lpthread -o $@.so $^
