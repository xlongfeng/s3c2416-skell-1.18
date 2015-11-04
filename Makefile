install:
	mkdir -p $(DESTDIR)
	find . -type d -name CVS -prune -o ! -name Makefile -print0 \
                                                      | cpio -p0d $(DESTDIR)
	for i in bin boot dev lib mnt opt proc root sbin sys tmp ; do \
        mkdir -p $(DESTDIR)/$$i                              ; done
	for i in bin include lib local                           ; do   \
        mkdir -p $(DESTDIR)/usr/$$i                          ; done
	for i in tmp lib lock mail run spool www/icons \
             ftp/bin ftp/etc ftp/lib ftp/pub   \
             spool/lpd spool/mail                    ; do \
        mkdir -p $(DESTDIR)/var/$$i                          ; done
	for i in cdrom floppy nfs rwfs src                       ; do \
        mkdir -p $(DESTDIR)/mnt/$$i                          ; done
	mkdir -p $(DESTDIR)/lib/modules
	mkdir -p $(DESTDIR)/
	ln -s /proc/mounts $(DESTDIR)/dev/mtab
	chmod 755 $(DESTDIR)/etc/rc.d/init.d/*
	chmod 2777 $(DESTDIR)/var/ftp/pub
	chmod 1777 $(DESTDIR)/tmp
	chmod 777  $(DESTDIR)/var/tmp

