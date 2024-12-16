import 'package:carrinton_app/di/di.dart';
import 'package:carrinton_app/domain/entity/po/po_list_entity.dart';
import 'package:carrinton_app/domain/usecase/po/po_list_usecase.dart';

import 'package:carrinton_app/presentation/ui/home/viewmodel/po_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final poListViewModelProvider =
StateNotifierProvider<PoListViewModel, AsyncValue<PoListEntity?>>((ref) {
  final useCase = getIt<PoListUseCase>();

  return PoListViewModel(PoListUseCase: useCase);
});