import 'package:sealed_class/sealed_class.dart';

@Sealed([Idle, HasStarted, HasData, HasError])
abstract class ViewState {}

class Idle implements ViewState {}

class HasStarted implements ViewState {}

class HasData implements ViewState {
  final dynamic data;

  HasData(this.data);
}

class HasError implements ViewState {
  final String error;

  HasError(this.error);
}
