// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$MenuControllerRouter(MenuController service) {
  final router = Router();
  router.add('GET', r'/', service.findAll);
  router.add('GET', r'/bordas', service.edges);
  return router;
}
