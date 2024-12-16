import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/domain/entity/po/po_list_entity.dart';


abstract class PoListRepository {
  Future<Result<PoListEntity>> fetchPoList();
}