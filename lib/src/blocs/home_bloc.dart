import 'package:shop/src/repositories/user_repository.dart';

class HomeBloc {
  UserRepository _userRepository = UserRepository();

  Future<bool> isUserLogOut() async {
    try {
      await _userRepository.isSignedOut();
      return true;
    } catch (_) {
      return false;
    }
  }
}
