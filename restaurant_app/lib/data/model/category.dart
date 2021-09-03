class Category {
  Category({
    required this.name,
  });

  String name;

  factory Category.fromJson(Map<String, dynamic> category) => Category(
        name: category['name'],
      );
}
