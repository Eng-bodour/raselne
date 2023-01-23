

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/logic/repositories/users/user_repo.dart';
import 'dart:io';
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
  Future<UserModel> getuser() {
    // TODO: implement getuser
    throw UnimplementedError();
  }

  @override
  Future<bool> isAuthuser() {
    // TODO: implement isAuthuser
    throw UnimplementedError();
  }

  @override
  Future<void> switch_type(String id_doc,String type) {
    // TODO: implement switch_type
    throw UnimplementedError();
  }

  @override
  Future<void> rate_user(String value, String iduser,String id_currentUser) {
    // TODO: implement rate_user
    throw UnimplementedError();
  }

  @override
  Future<double> check_Copoun(String id_doc, String copoun) {
    // TODO: implement check_Copoun
    throw UnimplementedError();
  }

  @override
  Future<bool> save_Copoun(String id_doc, String copoun) {
    // TODO: implement save_Copoun
    throw UnimplementedError();
  }

  @override
  Future<String> setImageProfileUser(String id_doc, String path_old,File? fileimage) {
    // TODO: implement setImageProfileUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateToken() {
    // TODO: implement updateToken
    throw UnimplementedError();
  }

  @override
  Future<void> updateLocation(String docId,GeoPoint location) {
    // TODO: implement updateLocation
    throw UnimplementedError();
  }

}