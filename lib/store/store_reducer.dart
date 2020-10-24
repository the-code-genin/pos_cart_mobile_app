import 'store_state_reducer.dart';
import 'store_state.dart';

/// Store Reducer.
class StoreReducer {
  StoreState call(StoreState state, dynamic reducer) {
    // Ensure reducer is of datatype StoreStateReducer.
    if (reducer.runtimeType != StoreStateReducer)
      throw 'Invalid or malformed Store State Reducer.';

    // Apply the Store State Reducer.
    state.applyStoreStateReducer(reducer as StoreStateReducer);

    // Return the updated state.
    return state;
  }
}
