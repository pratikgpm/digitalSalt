import 'dart:convert';

import 'package:digital_salt/features/home/model/product_model.dart';

import 'package:http/http.dart' as http;

class filterRepository {
  static const String _baseURL = 'https://dummyjson.com/products';

  Future<List<Product>> filterProduct(String category) async {
    final responce = await http.get(Uri.parse(
        '$_baseURL/$category?limit=10&select=id,title,brand,price,discountPercentage,images,category'));
    if (responce.statusCode == 200) {
      List<dynamic> jsonResponce = jsonDecode(responce.body)['products'];
      return jsonResponce.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception("Something went wrong");
    }
  }
}