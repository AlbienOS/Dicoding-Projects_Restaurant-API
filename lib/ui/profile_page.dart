import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  static const routeName = '/profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 190.0,
              height: 190.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://i.imgur.com/BoN9kdC.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Albien Oktavius Sutedja', textScaleFactor: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}