import 'package:pelias/src/data/parameter/abstraction/pelias_parameter.dart';

class Size implements IAutocompleteParameter, ISearchParameter {
  final int size;

  const Size([this.size = 10]);

  @override
  Map<String, String> toQueryParameters() => {'size': size.toString()};
}
