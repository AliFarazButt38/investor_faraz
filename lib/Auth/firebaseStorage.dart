import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
Future<String> uploadImageToFirestore(File imageFile) async {
  try {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference =
    FirebaseStorage.instance.ref().child('user_images/$userId/$imageName.jpg');
    UploadTask uploadTask ;
    try {
      uploadTask = storageReference.putFile(imageFile);
    } catch (e) {
      print('Error starting image upload: $e');
      return '';
    }
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    print('Image uploaded to Firestore: $downloadUrl');
    return downloadUrl;
  } catch (e) {
    print('Error uploading image to Firestore: $e');
    return '';
  }
}