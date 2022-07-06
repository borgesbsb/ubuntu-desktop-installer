import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Exposes a [future] that completes when a platform event named [name] is set.
class NamedEvent {
  /// The event name as known by the platform, UTF-8 encoded.
  String name;
  final _completer = Completer<void>();

  /// Completes when the platform event is set.
  Future<void> get future => _completer.future;
  NamedEvent(this.name) {
    _NamedEventSingleton.instance.addListenerFor(
      name: name,
      listener: _completer.complete,
    );
  }
}

@visibleForTesting
class NamedEventConstants {
  static const channel = 'ubuntuWslSetupChannel';
  static const onEventSet = 'onEventSet';
  static const addListenerFor = 'addListenerFor';
  static const argKey = 'eventName';
}

class _NamedEventSingleton {
  _NamedEventSingleton._() {
    _channel.setMethodCallHandler(_methodCallHandler);
  }

  /// The shared instance of [_NamedEventSingleton].
  static final _NamedEventSingleton instance = _NamedEventSingleton._();

  final MethodChannel _channel =
      const MethodChannel(NamedEventConstants.channel);

  Future<void> _methodCallHandler(MethodCall call) async {
    if (call.method == NamedEventConstants.onEventSet) {
      String eventName = call.arguments[NamedEventConstants.argKey];
      _listeners[eventName]?.call();
    } else {
      throw UnimplementedError();
    }
  }

  void addListenerFor({
    required String name,
    required void Function() listener,
  }) {
    if (_listeners.containsKey(name)) {
      throw ArgumentError('Cannot listen to the same event "$name" twice');
    }
    _channel.invokeMethod(NamedEventConstants.addListenerFor, name);
    _listeners[name] = listener;
  }

  final _listeners = HashMap<String, void Function()>();
}
