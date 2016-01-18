# Paint rounded rectangle (rgb)
#
# Command that emulates Paint rounded rectangle..., but where the colour
# argument is provided in an RGB format. The RGB components have to be entered
# as integer numbers from 1 to 255.
#
# This script is part of the colour CPrAN plugin for Praat.
# The latest version is available through CPrAN or at
# <http://cpran.net/plugins/colour>
#
# The colour plugin is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation, either
# version 3 of the License, or (at your option) any later version.
#
# The colour plugin is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with colour. If not, see <http://www.gnu.org/licenses/>.
#
# Copyright 2014, 2015, 2016 Mauricio Figueroa & José Joaquín Atria

include ../procedures/rgb2praat.proc

form Paint rounded rectangle (rgb)
  comment Enter RGB colour components as numbers from 0 to 255.
  integer Red:
  integer Green:
  integer Blue:
  real From_x: 0.0
  real To_x: 1.0
  real From_y: 0.0
  real To_y: 1.0
  real Radius_(mm): 3.0
endform

@rgb2praat: red, green, blue
Paint rounded rectangle: rgb2praat.color$, from_x, to_x, from_y, to_y, radius
