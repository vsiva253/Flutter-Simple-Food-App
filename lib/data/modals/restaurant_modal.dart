class Restaurant {
  final int id;
  final String name;
  final String tags;
  final double rating;
  final double discount;
  final String primaryImage;
  final double distance;

  Restaurant({
    required this.id,
    required this.name,
    required this.tags,
    required this.rating,
    required this.discount,
    required this.primaryImage,
    required this.distance,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      tags: json['tags'],
      rating: json['rating'].toDouble(),
      discount: json['discount'].toDouble(),
      primaryImage: json['primary_image'],
      distance: json['distance'].toDouble(),
    );
  }
}
