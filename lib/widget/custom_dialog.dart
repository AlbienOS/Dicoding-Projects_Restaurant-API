
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurant_api/common/navigation.dart';

customDialog(BuildContext context){
  if(Platform.isIOS){
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return CupertinoAlertDialog(
          title: Text('Coming Soon!'),
          content: Text('This feature will be coming soon!'),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: (){
                  Navigation.back();
                },
              ),
            ],
        );
      }
    );
  }else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Coming Soon!'),
          content: Text('This feature will be coming soon!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigation.back();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}