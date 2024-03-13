import 'dart:async';
import 'package:get/get.dart';



class StopwatchController extends GetxController {
  final Stopwatch _stopwatch = Stopwatch();
  final RxString _elapsedTime = '00:00:00'.obs;
  final RxBool _isRunning = false.obs;
  late Timer _timer;

  String get elapsedTime => _elapsedTime.value;
  bool get isRunning => _isRunning.value;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      _updateTime();
    });
  }

  void _updateTime() {
    if (_stopwatch.isRunning) {
      final milliseconds = _stopwatch.elapsedMilliseconds;
      final hundreds = (milliseconds ~/ 10) % 100;
      final seconds = (milliseconds ~/ 1000) % 60;
      final minutes = (milliseconds ~/ (1000 * 60)) % 60;

      final minutesStr = minutes.toString().padLeft(2, '0');
      final secondsStr = seconds.toString().padLeft(2, '0');
      final hundredsStr = hundreds.toString().padLeft(2, '0');

      _elapsedTime.value = '$minutesStr:$secondsStr:$hundredsStr';
    }
  }

  void startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _isRunning.value = true;
    }
  }

  void pauseStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _isRunning.value = false;
    }
  }

  void resetStopwatch() {
    _stopwatch.reset();
    _elapsedTime.value = '00:00:00';
    // Only stop the stopwatch if it's currently running

    if (_stopwatch.isRunning) {
      _stopwatch.reset();
      _isRunning.value = true;
    } else {
      _isRunning.value = false;
    }
    }
  }

