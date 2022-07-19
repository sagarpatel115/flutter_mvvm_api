import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils
{

  static  toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }

  static snackBar(String message,BuildContext context){
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message)
          ));
  }

}