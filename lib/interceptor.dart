class Injector {
  /*static final resolve = container.resolve;

  static void setup() {
    _common();
    switch (Environment.current.runtimeType) {
      case DevelopmentEnvironment:
        _development();
        break;
      case ProductionEnvironment:
        _production();
        break;
    }
  }*/

  static void _common() {
    // Put your common injections here
  }

  static void _development() {
    // Put your development specific injections here
  }

  static void _production() {
    // Put your production specific injections here
  }
}
