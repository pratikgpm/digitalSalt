import 'dart:convert';
import 'package:digital_salt/features/home/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final FilterAPIProvider =
    Provider<filterRepository>((ref) => filterRepository());

final AllProductProvider = FutureProvider<List<Product>>(
    (ref) => ref.read(FilterAPIProvider).filterProduct());

final resultProvider = StateNotifierProvider<myResult,List<Product>>((ref) => myResult());

class filterRepository {
  final String _baseURL = 'https://dummyjson.com/products';

  Future<List<Product>> filterProduct() async {
    final responce = await http.get(Uri.parse(
        '${_baseURL.trim()}?limit=0&select=id,title,brand,price,discountPercentage,images,category'));
    if (responce.statusCode == 200) {
      List<dynamic> jsonResponce = jsonDecode(responce.body)['products'];
      return jsonResponce.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception("Something went wrong");
    }
  }

}



class myResult extends StateNotifier<List<Product>>{
  myResult(): super([]);

  void upDate(List<Product> proList){
    state = [];
    state = proList;
  }

}
