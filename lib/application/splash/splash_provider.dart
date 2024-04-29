import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'splash_state.dart';
import 'splash_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final splashProvider =
    StateNotifierProvider.autoDispose<SplashNotifier, SplashState>(
  (ref) => SplashNotifier(settingsRepository, usersRepository),
);
