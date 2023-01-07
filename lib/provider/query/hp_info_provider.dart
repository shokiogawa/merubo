import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/repository/http_repository.dart';

final hpInfoProvider = FutureProvider.family<Map<String, String>, String>((ref, url)async{
  final hpInfo = await ref.watch(httpRepositoryProvider).getHpInfo(url);
  return hpInfo;
});