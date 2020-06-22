import 'package:example/service_locator.dart';
import 'package:example/services/shared_preferences_service.dart';
import 'base_model.dart';
export 'package:example/enums/view_state.dart';

class HomeViewModel extends BaseModel {
  SharedPrefService _sharedPrefService = locator<SharedPrefService>();
  logoff() async {
    setState(ViewState.Busy);
    await _sharedPrefService.saveBool('isFirstLaunch', true);
    setState(ViewState.Success);
  }
}
