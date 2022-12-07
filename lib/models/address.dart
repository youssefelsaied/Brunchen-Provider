class Address {
  final int id;
  final String title;
  final double latitude;
  final double longitude;
  final String address;
  final int cityId;
  final String cityTitle;
  final int areaId;
  final String areaTitle;
  final bool aDefault;
  Address({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.cityId,
    required this.cityTitle,
    required this.areaId,
    required this.areaTitle,
    required this.aDefault,
  });
}
