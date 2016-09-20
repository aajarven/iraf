images
immatch

unlearn imalign
imalign.shifts = 'images.shift'
imalign.interp_type = 'poly2'
imalign.boundary_type = 'constant'
imalign.trimimages = 'yes'

imalign images='images.list' reference='ALyi070063.fits' coords='images.coord' output='aligned.list'
