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
      final fileName = "${id}_${basename(image.path)}";
      final imagePath = '$path/$fileName';
      File imageFile = File(imagePath);
      await imageFile.writeAsBytes(await image.readAsBytes());
      return imagePath;
    } catch (err) {
      throw Exception(err);
    }
  }
}
