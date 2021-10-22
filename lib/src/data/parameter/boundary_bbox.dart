import 'package:pelias/src/data/parameter/abstraction/pelias_parameter.dart';

class BoundaryBBox implements IAutocompleteParameter, ISearchParameter {
  final double minLon;
  final double minLat;
  final double maxLon;
  final double maxLat;

  const BoundaryBBox(
      {required this.minLon,
      required this.minLat,
      required this.maxLon,
      required this.maxLat});

  @override
  Map<String, String> toQueryParameters() => {
        'boundary.rect.min_lon': minLon.toString(),
        'boundary.rect.max_lon': maxLon.toString(),
        'boundary.rect.min_lat': minLat.toString(),
        'boundary.rect.max_lat': maxLat.toString(),
      };
}
