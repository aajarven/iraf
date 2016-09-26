images
immatch

unlearn imalign
imalign.shifts = 'images.shift'
imalign.interp_type = 'poly2'
imalign.boundary_type = 'constant'
imalign.trimimages = 'yes'

imalign images='images.list' reference='ALyi070063.fits' coords='images.coord' output='aligned.list'

inlearn imcombine
imcombine.combine = 'median'
imcombine.reject = 'avsigclip'
imcombine.zero = 'mode'
imcombine.expname = 'EXPTIME'
imcombine.rdnoise = 'RDNOISE'
imconbine.gain = 'GAIN'

imcombine input='aligned.list' output='outputs/combined.fits'
