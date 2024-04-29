import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    @Default(false) bool paymentType,
    @Default(false) bool isLoading,
    @Default([]) List<OrderData> orders,
    @Default(0) int totalCount,
    @Default(0) int deliveryTime,
    @Default(0) int deliveryType,
  }) = _OrdrState;

  const OrderState._();
}
