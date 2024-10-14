import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';

class LabelOverrides extends EnLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'Συμπλήρωσε το email σου';

  @override
  String get passwordInputLabel => 'Συμπλήρωσε τον κωδικό σου';

  @override
  String get cancelLabel => 'Ακύρωση';

  @override
  String get signInText => 'Είσοδος';

  @override
  String get registerHintText => 'Δεν έχεις λογαριασμό;';

  @override
  String get registerActionText => 'Εγγραφή';

  @override
  String get registerText => 'Εγγραφή';

  @override
  String get signInHintText => 'Έχεις ήδη λογαριασμό;';

  @override
  String get confirmPasswordInputLabel => 'Επιβεβαίωση κωδικού';

  @override
  String get forgotPasswordButtonLabel => 'Ξέχασες τον κωδικό;';

  @override
  String get signInActionText => 'Είσοδος';

  @override
  String get emailIsRequiredErrorText => 'Το email είναι απαραίτητο πεδίο';

  @override
  String get passwordIsRequiredErrorText => 'Ο κωδικός είναι απαραίτητο πεδίο';

  @override
  String get forgotPasswordViewTitle => 'Υπενθύμιση κωδικού';

  @override
  String get forgotPasswordHintText =>
      'Συμπλήρωσε το email σου και θα σου στείλουμε σύνδεσμο για επαναφορά του κωδικού';

  @override
  String get resetPasswordButtonLabel => 'Επαναφορά κωδικού';

  @override
  String get goBackButtonLabel => 'Πίσω';

  @override
  String get confirmPasswordIsRequiredErrorText => 'Επιβεβαίωσε τον κωδικό σου';

  @override
  String get confirmPasswordDoesNotMatchErrorText =>
      'Οι κωδικοί δεν ταιριάζουν';
}
