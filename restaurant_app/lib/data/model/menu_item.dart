class MenuItem {
  late String name;

  MenuItem({required this.name});

  MenuItem.fromJson(Map<String, dynamic> menuItem) {
    name = menuItem['name'];
  }
}
