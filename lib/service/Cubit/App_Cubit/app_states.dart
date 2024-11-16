import 'package:almohamady/components/login/user_model/login_model.dart';

abstract class AppStates {}

class InitialState extends AppStates {}

class change_Visibility extends AppStates {}

class getLoding extends AppStates {}

class for_datalogin extends AppStates {}

class Success_login extends AppStates {
  final User_login_Model user_login;
  Success_login(this.user_login);
}

class Error_login extends AppStates {
  final error;

  Error_login(this.error);
}
