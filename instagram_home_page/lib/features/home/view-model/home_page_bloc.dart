import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_home_page/features/home/data/repositories/feed_repository.dart';
import 'package:instagram_home_page/features/home/data/repositories/story_repository.dart';
import 'package:instagram_home_page/features/home/view-model/states/feed_state.dart';
import 'package:instagram_home_page/features/home/view-model/states/story_state.dart';
import 'package:instagram_home_page/state_status_enum.dart';

part 'home_state.dart';
part 'home_event.dart';


class HomePageBloc extends Bloc<HomeEvent, HomeState> {
  final StoryRepository storyRepository = StoryRepository();
  final FeedRepository feedRepository = FeedRepository();

  HomePageBloc()
    : super(
        HomeState(
          storyState: StoryState(
            stateStatus: StateStatus.initial,
            errorMsg: null,
            data: [],
          ),
          feedState: FeedState(
            stateStatus: StateStatus.initial,
            errorMsg: null,
            data: [],
          ),
        ),
      ) {
    // separate event means data load separately not depended on each other
    // Never break single responsibility rule
    // paginate possible

    on<FetchStories>((event, emit) async {
      emit(
        state.copyWith(
          storyState: state.storyState.copyWith(
            stateStatus: StateStatus.loading,
          ),
        ),
      );

      final storyFailureOrStories = await storyRepository.fetchStories();

      storyFailureOrStories.fold(
        (storyFailure) {
          emit(
            state.copyWith(
              storyState: state.storyState.copyWith(
                stateStatus: StateStatus.error,
                errorMsg: storyFailure.msg,
              ),
            ),
          );
        },
        (stories) {
          emit(
            state.copyWith(
              storyState: state.storyState.copyWith(
                stateStatus: StateStatus.success,
                data: stories,
              ),
            ),
          );
        },
      );
    });
    on<FetchFeeds>((event, emit) async {
      emit(
        state.copyWith(
          feedState: state.feedState.copyWith(stateStatus: StateStatus.loading),
        ),
      );
      final feedFailureOrFeeds = await feedRepository.fetchFeed();
      feedFailureOrFeeds.fold(
        (feedFailure) {
          emit(
            state.copyWith(
              feedState: state.feedState.copyWith(
                stateStatus: StateStatus.error,
                errorMsg: 'Failed to fetch post',
              ),
            ),
          );
        },
        (feed) {
          emit(
            state.copyWith(
              feedState: state.feedState.copyWith(
                stateStatus: StateStatus.success,
                data: feed,
              ),
            ),
          );
        },
      );
    });

    // Don't fetch or handle independent data in single event
    //   on<FetchInitialData>((event, emit) async {
    //     emit(
    //       state.copyWith(
    //         feedState: state.feedState.copyWith(stateStatus: StateStatus.loading),
    //         storyState: state.storyState.copyWith(
    //           stateStatus: StateStatus.loading,
    //         ),
    //       ),
    //     );

    //     // Don't emit back to back cause wired rebuild emit once together
    //     // emit(
    //     //   state.copyWith(
    //     //     storyState: state.storyState.copyWith(
    //     //       stateStatus: StateStatus.loading,
    //     //     ),
    //     //   ),
    //     // );
    //     // emit(
    //     //   state.copyWith(
    //     //     feedState: state.feedState.copyWith(stateStatus: StateStatus.loading),
    //     //   ),
    //     // );

    //     final storyFailureOrStories = await storyRepository.fetchStories();
    //     final feedFailureOrFeeds = await feedRepository.fetchFeed();

    //     storyFailureOrStories.fold(
    //       (storyFailure) {
    //         emit(
    //           state.copyWith(
    //             storyState: state.storyState.copyWith(
    //               stateStatus: StateStatus.error,
    //               errorMsg: storyFailure.msg,
    //             ),
    //           ),
    //         );
    //       },
    //       (stories) {
    //         emit(
    //           state.copyWith(
    //             storyState: state.storyState.copyWith(
    //               stateStatus: StateStatus.success,
    //               data: stories,
    //             ),
    //           ),
    //         );
    //       },
    //     );
    //     feedFailureOrFeeds.fold(
    //       (feedFailure) {
    //         emit(
    //           state.copyWith(
    //             feedState: state.feedState.copyWith(
    //               stateStatus: StateStatus.error,
    //               errorMsg: 'Failed to fetch post',
    //             ),
    //           ),
    //         );
    //       },
    //       (feed) {
    //         emit(
    //           state.copyWith(
    //             feedState: state.feedState.copyWith(
    //               stateStatus: StateStatus.success,
    //               data: feed,
    //             ),
    //           ),
    //         );
    //       },
    //     );
    //   });
    // }
  }
}
