/datum/species/andorian
	name = "Andorian"
	id = "andorian"
	fixed_mut_color = "a3adc3" //Blue!
	exotic_blood = null
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,MUTCOLORS)
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None")
	use_skintones = FALSE //they all BLUE
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = JUNKFOOD
	liked_food = GROSS | RAW | FRIED
	armor = 0
	coldmod = 0.6		//Andorians can thrive in a lot of environments
	heatmod = 0.6
	hair_color = "ffffff" //They all have white hair

/mob/living/carbon/human/species/andorian
	race = /datum/species/andorian

/datum/species/andorian/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	if(C.client)
		if(C.client.prefs.real_name == C.real_name) //Random name if this isnt their chosen name
			return
	var/new_name = random_name()
	C.real_name = new_name
	C.name = new_name
	to_chat(C, "<font size=4 color=red>You are playing a roleplay heavy race! Andorians are suspicious and short tempered. Your race is militaristic and doesn't accept defeat.</font>")

/datum/species/andorian/qualifies_for_rank(rank, list/features)
	return TRUE //Federation are super PC

GLOBAL_LIST_INIT(andorian_names, world.file2list("strings/names/andorian.txt"))

/datum/species/andorian/random_name()
	var/randname = random_unique_andorian_name()
	return randname

/proc/random_unique_andorian_name(attempts_to_find_unique_name=10)
	for(var/i in 1 to attempts_to_find_unique_name)
		. = capitalize(andorian_name())
		if(!findname(.))
			break

/proc/andorian_name()
	return "[pick(GLOB.andorian_names)]"

