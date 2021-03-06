-- keyboard assignment vars
k_up = "up"
k_down = "down"
k_left = "left"
k_right = "right"
k_swap1 = "z"
k_swap2 = "x"
k_raise1 = "c"
k_raise2 = "v"
keys = {}
this_frame_keys = {}

bounce_table = {1, 1, 1, 1,
        2, 2, 2,
        3, 3, 3,
        4, 4, 4}

danger_bounce_table = { 1, 1, 1,
            2, 2, 2,
            3, 3, 3,
            2, 2, 2,
            1, 1, 1,
            4, 4, 4}

IMG_panels = nil
IMG_cursor = nil
IMG_frame = nil
IMG_cards = nil

VEASY  = 1
EASY   = 2
NORMAL = 3
HARD   = 4
VHARD  = 5

SCOREMODE_TA    = 1
SCOREMODE_PDP64 = 2
score_mode = SCOREMODE_TA

 -- score lookup tables
score_combo_PdP64 = {} --size 40
score_combo_TA = {0,0,0, --You get nothing for clearing 3 or less things.
          20,
          30,
          50,
          60,
          70,
          80,
          100,
          140,
          170,
          210,
          250,
          290,
          340,
          390,
          440,
          490,
          550,
          610,
          680,
          750,
          820,
          900,
          980,
          1060,
          1150,
          1240,
          1330}
score_combo_TA[0]=0
score_chain_TA = {0, --You get nothing for clearing things without chaining.
          50,
          80,
          150,
          300,
          400,
          500,
          700,
          900,
          1100,
          1300,
          1500,
          1800}
score_chain_TA[0]=0

GFX_SCALE = 3

card_animation = {0, 1, 2, 3, 4, 5, 6, 6, 7, 7,
  8, 8, 9, 9, 10, 10, 10, 11, 11, 11,
  11, 11, 13, 13, 13, 13, 13, 13, 13, 13,
  13, 13, 13, 13, 13, 13, 13, 15, 15, 15,
  15, 15}
card_animation.max = 43

gfx_q = Queue()

FC_HOVER = {12, 12, 9,  6,  6 }
FC_MATCH = {61, 61, 50, 37, 37}
FC_FLASH = {16, 16, 13, 8,  8 }
FC_POP   = {9,  9,  8,  7,  7 }
stop_time_combo = {{3,2,2,2,1},{13,10,7,4,1}}
stop_time_chain = {{7,5,3,2,1},{13,10,7,4,1}}

-- Yes, 2 is slower than 1 and 50..99 are the same.
speed_to_rise_time =
   {942, 983, 838, 790, 755, 695, 649, 604, 570, 515,
  474, 444, 394, 370, 347, 325, 306, 289, 271, 256,
  240, 227, 213, 201, 189, 178, 169, 158, 148, 138,
  129, 120, 112, 105,  99,  92,  86,  82,  77,  73,
   69,  66,  62,  59,  56,  54,  52,  50,  48,  47,
   47,  47,  47,  47,  47,  47,  47,  47,  47,  47,
   47,  47,  47,  47,  47,  47,  47,  47,  47,  47,
   47,  47,  47,  47,  47,  47,  47,  47,  47,  47,
   47,  47,  47,  47,  47,  47,  47,  47,  47,  47,
   47,  47,  47,  47,  47,  47,  47,  47,  47}
for idx,val in ipairs(speed_to_rise_time) do
  speed_to_rise_time[idx] = val/16
end

-- Values past 51 weren't measured because all the speeds
-- after that are the same anyway.
panels_to_next_speed =
  {9, 12, 12, 12, 12, 12, 15, 15, 18, 18,
  24, 24, 24, 24, 24, 24, 21, 18, 18, 18,
  36, 36, 36, 36, 36, 36, 36, 36, 36, 36,
  39, 39, 39, 39, 39, 39, 39, 39, 39, 39,
  45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
  45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
  45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
  45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
  45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
  45, 45, 45, 45, 45, 45, 45, 45, math.huge}

min = math.min
max = math.max
-- bounds b so a<=b<=c
function bound(a, b, c)
  if b<a then return a
  elseif b>c then return c
  else return b end
end

-- map for numeric tables
function map(func, tab)
  local ret = {}
  for i=1, #tab do
    ret[i]=func(tab[i])
  end
  return ret
end

function map_inplace(func, tab)
  for i=1, #tab do
    tab[i]=func(tab[i])
  end
  return tab
end

-- reduce for numeric tables
function reduce(func, tab, ...)
  local idx, value = 2, nil
  if select("#", ...) ~= 0 then
    value = select(1, ...)
    idx = 1
  elseif #tab == 0 then
    error("Tried to reduce empty table with no initial value")
  else
    value = tab[1]
  end
  for i=idx,#tab do
    value = func(value, tab[i])
  end
  return value
end
