import 'dart:convert';
import 'menu_item.dart';

class Menu {
  int id;
  String name;
  List<MenuItem> items;

  Menu({
    this.id,
    this.name,
    this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'items': items?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Menu(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      items: List<MenuItem>.from(map['items']?.map((x) => MenuItem.fromMap(x) ?? MenuItem()) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) => Menu.fromMap(json.decode(source));
}