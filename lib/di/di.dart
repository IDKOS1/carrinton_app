import 'package:carrinton_app/data/repository/po/po_list_repository_impl.dart';
import 'package:carrinton_app/data/source/test/request/collect_info/local_collect_info_data_source.dart';
import 'package:carrinton_app/data/source/test/request/po/local_po_list_data_source.dart';
import 'package:carrinton_app/domain/usecase/po/po_list_usecase.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:carrinton_app/domain/usecase/collect_info/collect_info_usecase.dart';
import 'package:carrinton_app/domain/repository/collect_info/collect_info_repository.dart';
import 'package:carrinton_app/data/repository/collect_info/collect_info_repository_impl.dart';

import '../domain/repository/po/po_list_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // DataSource 등록
  getIt.registerLazySingleton<CollectInfoRequest>(
      () => CollectInfoRequest(assetBundle: rootBundle));
  getIt.registerLazySingleton<PoListRequest>(
      () => PoListRequest(assetBundle: rootBundle));

  // Repository 등록
  getIt.registerLazySingleton<CollectInfoRepository>(
      () => CollectInfoRepositoryImpl(
            localDataSource: getIt<CollectInfoRequest>(),
          ));
  getIt.registerLazySingleton<PoListRepository>(() => PoListRepositoryImpl(
        localDataSource: getIt<PoListRequest>(),
      ));

  // UseCase 등록
  getIt.registerLazySingleton(() => CollectInfoUseCase(
        repository: getIt<CollectInfoRepository>(),
      ));
  getIt.registerLazySingleton(
      () => PoListUseCase(repository: getIt<PoListRepository>()));
}
