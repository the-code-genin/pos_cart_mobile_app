import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/models/models.dart';
import 'package:pos_cart_mobile_app/components/components.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EditCartItemScreen extends StatefulWidget {
  _EditCartItemScreenState createState() => _EditCartItemScreenState();
}

class _EditCartItemScreenState extends State<EditCartItemScreen> {
  @override
  Widget build(BuildContext context) {
    var cartItemIndex = ModalRoute.of(context).settings.arguments as int;

    return StoreConnector<StoreState, CartItem>(
      converter: (store) => store.state.cartItems[cartItemIndex],
      builder: (context, cartItem) {
        return Scaffold(
          appBar: CartItemEditorAppBar(
            title: 'Edit Cart Item',
            onBackPressed: () {
              Navigator.pop(context);
            },
          ),
          body: StoreConnector<StoreState, VoidCallback>(
            converter: (state) {
              return () {
                state.dispatch(
                  StoreStateReducer(
                    action: StoreStateReducerAction.updateCartItem,
                    payload: <String, dynamic>{
                      'index': cartItemIndex,
                      'cartItem': cartItem,
                    },
                  ),
                );
                Navigator.pop(context);
              };
            },
            builder: (context, callback) {
              return CartItemEditor(
                cartItem: cartItem,
                saveButtonText: 'Update',
                onSave: () => callback(),
              );
            },
          ),
        );
      },
    );
  }
}
