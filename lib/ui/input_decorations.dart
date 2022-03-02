import 'package:flutter/material.dart';

class Inputdecorations {

  static InputDecoration authInputDecoration ({
    required String hintText,
    required String labelText, 
    IconData? prefixIcon

  }) {

    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2.5
          )
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey
        ),
        
        //Ternario
        prefixIcon: prefixIcon != null 
          ? Icon(prefixIcon, color: Colors.deepPurple,)
          : null
    );
  }

}