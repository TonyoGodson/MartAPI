import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ApiHelper {
  final String baseUrl = "https://fakestoreapi.com";

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/products"));
      if (response.statusCode == 200) {
        final productsList = json.decode(response.body) as List<dynamic>;
        return productsList.map((productMap) {
          return ProductModel.fromJson(productMap);
        }).toList();
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (error) {
      throw Exception('Server Error: $error');
    }
  }
}