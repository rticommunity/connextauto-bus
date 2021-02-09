--*****************************************************************************
--  (c) 2020 Copyright, Real-Time Innovations, Inc. (RTI) All rights reserved.
--
--   Licensed according to the terms in the LICENSE.md file located at the root 
--  of this software repository:
--
--                               LICENSE.md
--
--*****************************************************************************
-- Generic Publisher
--   Write default values on all outputs (DataWriters) 
-- 
-- USAGE 
--[[

rtiddsprototyper -luaOnData 0 -luaFile src/utils/Publisher.lua -cfgName <name> 

--]]

-- Globals (preserved across invocations)
if not count then count = 0 else count = count + 1 end
print("*** iteration ", count,  "***")

-- Iterate over all the writers
for name,writer in pairs(CONTAINER.WRITER) do 
    print("WRITER", name)
    writer:write()
end
