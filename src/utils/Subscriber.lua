--*****************************************************************************
--  (c) 2020 Copyright, Real-Time Innovations, Inc. (RTI) All rights reserved.
--
--   Licensed according to the terms in the LICENSE.md file located at the root 
--  of this software repository:
--
--                               LICENSE.md
--
--*****************************************************************************
-- Generic Subscriber
--   Take data arriving on all inputs (DataReaders) 
-- 
-- USAGE 
--[[

rtiddsprototyper -luaOnPeriod 0 -luaFile src/utils/Subscriber.lua -cfgName <name>

--]]

-- Globals (preserved across invocations)
if not count then count = 0 else count = count + 1 end
print("*** iteration ", count,  "***")

-- Iterate over all the readers
for name,reader in pairs(CONTAINER.READER) do 

    reader:take()
    print("READER", name, "#samples", #reader.samples)
    
    for  i, sample in ipairs(reader.samples) do
        print(i, ": valid_data = ", reader.infos[i].valid_data)
    end
end
