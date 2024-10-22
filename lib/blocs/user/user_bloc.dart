import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/extensions/printextensions.dart';
import 'package:jbox/go_router/go_router.dart';
import 'package:jbox/main.dart';
import 'package:jbox/screens/adminscreen/adminscreen.dart';
import 'package:jbox/screens/validatescreen/validate_email.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final StreamSubscription<User?> _subscription;
  UserBloc() : super(UserState.initial()) {
    _subscription = auth.userChanges().listen((User? user) {
      //check user data
      // if email verified first
      if (user?.emailVerified == false) {
        GoRouterProvider.router.goNamed(ValidateEmail.routeName);
      } else {
        GoRouterProvider.router.goNamed(AdminScreen.routeName);
      }
      add(UserEvent(user: user));
    });
    on<UserEvent>((event, emit) {
      if (event.user != null) {
        'user signed in'.printWarning();

        emit(state.copyWith(loggedIn: true, user: event.user));
      } else {
        'user signed out'.printError();
        emit(state.copyWith(loggedIn: false, user: null));
      }
    });

    on<UserUpdateEvent>((event, emit) {
      if (state.user != null) {
        state.user!.reload();
        'User has the below data stored at firebase\ndisplay name: ${event.user!.displayName}\nphoto url: ${event.user!.photoURL}\nphone: ${event.user!.phoneNumber}\nemail: ${event.user!.email} -> verified? ${event.user!.emailVerified}'
            .printWarning();
        emit(state.copyWith(user: event.user));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
