/datum/action/role_info
	name = "Open Role Information:"
	button_icon_state = "round_end"

/datum/action/role_info/New(Target)
	. = ..()
	name += " [target]"

/datum/action/role_info/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return

	target.ui_interact(owner)

/datum/action/role_info/IsAvailable()
	if(!target)
		stack_trace("[type] was used without a target antag datum!")
		return FALSE
	. = ..()
	if(!.)
		return
	if(!owner.mind)
		return FALSE
	if(!(target in owner.mind.antag_datums))
		return FALSE
	return TRUE


///ANTAGONIST UI STUFF

/datum/job/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, ui_name, title)
		ui.open()

/datum/job/ui_state(mob/user)
	return GLOB.always_state
