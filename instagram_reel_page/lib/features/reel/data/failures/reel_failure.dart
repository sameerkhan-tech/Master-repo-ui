sealed class ReelFailure {
  final String msg;
  ReelFailure(this.msg);
}

final class UnknownReelFailure extends ReelFailure{
  UnknownReelFailure(super.msg);
}

