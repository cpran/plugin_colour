form Settings
  choice Format: 1
    button Hexadecimal
    button RGB
    button HSV
  boolean Save_palette 1
endform

table_id = Read Table from comma-separated file: "colour_list.csv"
n_rows   = Get number of rows
baseline = 0.5
Erase all

for i to n_rows
  
  colour_name$ = Get value: i, "name"
  if format == 1
    hex_colour$ = Get value: i, "hexadecimal"
    runScript: preferencesDirectory$ + "/plugin_colour/scripts/hex_to_praat.Praat", hex_colour$
  elsif format == 2
    rgb_red   = Get value: i, "rgb_red"
    rgb_green = Get value: i, "rgb_green"
    rgb_blue  = Get value: i, "rgb_blue"
    runScript: preferencesDirectory$ + "/plugin_colour/scripts/rgb_to_praat.Praat", rgb_red, rgb_green, rgb_blue
  elsif format == 3
    hsv_hue   = Get value: i, "hsv_hue"
    hsv_satur = Get value: i, "hsv_satur"
    hsv_value = Get value: i, "hsv_value"
    runScript: preferencesDirectory$ + "/plugin_colour/scripts/hsv_to_praat.Praat", hsv_hue, hsv_satur, hsv_value
  endif
  
  Select inner viewport: 1, 3.7, baseline, baseline + 0.22
  Text: 0, "Left", 0.5, "Half", "'i'. 'colour_name$'"
  Draw rectangle: 0, 1, 0, 1
  baseline += 0.22

endfor

# Saving image.
Select inner viewport: 1, 3.7, 0.5, baseline
if save_palette
  if format == 1
    name$ = "palette_1_hex.pdf"
  elsif format == 2
    name$ = "palette_2_rgb.pdf"
  elsif format == 3
    name$ = "palette_3_hsv.pdf"
  endif
  Save as PDF file: preferencesDirectory$ + "/plugin_colour/t/" + name$
endif

selectObject: table_id
Remove
