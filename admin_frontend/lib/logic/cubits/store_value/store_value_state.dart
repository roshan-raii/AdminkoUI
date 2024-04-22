part of 'store_value_cubit.dart';

@immutable
class StoreValueState extends Equatable {
  String? message;

  StoreValueState({this.message});

  @override
  // TODO: implement props
  List<Object?> get props {
    if (this.message != null) {
      return [this.message];
    }
    return [];
  }
}
