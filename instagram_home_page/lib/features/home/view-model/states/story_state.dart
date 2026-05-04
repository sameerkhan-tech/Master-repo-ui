import 'package:equatable/equatable.dart';
import 'package:instagram_home_page/features/home/model/story_model.dart';
import 'package:instagram_home_page/state_status_enum.dart';

class StoryState extends Equatable {
  final StateStatus stateStatus;
  final String? errorMsg;
  final List<StoryModel> data;

  const StoryState({
    required this.stateStatus,
    required this.errorMsg,
    required this.data,
  });

  StoryState copyWith({
    StateStatus? stateStatus,
    String? errorMsg,
    List<StoryModel>? data,
  }) => StoryState(
    stateStatus: stateStatus ?? this.stateStatus,
    errorMsg: errorMsg ?? this.errorMsg,
    data: data ?? this.data,
  );

  @override
  List<Object?> get props => [stateStatus, errorMsg, data];
}
