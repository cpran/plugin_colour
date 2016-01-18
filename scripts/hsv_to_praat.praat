# Colour (hsv)
#
# Script to set the colour for Praat's Draw window using the HSV format.
# Hue has to be provided in a scale from 1 to 360, while saturation
# and value have to provided in a scale from 1 to 100.
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

include ../procedures/hsv2praat.proc

form Colour (hsv)
  comment Enter hue as a number from 1 to 360.
  integer Hue:
  comment Enter saturation and value as percentages from 1 to 100.
  integer Saturation:
  integer Value:
endform

@hsv2praat: hue, saturation, value
Colour: hsv2praat.color$
