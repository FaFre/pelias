import 'package:pelias/src/data/parameter/abstraction/pelias_parameter.dart';

class Text implements IAutocompleteParameter, ISearchParameter {
  final String text;

  Text(this.text);

  @override
  Map<String, String> toQueryParameters() => {'text': text};
}
