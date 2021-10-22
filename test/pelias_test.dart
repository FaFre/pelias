import 'package:pelias/pelias.dart';
import 'package:test/test.dart';

const host = 'http://osm.movenext.me:4000';

void main() {
  group('basic query', () {
    final pelias = PeliasClient(host);

    test('autocomplete', () async {
      final test = await pelias.autocomplete(text: Text('murrhardt'));
      expect(test.collection, isNotEmpty);
    });

    test('search', () async {
      final test = await pelias.search(text: Text('murrhardt'));
      expect(test.collection, isNotEmpty);
    });
  });
}
