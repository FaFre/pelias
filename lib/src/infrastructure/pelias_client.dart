import 'package:geojson/geojson.dart';
import 'package:http/http.dart' as http;
import 'package:pelias/src/data/parameter/abstraction/pelias_parameter.dart';
import 'package:pelias/src/data/parameter/text.dart';

typedef UriFactory = Uri Function(String authority, String unencodedPath,
    [Map<String, dynamic>? queryParameters]);

class PeliasClient {
  late http.Client httpClient;
  final Map<String, String>? headers;

  late Uri host;
  final UriFactory factory;

  static Uri httpFactory(String authority, String unencodedPath,
          [Map<String, dynamic>? queryParameters]) =>
      Uri.http(authority, unencodedPath, queryParameters);

  static Uri httpsFactory(String authority, String unencodedPath,
          [Map<String, dynamic>? queryParameters]) =>
      Uri.https(authority, unencodedPath, queryParameters);

  PeliasClient(String host,
      {this.factory = httpFactory, this.headers, http.Client? client}) {
    httpClient = client ?? http.Client();
    this.host = Uri.parse(host);
  }

  Future<GeoJsonFeatureCollection> _query(String path,
      {required Text text, List<IPeliasParameter>? parameters}) {
    final requestUri = factory.call(
        host.authority,
        path,
        parameters?.fold<Map<String, String>>(
                text.toQueryParameters(),
                (params, element) =>
                    params..addAll(element.toQueryParameters())) ??
            text.toQueryParameters());

    return httpClient
        .get(requestUri, headers: headers)
        .then((response) => featuresFromGeoJson(response.body));
  }

  Future<GeoJsonFeatureCollection> autocomplete(
          {required Text text, List<IAutocompleteParameter>? parameters}) =>
      _query('/v1/autocomplete', text: text, parameters: parameters);

  Future<GeoJsonFeatureCollection> search(
          {required Text text, List<ISearchParameter>? parameters}) =>
      _query('/v1/search', text: text, parameters: parameters);
}
