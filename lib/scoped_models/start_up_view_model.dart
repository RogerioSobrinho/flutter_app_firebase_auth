import 'package:example/routes/router.gr.dart';
import 'package:example/service_locator.dart';
import 'package:example/services/authentication_service.dart';
import 'package:example/services/navigation_service.dart';
import 'package:flutter/material.dart';

import 'base_model.dart';

export 'package:example/enums/view_state.dart';

class StartUpViewModel extends ChangeNotifier {
  AuthentaticationService _authentaticationService =
      locator<AuthentaticationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authentaticationService.isLogged();
    if (hasLoggedInUser) {
      locator<NavigationService>().navigateTo(Routes.home);
    } else {
      locator<NavigationService>().navigateTo(Routes.login);
    }
  }
}
