import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'chat_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(true) bool isLoading,
    @Default(false) bool isButtonLoading,
    @Default(true) bool isMessageLoading,
    @Default(null) ChatModel? chatModel,
    @Default([]) List<ChatModel> chatList,
  }) = _MainState;

  const MainState._();
}
