// ignore_for_file: public_member_api_docs, sort_constructors_first

class Product {
  final int id;
  final String title;
  final String brand;
  final double price;
  final double discount;
  final String imageUrl;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    required this.discount,
    required this.imageUrl,
    required this.category,
  });

  Product copyWith({
    int? id,
    String? title,
    String? brand,
    double? price,
    double? discount,
    String? imageUrl,
    String? category,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'brand': brand});
    result.addAll({'price': price});
    result.addAll({'discountPercentage': discount});
    result.addAll({'images': imageUrl});
    result.addAll({'category': category});
    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      brand: map['brand'] ?? '',
      price: map['price'].cast<double>(),
      discount: map['discountPercentage'].cast<double>(),
      imageUrl: map['images'][0] ?? '',
      category: map['category'] ?? '',
    );
  }


  factory Product.fromJson(Map<String, dynamic> json)
  {
    return Product(
      id: json['id'],
      title: json['title'],
      brand: json['brand'],
      price: json['price'],
      discount: json['discountPercentage'] ?? '',
      imageUrl: json['images'][0] ?? '',
      category: json['category'] ?? '',

    );
  }



  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.brand == brand &&
        other.price == price &&
        other.discount == discount &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        brand.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        imageUrl.hashCode;
  }
}
