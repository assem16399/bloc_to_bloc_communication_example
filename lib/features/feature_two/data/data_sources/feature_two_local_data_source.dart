import 'package:bloc_to_bloc_communication_example/features/feature_two/data/models/feature_two_data_model.dart';

abstract class FeatureTwoLocalDataSource {
  Future<FeatureTwoDataModel> getFeatureTwoData();
}

class FeatureTwoLocalDataSourceImpl implements FeatureTwoLocalDataSource {
  @override
  Future<FeatureTwoDataModel> getFeatureTwoData() async {
    await Future.delayed(const Duration(seconds: 3));
    return FeatureTwoDataModel();
  }
}
