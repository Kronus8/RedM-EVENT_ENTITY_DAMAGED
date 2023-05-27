Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local size = GetNumberOfEvents(0)
        if size > 0 then
            for index = 0, size - 1 do
                local event = GetEventAtIndex(0, index)
                if event == `EVENT_ENTITY_DAMAGED` then
					local eventDataSize = 9

					local eventDataStruct = DataView.ArrayBuffer(8*9) -- buffer must be 8*eventDataSize or bigger
					eventDataStruct:SetInt32(0 ,0)		 	-- 8*0 offset for 0 element of eventData
					eventDataStruct:SetInt32(8 ,0)    	  	-- 8*1 offset for 1 element of eventData
					eventDataStruct:SetInt32(16 ,0)			-- 8*2 offset for 2 element of eventData
					eventDataStruct:SetInt32(24 ,0)			-- 8*3 offset for 3 element of eventData
					eventDataStruct:SetInt32(32,0)    		-- 8*4 offset for 4 element of eventData
					eventDataStruct:SetInt32(40,0)    		-- 8*5 offset for 5 element of eventData
                    eventDataStruct:SetInt32(48,0)    		-- 8*6 offset for 6 element of eventData
                    eventDataStruct:SetInt32(56,0)    		-- 8*7 offset for 7 element of eventData
                    eventDataStruct:SetInt32(64,0)    		-- 8*8 offset for 8 element of eventData

					local is_data_exists = Citizen.InvokeNative(0x57EC5FA4D4D6AFCA, 0, index, eventDataStruct:Buffer(), eventDataSize) -- GET_EVENT_DATA

					if is_data_exists then
						print("0: pedId: "..eventDataStruct:GetInt32(0))
						print("1: object: "..eventDataStruct:GetInt32(8))
						print("2: weaponhash: "..eventDataStruct:GetInt32(16))
						print("3: ammohash: "..eventDataStruct:GetInt32(24))
						print("4: damage: "..eventDataStruct:GetFloat32(32))
						print("5: unknown: "..eventDataStruct:GetInt32(40))
                        print("6: coord x: "..eventDataStruct:GetFloat32(48))
                        print("7: coord y: "..eventDataStruct:GetFloat32(56))
                        print("8: coord z: "..eventDataStruct:GetFloat32(64))
					end
                end
            end
        end
    end
end)