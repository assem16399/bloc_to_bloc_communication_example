import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../events/feature_one_data_changed_event.dart';
import '../../../events_handler.dart';
import '../../data/repos/feature_one_repo_impl.dart';

part 'feature_one_state.dart';

class FeatureOneCubit extends Cubit<FeatureOneState> with EventBusMixin {
  final FeatureOneRepo _repo;
  late final StreamSubscription _subscription;

  FeatureOneCubit(this._repo) : super(FeatureOneInitial()) {
    _listenToFeatureTwoDataUsingEventBus();
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

  void _listenToFeatureTwoDataUsingEventBus() {
    _subscription = listenEvent<FeatureOneDataChangedEvent>((event) {
      emit(FeatureOneLoaded(event.data));
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
