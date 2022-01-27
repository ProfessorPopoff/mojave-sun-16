/datum/antagonist/bountyhunter
	name = "Bounty Hunter"
	antagpanel_category = "Bounty Hunter"
	job_rank = ROLE_BOUNTYHUNTER
	antag_hud_name = "bounty_hunter"
	show_name_in_check_antagonists = TRUE
	show_to_ghosts = TRUE
	preview_outfit = /datum/outfit/ms13/wasteland/bountyhunter
	///Whether or not this ninja will obtain objectives
	var/give_objectives = TRUE
	///Whether or not this ninja receives the standard equipment
	var/give_equipment = TRUE

/**
 * Proc that equips the Bounty Hunter outfit on a given individual.  By default this is the owner of the antagonist datum.
 *
 * Proc that equips the Bounty Hunter outfit on a given individual.  By default this is the owner of the antagonist datum.
 * Arguments:
 * * hunter - The human to receive the gear
 * * Returns a proc call on the given human which will equip them with all the gear.
 */
/datum/antagonist/bountyhunter/proc/equip_bounty_hunter(mob/living/carbon/human/hunter = owner.current)
	return hunter.equipOutfit(/datum/outfit/ms13/wasteland/bountyhunter)

/**
 * Proc that adds the proper memories to the antag datum
 *
 * Proc that adds the hunter starting memories to the owner of the antagonist datum.
 */
/datum/antagonist/bountyhunter/proc/addMemories()
	antag_memory += "I am a seasoned veteran of the wasteland. A <font color='red'><B>Bounty Hunter</B></font>!<br>"
	antag_memory += "I am well equiped, but these aren't the only things I use. I must use my witts and keep eyes to my back when taking missions. The environment is against me."

/**
 * Proc that adds all the hunter's objectives to the antag datum.
 *
 * Proc that adds all the hunter's objectives to the antag datum.  Called when the datum is gained.
 */
/datum/antagonist/bountyhunter/proc/addObjectives()
	//Survival until end
	var/datum/objective/survival = new /datum/objective/survive()
	survival.owner = owner
	objectives += survival

/datum/antagonist/bountyhunter/greet()
	SEND_SOUND(owner.current, sound('mojave/sound/ms13effects/timeshift.ogg'))
	to_chat(owner.current, "I am a seasoned veteran of the wasteland. A <font color='red'><B>Bounty Hunter</B></font>!<br>")
	to_chat(owner.current, "I am well equiped, but these are mere tools, and aren't the only things I must use. I should keep my witts handy and eyes to my back when taking missions. The world is against me.")
	owner.announce_objectives()

/datum/antagonist/bountyhunter/on_gain()
//	if(give_objectives)
//		addObjectives()
	addMemories()
	if(give_equipment)
		equip_bounty_hunter(owner.current)

	owner.current.mind.set_assigned_role(SSjob.GetJobType(/datum/job/ms13/bountyhunter))
	owner.current.mind.special_role = ROLE_BOUNTYHUNTER
	return ..()

/datum/antagonist/bountyhunter/admin_add(datum/mind/new_owner,mob/admin)
	new_owner.set_assigned_role(SSjob.GetJobType(/datum/job/ms13/bountyhunter))
	new_owner.special_role = ROLE_BOUNTYHUNTER
	new_owner.add_antag_datum(src)
	message_admins("[key_name_admin(admin)] has hunter'ed [key_name_admin(new_owner)].")
	log_admin("[key_name(admin)] has hunter'ed [key_name(new_owner)].")
