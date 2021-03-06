import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          
          const _PurpleBox(),
          const _HeaderIcon(),
          child,

        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only( top: 30),
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100,),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _colorGradiente(),
      child: Stack(
        children: const [
          Positioned(child: _Circulo(), top: 100, left: 30,),
          Positioned(child: _Circulo(), top: 70, left: 250,),
          Positioned(child: _Circulo(), top: -40, left: -30,),
          Positioned(child: _Circulo(), top: -50, right: -20,),
          Positioned(child: _Circulo(), bottom: -50, left: 10,),
          Positioned(child: _Circulo(), bottom: 100, right: 20,),
        ],
      ), 
    );
  }

  //metodo
  BoxDecoration _colorGradiente() => const BoxDecoration(

    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ]
    )

  );
}

class _Circulo extends StatelessWidget {
  const _Circulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}