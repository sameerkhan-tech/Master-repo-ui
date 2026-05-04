
part of 'reel_bloc.dart';
class ReelState {
  final StateStatus stateStatus;
  final String? errorMsg;
  final List<ReelModel> data;
  ReelState({
    required this.stateStatus,
    required this.errorMsg,
    required this.data,
  });

// imp for emiting state 
  ReelState copyWith({
    StateStatus? stateStatus,
    String? errorMsg,
    List<ReelModel>? data,
  }) => ReelState(
    stateStatus: stateStatus ?? this.stateStatus,
    errorMsg: errorMsg ?? this.errorMsg,
    data: data ?? this.data,
  );
}
