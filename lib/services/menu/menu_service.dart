import 'package:injectable/injectable.dart';
import 'package:pizza_delivery/entities/edges_item.dart';
import 'package:pizza_delivery/entities/menu.dart';
import 'package:pizza_delivery/repositories/menu/i_menu_repository.dart';
import 'package:pizza_delivery/services/menu/i_menu_service.dart';

@LazySingleton(as: IMenuService)
class MenuService implements IMenuService {
  final IMenuRepository _repository;

  MenuService(
    this._repository,
  );

  @override
  Future<List<Menu>> getAllMenus() {
    return _repository.findAll();
  }

  @override
  Future<List<EdgesItem>> getEdges() {
    return _repository.edges();
  }
}
