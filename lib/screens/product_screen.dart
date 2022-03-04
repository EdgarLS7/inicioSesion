
import 'package:flt_login/providers/product_form_providers.dart';
import 'package:flt_login/services/services.dart';
import 'package:flt_login/ui/input_decorations.dart';
import 'package:flt_login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductScrenn extends StatelessWidget {
  const ProductScrenn({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: ( _ ) => ProductFormProvider( productService.selectedProduct ),
      child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                Productimage( url: productService.selectedProduct.picture,),

                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.white,),
                  )
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      //TODO Camara o Galeria
                    },
                    icon: const Icon(Icons.camera_alt_outlined, size: 30, color: Colors.white),
                  )
                ),
              ],
            ),

            _ProductForm(),

            const SizedBox( height: 100,),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon (Icons.save_outlined),
        onPressed: () async {
          if (!productForm.isValidForm()) return;

          await productService.saveOrCreateProduct(productForm.product);
        },
      ),

    );
  }
}

class _ProductForm extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 300,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [

              const SizedBox( height: 10,),

              TextFormField(
                initialValue: product.name,
                onChanged: ( value ) => product.name = value,
                validator: ( value ) {
                  if ( value == null || value.isEmpty ) {
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: Inputdecorations.authInputDecoration(
                  hintText : 'Nombre del producto', 
                  labelText: 'Nombre:'),
              ),

              const SizedBox( height: 30,),

              TextFormField(
                initialValue: '${product.price}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: ( value ) {
                  if ( double.tryParse(value) == null ) {
                    product.price = 0;
                  } else {
                    product.price = double.parse(value);
                  }
                }, 
                keyboardType: TextInputType.number,
                decoration: Inputdecorations.authInputDecoration(
                  hintText : '\$150', 
                  labelText: 'Precio:'),
              ),
              
              const SizedBox( height: 30,),

              SwitchListTile.adaptive(
                title: const Text('Disponible'),
                activeColor: Colors.indigo,
                value: product.available, 
                onChanged: productForm.updateAvailability
              ),
            ],
          )
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only( bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: const Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}
