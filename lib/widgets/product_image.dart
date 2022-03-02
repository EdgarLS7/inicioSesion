import 'package:flutter/material.dart';

class Productimage extends StatelessWidget {
  const Productimage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only( left: 10, right: 10, top: 10),
      child: Container(
        decoration: _BuildBoxdDecoration(),
        width: double.infinity,
        height: 450,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
          child: FadeInImage(
            image: NetworkImage('https://via.placeholder.com/400x300/green'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.cover,
          ),
        ),
      )
    );
  }

  BoxDecoration _BuildBoxdDecoration() => BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.00),
        blurRadius: 10,
        offset: Offset(0,5)
      )
    ]
  );
}