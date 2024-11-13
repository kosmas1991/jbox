import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jbox/extensions/printextensions.dart';
import 'package:jbox/main.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final StreamSubscription<User?> _subscription;
  UserBloc() : super(UserState.initial()) {
    _subscription = auth.userChanges().listen((User? user) {
      add(UserEvent(user: user));
    });
    on<UserEvent>((event, emit) {
      if (event.user != null) {
        'user signed in'.printWarning();
        // 'User has the below data stored at firebase\ndisplay name: ${event.user!.displayName}\nphoto url: ${event.user!.photoURL}\nphone: ${event.user!.phoneNumber}\nemail: ${event.user!.email} -> verified? ${event.user!.emailVerified}'
        //     .printWarning();

        emit(state.copyWith(loggedIn: true, user: event.user));
      } else {
        'user signed out'.printError();
        emit(state.copyWith(loggedIn: false));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
