import 'package:bloc/bloc.dart';
import 'package:bloc_to_bloc_communication_example/features/events/feature_one_data_changed_event.dart';
import 'package:bloc_to_bloc_communication_example/features/events_handler.dart';
import 'package:bloc_to_bloc_communication_example/features/feature_two/data/models/feature_two_data_model.dart';
import 'package:bloc_to_bloc_communication_example/features/feature_two/data/repos/feature_two_repo_impl.dart';

part 'feature_two_state.dart';

class FeatureTwoCubit extends Cubit<FeatureTwoState> with EventBusMixin {
  final FeatureTwoRepo _repo;
  FeatureTwoCubit(this._repo) : super(FeatureTwoInitial());

  void getFeatureTwoData() async {
    emit(FeatureTwoLoading());
    try {
      final data = await _repo.getFeatureTwoData();
      shareEvent(FeatureOneDataChangedEvent(data.featureOneRelatedData));
      emit(FeatureTwoLoaded(data));
    } catch (error) {
      emit(FeatureTwoError(error.toString()));
    }
  }
}
