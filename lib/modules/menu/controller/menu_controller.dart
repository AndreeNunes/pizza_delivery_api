import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:pizza_delivery/services/menu/i_menu_service.dart';

part 'menu_controller.g.dart';

@Injectable()
class MenuController {
  final IMenuService _menuService;

  MenuController(
    this._menuService,
  );

  @Route.get('/')
  Future<Response> findAll(Request request) async {
    try {
      final menus = await _menuService.getAllMenus();

      return Response.ok(
          jsonEncode(menus?.map((m) => m.toMap())?.toList() ?? []));
    } catch (e) {
      print(e);
      return Response.internalServerError();
    }
  }

  @Route.get('/bordas')
  Future<Response> edges(Request request) async {
    try {
      final edges = await _menuService.getEdges();

      return Response.ok(
          jsonEncode(edges?.map((e) => e.toMap())?.toList() ?? []));
    } catch (e) {
      print(e);
      return Response.internalServerError();
    }
  }

  Router get router => _$MenuControllerRouter(this);
}
