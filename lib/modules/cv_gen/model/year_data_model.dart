class YearData {
  String? start;
  String? end;
  String? data;
  int? age;
  YearData({
    this.start,
    this.end,
    this.data,
  });
  String get yearToyear => '$start - $end';
}
