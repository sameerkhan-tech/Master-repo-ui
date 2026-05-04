

import 'package:instagram_home_page/features/home/model/feed_model.dart';
import 'package:instagram_home_page/state_status_enum.dart';

class FeedState {
  final StateStatus stateStatus;
  final String? errorMsg;
  final List<FeedModel> data;

  FeedState({
    required this.stateStatus,
    required this.errorMsg,
    required this.data,
  });

  FeedState copyWith({
    StateStatus? stateStatus,
    String? errorMsg,
    List<FeedModel>? data,
  }) => FeedState(
    stateStatus: stateStatus ?? this.stateStatus,
    errorMsg: errorMsg ?? this.errorMsg,
    data: data ?? this.data,
  );
}
