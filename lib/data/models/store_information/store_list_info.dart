class PoListInfo {
  final int PoId;
  final String title;
  final String location;
  final String number;
  final String operatingTime;
  final double distance;
  final String PoImage;

  PoListInfo._(
      {required this.PoId,
        required this.title,
        required this.location,
        required this.number,
        required this.operatingTime,
        required this.distance,
        required this.PoImage,});

  factory PoListInfo.fromJson(Map<String, dynamic> json) {
    return PoListInfo._(
      PoId: json['PoId'] as int,
      title: json['title'] as String,
      location: json['location'] as String,
      number: json['number'] as String,
      operatingTime: json['operatingTime'] as String,
      distance: json['distance'] as double,
      PoImage: json['PoImage'] as String,
    );
  }
}
