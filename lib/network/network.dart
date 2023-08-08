import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/market_model.dart';
import '../model/product_model.dart';

class Network{
  final String baseUrl = "https://fakestoreapi.com";

  // Future<List<MarketModel>> getProducts() async {
  //   try {
  //     List<MarketModel> products = [];
  //     http.Response response = await http.get(Uri.parse("$baseUrl/products"));
  //
  //     List<dynamic> productsList = json.decode(response.body);
  //
  //     for (Map<String, dynamic> productMap in productsList) {
  //       products.add(MarketModel.fromMap(productMap));
  //     }
  //
  //     return products;
  //   } catch (error) {
  //     debugPrint("Server Error: $error");
  //     rethrow;
  //   }
  // }
  Future<List<MarketModel>> getProducts() async {
    try{
      List<MarketModel> products = [];
      http.Response response = await http.get(Uri.parse("$baseUrl/products"));

      List productsList = (json.decode(response.body))["products"];

      for(Map m in productsList){
        products.add(MarketModel.fromMap(m));
      }
      debugPrint(response.body);
      return products;
    } catch (error){
      debugPrint("Server Error: $error");
      rethrow;
    }
}
}