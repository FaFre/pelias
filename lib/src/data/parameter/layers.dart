import 'package:pelias/src/data/parameter/abstraction/pelias_parameter.dart';

enum Layer {
  ///points of interest, businesses, things with walls
  venue,

  ///places with a street address
  address,

  ///streets,roads,highways
  street,

  ///places that issue passports, nations, nation-states
  country,

  ///a related group of regions. Mostly in Europe
  macroregion,

  ///states and provinces
  region,

  ///a related group of counties. Mostly in Europe.
  macrocounty,

  ///official governmental area; usually bigger than a locality, almost always smaller than a region
  county,

  ///towns, hamlets, cities
  locality,

  ///local administrative boundaries
  localadmin,

  ///a local administrative boundary, currently only used for New York City
  borough,

  ///social communities, neighbourhoods
  neighbourhood,

  ///alias for simultaneously using all administrative layers (everything except venue and address)
  coarse,

  ///postal code used by mail services
  postalcode,
}

extension _ParseToString on Layer {
  String getValue() {
    return toString().split('.').last;
  }
}

class Layers implements IAutocompleteParameter, ISearchParameter {
  final List<Layer> layers;

  const Layers(this.layers);

  @override
  Map<String, String> toQueryParameters() =>
      {'layers': layers.map((e) => e.getValue()).join(',')};
}
