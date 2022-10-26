--*****************************************************************************
-- (C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.
--
-- The use of this software is governed by the terms specified in the 
-- RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 
--
-- By accessing, downloading, or otherwise using this software, you agree to 
-- be bound by those terms.
--*****************************************************************************
-- Subscriber
--   A generic subscriber to Take data arriving on all inputs (DataReaders) 
-- 
-- USAGE 
--[[

rtiddsprototyper -luaOnPeriod 0 -luaFile src/utils/Subscriber.lua -cfgName <name>

--]]
--*****************************************************************************

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
