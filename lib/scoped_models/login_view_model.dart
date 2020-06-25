import 'package:example/routes/router.gr.dart';
import 'package:example/service_locator.dart';
import 'package:example/services/authentication_service.dart';
import 'package:example/services/navigation_service.dart';
import 'base_model.dart';
export 'package:example/enums/view_state.dart';

class LoginViewModel extends BaseModel {
  final AuthentaticationService _authentaticationService =
      locator<AuthentaticationService>();
  Future<void> login({
    String email,
    String password,
  }) async {
    setState(ViewState.Busy);

    var result = await _authentaticationService.loginWithEmail(
      email: email,
      password: password,
    );

    if (result is bool) {
      if (result) {
        locator<NavigationService>().navigateTo(Routes.home);
      } else {
        setState(ViewState.Error);
      }
    } else {
      setState(ViewState.Error);
    }
  }
}
