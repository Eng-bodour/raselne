


import 'package:raselne/data_layer/model/user_model.dart';

abstract class UserRepository{

  Future<String> creatuser(String name,String email,String password);
  Future<String> login(String email,String password);
  Future<bool> googleSinUp();
  Future<bool> faceBookSignUp( );
  Future<String> resetPassword(String email);
  Future<String> signOut();
  Future<UserModel> getuser(String uid);

}