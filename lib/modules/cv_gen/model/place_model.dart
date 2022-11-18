class Place {
  String? village;
  String? commune;
  String? district;
  String? province;
  String? country;
  Place({
    this.village,
    this.commune,
    this.district,
    this.province,
    this.country,
  });

  String _check(String? str) => str != null && str.isNotEmpty ? '$str ' : '';

  String get location =>
      _check(village) +
      _check(commune) +
      _check(district) +
      _check(province) +
      _check(country);
}
