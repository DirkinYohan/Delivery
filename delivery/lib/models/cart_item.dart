import 'package:delivery/models/burger.dart';

class CartItem {
  final Burger burger;
  int quantity;
  final String spicyLevel;
  final List<String> toppings;
  final List<String> sideOptions;

  CartItem({
    required this.burger,
    this.quantity = 1,
    this.spicyLevel = 'Mild',
    this.toppings = const [],
    this.sideOptions = const [],
  });

  double get totalPrice => burger.price * quantity;
}
