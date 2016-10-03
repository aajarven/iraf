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

combine input='@flats.list'
