import 'package:carrinton_app/domain/entity/collect_info/collect_info_entity.dart';
import 'package:carrinton_app/domain/repository/collect_info/collect_info_repository.dart';
import 'package:carrinton_app/core/result.dart';
import 'package:logger/logger.dart';

class CollectInfoUseCase {
  final CollectInfoRepository repository;
  var logger = Logger();

  CollectInfoUseCase({required this.repository});

  Future<Result<CollectInfoEntity>> call() async {
    logger.d('CollectInfoUseCase call 시작');
    final result = await repository.fetchCollectInfo();
    logger.d("CollectInfoUseCase call 완료 $result");
    return result;
  }
}
