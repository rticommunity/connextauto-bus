--*****************************************************************************
-- PURPOSE:
--  List the endpoints (DataWriters and DataReaders) in a DDS-XML configuration
--  
-- USAGE:
--   rtiddsprototyper 
--      <select the participant configuration>
--*****************************************************************************
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
