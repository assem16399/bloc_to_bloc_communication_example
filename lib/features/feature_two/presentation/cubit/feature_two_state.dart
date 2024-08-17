part of 'feature_two_cubit.dart';

sealed class FeatureTwoState {}

final class FeatureTwoInitial extends FeatureTwoState {}

final class FeatureTwoLoading extends FeatureTwoState {}

final class FeatureTwoLoaded extends FeatureTwoState {
  final FeatureTwoDataModel data;
  FeatureTwoLoaded(this.data);
}

final class FeatureTwoError extends FeatureTwoState {
  final String message;
  FeatureTwoError(this.message);
}
