# Calculate a single rainbow color
#
# Similar to the @rainbow() procedure, this script takes the current
# and the total number of steps in a colour progression, and sets the
# current color to the corresponding one.
#
# Other arguments to the script specify the common saturation and value
# for all colours in the progression.
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
# Copyright 2016 Mauricio Figueroa & José Joaquín Atria

include ../procedures/hsv2praat.proc

form Set rainbow colour...
  integer Total_steps 10
  integer Current_step 1
  positive Saturation 1
  positive Value 1
endform

hue = 360 / total_steps * current_step
@hsv2praat(hue, saturation, value)
Colour: hsv2praat.colour$
