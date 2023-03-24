class Area {
  static double get pi => 3.141592;

  double circle(double radius) {
    return pi * radius.square;
  }
}

extension NumSquare on num {
  num get square => this * this;
}