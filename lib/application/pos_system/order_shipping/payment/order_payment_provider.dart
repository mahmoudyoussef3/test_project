import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_payment_state.dart';
import 'order_payment_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final orderPaymentProvider =
    StateNotifierProvider<OrderPaymentNotifier, OrderPaymentState>(
  (ref) => OrderPaymentNotifier(
      ordersRepository, settingsRepository, paymentRepository),
);
