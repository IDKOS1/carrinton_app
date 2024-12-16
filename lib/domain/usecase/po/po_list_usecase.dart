import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/domain/entity/po/po_list_entity.dart';
import 'package:carrinton_app/domain/repository/po/po_list_repository.dart';

class PoListUseCase {
  final PoListRepository repository;

  PoListUseCase({required this.repository});

  Future<Result<PoListEntity>> call() async {
    return await repository.fetchPoList();
  }
}
