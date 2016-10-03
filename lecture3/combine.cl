images
immatch

# reference image (hardcoded)
#s1="../data/ALyi070063.fits"

unlearn imalign
imalign.shifts = 'images.shift'
imalign.interp_type = 'poly3'
imalign.boundary_type = 'constant'
imalign.trimimages = 'yes'

# reference image as first of images list
printf("!head -n images.list") | cl | scan(s1)

imalign input='@images.list' reference=(s1) coords='images.coord' output='@aligned.list'

unlearn imcombine
imcombine.combine = 'median'
imcombine.reject = 'avsigclip'
imcombine.zero = 'mode'
imcombine.expname = 'EXPTIME'
imcombine.rdnoise = 'RDNOISE'
imcombine.gain = 'GAIN'

imcombine input='@aligned.list' output='outputs/combined.fits'
