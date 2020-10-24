import 'store_state_data.dart';
import 'store_state_reducer_action.dart';
import 'store_state_reducer_function.dart';
import 'store_state_reducer.dart';
import 'package:meta/meta.dart';
import 'package:pos_cart_mobile_app/models/models.dart';

/// The store state object contains the store state data, a map of store state reducers and store state data getters.
class StoreState {
  /// Data.
  final StoreStateData _data = StoreStateData();

  /// Reducers.
  final Map<StoreStateReducerAction, StoreStateReducerFunction> _reducers = {
    // Add new cart item
    StoreStateReducerAction.addCartItem: (data, {payload}) {
      data.cartItems.add(CartItem());
    },

    // Remove cart item
    StoreStateReducerAction.removeCartItem: (data, {payload}) {
      if (payload.runtimeType != CartItem) return;

      data.cartItems.remove(payload);
    },

    // clear the cart
    StoreStateReducerAction.clearCartItem: (data, {payload}) {
      data.cartItems.removeRange(0, data.cartItems.length);
    }
  };

  /// Getters
  String get appName => _data.appName;
  List<CartItem> get cartItems => _data.cartItems;

  StoreState({@required String appName}) {
    // Initial data mapping.
    _data.appName = appName;
  }

  /// Find and apply the Store State Reducer Function for the Store State Reducer passed to this method.
  void applyStoreStateReducer(StoreStateReducer reducer) {
    // Ensure that the reducer's action has a corresponding reducer function.
    if (!_reducers.containsKey(reducer.action))
      throw 'Store State Reducer Action not found.';

    // Get the reducer function
    var reducerFunction = _reducers[reducer.action];

    // Apply the reducer function.
    reducerFunction(_data, payload: reducer.payload);
  }
}
