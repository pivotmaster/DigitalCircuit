LDVERSION= $(shell $(PIC_LD) -v | grep -q 2.30 ;echo $$?)
ifeq ($(LDVERSION), 0)
     LD_NORELAX_FLAG= --no-relax
endif

ARCHIVE_OBJS=
ARCHIVE_OBJS += _114301_archive_1.so
_114301_archive_1.so : archive.0/_114301_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -Bsymbolic $(LD_NORELAX_FLAG)  -o .//../simv.daidir//_114301_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_114301_archive_1.so $@


ARCHIVE_OBJS += _114325_archive_1.so
_114325_archive_1.so : archive.0/_114325_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -Bsymbolic $(LD_NORELAX_FLAG)  -o .//../simv.daidir//_114325_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_114325_archive_1.so $@


ARCHIVE_OBJS += _114326_archive_1.so
_114326_archive_1.so : archive.0/_114326_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -Bsymbolic $(LD_NORELAX_FLAG)  -o .//../simv.daidir//_114326_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_114326_archive_1.so $@




VCS_CU_ARC_OBJS = 


O0_OBJS =

$(O0_OBJS) : %.o: %.c
	$(CC_CG) $(CFLAGS_O0) -c -o $@ $<


%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \
objs/udps/qndjy.o objs/udps/Sbaqa.o 

CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

