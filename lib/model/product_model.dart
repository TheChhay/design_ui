class Product {
  final int? id;
  final String? name;
  int? qty;
  double? amount;
  final String? description;
  final double? price;
  final String? imageUrl;
  final int? categoryId;
  String? orderDate;

  Product({
    this.id,
    this.name,
    this.qty=0,
    this.amount=0,
    this.description,
    this.price,
    this.imageUrl,
    this.categoryId,
    this.orderDate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      qty: json['qty'],
      amount: json['amount'].toDouble(),
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      categoryId: json['categoryId'],
      orderDate: json['orderDate'],
    );
  }
}
