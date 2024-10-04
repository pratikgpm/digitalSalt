import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:digital_salt/features/home/model/product_model.dart';

Future<List<Product>> fetchFilteredProducts(List<String> categories) async {
  final response = await http.get(Uri.parse(
      'https://dummyjson.com/products/category/beauty?limit=10&select=id,title,brand,price,discountPercentage,images,category'));


  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['products'];
    List<Product> products =
        jsonResponse.map((product) => Product.fromJson(product)).toList();
    return products
        .where((product) => categories.contains(product.category))
        .toList();
  } else {
    throw Exception('Failed to load products');
  }
}
