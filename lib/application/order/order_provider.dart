import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_state.dart';
import 'order_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final orderProvider =
    StateNotifierProvider.autoDispose<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(ordersRepository),
);
