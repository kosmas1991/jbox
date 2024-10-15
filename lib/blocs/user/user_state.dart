part of 'user_bloc.dart';

class UserState extends Equatable {
  final bool loggedIn;

  UserState({required this.loggedIn});

  factory UserState.initial() {
    return UserState(loggedIn: false);
  }

  @override
  List<Object> get props => [loggedIn];

  UserState copyWith({
    bool? loggedIn,
  }) {
    return UserState(
      loggedIn: loggedIn ?? this.loggedIn,
    );
  }

  @override
  bool get stringify => true;
}
