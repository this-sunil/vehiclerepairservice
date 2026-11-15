import 'package:equatable/equatable.dart';

/// One turn in the assistant conversation.
class AiMessage extends Equatable {
  const AiMessage({
    required this.role,
    required this.text,
    this.isError = false,
  });

  /// Gemini uses 'user' and 'model'.
  final String role;
  final String text;
  final bool isError;

  bool get isUser => role == 'user';

  @override
  List<Object?> get props => [role, text, isError];
}
