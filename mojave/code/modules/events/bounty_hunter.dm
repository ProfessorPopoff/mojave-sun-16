/datum/round_event_control/bounty_hunter
	name = "Spawn Bounty Hunter"
	typepath = /datum/round_event/ghost_role/bounty_hunter
	max_occurrences = 1
	weight = 10
	earliest_start = 30 MINUTES
	min_players = 20
	dynamic_should_hijack = TRUE

/datum/round_event/ghost_role/bounty_hunter
	minimum_required = 1
	role_name = "Bounty Hunter"

/datum/round_event/ghost_role/bounty_hunter/spawn_role()
	var/list/spawn_locs = list()
	for(var/obj/effect/landmark/ms13/event/event_spawn in GLOB.landmarks_list)
		if(!isturf(event_spawn.loc))
			stack_trace("Late spawn found not on a turf: [event_spawn.type] on [isnull(event_spawn.loc) ? "null" : event_spawn.loc.type]")
			continue
		spawn_locs += event_spawn.loc
	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	//selecting a candidate player
	var/list/candidates = get_candidates(ROLE_BOUNTYHUNTER, ROLE_BOUNTYHUNTER)
	if(!candidates.len)
		return NOT_ENOUGH_PLAYERS

	var/mob/dead/selected_candidate = pick(candidates)
	var/key = selected_candidate.key

	//spawn the hunter and assign the candidate
	var/mob/living/carbon/human/hunter = create_bounty_hunter(pick(spawn_locs))
	hunter.key = key
	hunter.mind.add_antag_datum(/datum/antagonist/bountyhunter)
	spawned_mobs += hunter
	message_admins("[ADMIN_LOOKUPFLW(hunter)] has been made into a bounty hunter by an event.")
	log_game("[key_name(hunter)] was spawned as a hunter by an event.")

	return SUCCESSFUL_SPAWN


//=======//HUNTER CREATION PROCS//=======//

/proc/create_bounty_hunter(spawn_loc)
	var/mob/living/carbon/human/new_hunter = new(spawn_loc)
	new_hunter.randomize_human_appearance(~(RANDOMIZE_NAME))
//	var/new_name = "[pick(GLOB.hunter_titles)] [pick(GLOB.hunter_names)]"
//	new_hunter.name = new_name
//	new_hunter.real_name = new_name
	new_hunter.dna.update_dna_identity()
	return new_hunter
