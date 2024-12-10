import 'package:carrinton_app/domain/entities/store_info_entities/store_detail_entity.dart';
import 'package:carrinton_app/domain/entities/store_info_entities/store_list_entity.dart';

abstract class StoreRepository {
  Future<List<StoreListEntity>> getStoreList();
  Future<StoreDetailEntity> getStoreDetail(int storeId);
}
