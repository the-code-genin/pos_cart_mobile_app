import 'package:flutter/material.dart';

class CartItemEditorAppBar extends AppBar {
  CartItemEditorAppBar({Key key, String title, VoidCallback onBackPressed})
      : super(
          key: key,
          title: Text(title),
          leading: IconButton(
            onPressed: onBackPressed,
            icon: Icon(Icons.arrow_back_sharp),
          ),
        );
}
