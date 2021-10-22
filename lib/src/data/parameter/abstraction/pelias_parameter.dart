abstract class IPeliasParameter {
  Map<String, String> toQueryParameters();
}

abstract class IAutocompleteParameter implements IPeliasParameter {}

abstract class ISearchParameter implements IPeliasParameter {}
