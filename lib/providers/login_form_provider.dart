import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey <FormState> formKey = GlobalKey();

  String email    = '';
  String password = '';

  bool isValidForm(){

    print( formKey.currentState?.validate());

    return formKey.currentState?.validate() ?? false; 
  }

}