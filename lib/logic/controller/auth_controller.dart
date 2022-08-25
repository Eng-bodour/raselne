import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:raselne/data_layer/model/facebook_model.dart';
import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/data_layer/webServices/firebase.dart';

import 'package:raselne/routes/routes.dart';

class AuthProvider_vm extends ChangeNotifier {
  bool isVisibilty = false;
  bool isCheckBox = false;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  FaceBookModel? faceBookModel;
  late UserModel currentuser;
  var isSignedIn = false;
  final GetStorage? authBox = GetStorage();

  User? get userProfiloe => auth.currentUser;

  @override
  void onInit() {
  print('xxxxx');
    displayUserName.value =
        (userProfiloe != null ? userProfiloe!.displayName : "")!;
    // displayUserPhoto.value =
    //     (userProfiloe != null ? userProfiloe!.photoURL : "")!;
    displayUserEmail.value = (userProfiloe != null ? userProfiloe!.email : "")!;
    currentuser=UserModel(
      name: 'displayUserName.value',
      uid:'userProfiloe?.uid', location: LatLng(35.22,22.50), mobile: '0', email: '', );

  }

  // create user obj based on firebase
  // UserPrivate? _userFirebaseUser(User user) {
  //   return user != null ? UserPrivate(uid: user.uid) : null;
  // }

  void visibility() {
    isVisibilty = !isVisibilty;

    notifyListeners();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    notifyListeners();
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      //to add applecation user and uid


      notifyListeners();
      FirebaseServices("users").userSetUp(name);
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);

      isSignedIn = true;
      authBox!.write("auth", isSignedIn);

      notifyListeners();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void googleSinUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox!.write("auth", isSignedIn);
      FirebaseServices("users").userSetUp(displayUserName.value);
      notifyListeners();

      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.amber,
        colorText: Colors.white,
      );
    }
  }

  void faceBookSignUpApp() async {
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
      isSignedIn = true;
      authBox!.write("auth", isSignedIn);
      FirebaseServices("users").userSetUp(faceBookModel!.name.toString());
      notifyListeners();
      Get.offNamed(Routes.mainScreen);
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      notifyListeners();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';
      isSignedIn = false;
      authBox!.remove("auth");
      notifyListeners();

      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
