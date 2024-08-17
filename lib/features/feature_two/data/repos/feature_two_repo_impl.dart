import 'dart:async';

import '../data_sources/feature_two_local_data_source.dart';
import '../models/feature_two_data_model.dart';

abstract class FeatureTwoRepo {
  Future<FeatureTwoDataModel> getFeatureTwoData();

  Stream<List<String>> get broadcastFeatureOneData;
}

class FeatureTwoRepoImpl implements FeatureTwoRepo {
  final FeatureTwoLocalDataSource _localDataSource;
  late final StreamController<List<String>> _featureOneDataController;

  FeatureTwoRepoImpl(this._localDataSource) {
    _featureOneDataController = StreamController<List<String>>.broadcast();
  }

  @override
  Future<FeatureTwoDataModel> getFeatureTwoData() async {
    final data = await _localDataSource.getFeatureTwoData();

    _featureOneDataController.add(data.featureOneRelatedData);
    return data;
  }

  @override
  Stream<List<String>> get broadcastFeatureOneData {
    return _featureOneDataController.stream;
  }
}
