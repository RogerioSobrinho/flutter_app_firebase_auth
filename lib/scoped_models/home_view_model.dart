import 'package:example/routes/router.gr.dart';
import 'package:example/service_locator.dart';
import 'package:example/services/authentication_service.dart';
import 'package:example/services/navigation_service.dart';

import 'base_model.dart';
export 'package:example/enums/view_state.dart';

class HomeViewModel extends BaseModel {
  AuthentaticationService _authentaticationService =
      locator<AuthentaticationService>();
  signOut() async {
    setState(ViewState.Busy);
    await _authentaticationService.signOut();
    locator<NavigationService>().navigateTo(Routes.login);
  }
}
