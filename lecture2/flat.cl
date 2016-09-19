noao
imred
ccdred

unlearn combine
combine.combine = 'median'
combine.ccdtype = ' '
combine.rdnoise = 4.2
combine.gain = 0.33
combine.reject = 'crreject'
combine.output = 'outputs/masterflat.fits'

combine input='@rawflats.list'

unlearn ccdproc
ccdproc.output = '@images_flatcor.list'
ccdproc.ccdtype = ' '
ccdproc.fixpix = no
ccdproc.overscan = no
ccdproc.trim = no
ccdproc.zerocor = no
ccdproc.darkcor = no
ccdproc.flatcor = yes
ccdproc.flat = 'outputs/masterflat.fits'

ccdproc images='@images_biascor.list'
