sealed class ContactFailure {
  final String msg;

  ContactFailure(this.msg);
}

class UnknownContactFailure extends ContactFailure{
  UnknownContactFailure(super.msg);
}