import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/domain/entity/po/po_list_entity.dart';
import 'package:carrinton_app/domain/usecase/po/po_list_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class PoListViewModel extends StateNotifier<AsyncValue<PoListEntity>> {
  final PoListUseCase _poListUseCase;

  PoListViewModel({required PoListUseCase poListUseCase})
      : _poListUseCase = poListUseCase,
        super(const AsyncValue.loading()) {
    logger.d('PoListViewModel 생성');
    fetchCollectInfo();
  }

  Future<void> fetchCollectInfo() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await _poListUseCase.call();
      return result is Success<PoListEntity>
          ? result.data // 성공 상태의 데이터를 반환
          : throw (result as Error<PoListEntity>).exception; // 실패 상태에서 예외를 던짐
    });
  }
}
