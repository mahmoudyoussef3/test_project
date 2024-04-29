import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'statistics_state.dart';
import 'statistics_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final statisticsProvider =
    StateNotifierProvider<StatisticsNotifier, StatisticsState>(
  (ref) => StatisticsNotifier(statisticsRepository),
);
