import 'package:carrinton_app/presentation/ui/base/viewmodel/collect_info_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carrinton_app/domain/entity/collect_info/collect_info_entity.dart';
import 'package:carrinton_app/domain/usecase/collect_info/collect_info_usecase.dart';
import 'package:carrinton_app/di/di.dart';

final collectInfoViewModelProvider =
StateNotifierProvider<CollectInfoViewModel, AsyncValue<CollectInfoEntity?>>((ref) {
  final useCase = getIt<CollectInfoUseCase>();

  return CollectInfoViewModel(collectInfoUseCase: useCase);
});
