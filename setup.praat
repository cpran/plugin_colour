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
nocheck Add menu command: "Picture", "Pen",   "-- Other colour formats --",       "", 1, ""
nocheck Add menu command: "Picture", "Pen",   "Colour (hex)...",                  "Colour...", 1, "scripts/hex_to_praat.praat"
nocheck Add menu command: "Picture", "Pen",   "Colour (rgb)...",                  "Colour...", 1, "scripts/rgb_to_praat.praat"
nocheck Add menu command: "Picture", "Pen",   "Colour (hsv)...",                  "Colour...", 1, "scripts/hsv_to_praat.praat"

nocheck Add menu command: "Picture", "World", "-- Hexadecimal --",                "", 1, ""
nocheck Add menu command: "Picture", "World", "Paint rectangle (hex)...",         "", 1, "scripts/paint_rectangle_hex.praat"
nocheck Add menu command: "Picture", "World", "Paint rounded rectangle (hex)...", "", 1, "scripts/paint_rounded_rectangle_hex.praat"
nocheck Add menu command: "Picture", "World", "Paint ellipse (hex)...",           "", 1, "scripts/paint_ellipse_hex.praat"
nocheck Add menu command: "Picture", "World", "Paint circle (hex)...",            "", 1, "scripts/paint_circle_hex.praat"
nocheck Add menu command: "Picture", "World", "Paint circle (mm) (hex)...",       "", 1, "scripts/paint_circle_mm_hex.praat"

nocheck Add menu command: "Picture", "World", "-- RGB --",                        "", 1, ""
nocheck Add menu command: "Picture", "World", "Paint rectangle (rgb)...",         "", 1, "scripts/paint_rectangle_rgb.praat"
nocheck Add menu command: "Picture", "World", "Paint rounded rectangle (rgb)...", "", 1, "scripts/paint_rounded_rectangle_rgb.praat"
nocheck Add menu command: "Picture", "World", "Paint ellipse (rgb)...",           "", 1, "scripts/paint_ellipse_rgb.praat"
nocheck Add menu command: "Picture", "World", "Paint circle (rgb)...",            "", 1, "scripts/paint_circle_rgb.praat"
nocheck Add menu command: "Picture", "World", "Paint circle (mm) (rgb)...",       "", 1, "scripts/paint_circle_mm_rgb.praat"

nocheck Add menu command: "Picture", "World", "-- HSV --",                        "", 1, ""
nocheck Add menu command: "Picture", "World", "Paint rectangle (hsv)...",         "", 1, "scripts/paint_rectangle_hsv.praat"
nocheck Add menu command: "Picture", "World", "Paint rounded rectangle (hsv)...", "", 1, "scripts/paint_rounded_rectangle_hsv.praat"
nocheck Add menu command: "Picture", "World", "Paint ellipse (hsv)...",           "", 1, "scripts/paint_ellipse_hsv.praat"
nocheck Add menu command: "Picture", "World", "Paint circle (hsv)...",            "", 1, "scripts/paint_circle_hsv.praat"
nocheck Add menu command: "Picture", "World", "Paint circle (mm) (hsv)...",       "", 1, "scripts/paint_circle_mm_hsv.praat"
