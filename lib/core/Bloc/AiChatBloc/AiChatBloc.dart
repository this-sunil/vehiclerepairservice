import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/AiMessage.dart';
import '../../Services/GeminiChatService.dart';
import 'AiChatEvent.dart';
import 'AiChatState.dart';

class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  AiChatBloc({GeminiChatService? service})
      : _service = service ?? GeminiChatService(),
        super(const AiChatState()) {
    on<AiChatStarted>(_onStarted);
    on<AiChatMessageSent>(_onSent);
    on<AiChatCleared>(_onCleared);
  }

  final GeminiChatService _service;

  Future<void> _onStarted(
    AiChatStarted event,
    Emitter<AiChatState> emit,
  ) async {
    emit(state.copyWith(status: AiChatStatus.connecting, clearError: true));
    try {
      await _service.warmUp();
      emit(state.copyWith(status: AiChatStatus.idle));
    } catch (error) {
      emit(
        state.copyWith(
          status: AiChatStatus.idle,
          error: 'Could not reach the assistant service: $error',
        ),
      );
    }
  }

  Future<void> _onSent(
    AiChatMessageSent event,
    Emitter<AiChatState> emit,
  ) async {
    final text = event.text.trim();
    if (text.isEmpty || state.isBusy) return;

    final withUser = [...state.messages, AiMessage(role: 'user', text: text)];
    emit(
      state.copyWith(
        messages: withUser,
        status: AiChatStatus.thinking,
        clearError: true,
      ),
    );

    try {
      final reply = await _service.send(
        history: state.messages,
        message: text,
      );
      emit(
        state.copyWith(
          messages: [...withUser, AiMessage(role: 'model', text: reply)],
          status: AiChatStatus.idle,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          messages: [
            ...withUser,
            AiMessage(
              role: 'model',
              text: 'Sorry, something went wrong.\n$error',
              isError: true,
            ),
          ],
          status: AiChatStatus.idle,
          error: '$error',
        ),
      );
    }
  }

  void _onCleared(AiChatCleared event, Emitter<AiChatState> emit) {
    emit(const AiChatState());
  }
}
