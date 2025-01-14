interface class NumberFormatHelper {
  // 숫자를 소수점 첫째 자리까지만 표시
  static String floatTrunk(double number) {
    if (number.toStringAsFixed(1).split('.')[1] == '0') {
      return number.toStringAsFixed(0);
    } else {
      return number.toStringAsFixed(1);
    }
  }

  // 1000단위로 콤마 찍기
  static String comma(int number) {
    return number.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
