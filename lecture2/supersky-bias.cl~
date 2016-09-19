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
objmask.objmasks = '@supersky_objmask.list'
objmask.skys = 'sky//@supersky_biascor.list'

mscred

unlearn sflatcombine
sflatcombine.output = 'outputs/superskies/sflat.fits'
sflatcombine.reject = 'ccdclip'
sflatcombine.ccdtype = ' '
sflatcombine.masktype = '!objmask'
sflatcombine.rdnoise = 4.2
sflatcombine.gain = 0.33

sflatcombine images='@supersky-biascor.list'
