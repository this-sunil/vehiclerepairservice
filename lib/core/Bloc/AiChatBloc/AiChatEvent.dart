import 'package:equatable/equatable.dart';

sealed class AiChatEvent extends Equatable {
  const AiChatEvent();

  @override
  List<Object?> get props => const [];
}

/// Connect to MCP and load tools before the first message.
final class AiChatStarted extends AiChatEvent {
  const AiChatStarted();
}

final class AiChatMessageSent extends AiChatEvent {
  const AiChatMessageSent(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}

final class AiChatCleared extends AiChatEvent {
  const AiChatCleared();
}
