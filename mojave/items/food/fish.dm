// Fish

/obj/item/fish/ms13
	name = "fish"
	desc = "You shouldn't be seeing this."
	icon = 'mojave/icons/objects/food/fish/fish_world.dmi'
	grid_height = 64
	grid_width = 96
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish
	/// Average size for this fish type in centimeters. Will be used as gaussian distribution with 20% deviation for fishing, bought fish are always standard size
	average_size = 50
	/// Average weight for this fish type in grams
	average_weight = 1000
	/// Fishing behaviour
	fish_ai_type = FISH_AI_DUMB // CHOICES : FISH_AI_DUMB | FISH_AI_ZIPPY | FISH_AI_SLOW
	/// Base additive modifier to fishing difficulty
	fishing_difficulty_modifier = 0

/obj/item/fish/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/food/fish/fish_inventory.dmi')
/obj/item/fish/ms13/smallmouth
	name = "smallmouth bass"
	desc = "A smallmouth bass. A game fish, it had a reputation for fighting."
	icon_state = "smallmouth"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/smallmouth
	average_size = 45
	average_weight = 4080
	fish_ai_type = FISH_AI_DUMB
	fishing_difficulty_modifier = 10

/obj/item/fish/ms13/largemouth
	name = "largemouth bass"
	desc = "A largemouth bass. It's meat is usually mushy, gross!"
	icon_state = "largemouth"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/largemouth
	average_size = 55
	average_weight = 5400
	fish_ai_type = FISH_AI_DUMB
	fishing_difficulty_modifier = 15

/obj/item/fish/ms13/lamprey
	name = "lamprey"
	desc = "Typically mislabeled as an eel, the lamprey was highly appreciated by Ancient Romans."
	icon_state = "lamprey"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/lamprey
	average_size = 25
	average_weight = 360
	fish_ai_type = FISH_AI_ZIPPY
	fishing_difficulty_modifier = -5
	fishing_traits = list(/datum/fishing_trait/nocturnal)

/obj/item/fish/ms13/pink
	name = "pink salmon"
	desc = "Pink salmon used to be canned or salted pre-war, and was a staple food of sorts."
	icon_state = "pink"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/pink
	average_size = 58
	average_weight = 1800
	fish_ai_type = FISH_AI_SLOW
	fishing_difficulty_modifier = 5

/obj/item/fish/ms13/sockeye
	name = "sockeye salmon"
	desc = "A sockeye salmon, delicious! And not a bad catch."
	icon_state = "sockeye"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/sockeye
	average_size = 65
	average_weight = 4500
	fish_ai_type = FISH_AI_SLOW
	fishing_difficulty_modifier = 15

/obj/item/fish/ms13/chum
	name = "chum salmon"
	desc = "Generally considered cheap and low-quality, the chum salmon is an unlucky catch."
	icon_state = "chum"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/chum
	average_size = 55
	average_weight = 8000
	fish_ai_type = FISH_AI_SLOW
	fishing_difficulty_modifier = 15

/obj/item/fish/ms13/sturgeon // big ass fish on average. let's GOOO...
	name = "white sturgeon"
	desc = "Sturgeon can grow to pretty mind-boggling size. They used to be poached for their caviar."
	icon_state = "sturgeon"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/sturgeon
	average_size = 180
	average_weight = 54400 //fuwuh.h.h. gjhglg.f.
	fish_ai_type = FISH_AI_ZIPPY
	fishing_difficulty_modifier = 35

/obj/item/fish/ms13/sturgeon/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)

/obj/item/fish/ms13/asian
	name = "asian carp"
	desc = "An invasive species, the Asian carp has endured even nuclear holocaust."
	icon_state = "asian"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/asian
	average_size = 64
	average_weight = 5440
	fish_ai_type = FISH_AI_DUMB
	fishing_difficulty_modifier = 10

/obj/item/fish/ms13/blinky
	name = "blinky"
	desc = "A very strange looking fish, likely a product of lots and lots of radiation."
	icon_state = "blinky"
	fillet_type = /obj/item/food/meat/rawcutlet/ms13/fish/blinky
	average_size = 35
	average_weight = 1200
	fish_ai_type = FISH_AI_ZIPPY
	fishing_difficulty_modifier = 5

// Raw fish fillets

/obj/item/food/meat/rawcutlet/ms13/fish
	name = "raw fish fillet"
	desc = "A raw fish fillet. You shouldn't be seeing this."
	icon = 'mojave/icons/objects/food/fish/fish_world.dmi'
	icon_state = "sockeye_cutlet"
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 32
	grid_width = 64
	var/fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish
	bite_consumption = 3
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 4)
	tastes = list("fish" = 8)
	foodtypes = MEAT | RAW

/obj/item/food/meat/rawcutlet/ms13/fish/MakeGrillable()
	AddComponent(/datum/component/grillable, fish_cooked_type, rand(30 SECONDS, 60 SECONDS), TRUE, TRUE)

/obj/item/food/meat/rawcutlet/ms13/fish/Initialize()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/food/fish/fish_inventory.dmi')
	return ..()

/obj/item/food/meat/rawcutlet/ms13/fish/sockeye
	name = "raw sockeye fillet"
	desc = "A raw fillet of sockeye salmon. Red and tasty."
	icon_state = "sockeye_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/sockeye

/obj/item/food/meat/rawcutlet/ms13/fish/smallmouth
	name = "raw smallmouth fillet"
	desc = "A raw smallmouth bass fillet."
	icon_state = "smallmouth_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/smallmouth

/obj/item/food/meat/rawcutlet/ms13/fish/largemouth
	name = "raw largemouth fillet"
	desc = "A raw largemouth bass fillet. Kind of mushy, gross."
	icon_state = "largemouth_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/largemouth

/obj/item/food/meat/rawcutlet/ms13/fish/lamprey
	name = "raw lamprey fillet"
	desc = "A raw lamprey fillet. Meaty."
	icon_state = "lamprey_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/lamprey

/obj/item/food/meat/rawcutlet/ms13/fish/pink
	name = "raw pink salmon fillet"
	desc = "A raw pink salmon fillet, not canned, not salted, just fresh."
	icon_state = "pink_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/pink

/obj/item/food/meat/rawcutlet/ms13/fish/chum
	name = "raw chum salmon fillet"
	desc = "A raw chum salmon fillet. Low-quality and cheap, just like you."
	icon_state = "chum_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/chum

/obj/item/food/meat/rawcutlet/ms13/fish/sturgeon
	name = "raw sturgeon fillet"
	desc = "A raw white sturgeon fillet. The largest of white sturgeons used to feed whole tribes of natives."
	icon_state = "sturgeon_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/sturgeon

/obj/item/food/meat/rawcutlet/ms13/fish/asian
	name = "raw asian carp fillet"
	desc = "A raw Asian carp fillet. Soy sauce not included."
	icon_state = "asian_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/asian

/obj/item/food/meat/rawcutlet/ms13/fish/blinky
	name = "raw blinky fillet"
	desc = "A raw fillet from a Blinky fish. What's a Blinky? Try it and find out."
	icon_state = "blinky_cutlet"
	fish_cooked_type = /obj/item/food/meat/cutlet/ms13/fish/blinky
	tastes = list("what...?" =1, "fish" = 2)

// Cooked fish fillets

/obj/item/food/meat/cutlet/ms13/fish
	name = "cooked fish fillet"
	desc = "A cooked fish fillet."
	icon = 'mojave/icons/objects/food/fish/fish_world.dmi'
	icon_state = "sockeye_cutlet"
	bite_consumption = 5
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 4, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("fish" = 5)
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 32
	grid_width = 64
	foodtypes = MEAT

/obj/item/food/meat/cutlet/ms13/fish/Initialize()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/food/fish/fish_inventory.dmi')
	return ..()

/obj/item/food/meat/cutlet/ms13/fish/sockeye
	name = "cooked sockeye fillet"
	desc = "A nice and tasty sockeye fillet. Good eating."
	icon_state = "sockeye_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/smallmouth
	name = "cooked smallmouth fillet"
	desc = "A smallmouth bass fillet, despite being a game fish, it does not taste like game."
	icon_state = "smallmouth_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/largemouth
	name = "cooked largemouth fillet"
	desc = "A largemouth bass fillet. Mushy and gross, you must be desperate."
	icon_state = "largemouth_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/lamprey
	name = "cooked lamprey fillet"
	desc = "A lamprey fillet. Vedius Pollio would be jealous."
	icon_state = "lamprey_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/pink
	name = "cooked pink salmon fillet"
	desc = "A pink salmon fillet. Maybe put it in a salad."
	icon_state = "pink_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/chum
	name = "cooked chum salmon fillet"
	desc = "A chum salmon fillet. You can taste the poverty."
	icon_state = "chum_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/sturgeon
	name = "cooked sturgeon fillet"
	desc = "A white sturgeon fillet."
	icon_state = "sturgeon_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/asian
	name = "cooked asian carp fillet"
	desc = "An Asian carp fillet."
	icon_state = "asian_cutlet"

/obj/item/food/meat/cutlet/ms13/fish/blinky
	name = "cooked blinky fillet"
	desc = "A blinky fillet. What...?"
	icon_state = "blinky_cutlet"
	tastes = list("what...?" = 4, "fish" = 4)
