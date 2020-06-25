import 'package:flutter/material.dart';
import 'package:example/scoped_models/login_view_model.dart';
import 'package:example/ui/shared/font_styles.dart';
import 'package:example/ui/shared/ui_helpers.dart';
import 'package:example/ui/views/base_view.dart';
import 'package:example/enums/view_state.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: <Widget>[],
            ),
            backgroundColor: Color.fromARGB(255, 26, 27, 30),
            body: Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 50.0),
              child: ListView(children: <Widget>[
                Text('LOGIN', style: viewTitle),
                UIHelper.verticalSpaceLarge(),
                UIHelper.inputField(
                    title: 'Email',
                    placeholder: 'Enter username',
                    controller: emailController),
                UIHelper.verticalSpaceMedium(),
                UIHelper.inputField(
                    title: 'Password',
                    placeholder: 'Enter password',
                    isPassword: true,
                    controller: passwordController),
                UIHelper.verticalSpaceMedium(),
                _getFeedbackUI(model),
                UIHelper.verticalSpaceMedium(),
                _getLoginButton(model),
                UIHelper.verticalSpaceMedium(),
                _getSingUpButton(),
              ]),
            )));
  }

  Widget _getFeedbackUI(LoginViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor)),
        );
        break;
      case ViewState.Error:
        return Text('Could not log in at this moment');
      case ViewState.Success:
        return Center(child: Text('Login Success'));
      case ViewState.WaitingForInput:
      default:
        return Container();
    }
  }

  Widget _getLoginButton(LoginViewModel model) {
    return GestureDetector(
      onTap: () async {
        await model.login(
          email: emailController.text,
          password: passwordController.text,
        );
      },
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color.fromARGB(255, 9, 202, 172)),
        child: Center(
            child:
                Text('LOGIN', style: TextStyle(fontWeight: FontWeight.w800))),
      ),
    );
  }

  Widget _getSingUpButton() {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).pushNamed('/sign-up');
      },
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color.fromARGB(255, 9, 202, 172)),
        child: Center(
            child:
                Text('SingUp', style: TextStyle(fontWeight: FontWeight.w800))),
      ),
    );
  }
}
