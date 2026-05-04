import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_reel_page/core/state_status.dart';
import 'package:instagram_reel_page/features/reel/data/repository/reel_repository.dart';
import 'package:instagram_reel_page/features/reel/model/reel_model.dart';

part 'reel_event.dart';
part 'reel_state.dart';

class ReelBloc extends Bloc<ReelEvent, ReelState> {
  final ReelRepository reelRepository = ReelRepository();
  ReelBloc()
    : super(
        ReelState(stateStatus: StateStatus.initial, errorMsg: null, data: []),
      ) {
    on<FetchReel>(_onFetchEvent);
  }

  Future<void> _onFetchEvent(FetchReel event, Emitter<ReelState> emit) async {
    emit(state.copyWith(stateStatus: StateStatus.loading));
    final reelFailureOrReels = await reelRepository.fetchReels();
    reelFailureOrReels.fold(
      (reelFailure) => emit(state.copyWith(stateStatus: StateStatus.error)),
      (reels) {
        emit(state.copyWith(stateStatus: StateStatus.success, data: reels));
      },
    );
  }
}
