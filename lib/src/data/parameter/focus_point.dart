import 'package:pelias/src/data/parameter/abstraction/pelias_parameter.dart';

class FocusPoint implements IAutocompleteParameter, ISearchParameter {
  final double lat;
  final double lon;

  const FocusPoint({required this.lat, required this.lon});

  @override
  Map<String, String> toQueryParameters() =>
      {'focus.point.lat': lat.toString(), 'focus.point.lon': lon.toString()};
}
