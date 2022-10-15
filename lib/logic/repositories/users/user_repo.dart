


import 'package:raselne/data_layer/model/user_model.dart';
import 'dart:io';
abstract class UserRepository{

  Future<String> creatuser(String name,String email,String password);
  Future<String> login(String email,String password);
  Future<bool> googleSinUp();
  Future<bool> faceBookSignUp( );
  Future<void> rate_user(String value,String iduser,String id_currentUser);
  Future<String> resetPassword(String email);
  Future<String> signOut();
  Future<UserModel> getuser();
  Future<bool> isAuthuser();
  Future<void> switch_type(String id_doc,String type);
  Future<String> setImageProfileUser(String id_doc,String path_old,File? fileimage);
  Future<double> check_Copoun(String id_doc,String copoun);
  Future<bool> save_Copoun(String id_doc,String copoun);
  Future<void> updateToken();
}