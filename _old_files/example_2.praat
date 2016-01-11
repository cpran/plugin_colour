# Written by Mauricio Figueroa (www.mauriciofigueroa.cl)
# v.0.2 - 15th July 2014
# 
# Script to test "colors.proc". This script includes the main procedure at the
# beginning of the script (see line 39; the path to the file is relative) and
# then, inside a for loop, calls two procedures contained in "colors.proc",
# named "rgb2praat" and "hex2praat" (see lines 106 and 90), which become
# available after the main procedure has been included into the script. After
# these procedures have been called and arguments have been provided for them,
# a local variable from each procedure is used as a Praat colour argument, as
# seen in lines 110 and 95.
#
# The main procedure ("colors.proc") contains the following three
# sub-procedures: (a) "hex2rgb": converts hexadecimal colour codes into
# RGB-coded colours; (b) "rgb2praat": converts RGB colours into
# Praat-formatted RGB colours; and (c) "hex2praat": uses the two previous
# procedures to convert hexadecimal colours into Praat-formatted colours.
#
# In practice, you only have to call "hex2praat" and "rgb2praat". In the case
# of "hex2praat", you have to provide a hexadecimal string as the only required
# argument. In the case of "rgb2praat", you have to provide red, green and blue
# values (between 0 and 255) as the three required arguments. Once you have
# done that, a local variable called ".color$" will contain the Praat-formatted
# colour ready to use in Praat scripts. To call this variable, as is done in
# lines XX and XX, you have to refer to the name of the sub-procedure plus
# ".color$".
#
# This script is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# A copy of the GNU General Public License is available at 
# <http://www.gnu.org/licenses/>.

# Including main procedure into this script.
include colors.proc

# Opening list of colours as table. List taken from:
# <http://cloford.com/resources/colours/500col.htm">
table_ID = Read Table from comma-separated file: "example_2_list.csv"

# Input from the user to decide whether to save the output palette or not.
form Saving palette.
	comment Do you want to save the (rather big) palette as 300-dpi PNG file?
	boolean Save_palette 0
endform

# Cleaning Praat Picture window.
Erase all

# Resetting pen to black, just in case it had been changed before.
Colour: "black"

# Initial vertical coordinate.
baseline = 0.5

# Dummy variable to alternate between procedures.
counter = 0

# For loop to access items from list and process them to create the palette.
for i from 1 to 554
	
	# Obtaining colour name and original hexadecimal and RGB codes from table.
	current_name$ = Get value: i, "Colour Name"
	current_hex$ = Get value: i, "Hex"
	current_red_string$ = Get value: i, "R"
	current_green_string$ = Get value: i, "G"
	current_blue_string$ = Get value: i, "B"
	current_red = number (current_red_string$)
	current_green = number (current_green_string$)
	current_blue = number (current_blue_string$)
	
	# Selecting portion of Praat's Picture window to write colour name.
	Select inner viewport: 1, 3.7, baseline, baseline + 0.22
	
	# Adding text with the number of the iterator and the name of the colour.
	Text special: 0.0, "left", 0.0, "half", "Courier", 8, "0", "('i') 'current_name$':"
	
	# Selecting portion next to previous one to paint a rectangle.
	Select inner viewport: 3.7, 4.3, baseline, baseline + 0.22

	# Condition for using the first procedure (from hexadecimal).
	if counter == 0

		# Calling sub-procedure to parse hexadecimal codes. The argument is
		# provided as a string variable.
		@hex2praat (current_hex$)
		
		# Painting rectangle in selected zone. Local variable from procedure
		# and relative coordinates are used (the name of the procedure plus the
		# name of the local variable have to be specified).
		Paint rectangle: hex2praat.color$, 0, 1, -1, 1
		
		# Modifying dummy variable's value to use the other sub-procedure in
		# next iteration.
		counter = 1

	# Condition for using the second procedure (from RGB).
	else
		
		# Calling sub-procedure to parse RGB codes. The arguments are provided
		# as numerical variables.
		@rgb2praat (current_red, current_green, current_blue)
		
		# Painting rectangle in selected portion. Notice the use of a local
		# variable from the sub-procedure.
		Paint rectangle: rgb2praat.color$, 0, 1, -1, 1
		
		# Again, modifying dummy variable to alternate sub-procedures.
		counter = 0
	endif
		
	# Increasing vertical coordinate to move a step down in the Picture window
	# at each new iteration.
	baseline += 0.22

endfor

# Select the whole used canvas.
Select inner viewport: 1, 4.3, 0.5, baseline

# Saving the resulting image as 300-dpi PNG image if specified as such in form.
if save_palette
	
	# Checking current version of Praat.
	praat_version = praatVersion
	praat_version$ = praatVersion$
	
	# If current version of Praat is >= than 5369, the image is saved.
	if praat_version >= 5369
		appendInfoLine: "Saving image. It might take a couple of seconds..."
		Save as 300-dpi PNG file: "example_2.png"
		appendInfoLine: "The PNG file has been saved as <example_2.png>."
	
	# If not, the script will terminate and send a message to the user.
	else
		exitScript: "You need a newer version of Praat to save an image as 300-dpi
		... PNG (version 5.3.69 or higher). Your current version of Praat is:
		... 'praat_version$'. Image not saved.'newline$'"
	endif

endif
