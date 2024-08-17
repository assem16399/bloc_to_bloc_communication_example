import '../data_sources/feature_one_local_data_source.dart';

abstract class FeatureOneRepo {
  Future<List<String>> getFeatureOneData();
}

class FeatureOneRepoImpl implements FeatureOneRepo {
  final FeatureOneLocalDataSource _localDataSource;

  FeatureOneRepoImpl(this._localDataSource);

  @override
  Future<List<String>> getFeatureOneData() {
    return _localDataSource.getFeatureOneData();
  }
}
