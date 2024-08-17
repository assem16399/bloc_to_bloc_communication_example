import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../feature_two/data/repos/feature_two_repo_impl.dart';
import '../../data/repos/feature_one_repo_impl.dart';

part 'feature_one_state.dart';

class FeatureOneDataChangedEvent {
  final List<String> data;
  FeatureOneDataChangedEvent(this.data);
}

class FeatureOneCubit extends Cubit<FeatureOneState> {
  final FeatureOneRepo _repo;
  final FeatureTwoRepo _sharedRepo;
  late final StreamSubscription _subscription;

  FeatureOneCubit(this._repo, this._sharedRepo) : super(FeatureOneInitial()) {
    _listenToFeatureTwoDataUsingReactiveRepo();
  }

  void getFeatureOneData() async {
    emit(FeatureOneLoading());
    try {
      final data = await _repo.getFeatureOneData();
      emit(FeatureOneLoaded(data));
    } catch (error) {
      emit(FeatureOneError(error.toString()));
    }
  }

  void _listenToFeatureTwoDataUsingReactiveRepo() {
    _subscription = _sharedRepo.broadcastFeatureOneData.listen((data) {
      emit(FeatureOneLoaded(data));
    }, onError: (error) {
      emit(FeatureOneError(error.toString()));
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
