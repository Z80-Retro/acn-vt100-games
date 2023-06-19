# Make 'all' first so that it is THE default target.
#
# The :: means that if there is more than one of the same target name 
# then process all the occurrences one after the other.

all:: disk.img

.PHONY: disk.img

TOP=.

# include things that might be of interest to more than just this Makefile
include $(TOP)/Make.default
-include $(TOP)/Make.local		# The - on this means ignore it if the file does not exist

burn: disk.img
	@ if [ `hostname` != "$(SD_HOSTNAME)" -o ! -b "$(SD_DEV)" ]; then\
		echo "\nWARNING: You are either NOT logged into $(SD_HOSTNAME) or there is no $(SD_DEV) mounted!\n"; \
		false; \
	fi
	sudo dd if=$< of=$(SD_DEV) bs=512 seek=$(DISK_SLOT)x16384 conv=fsync

ls:: disk.img
	cpmls -f $(DISKDEF) disk.img

disk.img: 
	@ if [ ! -d "vt100-games/HDimage/u0" ]; then \
		git clone https://git.imzadi.de/acn/vt100-games.git; \
	fi
	rm -f $@
	mkfs.cpm -f $(DISKDEF) $@
	cpmcp -f $(DISKDEF) $@ vt100-games/HDimage/u0/* 0:
	cpmcp -f $(DISKDEF) $@ vt100-games/HDimage/u1/* 1:

clean:
	rm -f disk.img

world: clean all
