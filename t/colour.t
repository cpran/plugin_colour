include ../../plugin_testsimple/procedures/test_simple.proc

include ../../plugin_utils/procedures/utils.proc

include ../../plugin_colour/procedures/hex2praat.proc
include ../../plugin_colour/procedures/hsv2praat.proc
include ../../plugin_colour/procedures/rgb2praat.proc

include ../../plugin_colour/procedures/praat2hex.proc
include ../../plugin_colour/procedures/praat2hsv.proc
include ../../plugin_colour/procedures/praat2rgb.proc

include ../../plugin_colour/procedures/hex2rgb.proc
include ../../plugin_colour/procedures/rgb2hex.proc
include ../../plugin_colour/procedures/hex2hsv.proc
include ../../plugin_colour/procedures/hsv2hex.proc
include ../../plugin_colour/procedures/rgb2hsv.proc
include ../../plugin_colour/procedures/hsv2rgb.proc

threshold = 3

@no_plan()

colours = Read Table from comma-separated file: "colours.csv"

total = Get number of rows

for i to total

  tmp$ = Object_'colours'$[i, "hexadecimal"]
  @toLower: tmp$
  hex$ = toLower.return$

  r = Object_'colours'[i, "r"]
  g = Object_'colours'[i, "g"]
  b = Object_'colours'[i, "b"]
  h = Object_'colours'[i, "h"]
  s = Object_'colours'[i, "s"]
  v = Object_'colours'[i, "v"]

  appendInfoLine: "# ", do$("Get value...", i, "name")

  ## HEX -> RGB

  @hex2rgb: hex$

  @ok:  abs(hex2rgb.r - r) <= threshold and
    ... abs(hex2rgb.g - g) <= threshold and
    ... abs(hex2rgb.b - b) <= threshold,
    ... "hex2rgb"

  if !ok.value
    appendInfoLine: "# HEX: " + hex$
    appendInfoLine: "# ---"
    appendInfoLine: "# R: " + string$(hex2rgb.r) + " - " + string$(r) + " = " + string$(hex2rgb.r - r)
    appendInfoLine: "# G: " + string$(hex2rgb.r) + " - " + string$(g) + " = " + string$(hex2rgb.g - g)
    appendInfoLine: "# B: " + string$(hex2rgb.r) + " - " + string$(b) + " = " + string$(hex2rgb.b - b)
  endif

  ## RGB -> HEX

  @rgb2hex: r, g, b

  @ok:  length(rgb2hex.n$) == 7,
    ... "rgb2hex: " + rgb2hex.n$ + " =~ " + hex$

  if !ok.value
    appendInfoLine: "# R: " + string$(r)
    appendInfoLine: "# G: " + string$(g)
    appendInfoLine: "# B: " + string$(b)
    appendInfoLine: "# ---"
    appendInfoLine: "# HEX: " + rgb2hex.n$ + " (" + hex$ + ")"
  endif

  ## RGB -> PRAAT

  @rgb2praat: r, g, b

  @ok:  index_regex(rgb2praat.colour$, "\{[0-9.]+,[0-9.]+,[0-9.]+\}"),
    ... "rgb2praat"

  if !ok.value
    appendInfoLine: "# R: " + string$(r)
    appendInfoLine: "# G: " + string$(g)
    appendInfoLine: "# B: " + string$(b)
    appendInfoLine: "# ---"
    appendInfoLine: "# Praat: " + rgb2praat.colour$
  endif

  ## PRAAT -> RGB

  @praat2rgb: rgb2praat.colour$

  @ok:  abs(praat2rgb.r - r) <= threshold and
    ... abs(praat2rgb.g - g) <= threshold and
    ... abs(praat2rgb.b - b) <= threshold,
    ... "praat2rgb"

  if !ok.value
    appendInfoLine: "# Praat: " + rgb2praat.colour$
    appendInfoLine: "# ---"
    appendInfoLine: "# R: " + string$(praat2rgb.r)
    appendInfoLine: "# G: " + string$(praat2rgb.g)
    appendInfoLine: "# B: " + string$(praat2rgb.b)
  endif

  ## HEX -> HSV

  @hex2hsv: hex$

  @ok:  abs(hex2hsv.h - h) <= threshold and
    ... abs(hex2hsv.s - s) <= threshold and
    ... abs(hex2hsv.v - v) <= threshold,
    ... "hex2hsv"

  if !ok.value
    appendInfoLine: "# HEX: " + hex$
    appendInfoLine: "# ---"
    appendInfoLine: "# H: " + string$(hex2hsv.h) + " - " + string$(h) + " = " + string$(hex2hsv.h - h)
    appendInfoLine: "# S: " + string$(hex2hsv.s) + " - " + string$(s) + " = " + string$(hex2hsv.s - s)
    appendInfoLine: "# V: " + string$(hex2hsv.v) + " - " + string$(v) + " = " + string$(hex2hsv.v - v)
  endif

  ## HSV -> HEX

  @hsv2hex: h, s, v

  @ok:  length(hsv2hex.n$) == 7,
    ... "hsv2hex: " + hsv2hex.n$ + " =~ " + hex$

  if !ok.value
    appendInfoLine: "# H: " + string$(h)
    appendInfoLine: "# S: " + string$(s)
    appendInfoLine: "# V: " + string$(v)
    appendInfoLine: "# ---"
    appendInfoLine: "# HEX: " + hsv2hex.n$ + " (" + hex$ + ")"
  endif

  ## RGB -> HSV

  @rgb2hsv: r, g, b

  @ok:  abs(rgb2hsv.h - h) <= threshold and
    ... abs(rgb2hsv.s - s) <= threshold and
    ... abs(rgb2hsv.v - v) <= threshold,
    ... "rgb2hsv"

  if !ok.value
    appendInfoLine: "# R: " + string$(r)
    appendInfoLine: "# G: " + string$(g)
    appendInfoLine: "# B: " + string$(b)
    appendInfoLine: "# ---"
    appendInfoLine: "# H: " + string$(rgb2hsv.h) + " - " + string$(h) + " = " + string$(rgb2hsv.h - h)
    appendInfoLine: "# S: " + string$(rgb2hsv.s) + " - " + string$(s) + " = " + string$(rgb2hsv.s - s)
    appendInfoLine: "# V: " + string$(rgb2hsv.v) + " - " + string$(v) + " = " + string$(rgb2hsv.v - v)
  endif

  ## HSV -> RGB

  @hsv2rgb: h, s, v

  @ok:  abs(hsv2rgb.r - r) <= threshold and
    ... abs(hsv2rgb.g - g) <= threshold and
    ... abs(hsv2rgb.b - b) <= threshold,
    ... "hsv2rgb"

  if !ok.value
    appendInfoLine: "# H: " + string$(h)
    appendInfoLine: "# S: " + string$(s)
    appendInfoLine: "# V: " + string$(v)
    appendInfoLine: "# ---"
    appendInfoLine: "# R: " + string$(hsv2rgb.r) + " - " + string$(r) + " = " + string$(hsv2rgb.r - r)
    appendInfoLine: "# G: " + string$(hsv2rgb.g) + " - " + string$(g) + " = " + string$(hsv2rgb.g - g)
    appendInfoLine: "# B: " + string$(hsv2rgb.b) + " - " + string$(b) + " = " + string$(hsv2rgb.b - b)
  endif

endfor

removeObject: colours

@done_testing()
