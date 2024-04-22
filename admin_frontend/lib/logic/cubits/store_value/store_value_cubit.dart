import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'store_value_state.dart';

class StoreValueCubit extends Cubit<StoreValueState> {
  StoreValueCubit() : super(StoreValueState());
  void storeValue({required String value}) =>
      emit(StoreValueState(message: value));
  void clearValue() => emit(StoreValueState());
  @override
  void onChange(Change<StoreValueState> change) {
    print("Current ${change.currentState} Next ${change.nextState}");
    // TODO: implement onChange
    super.onChange(change);
  }
}
