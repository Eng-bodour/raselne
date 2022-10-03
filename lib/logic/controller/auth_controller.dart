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

import '../repositories/users/user_repo.dart';

class AuthProvider_vm extends ChangeNotifier {
  bool isVisibilty = false;
  bool isloading = false;
  bool isCheckBox = false;
  // var displayUserName = ''.obs;
  // var displayUserPhoto = ''.obs;
  // var displayUserEmail = ''.obs;
  bool isSignedIn = false;
  String message = '';
  late UserModel currentuser;
  UserRepository userRepository;
  AuthProvider_vm({required this.userRepository});

  Future<UserModel> isAuthuser()async{

  bool isauth= await  userRepository.isAuthuser();

  if(isauth)
  {
    currentuser= await userRepository.getuser();
    notifyListeners();
  }
   else
     return UserModel(
      location: LatLng(14,50), uid:null, name: 'name',
      email: 'email', mobile: 'mobile', dateCreated: '', type: '', rataing: 0.0);
   notifyListeners();
   return currentuser;
  }
  Future<bool> check_Copoun(String copoun) async {
    isloading=true;
    notifyListeners();
    bool res= await userRepository.check_Copoun(currentuser.docId, copoun);
    isloading=false;
    notifyListeners();
    return res;
  }

  Future<void> getuser_vm() async {
    currentuser=await userRepository.getuser();
     currentuser.rataing=UserModel.getrate(currentuser.rating);
    print('xxx '+currentuser.uid.toString());
    print('rating  '+currentuser.rataing.toString());
    notifyListeners();
  }

  Future<void> switch_type() async {
    isloading=true;
    notifyListeners();
    await userRepository.switch_type(
       currentuser.docId.toString(),
       currentuser.type=='user'?'captain':'user');
    currentuser.type=='user'?'captain':'user';
    isloading=false;
    notifyListeners();
  }

  @override
  void onInit()async {
  print('xxxxx');
    // displayUserName.value =
    //     (userProfiloe != null ? userProfiloe!.displayName : "")!;
    // // displayUserPhoto.value =
    // //     (userProfiloe != null ? userProfiloe!.photoURL : "")!;
    // displayUserEmail.value = (userProfiloe != null ? userProfiloe!.email : "")!;
    //

    // currentuser=UserModel(
    //   name: 'displayUserName.value',
    //   uid:'HjMUL9ksSLg7YSBODxA3zILpZKz2',//'userProfiloe?.uid',
    //   location: LatLng(35.22,22.50),
    //   mobile: '0', email: '', dateCreated: '', );

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
 Future<void> rateUser(String value,String iduser) async {

  await userRepository.rate_user( value, iduser, currentuser.uid.toString());

   notifyListeners();
 }
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    message=await  userRepository.creatuser(name, email, password);
    notifyListeners();
  }

 Future<void> logIn({
    required String email,
    required String password,
  }) async {
    message=await userRepository.login(email, password);
  notifyListeners();
  }

  Future<void> googleSinUpApp() async{
    isSignedIn=await userRepository.googleSinUp();
    notifyListeners();
  }

  Future<void> faceBookSignUpApp() async{

    isSignedIn=await userRepository.faceBookSignUp( );
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
   message=await userRepository.resetPassword(email);
    notifyListeners();
  }

  Future<void> signOutFromApp() async {
    message =await userRepository.signOut();
    notifyListeners();
  }
}
