import 'package:admin/data/models/success_model.dart';
import 'package:admin/data/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  UserRepository _deleteRepository = new UserRepository();
  DeleteCubit() : super(DeleteInitial());
  void delete(
      {required String token,
      required String close,
      required String delete}) async {
    emit(DeleteLoading());
    SuccessModel _success = await _deleteRepository.delete(
        token: token, close: close, delete: delete);
    if (_success.success == 0) {
      return emit(DeleteError(message: _success.message!));
    }
    emit(DeleteSuccess(message: _success.message!));
  }

  @override
  void onChange(Change<DeleteState> change) {
    print("Current ${change.currentState} next ${change.nextState}");
    super.onChange(change);
  }
}
