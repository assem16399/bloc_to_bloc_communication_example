import 'dart:async';

import '../data_sources/feature_two_local_data_source.dart';
import '../models/feature_two_data_model.dart';

abstract class FeatureTwoRepo {
  Future<FeatureTwoDataModel> getFeatureTwoData();
}

class FeatureTwoRepoImpl implements FeatureTwoRepo {
  final FeatureTwoLocalDataSource _localDataSource;

  FeatureTwoRepoImpl(this._localDataSource);

  @override
  Future<FeatureTwoDataModel> getFeatureTwoData() async {
    return await _localDataSource.getFeatureTwoData();
  }
}
