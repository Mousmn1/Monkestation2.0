/obj/item/fish/examine(mob/user)
	. = ..()

	// Tell people that can't read or use a fish scanner what type of water is necessary for fish survival
	// Displays required_fluid_type value, player sees the #DEFINE override from code > __DEFINES > aquarium.dm
	// For the sake of monke portability, override the strings that would not make sense grammatically rather than change their defines
	var/required_fluid_type_display_text = lowertext(required_fluid_type)
	switch(required_fluid_type)
		if(AQUARIUM_FLUID_ANADROMOUS)
			required_fluid_type_display_text = "either freshwater or saltwater" 	//Original: #define AQUARIUM_FLUID_ANADROMOUS = "either freshwater or saltwater"
		if(AQUARIUM_FLUID_ANY_WATER)
			required_fluid_type_display_text = "any kind of fluid"	//Original: #define AQUARIUM_FLUID_ANY_WATER = "any kind of fluid"

	. += span_notice("Its required water type is [required_fluid_type_display_text].")
