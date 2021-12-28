import 'dart:async';
import 'package:shop/src/repositories/user_repository.dart';
import 'package:shop/src/validator/user_validation.dart';

class LoginBloc{
  
  UserRepository _userRepository = UserRepository();
  StreamController _userController = StreamController();
  StreamController _passController = StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidEmail(String email){
    if(ValidationUser.validateEmail(email)){
      _userController.sink.add("OK");
      return true;
    }
    _userController.sink.addError("Invalid password");
    return false;
  }

  bool isValidPassword(String password){
    if(ValidationUser.validatePassword(password)){
      _passController.sink.add("OK");
      return true;
    }
    _passController.sink.addError("Invalid password");
    return false;
  }

  Future<bool> signInWithEmailAndPassword({String email, String password}) async{
    if(isValidEmail(email) && isValidPassword(password)){
      try{
        await _userRepository.signInWithEmailAndPassword(email, password);
        return true;
      }
      catch(_){}
    }
    return false;
  }
  Future<bool> signInWithGoogle() async {
    try{
      await _userRepository.signInWithGoogle();
      return true;
    }
    catch(_){}
    return false;
  }
}
