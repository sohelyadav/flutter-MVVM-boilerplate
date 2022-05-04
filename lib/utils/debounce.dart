import 'dart:async';
import 'dart:ffi';
import 'dart:ui';

class PDebounce {
  final int milliseconds;
  //final VoidCallback action = Void();
  Timer? _timer;

  PDebounce({this.milliseconds = 300});

  run(VoidCallback action) {
    _timer?.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
