import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/domain/entity/po/po_detail_entity.dart';

abstract class PoDetailRepository {
  Future<Result<PoDetailEntity>> fetchPoCollected();
}
