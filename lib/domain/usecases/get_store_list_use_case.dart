import 'package:carrinton_app/domain/entities/store_info_entities/store_list_entity.dart';
import 'package:carrinton_app/domain/repositories/store_repository.dart';

class GetStoreListUseCase {
  final StoreRepository repository;

  GetStoreListUseCase(this.repository);

  Future<List<StoreListEntity>> execute() {
    return repository.getStoreList();
  }
}
