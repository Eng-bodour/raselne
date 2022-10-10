
import 'dart:io';
import 'dart:math';
// import 'package:firebase_dart/firebase_dart.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class image_service{

   Future<String> uploadImageToFirebase(File imageFile,String path) async {
    String nameimage=basename(imageFile.path);
    // Create the file metadata
    final metadata = SettableMetadata(
        contentType: "image/jpg");


    var random=Random().nextInt(100000);
    var storageRef=FirebaseStorage.instance.
    ref('$path/$random${nameimage}');

    String urlimage='';
    final uploadTask = await storageRef.putFile(imageFile,metadata);
    if(uploadTask.state==TaskState.success)
      urlimage =await storageRef.getDownloadURL();

    // Upload file and metadata to the path 'images/mountains.jpg'
    // Uint8List data=fileimageinvoice.

    // = storageRef
    //     .child("images/${nameimage}")
    //     .putFile(imageFile,metadata);
    // Listen for state changes, errors, and completion of the upload.
    // String urlimage='';
    //
    // uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
    //   switch (taskSnapshot.state) {
    //     case TaskState.running:
    //       final progress =
    //           100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
    //       print("Upload is $progress% complete.");
    //       break;
    //     case TaskState.paused:
    //       print("Upload is paused.");
    //       break;
    //     case TaskState.canceled:
    //       print("Upload was canceled");
    //       break;
    //     case TaskState.error:
    //     // Handle unsuccessful uploads
    //       break;
    //     case TaskState.success:
    //     // Handle successful uploads on complete
    //     // ...
    //       urlimage=await storageRef.getDownloadURL();
    //       break;
    //   }
    // });
    return urlimage;
  }

}