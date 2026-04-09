class Burger {
  final String id;
  final String name;
  final String description;
  final double price;
  final String rating;
  final String time;
  final String imagePath;
  final List<String> categories;
  bool isFavorite;

  Burger({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.time,
    required this.imagePath,
    required this.categories,
    this.isFavorite = false,
  });
}
