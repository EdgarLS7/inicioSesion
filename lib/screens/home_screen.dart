import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flt_login/services/services.dart';
import 'package:flt_login/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => GestureDetector (
          onTap: () => Navigator.pushNamed(context, '/product'),
          child: const ProductCard())
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      )
    );
  }
}
