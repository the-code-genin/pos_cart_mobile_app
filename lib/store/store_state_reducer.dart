import 'store_state_reducer_action.dart';

/// Store State Reducer.
class StoreStateReducer<T extends dynamic> {
  StoreStateReducerAction action;
  T payload;

  StoreStateReducer({this.action, this.payload});
}