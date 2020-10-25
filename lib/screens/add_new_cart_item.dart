import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/models/models.dart';
import 'package:pos_cart_mobile_app/components/components.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AddNewCartItemScreen extends StatefulWidget {
  _AddNewCartItemScreenState createState() => _AddNewCartItemScreenState();
}

class _AddNewCartItemScreenState extends State<AddNewCartItemScreen> {
  final CartItem _cartItem = CartItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartItemEditorAppBar(
        title: 'Add New Cart Item',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: StoreConnector<StoreState, VoidCallback>(
        converter: (state) {
          return () {
            state.dispatch(
              StoreStateReducer(
                action: StoreStateReducerAction.addCartItem,
                payload: _cartItem,
              ),
            );
            Navigator.pop(context);
          };
        },
        builder: (context, callback) {
          return CartItemEditor(
            cartItem: _cartItem,
            saveButtonText: 'Save',
            onSave: () => callback(),
          );
        },
      ),
    );
  }
}
