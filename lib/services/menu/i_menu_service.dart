import 'package:pizza_delivery/entities/menu.dart';

abstract class IMenuService {
  Future<List<Menu>> getAllMenus();
}
