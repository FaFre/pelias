import 'package:pelias/src/data/parameter/abstraction/pelias_parameter.dart';

class BoundaryCircle implements IAutocompleteParameter, ISearchParameter {
  final double lat;
  final double lon;
  final double radius;

  const BoundaryCircle(
      {required this.lat, required this.lon, this.radius = 50});

  @override
  Map<String, String> toQueryParameters() => {
        'boundary.circle.lat': lat.toString(),
        'boundary.circle.lon': lon.toString(),
        'boundary.circle.radius': radius.toString(),
      };
}
