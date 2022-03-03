import 'package:flt_login/models/models.dart';
import 'package:flutter/material.dart';

class ProductFormProvider extends ChangeNotifier {

  GlobalKey <FormState> formKey = GlobalKey();

  Product product;

  ProductFormProvider( this.product );

  bool isValidForm(){
    
    return formKey.currentState?.validate() ?? false;
  }

}