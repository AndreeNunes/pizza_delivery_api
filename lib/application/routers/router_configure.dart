import 'package:pizza_delivery/application/routers/i_router_configure.dart';
import 'package:pizza_delivery/modules/menu/menu_routers.dart';
import 'package:pizza_delivery/modules/orders/orders_routers.dart';
import 'package:pizza_delivery/modules/users/users_router.dart';
import 'package:shelf_router/src/router.dart';

class RouterConfigure {
  final Router _router;
  final List<IRouterConfigure> routers = [
    UsersRouter(),
    MenuRouters(),
    OrdersRouters(),
  ];

  RouterConfigure(this._router);

  void configure() => routers.forEach((r) => r.configure(_router));
}
