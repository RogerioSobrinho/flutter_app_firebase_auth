import 'package:example/service_locator.dart';
import 'package:example/services/shared_preferences_service.dart';

import 'base_model.dart';

export 'package:example/enums/view_state.dart';

class LoginViewModel extends BaseModel {
  SharedPrefService _sharedPrefService = locator<SharedPrefService>();
  Future<void> login({String username, String password}) async {
    // Update state to loading so we can show indicator
    setState(ViewState.Busy);

    await Future.delayed(Duration(seconds: 1));
    var loginResult = true; // Get real response here from service

    // determine state of the view based on response.
    var loginStateBasedOnReponse =
        loginResult ? ViewState.Success : ViewState.Error;

    _sharedPrefService.saveBool('isFirstLaunch', false);

    // Update the view state based on the response
    setState(loginStateBasedOnReponse);
  }
}
