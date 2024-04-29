import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'extras_state.freezed.dart';

@freezed
class ExtrasState with _$ExtrasState {
  const factory ExtrasState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default([]) List<Group> groups,
  }) = _ExtrasState;

  const ExtrasState._();
}
