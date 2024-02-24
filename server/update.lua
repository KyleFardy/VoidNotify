if Config.CheckForUpdates then
    Citizen.CreateThread(function()
        resource_name = "Void Notify (" .. GetCurrentResourceName() .. ")"
        PerformHttpRequest("https://raw.githubusercontent.com/KyleFardy/VoidNotify/master/version", check_version, "GET")
    end)
end
function check_version(err, response, headers)
    current_version = LoadResourceFile(GetCurrentResourceName(), "version")
    if response == nil then
        print("^1" .. resource_name .. " Checking For Update Failed!^7")
        return
    end
    if current_version ~= response and tonumber(current_version) < tonumber(response) then
        update = true
        print("\n^1----------------------------------------------------------------------------------^7")
        print(resource_name.." Is Outdated, The Latest Version Is: ^2"..response.."^7, Installed Version: ^1"..current_version.."^7!\nDownload The Update From https://github.com/KyleFardy/VoidNotify")
        print("^1----------------------------------------------------------------------------------^7")
    elseif tonumber(current_version) > tonumber(response) then
        print("\n^3----------------------------------------------------------------------------------^7")
        print(resource_name.." Github Version Is: ^2"..response.."^7, Installed Version: ^1" .. current_version .. "^7!")
        print("^3----------------------------------------------------------------------------------^7")
    else
        print("\n" .. resource_name .. " Is Up To Date! (^2" .. current_version .. "^7)")
    end
end
