import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_year_sections_state.dart';

class FetchYearSectionsCubit extends Cubit<FetchYearSectionsState> {
  RoutineRepository _repository = new RoutineRepository();
  FetchYearSectionsCubit() : super(FetchYearSectionsInitial());

  void fetchYearSections({required String token}) async {
    emit(FetchYearSectionsLoading());
    final SuccessModel successModel =
        await _repository.getYearSection(token: token);
    if (successModel.success == 0) {
      return emit(FetchYearSectionsError(message: successModel.message!));
    }
    YearSectionModel yearSectionModel =
        YearSectionModel.fromMap(successModel.data!);
    return emit(FetchYearSectionsSuccess(yearSections: yearSectionModel));
  }

  @override
  void onChange(Change<FetchYearSectionsState> change) {
    print("Current ${change.currentState} next ${change.nextState}");
    super.onChange(change);
  }
}
