class PoDetailInfo {
  final int PoId;
  final String title;
  final String location;
  final String number;
  final double price;
  final DateTime lastVisit; // Non-nullable 유지
  final List<String> ownCan;
  final String PoImage;

  PoDetailInfo._({
    required this.PoId,
    required this.title,
    required this.location,
    required this.number,
    required this.price,
    required this.lastVisit, // 기본값 보장
    required this.ownCan,
    required this.PoImage,
  });

  factory PoDetailInfo.fromJson(Map<String, dynamic> json) {
    return PoDetailInfo._(
      PoId: json['PoId'] as int? ?? 0,
      title: json['title'] as String? ?? 'NO DATA',
      location: json['location'] as String? ?? 'Unknown',
      number: json['number'] as String? ?? 'No Number',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      lastVisit: json['lastVisit'] != null
          ? DateTime.parse(json['lastVisit'] as String)
          : DateTime(0000, 0, 0), // 기본값 설정
      ownCan: (json['ownCan'] as List<dynamic>?)?.cast<String>() ?? [],
      PoImage: json['PoImage'] as String? ?? '',
    );
  }
}
