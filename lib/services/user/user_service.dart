import 'package:injectable/injectable.dart';
import 'package:pizza_delivery/application/helpers/cripty_helper.dart';
import 'package:pizza_delivery/entities/user.dart';
import 'package:pizza_delivery/modules/users/view_models/register_input_model.dart';
import 'package:pizza_delivery/modules/users/view_models/user_login_model.dart';
import 'package:pizza_delivery/repositories/user/i_user_repository.dart';
import 'package:pizza_delivery/services/user/i_user_service.dart';

@LazySingleton(as: IUserService)
class UserService implements IUserService {
  final IUserRepository _repository;

  UserService(
    this._repository,
  );

  @override
  Future<void> register(RegisterInputModel inputModel) async {
    final passwordCrypt = CriptyHelper.generateSHA256Hash(inputModel.password);
    inputModel.password = passwordCrypt;

    await _repository.saveUser(inputModel);
  }

  @override
  Future<User> login(UserLoginModel viewModel) async {
    final passwordCrypt = CriptyHelper.generateSHA256Hash(viewModel.password);
    viewModel.password = passwordCrypt;
    return await _repository.login(viewModel);
  }
}
