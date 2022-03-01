

import 'package:flt_login/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView (
          child: Column(
            children: [
              SizedBox( height: 225),
              
              CardContainer(
                child: Column(
                  children: [
                    // SizedBox(height: 10,),
                    Text('login', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 10,),

                    Text('formulario')
                  ],
                ),
              )
            ],
          ),
        )
      ) 
    );
  }
}

