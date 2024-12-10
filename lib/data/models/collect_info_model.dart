import 'package:carrinton_app/domain/entities/collect_info.dart';

class CollectInfoModel extends CollectInfo {
  CollectInfoModel({
    required super.total,
    required super.collected,
    required super.pending,
    required super.jerryCan,
    required super.canWeight,
    required super.moveDistance,
  });

  factory CollectInfoModel.fromJson(Map<String, dynamic> json) =>
      CollectInfoModel(
        total: json['total'] as int? ?? 0,
        collected: json['collected'] as int? ?? 0,
        pending: json['pending'] as int? ?? 0,
        jerryCan: json['jerryCan'] as int? ?? 0,
        canWeight: (json['canWeight'] as num?)?.toDouble() ?? 0.0,
        moveDistance: (json['moveDistance'] as num?)?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'collected': collected,
      'pending': pending,
      'jerryCan': jerryCan,
      'canWeight': canWeight,
      'moveDistance': moveDistance,
    };
  }
}
