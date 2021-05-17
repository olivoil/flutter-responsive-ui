import 'package:bloc/bloc.dart';

/// [BlocObserver] to observe all [Bloc] state changes.
class CounterObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    // ignore: avoid_print
    print('${bloc.runtimeType} $transition');
  }
}
