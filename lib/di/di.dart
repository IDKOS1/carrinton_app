import 'package:carrinton_app/data/source/test/request/collect_info/local_collect_info_data_source.dart';
import 'package:carrinton_app/data/source/test/request/store/local_po_list_data_source.dart';
import 'package:carrinton_app/domain/repository/Po/po_list_repository.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:carrinton_app/domain/usecase/collect_info/collect_info_usecase.dart';
import 'package:carrinton_app/domain/repository/collect_info/collect_info_repository.dart';
import 'package:carrinton_app/data/repository/collect_info/collect_info_repository_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // DataSource 등록
  getIt.registerLazySingleton<CollectInfoRequest>(
      () => LocalCollectInfoDataSource(assetBundle: rootBundle));
  getIt.registerLazySingleton<PoListRequest>(
      () => LocalPoListDataSource(assetBundle: rootBundle));

  // Repository 등록
  getIt.registerLazySingleton<CollectInfoRepository>(
      () => CollectInfoRepositoryImpl(
            localDataSource: getIt<CollectInfoRequest>(),
          ));
  getIt.registerLazySingleton<PoListRequest>(
      () => PoListRepositoryImpl
  )

  // UseCase 등록
  getIt.registerLazySingleton(() => CollectInfoUseCase(
        repository: getIt<CollectInfoRepository>(),
      ));
}
