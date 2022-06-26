// Fishing rods

/obj/item/fishing_rod/ms13
	name = "fishing rod"
	desc = "You shouldn't be seeing this. LOOK AWAY."
	tool_behaviour = TOOL_FISHINGROD
	w_class = WEIGHT_CLASS_BULKY
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	inhand_icon_state = null
	lefthand_file = 'mojave/icons/mob/inhands/items64x_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items64x_righthand.dmi'
	grid_width = 192
	grid_height = 32

	/// How far can you cast this
	cast_range = 4
	/// Fishing minigame difficulty modifier (additive)
	difficulty_modifier = 0
	/// Explaination of rod functionality shown in the ui
	ui_description = "A classic fishing rod, with no special qualities."

/obj/item/fishing_rod/ms13/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/fishing_rod/ms13/basic
	name = "wooden fishing rod"
	desc = "A basic wooden fishing rod. Capable and proven."
	tool_behaviour = TOOL_FISHINGROD
	icon_state = "rod_wood"
	difficulty_modifier = 5
	ui_description = "A wooden fishing rod. Reminds you of a time you were never a part of."

/obj/item/fishing_rod/ms13/telescopic
	name = "telescoping fishing rod"
	desc = "A telescoping fishing rod, perfect to store away in your bag."
	icon_state = "rod_extendable"
	tool_behaviour = null // starts closed
	w_class = WEIGHT_CLASS_NORMAL
	grid_width = 96
	grid_height = 32
	difficulty_modifier = 100 // Fishin' wit da collapsed whip
	cast_range = 0
	ui_description = "A telescoping fishing rod, perfect to store away in your bag."
	var/toggled = FALSE
	var/extended_icon = "rod_extendable_extended"
	var/on_sound = 'sound/weapons/batonextend.ogg'

/obj/item/fishing_rod/ms13/telescopic/attack_self(mob/user, modifiers)
	. = ..()
	if(!toggled)
		to_chat(user, span_notice("You begin to extend the rod fully."))
		if(do_after(user, 2.5 SECONDS, interaction_key = DOAFTER_SOURCE_TELESCOPICROD))
			icon_state = extended_icon
			inhand_icon_state = icon_state
			desc = "[initial(desc)] It is currently extended."
			tool_behaviour = TOOL_FISHINGROD
			w_class = WEIGHT_CLASS_BULKY
			toggled = TRUE
			playsound(src, on_sound, 60, TRUE)
			grid_width = 192
			grid_height = 32
			difficulty_modifier = 100 // Fishin' wit da collapsed whip
			cast_range = 0

	else
		to_chat(user, span_notice("You begin to collapse the rod."))
		if(do_after(user, 2.5 SECONDS, interaction_key = DOAFTER_SOURCE_TELESCOPICROD))
			icon_state = (initial(icon_state))
			inhand_icon_state = icon_state
			desc = "[initial(desc)] It is currently collapsed."
			tool_behaviour = null
			w_class = WEIGHT_CLASS_NORMAL
			toggled = FALSE
			playsound(src, on_sound, 85, TRUE)
			grid_width = 96
			grid_height = 32
			difficulty_modifier = 0 // Fishin' wit da collapsed whip
			cast_range = 5


/obj/item/fishing_rod/ms13/advanced
	name = "advanced fishing rod"
	desc = "A professional, high-end fishing rod, state of the art fishing technology. They don't make them like this anymore."
	icon_state = "rod_advanced"
	difficulty_modifier = -5
	cast_range = 6
	ui_description = "A high quality fishing rod with an automatic reel. Makes quick work of the fish"
