DROP TABLE IF EXISTS `TERRAIN`;
CREATE TABLE `TERRAIN` (
    id varchar(2) NOT NULL UNIQUE,
    name varchar(32) NOT NULL,
    description varchar(1024) NOT NULL,
    img varchar(64) NOT NULL,
    tags varchar(256),
    basic boolean NOT NULL,
    movement int(2),
    vigilance int(2)
);
INSERT INTO `TERRAIN` (id, name, description, img, tags, basic, movement, vigilance) VALUES (
        "a",
        "Plains",
        "The vegetation in grassland is dominated by grasses, with rolling plains and scarce trees.",
        "./static/images/terrain/grasslands.png",
        "['grass','plain']",
        TRUE,
        1,
        2
    ),(
        "b",
        "Desert",
        "The type of desert that most commonly comes to mind when one speaks of deserts: hot, sandy deserts are home to only the hardiest of cretures and plants, with scattered cacti, tumbleweed, small gnarly trees and scrub brush, as well as scorpions, camels and other more exotic beasts roaming the trackless sands.",
        "./static/images/terrain/sandy_deserts.png",
        "['hot','desert','hostile']",
        TRUE,
        4,
        8
    ),(
        "c",
        "Forest",
        "Mixed forests are found most frequently in humid temperate biomes. They are often layered, with the outermost layer being tall, mature trees, the next layer being a shade-tolerant understory consisting of smaller mature trees, saplings and suppressed juvenile trees awaiting a fortuitous opening in the canopy.",
        "./static/images/terrain/mixed_forests.png",
        "['forest','dense']",
        TRUE,
        2,
        4
    ),(
        "d",
        "Jungle",
        "Jungles are troipcal forests typified by daily rainfall, but adequate drainage to handle that rainfall. Jungles frequently cover a large geographical area and have dense canopies that allow only scattered sunlight to leak through. Jungles are also notorious for concealing hidden ruins, secret entrances to the Underdark, hithertofor uncontacted tribes and flora and fauna unknown to outsiders.",
        "./static/images/terrain/jungles.png",
        "['jungle']",
        TRUE,
        6,
        6
    ),(
        "e",
        "Wetlands",
        "Wetlands are areas typified by perrenial shallow water cover. Wetlands come in many varieties, but most commonly have dense vegetation with sparse tree cover.",
        "./static/images/terrain/marsh.png",
        "['wetland']",
        TRUE,
        6,
        8
    ),(
        "f",
        "Hills",
        "Hilly plains are typically rocky rolling hills, usually with scattered grasses, lonely trees and hollows in the hills.",
        "./static/images/terrain/hills.png",
        "['hill']",
        TRUE,
        3,
        4
    ),(
        "g",
        "Mountain",
        "A large landform that stretches above the surrounding land in a limited area, usually in the form of a peak, when mountains stand alone, they are frequently revered as sacred by the peoples nearby, who sometimes attribute to them the homes of deities.",
        "./static/images/terrain/mountain.png",
        "['mountain']",
        TRUE,
        8,
        8
    ),(
        "h",
        "Water",
        "Hexes comprised of water may be salt or freshwater. Their value is primarily in industries that use the water, such as fisheries and shipping industries.",
        "./static/images/terrain/deep_seas.png",
        "['water']",
        TRUE,
        2,
        2
    ),(
### NON BASIC TERRAIN
# Variant plains
        "aa",
        "Grassy Plains",
        "The vegetation in grassland is dominated by grasses, with rolling plains and scarce trees.",
        "./static/images/terrain/grasslands.png",
        "['grass','plain']",
        FALSE,
        1,
        2
    ),(
        "ab",
        "Grazing Lands",
        "Grazing lands are a kind of plan with abundant, dense grass and frequent ponds, lakes and streams. Such lands are ideal for large herds of beasts of burden to be fed from natural sources and to water themselves. These lands are frequently controlled and regulated by lords of all stripes, and it isn't common to find fences, trenches and hedges built thereon to limit and regulate such grazing.",
        "./static/images/terrain/grazing_lands.png",
        "['grass','plain','fertile']",
        FALSE,
        1,
        2
    ),(
        "ac",
        "Badlands",
        "The rocky badlands are places where clay and sedimentary soil have been heavily eroded by wind, water and other natural forces. The result is craggy, stratified terrain, mostly devoid of things of immediate or obvious value.",
        "./static/images/terrain/badlands.png",
        "['hostile','plain','stone']",
        FALSE,
        2,
        4
    ),(
        "ad",
        "Steppes",
        "Large areas of flat unforested grassland, steppes are ideal terrain for wild and domestic horses, and are favored by nomads, especially centaurs.",
        "./static/images/terrain/steppes.png",
        "['plain','grass']",
        FALSE,
        1,
        2
    ),(
        "ae",
        "Mud Flats",
        "Mud flats are areas of low drainage with shifting infertile grounds. Such land is usually rich in ores and basic chemicals that prevent the growth of foliage. Such land is not arable as farmland, nor useful for the construction of cities, but these muds are alchemically valuable.",
        "./static/images/terrain/mud_flats.png",
        "['plain','hostile','mud']",
        FALSE,
        4,
        4
    ),(
        "af",
        "Broken Lands",
        "The broken lands have been the subject of a great mystical calamity. They are bereft of mystical energy and, therefore, are magically sterile.",
        "./static/images/terrain/broken_lands.png",
        "['hostile','antimagic','plain','stone']",
        FALSE,
        2,
        2
    ),(
        "ag",
        "Savanna",
        "A savanna is a grassland ecosystem characterised by the trees being sufficiently widely spaced so that the canopy does not close. The open canopy allows sufficient light to reach the ground to support an unbroken herbaceous layer consisting primarily of grasses. Savannas are common haunts of big cats, such as lions, and heavy grazing beasts, such as gnu, yaks and aurochs.",
        "./static/images/terrain/savannas.png",
        "['plain','forest']",
        FALSE,
        1,
        2
    ),(
        "ah",
        "Shrublands",
        "Shrubland, scrubland, scrub or brush is a plant community characterised by vegetation dominated by shrubs, often also including grasses, herbs, and geophytes (that is, plants that grow on or in rocks). Shrubland may either occur naturally or be the result of human activity, with rapid deforestation being a common cause. Such lands are easy for small predators to conceal themselveas in.",
        "./static/images/terrain/shrublands.png",
        "['shrubs','plain']",
        FALSE,
        1,
        2
    ),
# Variant deserts
    (
        "ba",
        "Sandy Desert",
        "The type of desert that most commonly comes to mind when one speaks of deserts: hot, sandy deserts are home to only the hardiest of cretures and plants, with scattered cacti, tumbleweed, small gnarly trees and scrub brush, as well as scorpions, camels and other more exotic beasts roaming the trackless sands.",
        "./static/images/terrain/sandy_deserts.png",
        "['hot','desert','hostile']",
        FALSE,
        4,
        8
    ),(
        "bb",
        "Sand Dunes",
        "Sand dunes are shifting hills of silica sand. The terrain in such places shifts so frequently that only hardy nomadic folk are frequently found in such terrain.",
        "./static/images/terrain/sand_dunes.png",
        "['hot','desert','hostile','hill']",
        FALSE,
        4,
        8
    ),(
        "bc",
        "Cactus",
        "Dense cactus fields are a result of fertile desert fields. Since cacti are well acclimated to dry, hot environments, they have little competition with other foliage.",
        "./static/images/terrain/cactus_lands.png",
        "['desert','forest','fertile','hot']",
        FALSE,
        4,
        8
    ),(
        "bd",
        "Heavy Cactus",
        "Dense cactus fields are a result of fertile desert fields. They are frequently the result of rolling sediment deposits from nearby mountains or mesa fields.",
        "./static/images/terrain/heavy_cactus_lands.png",
        "['desert','forest','dense','fertile','hot']",
        FALSE,
        6,
        8
    ),(
        "be",
        "Magma",
        "Magma flows from active volcanoes. While some very powerful wizards see it as a valuable resource to use in the construction of great fortified citadels. It is impossible for those without magical protection or natural immunity to fire to live in such hostile terrain.",
        "./static/images/terrain/magma.png",
        "['hostile','magma','hot']",
        FALSE,
        10,
        10
    ),(
        "bf",
        "Rocky Desert",
        "The type of desert that most commonly comes to mind when one speaks of deserts, hot, sandy deserts are home to only the hardiest of cretures and plants, with scattered cacti, tumbleweed, small gnarly trees and scrub brush, as well as scorpions, camels and other more exotic beasts roaming the trackless sands. Rocky deserts are typically the result of either destroyed monuments or declining sand levels approaching bedrock.",
        "./static/images/terrain/rocky_deserts.png",
        "['hot','desert','hostile','stone']",
        FALSE,
        4,
        8
    ),(
        "bg",
        "Cold Desert",
        "Frigid deserts are rocky and covered with a layer of permafrost. The majority of such lands are of virtually no commercial value, although the hardy people of the Crown of the World carve out for themseles a meagar existence.",
        "./static/images/terrain/cold_deserts.png",
        "['cold','desert','hostile']",
        FALSE,
        4,
        8
    ),(
        "bh",
        "Snow Fields",
        "An accumulative permanent snow field, typically found above the snow line. Glaciers originate in snow fields over the course of hundreds, thousands or even millions of years.",
        "./static/images/terrain/snow_fields.png",
        "['desert','cold','plain']",
        FALSE,
        4,
        8
    ),(
        "bi",
        "Glacier",
        "A persistent body of dense ice that is constantly shifting under its own weight. Glaciers frequently move slowly - sometimes only inches over the course of decades, and sometimes in sudden spectacular moves.",
        "./static/images/terrain/glaciers.png",
        "['desert','cold','hostile']",
        FALSE,
        4,
        8
    ),
# Variant Forests
    (
        "ca",
        "Deciduous Forest",
        "Deciduous forests are comprised of trees that keep their leaves only during the warmer, sunnier months of the year. As the seasons pass and summer turns to autumn, they frequently become awash in fiery colors as the trees halt their photosynthetic processes to preserve energy for the winter. Some such trees are fruit-bearing while others may have valubale edible sap which can be processed into rich syrups.",
        "./static/images/terrain/deciduous_forests.png",
        "['forest']",
        FALSE,
        2,
        4
    ),(
        "cb",
        "Dense Deciduous Forest",
        "Deciduous forests are comprised of trees that keep their leaves only during the warmer, sunnier months of the year. As the seasons pass and summer turns to autumn, they frequently become awash in fiery colors as the trees halt their photosynthetic processes to preserve energy for the winter. Some such trees are fruit-bearing while others may have valubale edible sap which can be processed into rich syrups. Dense deciduous forests are notorious for being the stomping grounds of bears and other mega-predators.",
        "./static/images/terrain/dense_deciduous_forests.png",
        "['forest','dense']",
        FALSE,
        4,
        4
    ),(
        "cc",
        "Evergreen Forest",
        "Evergreen forests, as the name suggests, do not lose their leaves (frequently needles) during the winter months, but continue to remain green all year round.",
        "./static/images/terrain/evergreen_forests.png",
        "['forest']",
        FALSE,
        2,
        4
    ),(
        "cd",
        "Dense Evergreen Forest",
        "Evergreen forests, as the name suggests, do not lose their leaves (frequently needles) during the winter months, but continue to remain green all year round. Dense evergreen forests frequently feature a forest bed dense with the discarded needles of several generations of trees. Their forest beds tend to be light on green leafy foliage, instead being host priamrily to herbs, mushrooms and lichen.",
        "./static/images/terrain/dense_evergreen_forests.png",
        "['forest','dense']",
        FALSE,
        4,
        4
    ),(
        "ce",
        "Dead Forest",
        "Dead forests, frequently a result of cataclysmic events, magical interference or rapid climate change. Some contain economically valuable wood, scientifically interesting formations and mystical secrets.",
        "./static/images/terrain/dead_forests.png",
        "['forest','hostile']",
        FALSE,
        2,
        4
    ),(
        "cf",
        "Dense Dead Forest",
        "Dead forests, frequently a result of cataclysmic events, magical interference or rapid climate change. Some contain economically valuable wood, scientifically interesting formations and mystical secrets.",
        "./static/images/terrain/dense_dead_forests.png",
        "['forest','hostile']",
        FALSE,
        4,
        4
    ),(
        "cg",
        "Mixed Forest",
        "Mixed forests are found most frequently in humid temperate biomes. They are often layered, with the outermost layer being tall, mature trees, the next layer being a shade-tolerant understory consisting of smaller mature trees, saplings and suppressed juvenile trees awaiting a fortuitous opening in the canopy.",
        "./static/images/terrain/mixed_forests.png",
        "['forest','dense']",
        FALSE,
        2,
        4
    ),(
        "ch",
        "Dense Mixed Forest",
        "Mixed forests are found most frequently in humid temperate biomes. They are often layered, with the outermost layer being tall, mature trees, the next layer being a shade-tolerant understory consisting of smaller mature trees, saplings and suppressed juvenile trees awaiting a fortuitous opening in the canopy. Dense mixed forests have fewer emerging juveniles, as established adult trees dominate the landscape.",
        "./static/images/terrain/dense_mixed_forests.png",
        "['forest','dense']",
        FALSE,
        4,
        4
    ),(
        "ci",
        "Bamboo Grove",
        "Groves this with flowering woody evergreen grasses. Economically valued for its characteristics and rapid growth, bamboo is strong, lightweight and can be processed for varying levels of tensile strength and flexibility.",
        "./static/images/terrain/bamboo_groves.png",
        "['forest']",
        FALSE,
        2,
        4
    ),(
        "cj",
        "Fungal Forest",
        "A forest comprised of enromous fungi. The flora and fauna of this terrain can be alien and confusing, with huge fungal formations sometimes fifty or more feet wide and stretching sometimes hundreds of feet into the air.",
        "./static/images/terrain/fungal_forests.png",
        "['fungus','forest'']",
        FALSE,
        2,
        4
    ),(
        "ck",
        "Dense Fungal Forest",
        "A thick forest comprised of densely packed enromous fungi. The flora and fauna of this terrain can be alien and confusing, with huge fungal formations sometimes clustered for a quarter of a mile solid and stretching sometimes hundreds of feet into the air.",
        "./static/images/terrain/dense_fungal_forests.png",
        "['fungus','forest','dense']",
        FALSE,
        4,
        4
    ),
# Variant Jungles
    (
        "da",
        "Jungles",
        "Jungles are tropical forests typified by daily rainfall, but adequate drainage to handle that rainfall. Jungles frequently cover a large geographical area and have dense canopies that allow only scattered sunlight to leak through. Megafauna and apex predators are abundant, and frequently struggle for control of vast tracts of territory.",
        "./static/images/terrain/jungles.png",
        "['jungle']",
        FALSE,
        8,
        4
    ),(
        "db",
        "Dense Jungles",
        "Jungles are tropical forests typified by daily rainfall, but adequate drainage to handle that rainfall. Jungles frequently cover a large geographical area and have dense canopies that allow only scattered sunlight to leak through. Dense jungles are difficult to navigate, not only because the foliage obscures vision and movement, but also because the terrain is sometimes impossible to negotiate for hundreds of yards, requiring that long trails be backtracked. Megafauna and apex predators are abundant, and frequently struggle for control of vast tracts of territory.",
        "./static/images/terrain/dense_jungles.png",
        "['jungle','dense']",
        FALSE,
        8,
        8
    ),(
        "ea",
        "Swamp",
        "A forested wetland, typified by long-leaved trees, lightly acidic water and thick overgrowth within its waters. Swamps are aassociated with geographically isolated peoples, vicious predators and thick, murky water that pickles things left therein for too long (especially bodies, which can, at times, be mummified by the murk).",
        "./static/images/terrain/swamp.png",
        "['wetland','forest']",
        FALSE,
        6,
        8
    ),(
        "eb",
        "Fen",
        "A fen is a wetland characterized by a deep mire, layered with liquid and solid muds. Fens differ from other forms of wetland insomuch as they are basic, rather than acidic, and dominated by mosses such as peat, which can layer itself dozens of yards thick.",
        "./static/images/terrain/fen.png",
        "['wetland']",
        FALSE,
        6,
        8
    ),(
        "ec",
        "Dead Forest Wetlands",
        "While dead forests are most frequently associated with magical or cataclysmic blights, dead forest wetlands are often naturally occurring, and are frequently the result of either sudden climate change, or toxins, such as acids and oily tars, rising to the surface and choking out all but the hardiest creatures and plants.",
        "./static/images/terrain/dead_forest_wetlands.png",
        "['forest','hostile','wetland']",
        FALSE,
        6,
        8
    ),(
        "ed",
        "Evergreen Wetlands",
        "Evergreen wetlands are characterized by silty loam, a type of sandy clay soil that retains water and nutrients well. Such wetlands are usually in northern regions, where the hardy evergreens crowd out the less cold-adapted deciduous trees. It is not uncommon for these wetlands to be caked in a layer of ice and snow for up to 7 months out of the year. The evergreens of such wetlands are favored for their fragrant hardwood.",
        "./static/images/terrain/evergreen_wetlands.png",
        "['wetland','forest']",
        FALSE,
        6,
        8
    ),(
        "ee",
        "Deciduous Wetlands",
        "Deciduous wetlands are characterized by silty loam, a type of sandy clay soil that retains water and nutrients well. The trees typically have tall roots that rise a few feet above ground. These areas are also frequently associated with quicksand, a hazardous fluid that that appears solid when undisturbed. A form of oobleck, quicksand is easy to sink into, but hard to pull oneself out of.",
        "./static/images/terrain/deciduous_wetlands.png",
        "['wetland','forest']",
        FALSE,
        6,
        8
    ),(
        "ef",
        "Jungle Wetlands",
        "Jungles are dense tropical forests with heavy rainfall and thick canopies. When these regions become wetlands, however, they frequently take on an altogether more dangerous character. These tropical wetlands are rich not only in valuable resources, but also flora and fauna of unique character, rare megafauna and, more sinisterly, pockets of swamp gas that builds up beneath the tree cover into pockets of potentially deadly gas.",
        "./static/images/terrain/jungle_wetlands.png",
        "['wetland','jungle']",
        FALSE,
        8,
        8
    ),(
        "eg",
        "Peat Bog",
        "Peat bogs are acidic bogs heavy in decayed plant matter - typically a mixture of moss and small fragrant shrubs. Gasses escaping from beneath the moss can sometimes ignite into night fires commonly mistaken for Will-O'-Wisps. This makes them favored hauntss of actual Will-O'-Wisps. The moss in the bogs can be burned to produce a sort of low quality iron frequently used by emerging iron age cultures to make crude weapons and tools",
        "./static/images/terrain/peat_bogs.png",
        "['wetland','fertile']",
        FALSE,
        6,
        8
    ),(
        "eh",
        "Marsh",
        "A marsh is a wetland dominated by herbaceous species rather than woody plants. They tend to be acidic and inhospitible to most forms of flora, but are frequently dominated by insects and other microfauna. Marshes also tend to be salty, which further exacerbates their inhospitability.",
        "./static/images/terrain/marsh.png",
        "['wetland']",
        FALSE,
        6,
        8
    ),
# Variant hills
    (
        "fa",
        "Grassy Hills",
        "The vegetation in grasslands is dominated by grasses, with rolling plains and scarce trees. Grassy hills are easy to navigate in general, but may restrict vision distance. Such lands, when occupied by barbarians or other savages, may about with burial mounds for slain warriors and nobles.",
        "./static/images/terrain/grassy_hills.png",
        "['grass','plain','hill']",
        FALSE,
        3,
        4
    ),(
        "fb",
        "Deciduous Hills",
        "Deciduous hills are heavily forested and frequently associated with plentiful game, lumber and naturally occurring fruits and herbs. Such rolling hills make for a majestic view in any season, be it the verdant rolling greens of spring and summer, the burnt amber of autumn, or the clean white cover of winter.",
        "./static/images/terrain/deciduous_hills.png",
        "['forest','hill']",
        FALSE,
        3,
        4
    ),(
        "fc",
        "Evergreen Hills",
        "Rolling hills of evergreen trees are associated primarily with northern lands, where the hardy conifers crowd out other trees that would struggle to survive in the same environment.",
        "./static/images/terrain/evergreen_forest_hills.png",
        "['forest','hill']",
        FALSE,
        3,
        4
    ),(
        "fd",
        "Dead Forest Hills",
        "Dead forest hills, frequently associated with blighted lands, broken by war, magic or sudden climate change, are inhospitible and foreboding.",
        "./static/images/terrain/dead_forest_hills.png",
        "['forest','hill','hostile']",
        FALSE,
        3,
        4
    ),(
        "fe",
        "Jungle Hills",
        "The thick canopy of the jungle often cloaks rolling hills and embankments. This creates terrain that is difficult to navigate, hard to negotiate and limited in visibility.",
        "./static/images/terrain/jungle_hills.png",
        "['jungle','hill']",
        FALSE,
        4,
        6
    ),(
        "ff",
        "Mixed Forest Hills",
        "Mixed forests are found most frequently in humid temperate biomes. They are often layered, with the outermost layer being tall, mature trees, the next layer being a shade-tolerant understory consisting of smaller mature trees, saplings and suppressed juvenile trees awaiting a fortuitous opening in the canopy. Mixed forested hills tend to have varied canopies, with hill peaks dominated by lower-crowned trees than the valleys, giving a more evenly stratified effect. The protection from erosion allows rivers to cut deep in such regions, often rolling down from nearby mountains.",
        "./static/images/terrain/mixed_forest_hills.png",
        "['forest','hill']",
        FALSE,
        3,
        4
    ),(
        "fg",
        "Shrubland Hills",
        "Shrubland, scrubland, scrub or brush is a plant community characterised by vegetation dominated by shrubs, often also including grasses, herbs, and geophytes (that is, plants that grow on or in rocks). Shrubland may either occur naturally or be the result of human activity, with rapid deforestation being a common cause. Shrubland hills are more likely to be natural, as over drainage and hostile terrain may result in hills being less hospitable to trees and other non-scrub sfoliage.",
        "./static/images/terrain/shrubland_hills.png",
        "['shrubs','hill']",
        FALSE,
        3,
        4
    ),
# Variant Mountains
    (
        "ga",
        "Lone Mountain",
        "A large landform that stretches above the surrounding land in a limited area, usually in the form of a peak, when mountains stand alone, they are frequently revered as sacred by the peoples nearby, who sometimes attribute to them the homes of deities.",
        "./static/images/terrain/mountain.png",
        "['mountain']",
        FALSE,
        8,
        12
    ),(
        "gb",
        "Mountains",
        "Mountain ranges are geographic areas containing numerous geographically linked mountains. Vegetation on mountains consists only of especially hardy plants, typically small shrubs and scattered evergreen trees.",
        "./static/images/terrain/mountains.png",
        "['mountain','dense']",
        FALSE,
        8,
        12
    ),(
        "gc",
        "Mesa",
        "Mesas are a form of flat-topped hill associated with certain forms of wind erosion. More solid, resistant minerals eroded down from much more complex rockforms. Commonly, harder capstones form a sill that protects the layers below from being eroded away.",
        "./static/images/terrain/mesa.png",
        "['mountain','desert']",
        FALSE,
        8,
        12
    ),(
        "gd",
        "Mixed Forested Mountains",
        "Mixed forests are found most frequently in humid temperate biomes. They are often layered, with the outermost layer being tall, mature trees, the next layer being a shade-tolerant understory consisting of smaller mature trees, saplings and suppressed juvenile trees awaiting a fortuitous opening in the canopy. When coupled with mountainous terrain they tend to be extremely rugged and dense, making movement and vision difficult.",
        "./static/images/terrain/mixed_forest_mountains.png",
        "['forest','mountain']",
        FALSE,
        8,
        12
    ),(
        "ge",
        "Deciduous Mountains",
        "Deciduous forests are comprised of trees that keep their leaves only during the warmer, sunnier seasons. The majesty of the mountain is accentuated by the verdant glory of the trees in spring and summer, and by the burnt oranges and reds of autumn as the seasons change to winter.",
        "./static/images/terrain/deciduous_mountains.png",
        "['forest','mountain']",
        FALSE,
        8,
        12
    ),(
        "gf",
        "Evergreen Mountains",
        "Evergreen forests, as the name suggests, do not lose their leaves (frequently needles) during the winter months, but continue to remain green all year round. Evergreen mountains feature hardy trees and often have forest beds dense with layers of discarded pine needles and hardy shrubs and fungi.",
        "./static/images/terrain/evergreen_mountains.png",
        "['mountain','forest']",
        FALSE,
        8,
        12
    ),(
        "gg",
        "Dead Forest Mountain",
        "Dead forests, frequently a result of cataclysmic events, magical interference or rapid climate change. Some contain economically valuable wood, scientifically interesting formations and mystical secrets.  Persistent dead forests are often seen as proof of the gods' displeasure, and can be associated with magical abuse or divine wrath. Such formations on mountains are often used as dramatic backdrops for the castles of wicked barons.",
        "./static/images/terrain/dead_forest_mountains.png",
        "['forest','mountain','hostile']",
        FALSE,
        8,
        12
    ),(
        "gh",
        "Jungle Mountain",
        "Jungle mountains are frequently concealed by the dense canopy found in such regions. The view from such a location, however, is truly breathtaking, with rolling expanses of glorious green.",
        "./static/images/terrain/jungle_mountains.png",
        "['jungle','mountain']",
        FALSE,
        10,
        14
    ),(
        "gi",
        "Dormant Volcano",
        "A rupture in the crust of the planet, volcanos allow great floes of molten rock, boiling metals and noxious gasses to erupt from the depths of the earth. \"Doramnt\" typically implies that the volcano is not currently emitting plumes of ash, actively spewing magma from fumeroles or otherwise currently in the process of erupting. They may have a molten caldera. Certain regions are more prone to volcanic activity than others, and the people thereof may not be intimidated by the presence of an active volcano near their settlement.",
        "./static/images/terrain/dormant_volcano.png",
        "['hostile','mountain']",
        FALSE,
        10,
        12
    ),(
        "gj",
        "Active Volcano",
        "A rupture in the crust of the planet, volcanos allow great floes of molten rock, boiling metals and noxious gasses to erupt from the depths of the earth. \"Active\" typically implies that the volcano is currently emitting plumes of ash, actively spewing magma from fumeroles or otherwise currently in the process of erupting. Certain regions are more prone to volcanic activity than others, and the people thereof may not be intimidated by the presence of an active volcano near their settlement.",
        "./static/images/terrain/active_volcano.png",
        "['hostile','hot','mountain']",
        FALSE,
        10,
        12
    ),
# Variant Water
    (
        "ha",
        "Lake",
        "Lakes, as they appear on the map, are large bodies of freshwater. Salt lakes exist, but are most commonly thought of as indland seas.",
        "./static/images/terrain/deep_seas.png",
        "['water','freshwater']",
        FALSE,
        2,
        2
    ),(
        "hb",
        "Sea",
        "Seas are bodies of saltwater that are surrounded completely or mostly by land. Who knows what may be concealed in their mirey depths?",
        "./static/images/terrain/seas.png",
        "['water','saltwater']",
        FALSE,
        2,
        2
    ),(
        "hc",
        "Shoals",
        "A natural submerged ridge, bank or sandbar that rises very near the surface of an otherwise deep body of water.",
        "./static/images/terrain/shoals.png",
        "['water','saltwater']",
        FALSE,
        2,
        2
    ),(
        "hd",
        "Ocean",
        "The oceans are uninterrupted seawater with no land as far as the horizon in every direction. Approximately 2/3 of the world is covered by water, and these are the deepest of those.",
        "./static/images/terrain/oceans.png",
        "['water','saltwater']",
        FALSE,
        2,
        2
    ),(
        "he",
        "Deep Ocean",
        "The deep oceans are uninterrupted seawater with no land as far as the horizon in every direction. Approximately 2/3 of the world is covered by water, and these are the deepest, of those.",
        "./static/images/terrain/deep_oceans.png",
        "['water','saltwater']",
        FALSE,
        2,
        2
    ),(
        "hf",
        "Deep Sea",
        "Seas are bodies of saltwater that are surrounded completely or mostly by land. They are frequently deep and treacherous, but nowhere near so much as the ocean.",
        "./static/images/terrain/deep_seas.png",
        "['water','saltwater']",
        FALSE,
        2,
        2
    );

DROP TABLE IF EXISTS `TERRAIN_IMPROVEMENTS`;
/*CREATE TABLE `TERRAIN_IMPROVEMENTS` ();
INSERT INTO `TERRAIN_IMPROVEMENTS` ();*/
