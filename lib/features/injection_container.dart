import 'package:get_it/get_it.dart' as sl;

import '/features/feature_one/data/data_sources/feature_one_local_data_source.dart';
import 'feature_one/data/repos/feature_one_repo_impl.dart';
import 'feature_one/presentation/cubit/feature_one_cubit.dart';
import 'feature_two/data/data_sources/feature_two_local_data_source.dart';
import 'feature_two/data/repos/feature_two_repo_impl.dart';
import 'feature_two/presentation/cubit/feature_two_cubit.dart';

final mainSL = sl.GetIt.instance;

void init() {
  // Register LocalDataSource
  mainSL.registerLazySingleton<FeatureOneLocalDataSource>(
      () => FeatureOneLocalDataSourceImpl());

  mainSL.registerLazySingleton<FeatureTwoLocalDataSource>(
      () => FeatureTwoLocalDataSourceImpl());

  // Register Repos
  mainSL.registerLazySingleton<FeatureOneRepo>(
      () => FeatureOneRepoImpl(mainSL()));

  mainSL.registerLazySingleton<FeatureTwoRepo>(
      () => FeatureTwoRepoImpl(mainSL()));

  // Register Cubits
  mainSL.registerFactory(() => FeatureOneCubit(mainSL(), mainSL()));

  mainSL.registerFactory(() => FeatureTwoCubit(mainSL()));
}
