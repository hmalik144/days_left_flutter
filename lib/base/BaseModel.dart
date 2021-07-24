import 'dart:async';

import 'package:days_left/data/ViewState.dart';
import 'package:stacked/stacked.dart';

class BaseModel extends BaseViewModel {
  ViewState _viewState = Idle();

  ViewState get viewState => _viewState;

  void onStart() {
    _viewState = HasStarted();
    notifyListeners();
  }

  void onSuccess(dynamic data) {
    _viewState = HasData(data);
    notifyListeners();
  }

  void onError(String error) {
    _viewState = HasError(error);
    notifyListeners();
  }

  void handleFuture(Future<dynamic> func) {
    onStart();
    func.then((value) => onSuccess(value)).catchError((error) {
      print(error);
      onError(error);
    });
  }

  void handleStream(Stream<dynamic> stream) {
    stream.listen((event) {
      onSuccess(event);
    }).onError((handleError) {
      onError(handleError);
    });
  }
}
