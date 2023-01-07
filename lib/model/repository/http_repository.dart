import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

final httpRepositoryProvider = Provider((ref) => HttpRepository());

class HttpRepository {
  Future<Map<String, String>> getHpInfo(String url) async {
    final Map<String, String> map = {};
    final Response response = await get(Uri.parse(url));

    var document = parse(response.body);
    // title取得
    final title = document.head!.getElementsByTagName('title')[0].innerHtml;
    map['title'] = title;
    // meta情報取得
    final metas = document.head!.getElementsByTagName('meta');
    for (var meta in metas) {
      if (meta.attributes['property'] == 'og:image') {
        map['image'] = meta.attributes['content']!;
      }
    }
    return map;
  }
}
