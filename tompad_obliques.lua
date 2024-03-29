-- @description tompad_obliques - randomly shows text from Oblique Strategies
-- @version 1.0
-- @author Thomas Dahl
-- @about
--   # tompad_obliques
--   tompad_obliques is a reascript that randomly shows text
--   from Oblique Strategies by Brian Eno and Peter Schmidt.
--
--   Any comments on coding, requests, bugs etc is welcome!
--   PM me (tompad) on Reaper Forum (https://forum.cockos.com/member.php?u=19103).
--
--   Credits
--   Oblique Strategies by Brian Eno and Peter Schmidt
--
-- @changelog
--   Published on BitBucket and ReaPack


-- Script generated by Lokasenna's GUI Builder
local lib_path = reaper.GetExtState("Lokasenna_GUI", "lib_path_v2")
if not lib_path or lib_path == "" then
    reaper.MB("Couldn't load the Lokasenna_GUI library. Please run 'Set Lokasenna_GUI v2 library path.lua' in the Lokasenna_GUI folder.", "Whoops!", 0)
    return
end
loadfile(lib_path .. "Core.lua")()

GUI.req("Classes/Class - Frame.lua")()
GUI.req("Classes/Class - Button.lua")()
-- If any of the requested libraries weren't found, abort the script.
if missing_lib then return 0 end

GUI.name = "Obliques Strategies"
GUI.x, GUI.y, GUI.w, GUI.h = 0, 0, 384, 128
GUI.anchor, GUI.corner = "mouse", "C"

GUI.New("Frame1", "Frame", {
    z = 11,
    x = 0,
    y = 0,
    w = 384,
    h = 128,
    shadow = false,
    fill = false,
    color = "elm_frame",
    bg = "black",
    round = 0,
    text = "",
    txt_indent = 0,
    txt_pad = 0,
    pad = 16,
    font = 1,
    col_txt = "txt"
})

GUI.New("btn_new", "Button", {
  z = 1,
  x = 160,
  y = 100,
  w = 60,
  h = 20,
  caption = "New",
  font = 3,
  col_txt = "txt",
  col_fill = "elm_frame"
})

function GUI.elms.btn_new:onmouseup()

  GUI.Button.onmouseup(self)

  local string_msg = lines[math.random(tablelength(lines))]

  GUI.Val("Frame1", tostring(string_msg))

end


-- Returns "currently executed script's path"
function get_script_path()
  local info = debug.getinfo(1,'S');
  local script_path = info.source:match[[^@?(.*[\/])[^\/]-$]]
  return script_path
end

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

path_to_script = get_script_path()

-- file path
local file = path_to_script .. "obliques"
  --reaper.ShowConsoleMsg(file)

local lines = lines_from(file)

local string_msg = lines[math.random(tablelength(lines))]

GUI.Val("Frame1", tostring(string_msg))

GUI.Init()
GUI.Main()
