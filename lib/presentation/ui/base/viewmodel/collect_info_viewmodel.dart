import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/domain/entity/collect_info/collect_info_entity.dart';
import 'package:carrinton_app/domain/usecase/collect_info/collect_info_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class CollectInfoViewModel
    extends StateNotifier<AsyncValue<CollectInfoEntity?>> {
  final CollectInfoUseCase _collectInfoUseCase;

  CollectInfoViewModel({required CollectInfoUseCase collectInfoUseCase})
      : _collectInfoUseCase = collectInfoUseCase,
        super(const AsyncValue.loading()) {
    logger.d('CollectInfoViewModel 생성');
    fetchCollectInfo();
  }

  Future<void> fetchCollectInfo() async {
    if (mounted) {
      logger.d('fetchCollectInfo 호출');
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        logger.d('fetchCollectInfo usecase 호출');
        final result = await _collectInfoUseCase.call();
        return result is Success<CollectInfoEntity>
            ? result.data
            : throw (result as Error<CollectInfoEntity>).exception;
      });
    }
  }
}
