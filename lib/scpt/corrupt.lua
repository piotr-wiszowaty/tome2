-- Definition of the corruptions

-- The Balrog corruptions
CORRUPT_BALROG_AURA = add_corruption
{
	["color"]       = TERM_ORANGE,
	["name"]	= "Balrog Aura",
	["get_text"]    = "A corrupted wall of flames surrounds you.",
	["lose_text"]   = "The wall of corrupted flames abandons you.",
	["desc"]	=
	{
			  "  Surrounds you with a fiery aura",
			  "  But it can burn scrolls when you read them"
	},
}

CORRUPT_BALROG_WINGS = add_corruption
{
	["color"]       = TERM_ORANGE,
	["name"]	= "Balrog Wings",
	["get_text"]    = "Wings of shadow grow in your back.",
	["lose_text"]   = "The wings in your back fall apart.",
	["desc"]	=
	{
			  "  Creates ugly, but working, wings allowing you to fly",
			  "  But it reduces charisma by 4 and dexterity by 2"
	},
}

CORRUPT_BALROG_STRENGTH = add_corruption
{
	["color"]       = TERM_ORANGE,
	["name"]	= "Balrog Strength",
	["get_text"]    = "Your muscles get unnatural strength.",
	["lose_text"]   = "Your muscles get weaker again.",
	["desc"]	=
	{
			  "  Provides 3 strength and 1 constitution",
			  "  But it reduces charisma by 1 and dexterity by 3"
	},
}

CORRUPT_BALROG_FORM = add_corruption
{
	["color"]       = TERM_YELLOW,
	["name"]	= "Balrog Form",
	["get_text"]    = "You feel the might of a Balrog inside you.",
	["lose_text"]   = "The presence of the Balrog seems to abandon you.",
	["desc"]	=
	{
			  "  Allows you to turn into a Balrog at will",
			  "  You need Balrog Wings, Balrog Aura and Balrog Strength to activate it"
	},
	["depends"]     =
	{
			[CORRUPT_BALROG_AURA] = TRUE,
			[CORRUPT_BALROG_WINGS] = TRUE,
			[CORRUPT_BALROG_STRENGTH] = TRUE
	},
}


-- The Demon corruptions
CORRUPT_DEMON_SPIRIT = add_corruption
{
	["color"]       = TERM_RED,
	["name"]	= "Demon Spirit",
	["get_text"]    = "Your spirit opens to corrupted thoughts.",
	["lose_text"]   = "Your spirit closes again to the corrupted thoughts.",
	["desc"]	=
	{
			  "  Increases your intelligence by 1",
			  "  But reduce your charisma by 2",
	},
}

CORRUPT_DEMON_HIDE = add_corruption
{
	["color"]       = TERM_RED,
	["name"]	= "Demon Hide",
	["get_text"]    = "Your skin grows into a thick hide.",
	["lose_text"]   = "Your skin returns to a natural state.",
	["desc"]	=
	{
			  "  Increases your armour class by your level",
			  "  Provides immunity to fire at level 40",
			  "  But reduces speed by your level / 7",
	},
}

CORRUPT_DEMON_BREATH = add_corruption
{
	["color"]       = TERM_RED,
	["name"]	= "Demon Breath",
	["get_text"]    = "Your breath becomes mephitic.",
	["lose_text"]   = "Your breath is once again normal.",
	["desc"]	=
	{
			  "  Provides fire breath",
			  "  But gives a small chance to spoil potions when you quaff them",
	},
}

CORRUPT_DEMON_REALM = add_corruption
{
	["color"]       = TERM_L_RED,
	["name"]	= "Demon Realm",
	["get_text"]    = "You feel more attuned to the demon realm.",
	["lose_text"]   = "You lose your attunement to the demon realm.",
	["desc"]	=
	{
			  "  Provides access to the demon school skill and the use of demonic equipment",
			  "  You need Demon Spirit, Demon Hide and Demon Breath to activate it"
	},
	["depends"]     =
	{
			[CORRUPT_DEMON_SPIRIT] = TRUE,
			[CORRUPT_DEMON_HIDE] = TRUE,
			[CORRUPT_DEMON_BREATH] = TRUE
	},
}


-- Teleportation corruptions

-- Random teleportation will ask for confirmation 70% of the time
-- But 30% of the time it will teleport, without asking
CORRUPT_RANDOM_TELEPORT = add_corruption
{
	["color"]       = TERM_GREEN,
	["name"]	= "Random teleportation",
	["get_text"]    = "Space seems to fizzle around you.",
	["lose_text"]   = "Space solidify again around you.",
	["desc"]	=
	{
			  "  Randomly teleports you around",
	},
	-- No oppose field, it will be automatically set when we declare the anti-telep corruption to oppose us
}

-- Anti-teleportation corruption, can be stopped with this power
CORRUPT_ANTI_TELEPORT = add_corruption
{
	["color"]       = TERM_GREEN,
	["name"]	= "Anti-teleportation",
	["get_text"]    = "Space continuum freezes around you.",
	["lose_text"]   = "Space continuum can once more be altered around you.",
	["desc"]	=
	{
			  "  Prevents all teleportations, be it of you or monsters",
	},
	["oppose"]     	=
	{
			[CORRUPT_RANDOM_TELEPORT] = TRUE
	},
}


-- Troll blood
CORRUPT_TROLL_BLOOD = add_corruption
{
	["color"]       = TERM_GREEN,
	["name"]	= "Troll Blood",
	["get_text"]    = "Your blood thickens, you sense corruption in it.",
	["lose_text"]   = "Your blood returns to a normal state.",
	["desc"]	=
	{
			  "  Troll blood flows in your veins, granting increased regeneration",
			  "  It also enables you to feel the presence of other troll beings",
			  "  But it will make your presence more noticeable and aggravating",
	},
}

-- The vampire corruption set
CORRUPT_VAMPIRE_TEETH = add_corruption
{
	["group"]       = "Vampire",
	["removable"]   = FALSE,
	["color"]       = TERM_L_DARK,
	["name"]	= "Vampiric Teeth",
	["get_text"]    = "You grow vampiric teeth!",
	["lose_text"]   = "BUG! this should not happen",
	["desc"]	=
	{
			  "  Your teeth allow you to drain blood to feed yourself",
			  "  However your stomach now only accepts blood.",
	},
	["allow"]       = function()
		if test_race_flags(1, PR1_NO_SUBRACE_CHANGE) == FALSE then return not nil else return nil end
	end,
	["gain"]	= function() player_gain_vampire_teeth() end,
}
CORRUPT_VAMPIRE_STRENGTH = add_corruption
{
	["group"]       = "Vampire",
	["removable"]   = FALSE,
	["color"]       = TERM_L_DARK,
	["name"]	= "Vampiric Strength",
	["get_text"]    = "Your body seems more dead than alive.",
	["lose_text"]   = "BUG! this should not happen",
	["desc"]	=
	{
			  "  Your body seems somewhat dead",
			  "  In this near undead state it has improved strength, constitution and intelligence",
			  "  But reduced dexterity, wisdom and charisma.",
	},
	["depends"]     =
	{
			[CORRUPT_VAMPIRE_TEETH] = TRUE,
	},
	["gain"]	= function() player_gain_vampire_strength() end,
}
CORRUPT_VAMPIRE_VAMPIRE = add_corruption
{
	["group"]       = "Vampire",
	["removable"]   = FALSE,
	["color"]       = TERM_L_DARK,
	["name"]	= "Vampire",
	["get_text"]    = "You die to be reborn in a Vampire form.",
	["lose_text"]   = "BUG! this should not happen",
	["desc"]	=
	{
			  "  You are a Vampire. As such you resist cold, poison, darkness and nether.",
			  "  Your life is sustained, but you cannot stand the light of the sun."
	},
	["depends"]     =
	{
			[CORRUPT_VAMPIRE_STRENGTH] = TRUE,
	},
	["gain"]	= function() player_gain_vampire() end,
}


--[[
CORRUPT_ = add_corruption
{
	["color"]       = TERM_GREEN,
	["name"]	= "",
	["get_text"]    = "",
	["lose_text"]   = "",
	["desc"]	=
	{
			  "  ",
	},
}
]]
