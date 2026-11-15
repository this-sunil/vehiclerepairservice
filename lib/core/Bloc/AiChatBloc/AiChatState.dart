import 'package:equatable/equatable.dart';

import '../../Models/AiMessage.dart';

enum AiChatStatus { idle, connecting, thinking }

class AiChatState extends Equatable {
  const AiChatState({
    this.messages = const [],
    this.status = AiChatStatus.idle,
    this.error,
  });

  final List<AiMessage> messages;
  final AiChatStatus status;
  final String? error;

  bool get isBusy => status != AiChatStatus.idle;

  AiChatState copyWith({
    List<AiMessage>? messages,
    AiChatStatus? status,
    String? error,
    bool clearError = false,
  }) {
    return AiChatState(
      messages: messages ?? this.messages,
      status: status ?? this.status,
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props => [messages, status, error];
}
