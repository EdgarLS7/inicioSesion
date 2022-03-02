
import 'package:flt_login/ui/input_decorations.dart';
import 'package:flt_login/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductScrenn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Productimage(),

                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios_new, size: 30,),
                  )
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      //TODO Camara o Galeria
                    },
                    icon: Icon(Icons.camera_alt_outlined, size: 30,),
                  )
                ),
              ],
            ),

            _ProductForm(),

            SizedBox( height: 100,),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon (Icons.save_outlined),
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
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 300,
        decoration: _BuildBoxDecoration(),
        child: Form(
          child: Column(
            children: [

              SizedBox( height: 10,),

              TextFormField(
                decoration: Inputdecorations.authInputDecoration(
                  hintText : 'Nombre del producto', 
                  labelText: 'Nombre:'),
              ),

               SizedBox( height: 30,),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: Inputdecorations.authInputDecoration(
                  hintText : '\$150', 
                  labelText: 'Precio:'),
              ),
              
              SizedBox( height: 30,),

              SwitchListTile.adaptive(
                title: Text('Disponible'),
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

  BoxDecoration _BuildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}