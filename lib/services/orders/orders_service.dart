import 'package:injectable/injectable.dart';
import 'package:pizza_delivery/entities/order.dart';
import 'package:pizza_delivery/modules/orders/view_models/save_order_input_model.dart';
import 'package:pizza_delivery/repositories/orders/i_orders_repository.dart';
import 'package:pizza_delivery/services/orders/i_orders_service.dart';

@LazySingleton(as: IOrdersService)
class OrdersService implements IOrdersService {
  final IOrdersRepository _repository;

  OrdersService(this._repository);

  @override
  Future<void> saveOrder(SaveOrderInputModel saveOrder) async {
    await _repository.saveOrder(saveOrder);
  }

  @override
  Future<List<Order>> findMyOrders(int userId) async {
    return await _repository.findMyOrders(userId);
  }
}
