import 'package:admin/data/data_exports.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_sections_state.dart';

class FetchSectionsCubit extends Cubit<FetchSectionsState> {
  SectionRepository _repository = new SectionRepository();
  FetchSectionsCubit() : super(FetchSectionsInitial());
  void fetchSections({required String token}) async {
    emit(FetchSectionsLoading());
    List<SectionModel> sections = await _repository.getSections(token: token);
    if (sections.length == 0) {
      return emit(FetchSectionsSuccess(sections: []));
    }
    if (sections[0].error != null) {
      return emit(FetchSectionsError(message: sections[0].error!));
    }
    return emit(FetchSectionsSuccess(sections: sections));
  }

  @override
  void onChange(Change<FetchSectionsState> change) {
    print("C: ${change.currentState} N: ${change.nextState}");
    super.onChange(change);
  }
}
