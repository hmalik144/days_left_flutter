import 'package:days_left/data/FirebaseAuthData.dart';
import '../base/BaseModel.dart';

class LoginViewModel extends BaseModel {
  FirebaseAuthData _firebaseAuthData;
  LoginViewModel(this._firebaseAuthData);

  void tryLogin(String email, String password) {
    // Todo: validate username & password
    handleFuture(_firebaseAuthData.signIn(email, password));
  }


}
