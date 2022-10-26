--*****************************************************************************
-- (C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.
--
-- The use of this software is governed by the terms specified in the 
-- RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 
--
-- By accessing, downloading, or otherwise using this software, you agree to 
-- be bound by those terms.
--*****************************************************************************
-- Publisher
--   A generic publisher to Write default values on all outputs (DataWriters)
-- 
-- USAGE 
--[[

rtiddsprototyper -luaOnData 0 -luaFile src/utils/Publisher.lua -cfgName <name> 

--]]
--*****************************************************************************

-- Globals (preserved across invocations)
if not count then count = 0 else count = count + 1 end
print("*** iteration ", count,  "***")

-- Iterate over all the writers
for name,writer in pairs(CONTAINER.WRITER) do 
    print("WRITER", name)
    writer:write()
end
