--*****************************************************************************
--  (c) 2020 Copyright, Real-Time Innovations, Inc. (RTI) All rights reserved.
--
--   Licensed according to the terms in the LICENSE.md file located at the root 
--  of this software repository:
--
--                               LICENSE.md
--
--*****************************************************************************
-- Endpoint List
--   List the endpoints (DataWriters and DataReaders) in a DDS-XML configuration
-- 
-- USAGE 
--[[

rtiddsprototyper -luaFile src/utils/Endpoints.lua -cfgName <name>

--]]

-- Globals (preserved across invocations)
if not count then count = 0 else count = count + 1 end

if count == 0 then 
  -- Iterate over all the writers
  for name,writer in pairs(CONTAINER.WRITER) do 
    print("WRITER", name)
  end
  
  -- Iterate over all the readers
  for name,writer in pairs(CONTAINER.READER) do 
    print("READER", name)
  end
end

CONTAINER.CONTEXT.intentExit = true 
