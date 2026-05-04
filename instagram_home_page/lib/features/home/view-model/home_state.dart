part of 'home_page_bloc.dart';

class HomeState extends Equatable {
  // List<HomeStates> homeStates;
  final StoryState storyState;
  final FeedState feedState;
  // Drive the isloading use getter to not violet single source of truth
  // final bool isLoading;
  // final StateStatus stateStatus;
  const HomeState({
    required this.storyState,
    required this.feedState,
    //  required this.isLoading,
  });

  HomeState copyWith({
    StoryState? storyState,
    FeedState? feedState,
    //  bool? isLoading,
  }) => HomeState(
    storyState: storyState ?? this.storyState,
    feedState: feedState ?? this.feedState,
    // isLoading: isLoading ?? this.isLoading,
  );

  // drive inital loading to not voilet single source of truth rule
  // To Preventing State Desynchronization
  // for clear code either we have to take to set bool value on every emit which is error prone

  // Then handle in ui like this
  //  body: BlocConsumer<HomePageBloc, HomeState>(
  //         builder: (context, state) {
  //           if (state.isInitialLoading) {
  //             return const Center(child: CircularProgressIndicator());
  //           }
  // return CustomScrollView etc

  bool get isInitialLoading =>
      (storyState.stateStatus == StateStatus.loading &&
          storyState.data.isEmpty) &&
      (feedState.stateStatus == StateStatus.loading && feedState.data.isEmpty);

  @override
  List<Object?> get props => [storyState, feedState];
}
