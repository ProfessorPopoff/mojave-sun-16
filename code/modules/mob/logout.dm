/mob/Logout()
	SEND_SIGNAL(src, COMSIG_MOB_LOGOUT)
	log_message("[key_name(src)] is no longer owning mob [src]([src.type])", LOG_OWNERSHIP)
	SStgui.on_logout(src)
	unset_machine()
	remove_from_player_list()
	//MOJAVE SUN EDIT - Wallening Testmerge
	if(client?.movingmob) //In the case the client was transferred to another mob and not deleted.
		client.movingmob.client_mobs_in_contents -= src
		UNSETEMPTY(client.movingmob.client_mobs_in_contents)
		client.movingmob = null

	if(client)
		client.images.Remove(frill_oval_mask)
	frill_oval_mask = null
	//MOJAVE SUN EDIT - Wallening Testmerge/Vapour
	if(client)
		client.images.Remove(vapour_alpha_mask)
	vapour_alpha_mask = null
	//MOJAVE SUN EDIT - Vapour
	..()

	if(loc)
		loc.on_log(FALSE)

	become_uncliented()

	return TRUE
