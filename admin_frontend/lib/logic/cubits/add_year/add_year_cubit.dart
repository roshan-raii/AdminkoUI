import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_year_state.dart';

class AddYearCubit extends Cubit<AddYearState> {
  YearRepository _yearRepository = new YearRepository();
  AddYearCubit() : super(AddYearInitial());
  void addYear({required String token, required String name}) async {
    emit(AddYearLoading());
    SuccessModel successModel =
        await _yearRepository.addYear(token: token, name: name);
    if (successModel.success == 0) {
      return emit(AddYearError(message: successModel.message!));
    }
    emit(AddYearSuccess(message: successModel.message!));
  }

  @override
  void onChange(Change<AddYearState> change) {
    print("Current state ${change.currentState} Next:${change.nextState}");
    // TODO: implement onChange
    super.onChange(change);
  }
}
