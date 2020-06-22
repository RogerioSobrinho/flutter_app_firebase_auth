import 'package:auto_route/auto_route_annotations.dart';
import 'package:example/ui/views/home_view.dart';
import 'package:example/ui/views/login_view.dart';
import 'package:example/ui/views/sign_up_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeViewRoute;
  LoginView loginViewRoute;
  SignUpView signUpViewRoute;
}
