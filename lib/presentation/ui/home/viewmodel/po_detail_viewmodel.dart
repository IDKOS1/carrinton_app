import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/domain/entity/po/po_detail_entity.dart';
import 'package:carrinton_app/domain/usecase/po/po_detail_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PoDetailViewmodel extends StateNotifier<AsyncValue<PoDetailEntity>> {
  final PoDetailUseCase _PoDetailUseCase;

  PoDetailViewmodel({required PoDetailUseCase PoDetailUseCase})
      : _PoDetailUseCase = PoDetailUseCase,
        super(const AsyncValue.loading());


  Future<void> fetchDetailInfo() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await _PoDetailUseCase.call();
      return result is Success<PoDetailEntity>
          ? result.data // 성공 상태의 데이터를 반환
          : throw (result as Error<PoDetailEntity>)
          .exception; // 실패 상태에서 예외를 던짐
    });
  }
}