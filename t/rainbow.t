include ../../plugin_testsimple/procedures/test_simple.proc

include ../../plugin_colour/procedures/rainbow.proc
include ../../plugin_colour/procedures/praat2hsv.proc

@no_plan()

max = 20
threshold = 4

for n from 0 to max

  saturation = randomInteger(0, 100)
  value      = randomInteger(0, 100)

  appendInfoLine: "# " + string$(n) + "-colour rainbow (" + string$(saturation) + ", " + string$(value) + ")"

  @rainbow: n, saturation, value

  result = 1
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
  endfor
  @ok: result, "Rainbow with " + string$(n) + " colours"

endfor

@done_testing()
