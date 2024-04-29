import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'extras_group_details_state.freezed.dart';

@freezed
class ExtrasGroupDetailsState with _$ExtrasGroupDetailsState {
  const factory ExtrasGroupDetailsState({
    @Default(false) bool isLoading,
    @Default([]) List<Extras> extras,
  }) = _ExtrasGroupDetailsState;

  const ExtrasGroupDetailsState._();
}
