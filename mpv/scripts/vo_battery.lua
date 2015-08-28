-- If the laptop is on battery, the VO set in the config will be choosen,
-- else the one defined with "hqvo" is used.
local hqvo = "opengl-hq:interpolation:swapinterval=1:scaler-resizes-only:scale=spline36:scale-radius=3:scale-antiring=1.0:dscale=mitchell:cscale=spline36:cscale-radius=3:tscale=oversample:dither-depth=8:fbo-format=rgb16f:linear-scaling:icc-profile-auto"

local utils = require 'mp.utils'
if mp.get_property_bool("option-info/vo/set-from-commandline") == true then
    return
end
t = {}
t.args = {"/usr/bin/pmset", "-g", "ac"}
res = utils.subprocess(t)
if res.stdout ~= "No adapter attached.\n" then
    mp.set_property("options/vo",hqvo)
    mp.set_property_number("display-fps",60)
end
