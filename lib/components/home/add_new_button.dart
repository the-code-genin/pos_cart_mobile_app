import 'package:flutter/material.dart';

class HomeAddNewButton extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(buildContext, '/add-new-cart-item');
      },
      padding: EdgeInsets.all(8),
      color: Theme.of(buildContext).primaryColor,
      child: Text(
        'Add Item',
        style: TextStyle(
          color: Theme.of(buildContext).accentColor,
        ),
        textScaleFactor: 1.25,
      ),
    );
  }
}
