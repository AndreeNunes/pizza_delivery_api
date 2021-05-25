import 'package:pizza_delivery/modules/users/view_models/user_login_model.dart';

class UserLoginViewModelMapper {
  final Map<String, dynamic> _requestMap;

  UserLoginViewModelMapper(this._requestMap);

  UserLoginModel mapper() {
    return UserLoginModel(
      _requestMap['email'],
      _requestMap['password'],
    );
  }
}
