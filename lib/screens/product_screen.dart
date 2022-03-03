
import 'package:flt_login/ui/input_decorations.dart';
import 'package:flt_login/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductScrenn extends StatelessWidget {
  const ProductScrenn({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const Productimage(),

                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 30,),
                  )
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      //TODO Camara o Galeria
                    },
                    icon: const Icon(Icons.camera_alt_outlined, size: 30,),
                  )
                ),
              ],
            ),

            const _ProductForm(),

            const SizedBox( height: 100,),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon (Icons.save_outlined),
        onPressed: () {

        },
      ),

    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 300,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [

              const SizedBox( height: 10,),

              TextFormField(
                decoration: Inputdecorations.authInputDecoration(
                  hintText : 'Nombre del producto', 
                  labelText: 'Nombre:'),
              ),

              const SizedBox( height: 30,),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: Inputdecorations.authInputDecoration(
                  hintText : '\$150', 
                  labelText: 'Precio:'),
              ),
              
              const SizedBox( height: 30,),

              SwitchListTile.adaptive(
                title: const Text('Disponible'),
                activeColor: Colors.indigo,
                value: true, 
                onChanged: ( value ) {

                }
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
