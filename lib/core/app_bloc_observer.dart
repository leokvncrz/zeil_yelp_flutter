import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.d(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    logger.d('Closing: ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
