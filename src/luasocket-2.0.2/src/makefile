#------
# Load configuration
#
EXT=dll
SOCKET_SO=socket.$(EXT)
MIME_SO=mime.$(EXT)

prefix=$(PWD)/../../../

LUADLL=$(prefix)/lib/liblua.a
LUAINC=-I$(prefix)/include

CC=i586-mingw32msvc-gcc
AR=i586-mingw32msvc-ar
RANLIB=i586-mingw32msvc-ranlib
DEF=-DLUASOCKET_DEBUG 
CFLAGS= $(LUAINC) $(DEF) -pedantic -Wall -O2
LDFLAGS=-O -shared
LD=$(CC)

INSTALL_TOP= $(prefix)
INSTALL_INC= $(INSTALL_TOP)/include
INSTALL_LIB= $(INSTALL_TOP)/lib
INSTALL= install -p
INSTALL_DATA= $(INSTALL) -m 0644
MKDIR= mkdir -p

#------
# Hopefully no need to change anything below this line
#

#------
# Modules belonging to socket-core
#

#$(COMPAT)/compat-5.1.o \

SOCKET_OBJS:= \
	luasocket.o \
	timeout.o \
	buffer.o \
	io.o \
	auxiliar.o \
	options.o \
	inet.o \
	tcp.o \
	udp.o \
	except.o \
	select.o \
	wsocket.o 

#------
# Modules belonging mime-core
#
#$(COMPAT)/compat-5.1.o \

MIME_OBJS:=\
	mime.o 

all: $(SOCKET_SO) $(MIME_SO) 
	$(AR) cru libluasocket.a *.o
	$(RANLIB) luasocket.a

install:
	$(MKDIR) $(INSTALL_INC) $(INSTALL_LIB)
	$(INSTALL_DATA) *.h $(INSTALL_INC)
	$(INSTALL_DATA) *.$(EXT) $(INSTALL_LIB)
	$(INSTALL_DATA) *.a $(INSTALL_LIB)

$(SOCKET_SO): $(SOCKET_OBJS)
	$(LD) $(LDFLAGS) -o $@ $(SOCKET_OBJS) $(LUADLL) -lwsock32

$(MIME_SO): $(MIME_OBJS)
	$(LD) $(LDFLAGS) -o $@ $(MIME_OBJS) $(LUADLL)

#------
# List of dependencies
#
auxiliar.o: auxiliar.c auxiliar.h
buffer.o: buffer.c buffer.h io.h timeout.h
except.o: except.c except.h
inet.o: inet.c inet.h socket.h io.h timeout.h wsocket.h
io.o: io.c io.h timeout.h
luasocket.o: luasocket.c luasocket.h auxiliar.h except.h timeout.h \
  buffer.h io.h inet.h socket.h wsocket.h tcp.h udp.h select.h
mime.o: mime.c mime.h
options.o: options.c auxiliar.h options.h socket.h io.h timeout.h \
  wsocket.h inet.h
select.o: select.c socket.h io.h timeout.h wsocket.h select.h
tcp.o: tcp.c auxiliar.h socket.h io.h timeout.h wsocket.h inet.h \
  options.h tcp.h buffer.h
timeout.o: timeout.c auxiliar.h timeout.h
udp.o: udp.c auxiliar.h socket.h io.h timeout.h wsocket.h inet.h \
  options.h udp.h
wsocket.o: wsocket.c socket.h io.h timeout.h wsocket.h

clean:
	rm -f $(SOCKET_SO) $(SOCKET_OBJS) 
	rm -f $(MIME_SO) $(UNIX_SO) $(MIME_OBJS) $(UNIX_OBJS)

#------
# End of makefile configuration
#
