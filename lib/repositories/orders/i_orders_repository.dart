import 'package:pizza_delivery/entities/order.dart';
import 'package:pizza_delivery/modules/orders/view_models/save_order_input_model.dart';

abstract class IOrdersRepository {
  Future<void> saveOrder(SaveOrderInputModel saveOrder);
  Future<List<Order>> findMyOrders(int userId);
}
