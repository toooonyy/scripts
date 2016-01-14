-- If the laptop is on battery, the VO set in the config will be choosen,
-- else the one defined with "hqvo" is used.
local hqvo = "opengl:scaler-resizes-only:scale=spline36:dscale=mitchell:cscale=spline36:dither-depth=8:fbo-format=rgb32f:correct-downscaling:linear-scaling:pbo:icc-profile-auto:es=no"
local utils = require 'mp.utils'
if mp.get_property_bool("option-info/vo/set-from-commandline") == true then
    return
end
t = {}
t.args = {"/usr/bin/pmset", "-g", "ac"}
res = utils.subprocess(t)
if res.stdout ~= "No adapter attached.\n" then
    mp.set_property("options/vo",hqvo)
end
