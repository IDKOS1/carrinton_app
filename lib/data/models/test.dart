import 'package:freezed_annotation/freezed_annotation.dart';

part 'test.freezed.dart';

part 'test.g.dart';

@freezed
class Test with _$Test {
  const factory Test({
    required int totalCollect,
    required int collected,
    required int pending,
    required int jerryCan,
    required double canWeight,
    required double moveDistance,
  }) = _Test;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
}
