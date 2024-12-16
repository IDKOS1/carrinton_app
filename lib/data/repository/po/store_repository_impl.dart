import 'package:carrinton_app/data/models/collect_info_model.dart';
import 'package:carrinton_app/data/source/test/request/collect_info/local_collect_info_data_source.dart';
import 'package:carrinton_app/domain/entity/collect_info/collect_info_entity.dart';
import 'package:carrinton_app/domain/repository/collect_info/collect_info_repository.dart';
import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/core/error/failures.dart';

class CollectInfoRepositoryImpl implements CollectInfoRepository {
  final CollectInfoRequest localDataSource;

  CollectInfoRepositoryImpl({required this.localDataSource});

  @override
  Future<Result<CollectInfoEntity>> fetchCollectInfo() async {
    try {
      final dataMap = await localDataSource.getCollectInfo();
      final model = CollectInfoModel.fromJson(dataMap);

      return Success(model.toEntity());
    } catch (e) {
      // 에러 발생 시 Failure를 담아 반환
      return Error(DataSourceFailure('Failed to fetch collect info: $e'));
    }
  }
}
