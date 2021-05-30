import 'dart:convert';

class EdgesItem {
  int id;
  double price;
  String description;
  EdgesItem({
    this.id,
    this.price,
    this.description,
  });

  EdgesItem copyWith({
    int id,
    double price,
    String description,
  }) {
    return EdgesItem(
      id: id ?? this.id,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'description': description,
    };
  }

  factory EdgesItem.fromMap(Map<String, dynamic> map) {
    return EdgesItem(
      id: map['id'],
      price: map['price'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EdgesItem.fromJson(String source) =>
      EdgesItem.fromMap(json.decode(source));

  @override
  String toString() =>
      'EdgesItem(id: $id, price: $price, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EdgesItem &&
        other.id == id &&
        other.price == price &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ price.hashCode ^ description.hashCode;
}
