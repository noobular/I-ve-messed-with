na_hopper = {}
-- Noobular's Addons [Printer Hoppers]
-- Created by : Noobular (Uncle Gremblo)
-- Last Update: 1/21/2018
-- No Redistribution
-------------------------------------------

------------------ Owner/Admin ------------------ 

--DebugMode; If true, turns on certain testing features NEVER ENABLE DURING PUBLIC USE
na_hopper['DebugMode'] = false

------------------ Text / Language Support ------------------ 

--Currency; Currency symbol used on the UI
na_hopper['Currency'] = "$"

------------------ Visual Performance ------------------ 

--VisualRadiusEnabled; if true, will show the radius of the collecting area
na_hopper['VisualRadiusEnabled'] = true

--RenderDistance; Distance (in units) which the hopper + 3D2D drawings are rendered
na_hopper['RenderDistance'] = 1200

------------------ Hopper Config ------------------ 

-- CollectionRadius; Radial distance to collect from printers / spawned_money
na_hopper['CollectionRadius'] = 120

-- Max Stored; Max amount of money in the collecter at a given time
na_hopper['MaxStored'] = 15000000

--SearchTimer; How long (in seconds) till a hopper searches for printers
na_hopper['SearchTimer'] = 1


------------------ Hopper Leveling Config ------------------ 

--CollectionExperienceRequired; the required amount for the first level (multiplies by 2 every level)
na_hopper['CollectionExperienceRequired'] = 25

--PrinterLevelMultiplier; when leveling , what the max is multiplied by.
na_hopper["HopperLevelMultiplier"] = 1.5 

--PrinterMoneyMultiplier; base money * PrinterLevelMultiplier = collected money (Does add on to the upg_money if they have it on the hopper)
na_hopper["HopperMoneyMultiplier"] = .1 -- 10% increase per level

--PrinterXPMultiplier; XP collected * PrinterXPMultiplier = what is actually collected in the hopper (Only single digits after the decimal ex: 1.5 not 1.55, it messes up the gui)
na_hopper["HopperXPMultiplier"] = .1 -- 10% increase per level

--PrinterCapMultiplier; base * PrinterCapMultiplier = max cap
na_hopper["HopperCapMultiplier"] = .1 -- 5% increase per level

------------------ UPGRADES ------------------ 

--UpgradesEnabled; if true then it will enable upgrades
na_hopper['UpgradesEnabled'] = true

--upg_money; print money collected  * upg_money value (Eg 1.5 is 1.5x money)
na_hopper['upg_money'] = 1.5

--upg_xp; Multiplier for the upgrade
na_hopper['upg_xp'] = 1.5

--upg_capacity; Multiplier for upgrade     (MaxStored * upg_capacity)
na_hopper['upg_capacity'] = 1.5

--upg_maxprints; if MaxPrintersEnabled is true this will set how many printers can be attached to a single hopper at a time.
-- NOT ADDED but needed for the upgrade ui
na_hopper['upg_maxprints'] = 1

------------------ FUTURE UPDATES ------------------ 
------------------    (IGNORE)    ------------------ 

--MaxPrintersEnabled; If true, enable a limit of printers added to this.
na_hopper['MaxPrintersEnabled'] = true

--MaxPrinters; Limits the amount of printers attached, ONLY WORKS IF MaxPrintersEnabled = true!
na_hopper['MaxPrinters'] = 2




-- FOR DEVELOPING IGNORE THIS :) 
-- Future Models 
--[[ 
models/props_combine/breenconsole.mdl
models/props_combine/combine_interface001.mdl
models/props_combine/combine_interface003.mdl
models/props_combine/combine_interface002.mdl
models/props_combine/masterinterface.mdl
models/props_combine/tpcontroller.mdl 

models/props_c17/substation_transformer01b.mdl
models/props_c17/substation_stripebox01a.mdl
models/props_c17/substation_circuitbreaker01a.mdl
models/props_c17/substation_transformer01a.mdl
]]