class CollectInfo {
  final int total;
  final int collected;
  final int pending;
  final int jerryCan;
  final double canWeight;
  final double moveDistance;

  CollectInfo._({
    this.total = 0,
      this.collected = 0,
      this.pending = 0,
      this.jerryCan = 0,
      this.canWeight = 0.0,
      this.moveDistance = 0.0
  });

  factory CollectInfo.fromJson(Map<String, dynamic> json) {
    return CollectInfo._(
      total: json['total'] as int,
      collected: json['collected'] as int,
      pending: json['pending'] as int,
      jerryCan: json['jerryCan'] as int,
      canWeight: (json['canWeight']) as double,
      moveDistance: json['moveDistance'] as double,
    );
  }
}
