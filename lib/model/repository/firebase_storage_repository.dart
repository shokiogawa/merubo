import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/common_provider/firebase_fire_storage.dart';
import 'package:uuid/uuid.dart';

final firebaseStorageRepository =
    Provider((ref) => FirebaseStorageRepository(ref));

class FirebaseStorageRepository {
  FirebaseStorageRepository(this.ref);

  final Ref ref;

  Future<String> uploadImage(File imageFile, String path) async {
    try {
      final uuid = const Uuid().v4();
      final storagePath = '$path/$uuid';
      final storageRef =
          ref.watch(fireBaseFireStorageProvider).child(storagePath);
      final uploadTask = await storageRef.putFile(imageFile);
      final url = await uploadTask.ref.getDownloadURL();
      return url;
    } catch (err) {
      print(path);
      print("Error uploadImage");
      print(err);
      throw Exception('$pathが保存できませんでした。');
    }
  }
}
