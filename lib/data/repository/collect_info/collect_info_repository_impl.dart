import 'package:carrinton_app/data/dto/collect_info/collect_info_mapper.dart';
import 'package:carrinton_app/data/models/collect_info/collect_info_model.dart';
import 'package:carrinton_app/data/source/test/request/collect_info/local_collect_info_data_source.dart';
import 'package:carrinton_app/domain/entity/collect_info/collect_info_entity.dart';
import 'package:carrinton_app/domain/repository/collect_info/collect_info_repository.dart';
import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/core/error/failures.dart';
import 'package:logger/logger.dart';


class CollectInfoRepositoryImpl implements CollectInfoRepository {
  var logger = Logger();
  final CollectInfoRequest localDataSource;

  CollectInfoRepositoryImpl({required this.localDataSource});

  @override
  Future<Result<CollectInfoEntity>> fetchCollectInfo() async {
    logger.d('CollectInfoRepositoryImpl fetchCollectInfo 시작');
    try {
      final dataMap = await localDataSource.getCollectInfo();
      final model = CollectInfoModel.fromJson(dataMap);
      return Success(CollectInfoMapper.toEntity(model));
    } on FormatException catch (e) {
      logger.d('Format 에러');
      return Error(DataSourceFailure('Data format error: $e'));
    } on Exception catch (e) {
      logger.d('Exception 에러');
      return Error(DataSourceFailure('Failed to fetch collect info: $e'));
    }
  }
}
