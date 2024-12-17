import 'package:carrinton_app/data/dto/po/po_list_mapper.dart';
import 'package:carrinton_app/data/models/po/po_list_model.dart';
import 'package:carrinton_app/data/source/test/request/po/local_po_list_data_source.dart';
import 'package:carrinton_app/domain/entity/po/po_list_entity.dart';

import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/core/error/failures.dart';
import 'package:carrinton_app/domain/repository/po/po_list_repository.dart';
import 'package:logger/logger.dart';

class PoListRepositoryImpl implements PoListRepository {
  var logger = Logger();
  final PoListRequest localDataSource;

  PoListRepositoryImpl({required this.localDataSource});

  @override
  Future<Result<PoListEntity>> fetchPoList() async {
    logger.d('PoListRepositoryImpl fetchPoList 시작');
    try {
      logger.d('PoListImpl try');
      final dataMap = await localDataSource.getPoList();
      logger.d('PoListImpl dataMap $dataMap');
      final model = PoListModel.fromJson(dataMap);
      logger.d('PoList 데이터 $model');
      return Success(PoListMapper.toEntity(model));
    } on FormatException catch (e) {
      logger.d('Format 에러');
      return Error(DataSourceFailure('Data format error: $e'));
    } on Exception catch (e) {
      logger.d('Exception 에러');
      return Error(DataSourceFailure('Failed to fetch collect info: $e'));
    }
  }
}
