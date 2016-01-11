# Setup script for colour
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

# Adding commands to Picture window.
nocheck Add menu command: "Picture", "Pen", "-",                     "Speckle size...", 1, ""
nocheck Add menu command: "Picture", "Pen", "Colour hexadecimal...", "Speckle size...", 1, "scripts/hex_to_praat.Praat"
nocheck Add menu command: "Picture", "Pen", "Colour RGB...",         "Speckle size...", 1, "scripts/rgb_to_praat.Praat"
nocheck Add menu command: "Picture", "Pen", "Colour HSV...",         "Speckle size...", 1, "scripts/hsv_to_praat.Praat"
