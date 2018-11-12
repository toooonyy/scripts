-- If the laptop is on battery, the VO set in the config will be choosen,
-- else the one defined with "hqvo" is used.
local utils = require 'mp.utils'
if mp.get_property_bool("option-info/vo/set-from-commandline") == true then
    return
end
t = {}
t.args = {"/usr/bin/pmset", "-g", "ac"}
res = utils.subprocess(t)
if res.stdout ~= "No adapter attached.\n" then
    mp.set_property("cscale","spline36")
    mp.set_property("scale","spline36")
    mp.set_property("temporal-dither","yes")
    mp.set_property("correct-downscaling","yes")
    mp.set_property("linear-downscaling","yes")
    mp.set_property("sigmoid-upscaling","yes")
end
