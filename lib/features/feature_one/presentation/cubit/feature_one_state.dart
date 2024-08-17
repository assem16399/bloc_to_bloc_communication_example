part of 'feature_one_cubit.dart';

sealed class FeatureOneState {}

final class FeatureOneInitial extends FeatureOneState {}

final class FeatureOneLoading extends FeatureOneState {}

final class FeatureOneLoaded extends FeatureOneState {
  final List<String> data;
  FeatureOneLoaded(this.data);
}

final class FeatureOneError extends FeatureOneState {
  final String message;
  FeatureOneError(this.message);
}
