noao
imred
ccdred

# redundant
unlearn zerocombine
zerocombine.combine = 'median'
zerocombine.ccdtype = ' '
zerocombine.rdnoise = 4.2
zerocombine.gain = 0.33
zerocombine.output = 'outputs/superskies/masterbias.fits'

zerocombine input='@rawbiases.list'

unlearn ccdproc
ccdproc.output = '@supersky_biascor.list'
ccdproc.ccdtype = ' '
ccdproc.fixpix = no
ccdproc.overscan = no
ccdproc.trim = yes
ccdproc.darkcor = no
ccdproc.flatcor = no
ccdproc.trimsec = '[58:2096,2:2036]'
ccdproc.zero = 'outputs/superskies/masterbias.fits'

ccdproc images='@rawimages-super.list'

unlearn objmasks1
objmasks1.fitstep = 10
objmasks1.fitxorder = 1
objmasks1.fityorder = 1

unlearn objmasks
objmasks images='@supersky_biascor.list' objmasks='@supersky_objmask.list' skys='@supersky_sky.list'

mscred

unlearn sflatcombine
sflatcombine.output = 'outputs/superskies/sflat.fits'
sflatcombine.reject = 'ccdclip'
sflatcombine.ccdtype = ' '
sflatcombine.masktype = '!objmask'
sflatcombine.rdnoise = 4.2
sflatcombine.gain = 0.33

sflatcombine input='@supersky_biascor.list'

unlearn mscmedian
mscmedian output = 'outputs/superskies/MedianTemp.fits' xwindow = 129 ywindow = 129 input='outputs/superskies/sflat1.fits'

unlearn imarith
imarith op='-' operand1 = 'outputs/superskies/sflat1.fits' operand2='outputs/superskies/MedianTemp.fits' result = 'outputs/superskies/fringe.fits'

unlearn rmfringe
rmfringe.background = '@supersky_sky.list'

rmfringe output='@supersky_fringecor.list' fringe='outputs/superskies/fringe.fits' masks = '@supersky_objmask.list' input='@supersky_biascor.list'

sflatcombine.output='outputs/superskies/sflat2.fits'
sflatcombine input='@supersky_fringecor.list' 

!mkdir outputs/superskies/final

unlearn ccdred.ccdproc
ccdred.ccdproc.output = '@supersky_final.list'
ccdred.ccdproc.ccdtype=' '
ccdred.ccdproc.fixpix = no
ccdred.ccdproc.overscan = no
ccdred.ccdproc.trim = no
ccdred.ccdproc.zerocor = no
ccdred.ccdproc.darkcor = no
ccdred.ccdproc.flatcor = yes
ccdred.ccdproc.flat = 'outputs/superskies/sflat21.fits'

ccdred.ccdproc images='@supersky_fringecor.list'
