import 'package:crabcheck/model/crab_info.dart';

final venitusLatreillei = Crab(
  image: "lib/assets/images/crab/venitusLatreillei.jpeg",
  species: "Venitus Latreillei",
  edibility: "Inedible!",
  localName: "Kasway",
  family: "Macrophthalmidae",
  habitat: "Burrows in soft mud",
  appearance: "60mm avg. width, light brown to dark in color",
);

final metopograpsusSpp = Crab(
    image: "lib/assets/images/crab/metopograpsusSp.jpeg",
    species: "Metopograpsus Spp",
    edibility: "Inedible!",
    localName: "Saka-saka",
    family: "Grapsidae",
    habitat: "Mangrove trees, they tend to climb trees at night",
    appearance:
        "5cm avg. width, square body, eyes set wide apart. Purple, green or yellow in color and has purple claws");

final portunosPelagicus = Crab(
    image: "lib/assets/images/crab/portunosPelagicus.jpg",
    species: "Portunos Pelagicus",
    edibility: "Edible!",
    localName: "Lambay",
    family: "Portunidae",
    habitat: "Shallow coastal waters, seagrass beds, mangroves",
    appearance:
        "20cm avg. width, males have bright blue shells with white spots, females are green or brown shades");

final scyllaSerrata = Crab(
    image: "lib/assets/images/crab/scyllaSerrata.jpg",
    species: "Scylla Serrata",
    edibility: "Edible!",
    localName: "Alimango",
    family: "Portunidae",
    habitat: "Deep mud burrows, mangroves",
    appearance:
        "28cm avg. width, green to black in color with smooth carapace");

final cardisomaCarnifex = Crab(
    image: "lib/assets/images/crab/cardisomaCarnifex.jpg",
    species: "Cardisoma Carnifex",
    edibility: "Edible!",
    localName: "Kagang",
    family: "Gecarcinidae",
    habitat: "Mangroves, mud burrows",
    appearance: "20cm avg. width, shades of brown, blue-grey in color");

// Crab data stored in a map for fetching
final crabInfo = {
  'Scylla Serrata': scyllaSerrata,
  'Portunos Pelagicus': portunosPelagicus,
  'Metopograpsus Spp': metopograpsusSpp,
  'Venitus Latreillei': venitusLatreillei,
  'Cardisoma Carnifex': cardisomaCarnifex
};

// create a list of crabs
final List<Crab> crabList = [
  venitusLatreillei,
  metopograpsusSpp,
  portunosPelagicus,
  scyllaSerrata,
  cardisomaCarnifex
];
