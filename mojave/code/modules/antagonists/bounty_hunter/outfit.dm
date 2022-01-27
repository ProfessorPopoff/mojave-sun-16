/datum/job/ms13/bountyhunter
	title = ROLE_BOUNTYHUNTER

/datum/outfit/ms13/wasteland/bountyhunter
	name = "_Bounty Hunter"

	head = 		 /obj/item/clothing/head/helmet/ms13/eliteriot/bountyhunter
	suit = 		 /obj/item/clothing/suit/ms13/ljacket/bountyhunter
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting/scoped/amr
	uniform =  	 /obj/item/clothing/under/ms13/wasteland/whiteshirt
	belt = 		 /obj/item/gun/ballistic/automatic/pistol/ms13/m12mm
	gloves = 	 /obj/item/clothing/gloves/ms13/winter/black
	shoes = 	 /obj/item/clothing/shoes/ms13/military
	r_pocket =   /obj/item/reagent_containers/hypospray/medipen/ms13/stimpak
	l_pocket =   /obj/item/stack/medical/gauze/ms13/military
	backpack_contents = list(/obj/item/stack/medical/suture/ms13=1,\
	/obj/item/ammo_box/magazine/ms13/m12mm=2,\
	/obj/item/ammo_box/magazine/ms13/amr=1,\
	/obj/item/knife/ms13/hunting/unique=1,\
	/obj/item/restraints/handcuffs=2)

/datum/outfit/ms13/wasteland/bountyhunter/pre_equip(mob/living/carbon/human/H)
	..()
