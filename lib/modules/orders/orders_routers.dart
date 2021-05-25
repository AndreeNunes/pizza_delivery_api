import 'package:get_it/get_it.dart';
import 'package:pizza_delivery/application/routers/i_router_configure.dart';
import 'package:pizza_delivery/modules/orders/controllers/orders_controller.dart';
import 'package:shelf_router/src/router.dart';

class OrdersRouters implements IRouterConfigure {
  @override
  void configure(Router router) {
    router.mount('/order/', GetIt.I.get<OrdersController>().router);
  }
}
