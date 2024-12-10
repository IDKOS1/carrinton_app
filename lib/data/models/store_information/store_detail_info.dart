class StoreDetailInfo {
  final int storeId;
  final String title;
  final String location;
  final String number;
  final double price;
  final DateTime lastVisit; // Non-nullable 유지
  final List<String> ownCan;
  final String storeImage;

  StoreDetailInfo._({
    required this.storeId,
    required this.title,
    required this.location,
    required this.number,
    required this.price,
    required this.lastVisit, // 기본값 보장
    required this.ownCan,
    required this.storeImage,
  });

  factory StoreDetailInfo.fromJson(Map<String, dynamic> json) {
    return StoreDetailInfo._(
      storeId: json['storeId'] as int? ?? 0,
      title: json['title'] as String? ?? 'NO DATA',
      location: json['location'] as String? ?? 'Unknown',
      number: json['number'] as String? ?? 'No Number',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      lastVisit: json['lastVisit'] != null
          ? DateTime.parse(json['lastVisit'] as String)
          : DateTime(0000, 0, 0), // 기본값 설정
      ownCan: (json['ownCan'] as List<dynamic>?)?.cast<String>() ?? [],
      storeImage: json['storeImage'] as String? ?? '',
    );
  }
}
