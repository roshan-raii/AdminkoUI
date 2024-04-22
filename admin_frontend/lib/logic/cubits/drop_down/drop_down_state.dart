import 'package:equatable/equatable.dart';

class DropDownValueState extends Equatable {
  List? items = [];
  String? value;

  DropDownValueState({this.items, this.value});

  DropDownValueState copyWith({List<String?>? items, String? value}) {
    return DropDownValueState(value: value ?? this.value);
  }

  List<Object> get props {
    if (this.value != null) {
      return [this.value!, this.items!];
    }
    if (this.items != [] && this.items != null) {
      return [this.items!];
    }
    return [];
  }
}
