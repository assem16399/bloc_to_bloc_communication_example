abstract class FeatureOneLocalDataSource {
  Future<List<String>> getFeatureOneData();
}

class FeatureOneLocalDataSourceImpl implements FeatureOneLocalDataSource {
  @override
  Future<List<String>> getFeatureOneData() async {
    await Future.delayed(const Duration(seconds: 3));
    return ['Feature One Data 1', 'Feature One Data 2', 'Feature One Data 3'];
  }
}
