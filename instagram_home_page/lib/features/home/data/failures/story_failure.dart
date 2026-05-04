sealed class StoryFailure {
  final String msg;
  const StoryFailure(this.msg);
}

class NoInternetStoryFailure extends StoryFailure {
  const NoInternetStoryFailure(super.msg);
}

class UnKnownStoryFailure extends StoryFailure {
  const UnKnownStoryFailure(super.msg);
}
