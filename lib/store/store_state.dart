import 'store_state_data.dart';
import 'store_state_reducer_action.dart';
import 'store_state_reducer_function.dart';
import 'store_state_reducer.dart';

/// The store state object contains the store state data, a map of store state reducers and store state data getters.
class StoreState {
  /// Data.
  final StoreStateData _data = StoreStateData();

  /// Reducers.
  final Map<StoreStateReducerAction, StoreStateReducerFunction> _reducers = {};

  /// Getters
  String get appName => _data.appName;

  StoreState({appName}) {
    // Initial data mapping.
    _data.appName = appName;
  }

  /// Find and apply the Store State Reducer Function for the Store State Reducer passed to this method.
  void applyStoreStateReducer(StoreStateReducer reducer) {
    // Ensure that the reducer's action has a corresponding reducer function.
    if (!_reducers.containsKey(reducer.action)) throw 'Store State Reducer Action not found.';

    // Get the reducer function
    var reducerFunction = _reducers[reducer.action];

    // Apply the reducer function.
    reducerFunction(_data, payload: reducer.payload);
  }
}
