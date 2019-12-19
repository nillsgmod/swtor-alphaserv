surface.CreateFont( "hudfont", {
	font = "Verdana",
	extended = false,
	size = ScrH()*0.016,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )

surface.CreateFont( "hudfontjobname", {
	font = "Verdana",
	extended = false,
	size = ScrH()*0.018,zdzd
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )

hook.Add( "HUDPaint", "HUDPaintShaared", function()

local self = LocalPlayer()

health = LocalPlayer():Health()zdzdzd
armor = LocalPlayer():Armor()

	if health >= 100 then health = 100 end
	if health <= 0 then health = 0 end

	if armor >= 255 then armor = 255 end
	if armor <= 0 then armor = 0 end

--[[Global]]--

--santé
draw.RoundedBox( 4, ScrW()*0.09, ScrH()*0.949, ScrW()*0.159, ScrH()*0.01, Color ( 19, 18, 16, 250 ) )

--santé point
draw.RoundedBox( 6, ScrW()*0.005, ScrH()*0.944, ScrW()*0.0845, ScrH()*0.02, Color ( 19, 18, 16, 250 ) )

--armure
draw.RoundedBox( 4, ScrW()*0.09, ScrH()*0.976, ScrW()*0.159, ScrH()*0.01, Color ( 19, 18, 16, 250 ) )

--armure point
draw.RoundedBox( 6, ScrW()*0.005, ScrH()*0.971, ScrW()*0.0845, ScrH()*0.02, Color ( 19, 18, 16, 250 ) )

--[[Santé]]--

draw.RoundedBox(4, ScrW()*0.0915, ScrH() * 0.951, ScrW() * 0.00156 * health, ScrH()*0.006, Color( 68,175,113) )
draw.RoundedBox(4, ScrW()*0.008, ScrH()*0.951, ScrW()*0.009, ScrH()*0.006, Color ( 68,175,113 ) )
draw.SimpleText( self:Health() > 0 and "" .. self:Health() .. " / " .. self:GetMaxHealth() or 0 and "0" .. " / " .. self:GetMaxHealth(), "hudfont", ScrW()*0.02, ScrH()*0.9455, Color( 255, 255, 255 ) )

--[[Armure]]--

draw.RoundedBox(4, ScrW()*0.0915, ScrH() * 0.978,  ScrW() * 0.0006118 * armor, ScrH()*0.006, Color( 50, 100, 255 ) )
draw.SimpleText(self:Armor() > 0 and "" .. self:Armor() .. " / 255" or 0 and self:Armor() .. " / 255" , "hudfont", ScrW() * 0.02, ScrH() * 0.9722, Color (255, 255, 255) )
draw.RoundedBox(4, ScrW()*0.008, ScrH()*0.979, ScrW()*0.009, ScrH()*0.006, Color ( 50, 100, 255 ) )

local argent = tostring( LocalPlayer():getDarkRPVar("money") ) .. " Dataris"

--dataris
draw.RoundedBox( 6, ScrW()*0.005, ScrH()*0.914, ScrW()*0.0845, ScrH()*0.02, Color ( 19, 18, 16, 250 ) )
--dataris barre jaune
draw.RoundedBox( 4, ScrW()*0.008, ScrH()*0.92165, ScrW()*0.009, ScrH()*0.006, Color ( 247,164,26 ) )
--money nombre
draw.SimpleText( argent , "hudfont", ScrW()*0.02, ScrH() * 0.9145, Color( 255, 255, 255) )


--job
draw.RoundedBox( 6, ScrW()*0.091, ScrH()*0.914, ScrW() *0.157, ScrH() *0.02, Color ( 19, 18, 16, 250 ) )

local job = tostring( LocalPlayer():getDarkRPVar("rpname") )
local teamcolor = team.GetColor( LocalPlayer():Team() )

draw.SimpleText( job , "hudfontjobname", ScrW() *0.17, ScrH() * 0.9138, Color( 255, 255, 255), TEXT_ALIGN_CENTER )

draw.RoundedBox(4, ScrW()*0.235, ScrH()*0.92165 , ScrW()*0.009, ScrH()*0.006, teamcolor )
draw.RoundedBox(4, ScrW()*0.0955, ScrH()*0.92165 , ScrW()*0.009, ScrH()*0.006, teamcolor )

end )

hook.Add( "HUDShouldDraw", "Hidehud", function( name )
     if ( name == "CHudHealth" or name == "CHudBattery" or name == "CHudAmmo" or name == "CHudSecondaryAmmo") then
         return false
     end

end )
