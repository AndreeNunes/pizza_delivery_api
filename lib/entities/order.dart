import 'dart:convert';

import 'package:pizza_delivery/entities/order_item.dart';

class Order {
  final int id;
  final String paymentType;
  final String address;
  final List<OrderItem> items;
  final String note;

  Order({
    this.id,
    this.paymentType,
    this.address,
    this.items,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'paymentType': paymentType,
      'address': address,
      'items': items?.map((x) => x?.toMap())?.toList(),
      'note': note,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Order(
      id: map['id'],
      paymentType: map['paymentType'],
      address: map['address'],
      items:
          List<OrderItem>.from(map['items']?.map((x) => OrderItem.fromMap(x))),
      note: map['note'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
