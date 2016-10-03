noao
imred
ccdred

unlearn zerocombine
zerocombine.combine = 'median'
zerocombine.ccdtype = ' '
zerocombine.rdnoise = 4.2
zerocombine.gain = 0.33
zerocombine.output = 'outputs/masterbias.fits'

zerocombine input='@rawbiases.list'

unlearn ccdproc
ccdproc.output = '@images_biascor.list'
ccdproc.ccdtype = ' '
ccdproc.fixpix = no
ccdproc.overscan = no
ccdproc.trim = yes
ccdproc.darkcor = no
ccdproc.flatcor = no
ccdproc.trimsec = '[*,2:2049]'
ccdproc.zero = 'outputs/masterbias.fits'

ccdproc images='@rawimages.list'
