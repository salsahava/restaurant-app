import 'menu_item.dart';

class Menu {
  late List<MenuItem> foods;
  late List<MenuItem> drinks;

  Menu({
    required this.foods,
    required this.drinks,
  });

  Menu.fromJson(Map<String, dynamic> menu) {
    foods = List<MenuItem>.from(menu['foods'].map((x) => MenuItem.fromJson(x)));
    drinks =
        List<MenuItem>.from(menu['drinks'].map((x) => MenuItem.fromJson(x)));
  }
}
