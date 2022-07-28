

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StoreService {
  static final _storage = FirebaseStorage.instance.ref();
  static final folder = "post_images";

  static Future<String?> uploadImage(File _image) async {
    String img_name = "image_" + DateTime.now().toString();
    var firebaseStorageRef = _storage.child(folder).child(img_name);
    var uploadTask = firebaseStorageRef.putFile(_image);
    var taskSnapshot = await uploadTask.snapshot;
    if (taskSnapshot != null) {
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      print(downloadUrl);
      return downloadUrl;
    }
    return null;
  }
}