import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/model/product_model.dart';
import '../services/filterProduct.dart';



class FilterProvider extends StateNotifier<bool>  {
  FilterProvider() : super(false);
  final List<Product> allProducts = [];
  final List<Product> filteredProduct = [];
  final _filterRepository = filterRepository();
  final List<String> categories = [];
  bool isLoading = false;

  Future<void> fetchFilterProducts() async {
    isLoading = true;
    try {
      List<Product> newProduct = await _filterRepository.filterProduct();
      if (newProduct.isEmpty) {
        debugPrint("new product is empty");
      } else {
        allProducts.addAll(newProduct);
      }
    } catch (e) {
      print("custom exception occur");
    } finally {
      isLoading = false;

    }
  }

  Future<void> addData(List<String> cato) async {
    filteredProduct.clear();
    for (Product test in allProducts) {
      if (cato.contains(test.category.toString())) {
        print(test.title);
        filteredProduct.add(test);
      }
    }
    print(filteredProduct.length.toString());

// Apply filter logic here
  }
}
