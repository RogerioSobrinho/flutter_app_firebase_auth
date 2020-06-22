import 'package:scoped_model/scoped_model.dart';

import 'base_model.dart';

export 'package:example/enums/view_state.dart';

class SignUpViewModel extends BaseModel {
  Future<bool> signUpUser({String username, String password}) async {
    // Update state to loading so we can show indicator
     setState(ViewState.Busy);

    await Future.delayed(Duration(seconds: 1));
    var signUpResponse = true; // Get real response here from service

    // determine state of the view based on response
    var signupStateBasedOnResponse =
        signUpResponse ? ViewState.Success : ViewState.Error;

    // Update the view state based on the response
   setState(signupStateBasedOnResponse);

    // Return the state so wherever the function was called van perform further functionality.
    // Example. Show a dialog to the user indicating that there was a failure
    return true;
  }

  String checkConfirmationPasswordValid(
      {String password, String confirmationPassword}) {
    if (password != confirmationPassword) {
      return 'Please confirm that your passwords are the same';
    }

    return null;
  }
}
