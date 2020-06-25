import 'package:example/scoped_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:example/ui/shared/font_styles.dart';
import 'package:example/ui/views/base_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        builder: (context, child, model) => model.state == ViewState.Busy
            ? _getFeedbackUI(model)
            : Scaffold(
                appBar: AppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      onPressed: () async {
                        await model.signOut();
                      },
                    )
                  ],
                  automaticallyImplyLeading: false,
                ),
                backgroundColor: Color.fromARGB(255, 26, 27, 30),
                body: Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.only(top: 50.0),
                  child: ListView(children: <Widget>[
                    Text('Home', style: viewTitle),
                  ]),
                )));
  }

  Widget _getFeedbackUI(HomeViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor)),
        );
        break;
      default:
        return Container();
    }
  }
}
