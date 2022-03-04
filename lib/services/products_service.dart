
import 'dart:convert';

import 'package:flt_login/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {

  final String _baseUrl = 'flutter-lgproductos-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;

  bool isLoading = true;
  bool isSaving  = false;

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

  Future saveOrCreateProduct ( Product product ) async {

    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      //Es necesario crear
      await this.createProduct(product);
    } else {
      // Actualizar
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();

  }

  Future <String> updateProduct ( Product product ) async {

    final url = Uri.https( _baseUrl, 'products/${product.id}.json');
    final respuesta = await http.put( url, body: product.toJson() );
    final decodedData = respuesta.body;

    //TODO Actualizar el listado de productos
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;

  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final respuesta = await http.post(url, body: product.toJson());
    final decodedData = json.decode( respuesta.body );

    product.id = decodedData['name'];
    products.add(product);

    return product.id!;

    
  }

}