
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../home/model/product_model.dart';
import '../services/filterProduct.dart';

class FilterProvider with ChangeNotifier {
  final _filterRepository = filterRepository();

  final List<Product> allProducts = [];


  Future<void> fetchAllProducts(List<String>catogories) async {
    notifyListeners();
    for(String cato in catogories){
      try {
        List<Product> newProduct =
        await _filterRepository.filterProduct(cato);
        if (newProduct.isEmpty) {
        } else {
          allProducts.addAll(newProduct);
        }
      } catch (e) {
        print("Error fetching post");
      } finally {
        notifyListeners();
      }
    }

  }

}
