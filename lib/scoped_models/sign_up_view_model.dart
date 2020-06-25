import 'package:example/routes/router.gr.dart';
import 'package:example/services/authentication_service.dart';
import 'package:example/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';

import '../service_locator.dart';
import 'base_model.dart';

export 'package:example/enums/view_state.dart';

class SignUpViewModel extends BaseModel {
  final AuthentaticationService _authentaticationService =
      locator<AuthentaticationService>();
  Future<bool> signUpUser({
    @required String email,
    @required String password,
  }) async {
    setState(ViewState.Busy);
    var signUpResult = await _authentaticationService.singUpWithEmail(
      email: email,
      password: password,
    );
    if (signUpResult is bool) {
      if (signUpResult) {
        locator<NavigationService>().navigateTo(Routes.home);
      } else {
        setState(ViewState.Error);
      }
    } else {
      setState(ViewState.Error);
    }
  }

  String checkConfirmationPasswordValid(
      {String password, String confirmationPassword}) {
    if (password != confirmationPassword) {
      return 'Please confirm that your passwords are the same';
    }

    return null;
  }

  bool checkPasswordLengthValid({@required String password}) {
    return password.length >= 6;
  }
}
