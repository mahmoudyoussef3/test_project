import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'new_orders_state.dart';
import 'new_orders_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final newOrdersProvider =
    StateNotifierProvider<NewOrdersNotifier, NewOrdersState>(
  (ref) => NewOrdersNotifier(ordersRepository),
);
