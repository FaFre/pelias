import 'package:pelias/src/data/parameter/abstraction/pelias_parameter.dart';

enum Source {
  openstreetmap,
  openaddresses,
  geonames,
  whosonfirst,
}

const _sourceValues = {
  Source.openstreetmap: 'osm',
  Source.openaddresses: 'oa',
  Source.geonames: 'gn',
  Source.whosonfirst: 'wof',
};

class PeliasSources implements IAutocompleteParameter, ISearchParameter {
  final List<Source> sources;

  const PeliasSources(this.sources);

  @override
  Map<String, String> toQueryParameters() =>
      {'sources': sources.map((e) => _sourceValues[e]!).join(',')};
}
