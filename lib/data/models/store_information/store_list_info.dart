class StoreListInfo {
  final int storeId;
  final String title;
  final String location;
  final String number;
  final String operatingTime;
  final double distance;
  final String storeImage;

  StoreListInfo._(
      {required this.storeId,
        required this.title,
        required this.location,
        required this.number,
        required this.operatingTime,
        required this.distance,
        required this.storeImage,});

  factory StoreListInfo.fromJson(Map<String, dynamic> json) {
    return StoreListInfo._(
      storeId: json['storeId'] as int,
      title: json['title'] as String,
      location: json['location'] as String,
      number: json['number'] as String,
      operatingTime: json['operatingTime'] as String,
      distance: json['distance'] as double,
      storeImage: json['storeImage'] as String,
    );
  }
}
