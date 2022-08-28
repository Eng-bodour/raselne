


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/logic/repositories/users/user_repo.dart';

import '../../../data_layer/model/facebook_model.dart';
import '../../../data_layer/webServices/firebase.dart';
import '../../../routes/routes.dart';

class user_firebase extends UserRepository{
  FirebaseAuth auth = FirebaseAuth.instance;// auth.currentUser!.uid.toString();
  User? get userProfiloe => auth.currentUser;
  var googleSignIn = GoogleSignIn();
  var isSignedIn = false;
  FaceBookModel? faceBookModel;

  @override
  Future<String> creatuser(String name, String email, String password)async {
    String message = '';
    try{
      await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // displayUserName.value = name;
      auth.currentUser!.updateDisplayName(name);
    });
    //to add applecation user and uid

   await FirebaseServices("users").userSetUp(name,email);

    message='done';
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;


      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }


    } catch (error) {
      message=error.toString();

    }
   return message;
  }

  @override
  Future<bool> faceBookSignUp( ) async {
    // print('facebok');
    final LoginResult loginResult = await FacebookAuth.instance.login();
    // final accesToken = loginResult.accessToken!.token;
    // final credential = FacebookAuthProvider.credential(accesToken);
    // await auth.signInWithCredential(credential);

    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      // displayUserPhoto.value = faceBookModel!.faceBookPhotoModel!.url!;
      // displayUserEmail.value = faceBookModel!.email!;
      // displayUserName.value = faceBookModel!.name!;

      await FirebaseServices("users").userSetUp
        (faceBookModel!.name.toString(),faceBookModel!.email.toString()
          // faceBookModel!.id.toString()
      );

      return true;
    }
    return false;
  }

  @override
  Future<bool> googleSinUp()async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      // displayUserName.value = googleUser!.displayName!;
      // displayUserPhoto.value = googleUser.photoUrl!;
      // displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
      await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);


     await FirebaseServices("users")
         .userSetUp(
         googleUser!.displayName!,
         googleUser.email.toString(),
         // googleUser.id
     );

      return true;
    } catch (error) {
      return false;

    }
  }

  @override
  Future<String> login(String email, String password) async{
    String message = '';
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password);
      //     .then((value) =>
      // displayUserName.value = auth.currentUser!.displayName!);

      isSignedIn = true;

    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;


      if (error.code == 'user-not-found') {
        message =
        ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else {
        message = error.message.toString();
      }
      // Get.snackbar(
      //   title,
      //   message,
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.green,
      //   colorText: Colors.white,
      // );
    } catch (error) {
      message=error.toString();

    }
    throw UnimplementedError();
  }

  @override
  Future<String> resetPassword(String email)
    // TODO: implement resetPassword
    async {
    String message='';
    try {
        await auth.sendPasswordResetEmail(email: email);

        message='done';
      } on FirebaseAuthException catch (error) {
        String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;


        if (error.code == 'user-not-found') {
          message =
          ' Account does not exists for that $email.. Create your account by signing up..';
        } else {
          message = error.message.toString();
        }


      } catch (error) {
      message=error.toString();
        // Get.snackbar(
        //   'Error!',
        //   error.toString(),
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        // );
      }
      return message;
    }


  @override
  Future<String> signOut() async {
    // TODO: implement signOut
    try {

      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      // displayUserName.value = '';
      // displayUserPhoto.value = '';
      // displayUserEmail.value = '';

      return 'done';

    } catch (error) {
      return error.toString();

    }
  }

  @override
  Future<UserModel> getuser() {
    // TODO: implement getuser

    return  FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo:
         auth.currentUser!.uid.toString())
        .get().then((value) =>
        UserModel.fromJson(value.docs[0].data()));

    throw UnimplementedError();
  }

  @override
  Future<bool> isAuthuser()async {
    // TODO: implement isAuthuser
    if(FirebaseAuth.instance.currentUser != null ||
       await GetStorage().read<bool>('auth') == true)
      return true;
    else return false;
  }


}