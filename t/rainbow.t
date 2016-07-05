include ../../plugin_tap/procedures/more.proc

include ../../plugin_colour/procedures/rainbow.proc
include ../../plugin_colour/procedures/praat2hsv.proc

@no_plan()

max = 20
threshold = 3

for n from 0 to max

  saturation = randomInteger(0, 100)
  value      = randomInteger(0, 100)

  appendInfoLine: "# " + string$(n) + "-colour rainbow (" + string$(saturation) + ", " + string$(value) + ")"

  @rainbow: n, saturation, value

  result = 1
  same   = 1
  for i to n
    colour$ = rainbow.colours$[i]

    @praat2hsv: colour$

    if    colour$ == "" or
      ... praat2hsv.s - saturation > threshold or
      ... praat2hsv.v - value      > threshold

      appendInfoLine: "# Colour " + string$(i) + ": "
      appendInfoLine: "#   H: " + string$(praat2hsv.h)
      appendInfoLine: "#   S: " + string$(praat2hsv.s), " - ", saturation
      appendInfoLine: "#   V: " + string$(praat2hsv.v), " - ", value

      result = 0
    endif

    runScript: "../scripts/rainbow.praat", n, i, saturation, value
    info$ = Picture info
    r$ = extractWord$(info$, "Red:")
    g$ = extractWord$(info$, "Green:")
    b$ = extractWord$(info$, "Blue:")

    if same
      same = colour$ == "{" + r$ + "," + g$ + "," + b$ + "}"
    endif

  endfor
  @todo: 1, "HSV -> RGB -> HSV conversion is prone to errors"
  @ok: result, "Rainbow with " + string$(n) + " colours"

  @ok: same,
    ... "Script and procedure create the same colour"

endfor

@ok_selection()

@done_testing()
