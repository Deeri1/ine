if not isfolder("DeeriHub") then
    makefolder("DeeriHub")
    end
    repeat wait() until isfolder("DeeriHub")
    plr = game.Players.LocalPlayer
    char = plr.Character
    if char:FindFirstChild("Humanoid") then
    hum = char.Humanoid
    humanoid = hum
    end
    hrp = char.HumanoidRootPart
    lplayer = plr
    plrname = game.Players.LocalPlayer.Name
    workspace.FallenPartsDestroyHeight = 0/0
    RunService = game:GetService("RunService")
    mouse = plr:GetMouse()
    print("firstname",plrname)
    key = "/e"
    key2 = ";"
    key3 = "/"
    key4 = [[\]]
    noclip= false
    doingclick = false
    doingclick2 = false
    function GetRoot(targetplr)
        if targetplr:FindFirstChild("HumanoidRootPart") then
            v = targetplr.HumanoidRootPart
        else
            if targetplr:FindFirstChild("Torso") then
                v = targetplr.Torso
            else
                if targetplr:FindFirstChildOfClass("Accessory") then
                    v = targetplr:FindFirstChildOfClass("Accessory").Handle
                end
            end
        end
        return v
    end
    function randomString()
        local length = math.random(10,20)
        local array = {}
        for i = 1, length do
            array[i] = string.char(math.random(32, 126))
        end
        return table.concat(array)
    end
    function GetPlayer(String) -- Credit to Timeless/xFunnieuss
        
        print(String)
        local Found = {}
        local strl = String:lower()
        if strl == "all" then
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                table.insert(Found,v)
            end
        elseif strl == "others" then
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.Name ~= lplayer.Name then
                    table.insert(Found,v)
                end
            end   
        elseif strl == "me" then
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.Name == lplayer.Name then
                    table.insert(Found,v)
                end
            end  
        else
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.DisplayName:lower():sub(1, #String) == String:lower()  or v.Name:lower():sub(1, #String) == String:lower() then
                    table.insert(Found,v)
                end
            end    
        end
        return Found    
    end
    tempncend = true
    function nolcipf(version)
        if version == "off" then
            tempncend = true
            for i, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Part") then
                    if v.Parent~=workspace then
                        v.CanCollide = true
                    end
                end
            end
    else
        tempncend = false
        while wait() and tempncend == false do
                for i, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("Part") then
                        if v.Parent~=workspace then
                            v.CanCollide = false
                        end
                    end
                end
            end
        end     
            
    end
    function goto(target)
    target2 = game:GetService("Players")[target.Name].Character
    hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    hrp.RotVelocity = Vector3.new(0, 0, 0)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = GetRoot(target2).CFrame
    end
    function test(traget)
    print(traget)
    end
    function cspye(traget)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/chat%20spy"))()
    end
    function sflinge(target)
        if target ~= "stop" and target ~= plrname and game.Workspace:FindFirstChild(target.Name) then
                coroutine.wrap(nolcipf)()
            target = game.Workspace[target.Name]
    speaker = game.Players.LocalPlayer
    for _, child in pairs(speaker.Character:GetDescendants()) do
            if child:IsA("BasePart") then
                child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
            end
        end
        local Char = speaker.Character:GetChildren()
        for i, v in next, Char do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.Massless = true
                v.Velocity = Vector3.new(0, 0, 0)
            end
        end
        wait(.1)
        hrp = speaker.Character.HumanoidRootPart
        oldcf = speaker.Character.HumanoidRootPart.CFrame
      -- hrp.Parent.Humanoid.PlatformStand = true
      endedskid = false
      function gotoskid()
        while wait() do
            if target:FindFirstChild("HumanoidRootPart") then
                v = target:FindFirstChild("HumanoidRootPart")
                hrp.CFrame = v.CFrame
            elseif  target:FindFirstChildOfClass("Accessory") then
                v = target:FindFirstChildOfClass("Accessory")
                hrp.CFrame = v.Handle.CFrame
            end
            if endedskid == true then
                break
            end
        end
      end
      coroutine.wrap(gotoskid)()
            wait(.1)
        local bambam = Instance.new("BodyAngularVelocity")
        bambam.Name = randomString()
        bambam.Parent = speaker.Character.HumanoidRootPart
        bambam.AngularVelocity = Vector3.new(0,99999,0)
        bambam.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
        bambam.P = math.huge
        local bambam = Instance.new("BodyVelocity")
        bambam.Name = randomString()
        bambam.Parent = speaker.Character.HumanoidRootPart
        bambam.MaxForce = Vector3.new(0,99999,0)
        bambam.Velocity = Vector3.new(math.huge,math.huge,math.huge)
        bambam.P = math.huge
    wait(2)
    endedskid = true
        for i,v in pairs(speaker.Character.HumanoidRootPart:GetChildren()) do
            if v.ClassName == 'BodyAngularVelocity'or v.ClassName == 'BodyVelocity' then
                v:Destroy()
            end
        end
        wait(.2)
       -- coroutine.wrap(nolcipf)("off")
       --   game:GetService('RunService').Heartbeat:Wait()
        hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        hrp.RotVelocity = Vector3.new(0, 0, 0)
        --hrp.AssemblyAngularVelocity
        hrp.CFrame = CFrame.new(oldcf.X,oldcf.Y+3,oldcf.Z)
        coroutine.wrap(nolcipf)()
        hrp.CFrame = CFrame.new(oldcf.X,oldcf.Y+3,oldcf.Z)

        wait(1)

        hrp.CFrame = CFrame.new(oldcf.X,oldcf.Y+3,oldcf.Z)

    end
    end
    function loadxd(id1,id2)
        if id2 ~= "" and id2 ~= " " and id2 ~= nil then
             if GetPlayer(id2) then
                print(GetPlayer(id2)[1])
              parnt =   game.Workspace:FindFirstChild(GetPlayer(id2)[1].Name)
              lol = game:GetObjects("rbxassetid://"..id1.."")[1]
              lol.Parent = parnt
                lol:FindFirstChildOfClass("Part").Position = parnt:FindFirstChildOfClass("Part").Position
                lol:FindFirstChildOfClass("Part").Anchored = true 
             end
        else
            lol = game:GetObjects("rbxassetid://"..id1.."")[1]
            lol.Parent = game.Workspace
            lol:FindFirstChildOfClass("Part").Position = char.HumanoidRootPart.Position
            lol:FindFirstChildOfClass("Part").Anchored = true
              
        end
    end
    function dexf(version)
        if version == 'v3' or version == 'v4'  or version == 'v2'   or version == 'frosty' or version == 'v5'   then
            if version == "v4" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceSpiffer/Scripts/main/Script5", true))()
                    end
            if version == "v3" then
                 loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
            end
            if version == "v2" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceSpiffer/Scripts/main/Script4", true))()
           end
           if version == "frosty" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/frosty.txt"))()
            end
            if version == "v5" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/dv5.txt"))()
                end
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
        end
    end
    function rejoin()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
    end
    function notoolkill(version)
        if version == "off" then
            donetk = true
        else
            donetk = false
           thing =  RunService.RenderStepped:Connect(function()
                if donetk == false then
    
                        hum:UnequipTools()
                else
                    thing:Disconnect()
                end
            end)
        end
    end
    function clicktpe()
    local UserInputService = game:GetService("UserInputService")
    if doingclick2 == false then
    while wait() and doingclick2 == false  do
        if doingclick== false then
            doingclick = true
            doingclick2 = true
            thing2 = mouse.Button1Down:Connect(function() 
                        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and mouse.Target then
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            hrp.RotVelocity = Vector3.new(0, 0, 0)
                          hrp.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
                        end
                    end)
    end
    end
    else
        thing2:Disconnect()
        wait()
        doingclick2 = false
    end
    
    end
    alreadydone = false
    function autoexee(val2,val3)
        alreadydone =false
        commandnum = 0
        data = readfile("DeeriHub/AdminDNA.txt")
        data = table.concat(data, ":")
        if val2 ~= nil then
            print("running2")
        for i, v in pairs(commands) do
            print(v,i)
            commandnum = commandnum+1
            print(data[commandnum],"lol")
            if i == val2 and alreadydone == false  then
                print(data[commandnum])
                if data[commandnum] == false and i == val2 then
                    v.autoexe = true
                    alreadydone = true
                    print(i,commandnum,"firstone")
                elseif  i == val2  and data[commandnum] == true then
                    v.autoexe = false
                    alreadydone = true
                    print(i,commandnum,"secondone")
                end
            end
            if alreadydone == false then
                for i, e in pairs(v.altnames) do
                    if i == val2 then
                        v.autoexe = true
                        alreadydone = true
                        print("madetruealt")
                    end
                end
            end
        end
            if isfile("DeeriHub/AdminDNA.txt") then
                delfile("DeeriHub/AdminDNA.txt")
                print("deleatedfile")
                end
                if not isfile("DeeriHub/AdminDNA.txt") then
                data = {}
                commandnum = 0
                 for i, v in pairs(commands) do
                     if v.functionname then
                         commandnum = commandnum +1
                         table.insert(data, tostring(v.autoexe))
                         print(v.autoexe,i)
                         print(data[i])
                     end
                 end
                savedata = table.concat(data, ":")
                print(savedata,"updated")
                writefile("DeeriHub/AdminDNA.txt",savedata)

            
    end
    end
end


function ghlol(hats)
    print(hats)
    val = string.sub(hats,1,1)
    print(val,"startnumlol")
    starth = 1
    endh = 1    
   while wait() do
        if  string.sub(hats,endh,endh) ~="," and tonumber(string.sub(hats,endh,endh)) then
            endh = endh + 1
            print("nextnum")
            --hats[] = {}
        elseif string.sub(hats,endh,endh) == "," then
        print(string.sub(hats,starth,endh-1),"a")
        lol = game:GetObjects("rbxassetid://"..string.sub(hats,starth,endh-1).."")[1]
        humanoid:AddAccessory(lol)
           nweld = Instance.new("WeldConstraint",lol.Handle)
            nweld.Name = "AccessoryWeld"
            lol.Handle.CFrame = hrp.CFrame
            nweld.Part0 = lol.Handle
            nweld.Part1 = hrp
       -- loadxd(string.sub(hats,starth,endh-1),game.Players.LocalPlayer.Name)
        starth = endh+1
        endh = endh + 1

        elseif string.sub(hats,endh,endh) == " " or string.sub(hats,endh,endh) == ""   then
        print(string.sub(hats,starth,endh-1),"a")
        lol = game:GetObjects("rbxassetid://"..string.sub(hats,starth,endh-1).."")[1]
        humanoid:AddAccessory(lol)
           nweld = Instance.new("WeldConstraint",lol.Handle)
            nweld.Name = "AccessoryWeld"
            lol.Handle.CFrame = hrp.CFrame
            nweld.Part0 = lol.Handle
            nweld.Part1 = hrp
           -- nweld.Active = true
           -- nweld.Part0 = lol.Handle
       --    lol.Handle.CFrame = char.HumanoidRootPart.CFrame
       -- lol.Parent = char
           return
        end
    end
end

function printxd(subcmd)
    print("printran" , subcmd)
    if subcmd == "plrs" or subcmd == "players" then
        print("list of players")
        plrtbl = game.Players:GetPlayers()
        numplr = #plrtbl
        count = 1
        for i = 1, numplr do
        print(plrtbl[count])
        count = count + 1
        end
        print("________________________________________________________________")

    end

    if subcmd == "cmds" or subcmd == "commands" then
        print("________________________________________________________________")
        print("list of commands")
        --print("________________________________________________________________")
        for i, v in pairs(commands) do
            print("________________________________________________________________")
            print(i,"V")
            print(v[i])
            print("________________________________________________________________")
            if type(v) == "table" then
             for i, e in pairs(v) do
                print(i)
                print(e)
                if type(e) == "table" then
                    for i, a in pairs(e) do
                       print(i)
                       print(a)
                       --print("________________________________________________________________")
                   end
                   end
                --print("________________________________________________________________")
            end
            end
        end
        print("________________________________________________________________")
    end



end

function glitchskidxd()
    workspace.FallenPartsDestroyHeight = 0/0
    local savpos = hrp.CFrame

    hrp.CFrame = CFrame.new(math.huge,-math.huge,math.huge)
    wait()
    hrp.CFrame = savpos
end



function splite(endcmd)
    local foundend = false
        for i, v in pairs(ctable) do
            if i ~= 1 and i ~= 2 and not foundend then
                
                if v == endcmd then
                    print("found end at phrase",i,"end is",v)
                    foundend = true
                end



            end
        end


end



    function empty()
        
    end

    commands = {
            noclip = {
                functionname = [[nolcipf(ctable[2])]],
                altnames = {"antifling"},
                autoexe = false,
                description  = "Prevents your character from getting flung and allows you to walk through walls"
            },
            gh = {
                functionname = [[ghlol(ctable[2])]],
                altnames = {"gethats"},
                autoexe = false,
                description  = "loads hats onto character is not fe but is usefull to use scripts that require hats but you dont have them"
            },
            split = {
                functionname = [[splite(ctable[2])]],
                altnames = {},
                autoexe = false,
                description  = "usefull in auto exe."
            },
            rj = {
                functionname = [[rejoin(ctable[2])]],
                altnames = {"rejoin"},
                autoexe = false,
                description  = "You rejoin the game"
            },
            glitchskid = {
                functionname = [[glitchskidxd()]],
                altnames = {"glitchtpskid","gtpskid"},
                autoexe = false,
                description  = "teleport somewere faraway to glitch players who teleport to you"
            },
            print = {
                functionname = [[printxd(ctable[2])]],
                altnames = {"output"},
                autoexe = false,
                description  = "a few things you could print exe: /e print cmds or /e print plrs"
            },
            te = {
                functionname = [[test(ctable[2])]],
                altnames = {"test",'st'},
                autoexe = false,
                description  = "test"
            },
            goto = {
                functionname = [[goto(ctable[2])]],
                altnames = {"to","tpto"},
                autoexe = false,
                description  = "go to a player"
            },
            tkill = {
                functionname = [[notoolkill(ctable[2])]],
                altnames = {"anti-tkill"},
                autoexe = false,
                description  = "not the best but it constantly unequpts your tools"
            },
            sfling = {
                functionname = [[sflinge(ctable[2])]],
                altnames = {"fling"},
                autoexe = false,
                description  = "tp to a player and spin fling them"
            },
            clicktp = {
                functionname = [[clicktpe()]],
                altnames = {"ctp"},
                autoexe = false,
                description  = "press crtl and click to tp to your mouses location"
            },
            spy = {
                functionname = [[cspye(ctable[2])]],
                altnames = {"cspy","chatspy","chat-spy"},
                autoexe = false,
                description  = "Chat Spy"
            },
            load = {
                functionname = [[loadxd(ctable[2],ctable[3])]],
                altnames = {"spawn"},
                autoexe = false,
                description  = "Loads a asset into the game can be used on a player exe; '/e load 'id' 'playername'' if no player name it will be put in workspace"
            },
            autoexe = {
                functionname = [[autoexee(ctable[2],ctable[3])]],
                altnames = {},
                autoexe = false,
                description  = "allows you to run a command as the script is ran exe: '/e autoexe 'command name' 'extra values'' "
            },
            dex = {
                functionname = [[dexf(ctable[2])]],
                altnames = {"explorer"},
                autoexe = false,
                description  = "Opens up the Dex Explorer you can add extra permitters exe: '/e dex (v2/v3/v4/v4/frosty)' can be left as just '/e dex' "
            }
    
    }
    --[[
    autoexe stuff 👍
    ]]--
    commandnum = 0
    if not isfile("DeeriHub/AdminDNA.txt") then
    data = {}
     for i, v in pairs(commands) do
         if v.functionname then
             commandnum = commandnum +1
             table.insert(data, tostring(v.autoexe))
             print(data[commandnum])
         end
     end
    savedata = table.concat(data, ":")
    print(savedata)
    print(commandnum,":Commands")
    writefile("DeeriHub/AdminDNA.txt",savedata)
    print(readfile("DeeriHub/AdminDNA.txt"),"lol2")
    end
    data = readfile("DeeriHub/AdminDNA.txt")
    data = data:split(":")
    commandnum = 0
    for i, v in pairs(commands) do
         commandnum = commandnum+1
         if data[commandnum] == true then
             v.autoexe = true
             loadstring(v.functionname)()
         end
    end
    --done
    characters = ('a') or ('b') or ("c") or ('d') or ('e') or ("f") or ('g') or ('h') or ("i") or ('j') or ('k') or ("l") or ('m') or ("n") or ('o') or ('p') or ("q") or ('r') or ("s") or ('t') or ('u') or ("v") or ('w') or ("x") or ('y') or ('z')
    plr.Chatted:Connect(function(msg)
        itsago = false
        if string.sub(msg, 0, 2) == "/e" then
            before = 4
            itsago = true
        end
        if string.sub(msg, 0, 1) == ";" then
                before = 2
                itsago = true
          
        end
        if itsago == true then
        before2 = before

        done = false
        total = 0
        ctable = {}
        while done == false do
            wait()
            if string.sub(msg,before2,before2) ~= " " and string.sub(msg,before2,before2) ~= ""  and  string.sub(msg,before2,before2) ~=  "  " then--then
                val = string.sub(msg,before2,before2)
                --print(val)
                before2 = before2+1
            else 
                total = total+1
                before = before
                ctable[total] = string.sub(msg,before,before2-1)
                --print(ctable[total],"xd",total)
                before2 = before2+1
                before = before2

                if string.sub(msg,before2,before2) == " " or string.sub(msg,before2,before2) == ""  or  string.sub(msg,before2,before2) ==  "  " then--then
                    done = true
                    break
                    --total = total -1
                end
            end



        end
        for i, v in pairs(ctable) do -- fix them idk why
            print(i,v,"i,v",ctable[i],ctable[v],"ctable[i],ctable[v]")
            if i~= 1 then
            ctable[i] = v
            end
        end

        for i, v in pairs(ctable) do
            --print(v)
           -- print(ctable[i])
            if GetPlayer(v)[1] ~= nil  and ctable[i] ~= ctable[1] then
              --  print(i,v,"lolidk")
                ctable[i] = GetPlayer(v)[1]
                print(ctable[i])
            end
        end
        print("total: ",total)
        if commands[ctable[1]] then
            print("cmd "..ctable[1].." found nosearch")
            v = commands[ctable[1]]
            if total == 1 then
                print("total 1")
                loadstring(v.functionname)()
            elseif total == 2 then
                print("total 2")
                print(ctable[2],"ctable[2]")
                loadstring(v.functionname)(ctable[2])
            elseif total == 3 then
                print("total 3")
                print(ctable[2],ctable[3],"ctable[2],ctable[3]")
                loadstring(v.functionname)(ctable[2],ctable[3])
            end

        else
            print("cmd "..ctable[1].." found search")
            y = ctable[1]
            for i, v in pairs(commands) do
                e = i
                v = v["altnames"]
               -- print('lol',v[1])
                for i, v in pairs(v) do
                    print(v,y)
                    if v == y then
                       i = commands[e]
                       if total == 1 then
                        print("total 1")
                        loadstring(i.functionname)()
                    elseif total == 2 then
                        print("total 2")
                        print(ctable[2],"ctable[2]")
                        loadstring(i.functionname)(ctable[2])
                    elseif total == 3 then
                        print("total 3")
                        print(ctable[2],ctable[3],"ctable[2],ctable[3]")
                        loadstring(i.functionname)(ctable[2],ctable[3])
                    end
                       return
                    end
                end
            end

        end
      
    end
    end)
