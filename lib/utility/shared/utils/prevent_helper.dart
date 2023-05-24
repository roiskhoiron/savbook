class Prevent {
  static final Prevent _instance = Prevent._init();

  factory Prevent() => _instance;

  int lastExecute = 0;

  Prevent._init();

  static bool multiSubmit({int intervalMs = 500}) {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - _instance.lastExecute < intervalMs) {
      return true;
    }
    _instance.lastExecute = now;
    return false;
  }
}
