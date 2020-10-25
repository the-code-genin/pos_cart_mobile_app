import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/models/models.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CartItemTile extends StatelessWidget {
  final int _cartItemIndex;
  final CartItem _cartItem;

  CartItemTile({Key key, CartItem cartItem, int cartItemIndex})
      : _cartItem = cartItem,
        _cartItemIndex = cartItemIndex,
        super(key: key);

  Text _title() {
    if (_cartItem.name.length > 0) {
      return Text(
        _cartItem.name,
        softWrap: true,
        style: const TextStyle(
          fontSize: 18,
        ),
      );
    } else {
      return Text(
        'Click to edit item',
        softWrap: true,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[600],
        ),
      );
    }
  }

  Widget build(BuildContext buildContext) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(left: 10, right: 3, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    'N${_cartItem.price}  --  ${_cartItem.quantity} pcs',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          StoreConnector<StoreState, VoidCallback>(
            converter: (store) {
              return () {
                store.dispatch(
                  StoreStateReducer(
                    action: StoreStateReducerAction.removeCartItem,
                    payload: _cartItemIndex,
                  ),
                );
              };
            },
            builder: (buildContext, callback) {
              return IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                iconSize: 32,
                onPressed: callback,
              );
            },
          ),
        ],
      ),
    );
  }
}
