import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final StreamSubscription<User?> _subscription;
  UserBloc() : super(UserState.initial()) {
    // _subscription = FirebaseAuth.instance.authStateChanges().listen((User? user) => user.providerData.,);
    on<UserEvent>((event, emit) {});
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
