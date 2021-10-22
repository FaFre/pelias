import 'package:pelias/src/data/parameter/abstraction/pelias_parameter.dart';

class Country implements IAutocompleteParameter, ISearchParameter {
  ///alpha-2 or alpha-3 ISO-3166 country code
  final List<String> countries;

  const Country(this.countries);

  @override
  Map<String, String> toQueryParameters() => {'countries': countries.join(',')};
}
