import 'package:pizza_delivery/entities/menu.dart';

abstract class IMenuRepository {
  Future<List<Menu>> findAll();
}
