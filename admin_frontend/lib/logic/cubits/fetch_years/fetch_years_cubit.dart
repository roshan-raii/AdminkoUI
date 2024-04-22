import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_years_state.dart';

class FetchYearsCubit extends Cubit<FetchYearsState> {
  YearRepository _yearRepository = new YearRepository();
  FetchYearsCubit() : super(FetchYearsInitial());
  void fetchYears({required String token}) async {
    emit(FetchYearsLoading());
    List<YearModel> _years = await _yearRepository.getYears(token: token);
    if (_years.length == 0) {
      return emit(FetchYearsSuccess(years: []));
    }
    if (_years[0].error != null) {
      return emit(FetchYearsError(_years[0].error!));
    }
    return emit(FetchYearsSuccess(years: _years));
  }

  @override
  void onChange(Change<FetchYearsState> change) {
    print("Current state ${change.currentState} next:${change.nextState}");
    super.onChange(change);
  }
}
