import 'package:flutter/material.dart';

class Productimage extends StatelessWidget {

  final String? url;

  const Productimage({
    Key? key, 
    this.url
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxdDecoration(),
        width: double.infinity,
        height: 450,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
          child: url == null
            ? const Image(image: AssetImage('assets/no-image.png'),
            fit: BoxFit.cover,
          )
          : FadeInImage(
              image: NetworkImage( url! ),
              placeholder: const AssetImage('assets/jar-loading.gif'),
              fit: BoxFit.cover,
          ),
        ),
      )
    );
  }

  BoxDecoration _buildBoxdDecoration() => BoxDecoration(
    color: Colors.red,
    borderRadius: const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.00),
        blurRadius: 10,
        offset: const Offset(0,5)
      )
    ]
  );
}