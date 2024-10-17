part of 'user_bloc.dart';

class UserEvent extends Equatable {
  final User? user;

  UserEvent({this.user});

  @override
  List<Object?> get props => [user];

  @override
  bool get stringify => true;
}
