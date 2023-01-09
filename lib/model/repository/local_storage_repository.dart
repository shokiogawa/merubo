import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

final localStorageRepositoryProvider =
    Provider((ref) => const LocalStorageRepository());

class LocalStorageRepository {
  const LocalStorageRepository();

  Future<String> saveImage(File image, String id) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final oldImagePath = image.path;
      File imageFile = File(oldImagePath);
      // 存在していればそのパスをリターン
      if (await imageFile.exists()) {
        return oldImagePath;
      }
      //存在していない場合は、idを付与してリターン
      final fileName = "${id}_${basename(image.path)}";
      final imagePath = '$path/$fileName';
      await imageFile.writeAsBytes(await image.readAsBytes());
      return imagePath;
    } catch (err) {
      throw Exception(err);
    }
  }
}
