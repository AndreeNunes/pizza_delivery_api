import 'package:pizza_delivery/entities/user.dart';
import 'package:pizza_delivery/modules/users/view_models/register_input_model.dart';
import 'package:pizza_delivery/modules/users/view_models/user_login_model.dart';

abstract class IUserRepository {
  Future<void> saveUser(RegisterInputModel model);

  Future<User> login(UserLoginModel viewModel);
}
