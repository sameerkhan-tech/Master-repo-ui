part of 'home_page_bloc.dart';

sealed class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Don't break single responsibility principle have two event for entire different data;
// ex -  fetching story and feed

final class FetchStories extends HomeEvent{}
final class FetchFeeds extends HomeEvent{}
//final class FetchInitialData extends HomeEvent {}
