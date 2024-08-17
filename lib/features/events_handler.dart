import 'dart:async';

import 'package:bloc_to_bloc_communication_example/features/injection_container.dart';
import 'package:event_bus/event_bus.dart';

mixin EventBusMixin {
  StreamSubscription<T> listenEvent<T>(void Function(T) onData,
      {Function? onError}) {
    return mainSL<EventBus>().on<T>().listen(onData, onError: onError);
  }

  void shareEvent<S>(S event) => mainSL<EventBus>().fire(event);
}
