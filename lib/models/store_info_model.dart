class StoreInfo {
  final int storeId;
  final String title;
  final String location;
  final String number;
  final String operatingTime;
  final double distance;
  final String storeImage;
  final int price;

  StoreInfo._(
      {required this.storeId,
      required this.title,
      required this.location,
      required this.number,
      required this.operatingTime,
      required this.distance,
      required this.storeImage,
      required this.price});

  factory StoreInfo.fromJson(Map<String, dynamic> json) {
    return StoreInfo._(
      storeId: json['storeId'] as int ?? 0,
      title: json['title'] as String ?? 'NO DATA',
      location: json['location'] as String,
      number: json['number'] as String,
      operatingTime: json['operatingTime'] as String,
      distance: (json['distance']) as double,
      storeImage: json['storeImage'] as String,
      price: json['price'] as int ?? 0,
    );
  }
}
