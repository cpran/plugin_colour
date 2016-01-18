# Paint ellipse (hex)
#
# Command that emulates Paint ellipse..., but where the colour argument
# is provided in an hexadecimal format. The hexadecimal can be entered
# with or without initial hash, in lower or uppercase.
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

include ../procedures/hex2praat.proc

form Paint ellipse (hex)
  word Hexadecimal:
  real From_x: 0.0
  real To_x: 1.0
  real From_y: 0.0
  real To_y: 1.0
endform

@hex2praat: hexadecimal$
Paint ellipse: hex2praat.color$, from_x, to_x, from_y, to_y
