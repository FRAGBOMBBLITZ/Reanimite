--[[	
	d8888b. d88888b  .d8b.  d8b   db d888888b .88b  d88. d888888b d888888b d88888b 
	88  `8D 88'     d8' `8b 888o  88   `88'   88'YbdP`88   `88'   `~~88~~' 88'     
	88oobY' 88ooooo 88ooo88 88V8o 88    88    88  88  88    88       88    88ooooo 
	88`8b   88~~~~~ 88~~~88 88 V8o88    88    88  88  88    88       88    88~~~~~ 
	88 `88. 88.     88   88 88  V888   .88.   88  88  88   .88.      88    88.     
	88   YD Y88888P YP   YP VP   V8P Y888888P YP  YP  YP Y888888P    YP    Y88888P 
	                                                                                                                                                      
	Reanimite 1.0
	Created by Ches (@FRAGBOMBBLITZ)
	
	Instructions:
	Place this script at the bottom of the 
	script you are wanting to replicate, 
	and submit relevant entrie(s) 
	to the ReplicationTable.
	
	Note:
	See "Submitting ReplicationTable Entrie(s)"
	to know how to add entrie(s).
	
	Contributors:
	ShownApe: AccessoryCollision Method, Permadeath
	OOF (@rodvd): Permadeath

	Updates:
	Version 1.0.1: 9/04/2025 1:50 AM "Beta Testing" "Never a frown with golden brown" Note: 
	Version 1.0.2: 13/04/2025 4:06 AM "Beta Testing" "Forever (Live and die)" Note: Reanimation transition visualization
	Version 1.0.3: 16/04/2025 5:35 AM "Beta Testing" "Want You Gone" Note: ReplicationTable Entry Part0 AssetId support (and additional documentation)
	Version 1.0.4: 17/04/2025 4:17 AM "Beta Testing" "Computer Games" Note: Antisleep and velocity related changes, and duplicate hat replication bug patched

	Discord Server:
	https://discord.gg/Ud6zrfuhAK
]]

--[[
	ReanimationDummy Configuration:
	
	If you are using a script that uses
	a custom rig, e.g. Touché's Horse script.
	
	You would want to define the ReanimationDummy
	variable as that scripts rig, e.g.
	ReanimationDummy = Character
	
	Or just use the scripts Character variable in
	the ReplicationTable.
]]

--[[
	Submitting ReplicationTable Entrie(s):
	
	The ReplicationTable is passed to the
	ReanimationModule's Reanimate function
	when reanimating.
	
	It is expected to contain entrie(s) on
	what you want to replicate with your hats.

	Example:
	
	{
		Part0 = "ScifiMovieHat",
		Part1 = ReanimationRig["Left Arm"],
		Transform = CFrame.Angles(math.rad(90),0,0)
	}
	
	Part0 can be the accessory's name (string) (See this easily with Dex explorer), the accessory's Handle (BasePart), or the accessory's AssetId (number)* e.g. "RedHat", Character.RedHat.Handle, 80930922586072
	Part1 is the BasePart you are replicating your accessory to
	Transform is the CFrame offset from Part1
	
	Template:
	{Part0 = , Part1 = BasePart, Transform = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))}

	*Please note that if you use AssetId for Part0, expect a lag spike on first load of that AssetId. AssetId may not be for you if you do not have a stable internet connection, please let-
	-me know if you experience issues with anything at all, especially this.
]]	

--[[
	ReplicationTable Settings:
	
	- AccessoryCollision (Coming soon)
		- Value: boolean
		- Default Value: false
		- Description: Uses ShownApe's method of Hatdrop to attempt to drop all your accessories.
	
	- NonEssentialAccessories
		- Value: boolean
		- Default Value: false
		- Description: Adds non-specified accessories from your character to the ReplicationTable. (All hats)

	- NonEssentialAccessoryBlacklist (Coming soon)
		- Value:
		- Default Value:
		- Description: A table on what accessories shouldn't be replicated if NonEssentialAccessories is enabled.
]]

local ReanimationModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/FRAGBOMBBLITZ/Reanimite/refs/heads/main/ReanimiteSource.lua"))()
local ReanimationDummy = ReanimationModule:CreateDummy()

local ReplicationTable = { -- The following entries were left as an extra example on how to correctly add entries, please use as a reference and then remove them all
	-- Noob Rig
	{Part0 = "RetroFace", Part1 = ReanimationDummy.Head},
	{Part0 = "Accessory (Black)", Part1 = ReanimationDummy.Torso},
	{Part0 = "Accessory (LArmNoob)", Part1 = ReanimationDummy["Left Arm"], Transform = CFrame.Angles(0,0,math.rad(90))},
	{Part0 = "Accessory (RArmNoob)", Part1 = ReanimationDummy["Right Arm"], Transform = CFrame.Angles(0,0,math.rad(90))},
	{Part0 = "Accessory (LArm)", Part1 = ReanimationDummy["Left Leg"], Transform = CFrame.Angles(0,0,math.rad(90))},
	{Part0 = "Accessory (RArm)", Part1 = ReanimationDummy["Right Leg"], Transform = CFrame.Angles(0,0,math.rad(90))},

	-- Ches's Rig
	{Part0 = "Accessory (DummyTorso)", Part1 = ReanimationDummy.Torso},
	{Part0 = "Accessory (DummyLeftArm)", Part1 = ReanimationDummy["Left Arm"]},
	{Part0 = "Accessory (DummyRightArm)", Part1 = ReanimationDummy["Right Arm"]},
	{Part0 = "Accessory (DummyLeftLeg)", Part1 = ReanimationDummy["Left Leg"]},
	{Part0 = "Accessory (DummyRightLeg)", Part1 = ReanimationDummy["Right Leg"]},
}

ReplicationTable.NonEssentialAccessories = true

ReanimationModule:Reanimate(ReplicationTable)
