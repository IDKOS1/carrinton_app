import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/domain/entity/po/po_detail_entity.dart';
import 'package:carrinton_app/domain/repository/po/po_detail_repository.dart';


class PoDetailUseCase {
  final PoDetailRepository repository;

  PoDetailUseCase({required this.repository});

  Future<Result<PoDetailEntity>> call() async {
    return await repository.fetchPoCollected();
  }
}