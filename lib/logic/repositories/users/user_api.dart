

import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/logic/repositories/users/user_repo.dart';

class user_api extends UserRepository{
  @override
  Future<String> creatuser(String name, String email, String password) {
    // TODO: implement creatuser
    throw UnimplementedError();
  }

  @override
  Future<bool> faceBookSignUp( ) {
    // TODO: implement faceBookSignUp
    throw UnimplementedError();
  }

  @override
  Future<bool> googleSinUp() {
    // TODO: implement googleSinUp
    throw UnimplementedError();
  }

  @override
  Future<String> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getuser(String uid) {
    // TODO: implement getuser
    throw UnimplementedError();
  }

}