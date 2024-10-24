import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/global%20widgets/mytextfield.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text =
        context.read<UserBloc>().state.user?.displayName ?? '';
    return MyTextField(
      textEditingController: textEditingController,
      hintText: context.watch<UserBloc>().state.user?.displayName ?? '',
    );
  }
}
