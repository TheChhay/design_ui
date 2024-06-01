class Product {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final String? imageUrl;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
    );
  }
}
