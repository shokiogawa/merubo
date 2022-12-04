import 'package:flutter_riverpod/flutter_riverpod.dart';

// メッセージボード作成のためのprovider
final currentIndexProviderForCreate = StateProvider<int>((ref) {
  return 0;
});
