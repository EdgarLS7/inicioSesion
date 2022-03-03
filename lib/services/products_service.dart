
import 'dart:convert';

import 'package:flt_login/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {

  final String _baseUrl = 'flutter-lgproductos-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;

  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }
  
  Future<List<Product>> loadProducts() async {

    isLoading = true;
    notifyListeners();

    //Disparar la peticion
    final url = Uri.https( _baseUrl, 'products.json');
    final respuesta = await http.get( url );

    final Map<String, dynamic> productsMap =  json.decode(respuesta.body);

    productsMap.forEach((key, value) { 
      final tempProduct = Product.fromMap( value );
      tempProduct.id = key;
      products.add(tempProduct);

    });

    isLoading = false;
    notifyListeners();
    return products;
    
  }
}