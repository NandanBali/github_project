class HelperFunctions {
  String iTok(int i) {
    double x;
    if (i > 1000000) {
      x = double.parse((i / 1000000).toStringAsFixed(1));
      return "${x}m";
    } else if (i > 1000 && i < 1000000) {
      x = double.parse((i / 1000).toStringAsFixed(1));
      return "${x}k";
    } else {
      x = double.parse(i.toStringAsFixed(0));
      return "$x";
    }
  }
}