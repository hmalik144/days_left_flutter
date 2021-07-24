import 'package:days_left/data/FirebaseAuthData.dart';
import '../base/BaseModel.dart';

class UserAuthViewModel extends BaseModel {
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  FirebaseAuthData _firebaseAuthData;
  UserAuthViewModel(this._firebaseAuthData){
    _firebaseAuthData.firebaseAuth.authStateChanges().listen((event) {
      _loggedIn = event != null;
      notifyListeners();
    });
  }

}
