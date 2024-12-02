class StoreInfo {
  final String title;
  final String location;
  final String number;
  final String operatingTime;
  final double distance;
  final String storeImage;

  StoreInfo._(
      {required this.title,
      required this.location,
      required this.number,
      required this.operatingTime,
      required this.distance,
      required this.storeImage});

  factory StoreInfo.fromJson(Map<String, dynamic> json) {
    return StoreInfo._(
      title: json['title'] as String,
      location: json['location'] as String,
      number: json['number'] as String,
      operatingTime: json['operatingTime'] as String,
      distance: (json['distance']) as double,
      storeImage: json['storeImage'] as String, // 추가된 필드
    );
  }
}
