import 'package:carrinton_app/domain/entities/store_info_entities/store_detail_entity.dart';
import 'package:carrinton_app/domain/repositories/store_repository.dart';

class GetStoreDetailUseCase {
  final StoreRepository repository;

  GetStoreDetailUseCase(this.repository);

  Future<StoreDetailEntity> execute(int storeId) {
    return repository.getStoreDetail(storeId);
  }
}
