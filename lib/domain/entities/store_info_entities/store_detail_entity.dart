class StoreDetailEntity {
  final int storeId;
  final String title;
  final String location;
  final String number;
  final double price;
  final DateTime lastVisit; // Non-nullable 유지
  final List<String> ownCan;
  final String storeImage;

  StoreDetailEntity({
    required this.storeId,
    required this.title,
    required this.location,
    required this.number,
    required this.price,
    required this.lastVisit, // 기본값 보장
    required this.ownCan,
    required this.storeImage,
  });
}
