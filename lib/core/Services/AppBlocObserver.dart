import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    print('Bloc Created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    print('Bloc Event: ${bloc.runtimeType} - $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    print(
      'Bloc Change: ${bloc.runtimeType}\n'
      'Current State: ${change.currentState}\n'
      'Next State: ${change.nextState}',
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    print(
      'Bloc Transition: ${bloc.runtimeType}\n'
      'Event: ${transition.event}\n'
      'Current State: ${transition.currentState}\n'
      'Next State: ${transition.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    print('Bloc Error: ${bloc.runtimeType}');
    print('Error: $error');
    print('StackTrace: $stackTrace');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    print('Bloc Closed: ${bloc.runtimeType}');
  }
}
