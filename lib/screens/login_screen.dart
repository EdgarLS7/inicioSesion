

import 'package:flt_login/providers/login_form_provider.dart';
import 'package:flt_login/ui/input_decorations.dart';
import 'package:flt_login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView (
          child: Column(
            children: [
              SizedBox( height: 235),
              
              CardContainer(
                child: Column(
                  children: [
                    // SizedBox(height: 10,),
                    Text('login', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 10,),

                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm(), 
                    )
                  ],
                ),
              ),

              SizedBox( height:  50,),
              Text('Crear una nueva cuenta', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox( height: 150,)
            ],
          ),
        )
      ) 
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of(context)<LoginFormProvider>(context);

    return Container(
      child: Form(

        // key: ,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: Inputdecorations.authInputDecoration(
                hintText: 'ie@soluciones.com',
                labelText: 'Correo electronico',
                prefixIcon: Icons.alternate_email_rounded
              ),
              validator: ( value ) {

                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                
                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El dato ingresado no es un Correo';

              },
            ),

            SizedBox(height: 30,),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: Inputdecorations.authInputDecoration(
                hintText: '****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              validator: ( value ) {

                return (value != null && value.length == 6) 
                ? null
                : 'La contraseña debe de ser de 6 caracteres';
                
              },
            ),

            SizedBox(height: 30,),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 70, vertical: 15),
                child: Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {},
            
            )

          ],
        ),
      ),
    );
  }
}

