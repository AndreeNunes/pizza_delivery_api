//import 'dart:html';

import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';
import 'package:pizza_delivery/application/database/i_database_connection.dart';
import 'package:pizza_delivery/application/exceptions/database_error_exception.dart';
import 'package:pizza_delivery/entities/menu_item.dart';
import 'package:pizza_delivery/entities/order.dart';
import 'package:pizza_delivery/entities/order_item.dart';
import 'package:pizza_delivery/modules/orders/view_models/save_order_input_model.dart';
import 'package:pizza_delivery/repositories/orders/i_orders_repository.dart';

@LazySingleton(as: IOrdersRepository)
class OrdersRepository implements IOrdersRepository {
  final IDatabaseConnection _connection;

  OrdersRepository(this._connection);

  @override
  Future<void> saveOrder(SaveOrderInputModel saveOrder) async {
    final conn = await _connection.openConnection();

    try {
      await conn.transaction((_) async {
        final resultOrder = await conn.query('''
      insert into pedido(
      id_usuario,
      forma_pagamento,
      endereco_entrega,
      observacao
      ) values(?,?,?,?) 
      ''', [
          saveOrder.userId,
          saveOrder.paymentType,
          saveOrder.address,
          saveOrder.note,
        ]);

        final orderId = resultOrder.insertId;

        await conn.queryMulti('''
          insert into pedido_item(
            id_pedido,
            id_cardapio_grupo_item
          ) values(?,?)
        ''', saveOrder.itemsId.map((item) => [orderId, item]));
      });
    } on MySqlException catch (e) {
      print(e);
      throw DatabaseErrorException(message: 'Erro ao inserir order');
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<List<Order>> findMyOrders(int userId) async {
    final conn = await _connection.openConnection();
    final orders = <Order>[];

    try {
      final ordersResult = await conn.query(''' 
      select * from pedido where id_usuario = ?
      ''', [userId]);

      if (ordersResult.isNotEmpty) {
        for (var orderResult in ordersResult) {
          final orderData = orderResult.fields;

          final orderItemsResult = await conn.query(''' 
          
            select p.id_pedido_item, item.id_cardapio_grupo_item, item.nome, item.valor 
            from pedido_item p
            inner join cardapio_grupo_item item on item.id_cardapio_grupo_item = p.id_cardapio_grupo_item
            where p.id_pedido = ?
          ''', [orderData['id_pedido']]);

          final items = orderItemsResult.map<OrderItem>((item) {
            final itemFields = item.fields;
            return OrderItem(
                id: itemFields['id_pedido_item'],
                item: MenuItem(
                    id: itemFields['id_cardapio_grupo_item'] as int,
                    name: itemFields['nome'],
                    price: itemFields['valor']));
          }).toList();

          final order = Order(
            id: orderData['id_pedido'] as int,
            address: (orderData['endereco_entrega'] as Blob).toString(),
            paymentType: orderData['forma_pagamento'] as String,
            items: items,
            note: (orderData['observacao'] as Blob).toString(),
          );
          orders.add(order);
        }
      }

      return orders;
    } on MySqlException catch (e) {
      print(e);
      throw DatabaseErrorException(message: 'Erro ao buscar orders');
    }
  }
}
