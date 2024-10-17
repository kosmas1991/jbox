// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

class UserState extends Equatable {
  final bool loggedIn;
  final User? user;

  UserState({required this.loggedIn, this.user});

  factory UserState.initial() {
    return UserState(loggedIn: false, user: null);
  }

  @override
  List<Object?> get props => [loggedIn, user];

  @override
  bool get stringify => true;

  UserState copyWith({
    bool? loggedIn,
    User? user,
  }) {
    return UserState(
      loggedIn: loggedIn ?? this.loggedIn,
      user: user ?? this.user,
    );
  }
}
