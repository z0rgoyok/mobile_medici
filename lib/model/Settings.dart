import 'package:universal_platform/universal_platform.dart';

class CalcSettings {
  var maxTransits = 0;
  var threads = UniversalPlatform.isAndroid ? 3 : 5;
  var reverse = false;
  var balance = <int>[0, 0, 0, 0, 0, 0];
  var mirror = false;
  var onlyDifferentHexes = false;
  var showMobiles = false;

  bool isDefault() {
    return maxTransits == 0 &&
        threads == (UniversalPlatform.isAndroid ? 3 : 5) &&
        reverse == false &&
        balance.fold<int>(
                0, (previousValue, element) => previousValue + element) ==
            0 &&
        mirror == false &&
        onlyDifferentHexes == false &&
        showMobiles == false;
  }

  void setDefault() {
    maxTransits = 0;
    threads = 5;
    reverse = false;
    balance = [0, 0, 0, 0, 0, 0];
    mirror = false;
    onlyDifferentHexes = false;
    showMobiles = false;
  }
}
