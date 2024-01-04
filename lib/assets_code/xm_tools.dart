
extension StringTool on int {
  String get xmPlayPeriod {
    int hour = this ~/ 60;
    if (hour > 0) {
      return '${hour}hours${hour%60}mins.';
    }
    return '${this%60}mins.';
  }
}