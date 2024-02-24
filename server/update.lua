AddEventHandler('onResourceStart', function(resourceName)
    if Config.CheckForUpdates then
        Citizen.CreateThread(function()
            resource_name = GetCurrentResourceName()
            PerformHttpRequest("https://api.github.com/repos/KyleFardy/VoidNotify/releases/latest", check_version, "GET")
        end)
    end
end)
function get_version()
    local file = io.open(GetResourcePath(GetCurrentResourceName()) .. "/fxmanifest.lua", "r")
    if file then
        local content = file:read("*all")
        file:close()
        local version = content:match("version%s*['\"](%d+%.%d+)['\"]")
        if version then
            return version
        else
            return "Unknown"
        end
    else
        print("Unable To Open fxmanifest.lua")
    end
end

function check_version(err, response, headers)
    current_version = get_version()
    if response == nil then
        print("^1" .. resource_name .. " Checking For Update Failed!^7")
        return
    end
    local response_obj = json.decode(response)
    if current_version ~= response_obj.tag_name and tonumber(current_version) < tonumber(response_obj.tag_name) then
        print("\n^1----------------------------------------------------------------------------------^7")
        print(resource_name ..
            " Is Outdated, The Latest Version Is: ^2" ..
            response_obj.tag_name ..
            "^7, Installed Version: ^1" ..
            current_version .. "^7!\nDownload The Update From https://github.com/KyleFardy/VoidNotify")
        print("^1----------------------------------------------------------------------------------^7")
    elseif tonumber(current_version) > tonumber(response_obj.tag_name) then
        print("\n^3----------------------------------------------------------------------------------^7")
        print(resource_name ..
            " Github Version Is: ^2" .. response_obj.tag_name .. "^7, Installed Version: ^1" .. current_version .. "^7!")
        print("^3----------------------------------------------------------------------------------^7")
    else
        print(resource_name .. " Is Up To Date! (^2" .. current_version .. "^7)")
    end
end
