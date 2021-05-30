import 'package:pizza_delivery/entities/edges_item.dart';
import 'package:pizza_delivery/entities/menu.dart';

abstract class IMenuRepository {
  Future<List<Menu>> findAll();
  Future<List<EdgesItem>> edges();
}
