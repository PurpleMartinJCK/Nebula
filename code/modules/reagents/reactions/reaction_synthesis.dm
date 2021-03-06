/* Solidification */
/datum/chemical_reaction/synthesis
	result = null
	result_amount = 1

/datum/chemical_reaction/synthesis/phoronsolidification
	name = "Solid Phoron"
	required_reagents = list(/datum/reagent/iron = 5, /datum/reagent/toxin/phoron = 20)
	minimum_temperature = (-80 CELSIUS) - 100
	maximum_temperature = -80 CELSIUS
	mix_message = "The solution hardens and begins to crystallize."

/datum/chemical_reaction/synthesis/phoronsolidification/on_reaction(var/datum/reagents/holder, var/created_volume, var/reaction_flags)
	..()
	new /obj/item/stack/material/phoron(get_turf(holder.my_atom), created_volume)

/datum/chemical_reaction/synthesis/plastication
	name = "Plastic"
	required_reagents = list(/datum/reagent/acid/polyacid = 1, /datum/reagent/toxin/plasticide = 2)
	mix_message = "The solution solidifies into a grey-white mass."

/datum/chemical_reaction/synthesis/plastication/on_reaction(var/datum/reagents/holder, var/created_volume, var/reaction_flags)
	..()
	new /obj/item/stack/material/plastic(get_turf(holder.my_atom), created_volume)

/datum/chemical_reaction/synthesis/resin_pack
	name = "Resin Globule"
	required_reagents = list(
		/datum/reagent/crystal = 1,
		/datum/reagent/silicon = 2
	)
	catalysts = list(
		/datum/reagent/toxin/phoron = 1
	)
	result_amount = 3
	mix_message = "The solution hardens and begins to crystallize."

/datum/chemical_reaction/synthesis/resin_pack/on_reaction(var/datum/reagents/holder, var/created_volume, var/reaction_flags)
	..()
	var/turf/T = get_turf(holder.my_atom)
	if(istype(T))
		var/create_stacks = Floor(created_volume)
		if(create_stacks > 0)
			new /obj/item/stack/medical/resin/handmade(T, create_stacks)

/datum/chemical_reaction/synthesis/nullglass
	name = "Soulstone"
	result = null
	required_reagents = list(/datum/reagent/blood = 15, /datum/reagent/crystal = 1)
	result_amount = 1

/datum/chemical_reaction/synthesis/nullglass/get_reaction_flags(var/datum/reagents/holder)
	for(var/datum/reagent/blood/blood in holder.reagent_list)
		var/weakref/donor_ref = islist(blood.data) && blood.data["donor"]
		if(istype(donor_ref))
			var/mob/living/donor = donor_ref.resolve()
			if(istype(donor) && (donor.psi || (donor.mind && GLOB.wizards.is_antagonist(donor.mind))))
				return TRUE

/datum/chemical_reaction/synthesis/nullglass/on_reaction(var/datum/reagents/holder, var/created_volume, var/reaction_flags)
	var/location = get_turf(holder.my_atom)
	if(reaction_flags)
		for(var/i = 1, i <= created_volume, i++)
			new /obj/item/soulstone(location)
	else
		for(var/i = 1, i <= created_volume*2, i++)
			new /obj/item/material/shard(location, MAT_CRYSTAL)
