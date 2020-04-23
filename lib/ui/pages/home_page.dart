import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/homePageBloc/home_page_bloc.dart';
import 'package:umit/src/blocs/homePageBloc/home_page_event.dart';
import 'package:umit/src/blocs/homePageBloc/home_page_state.dart';
import 'package:umit/ui/pages/login_page.dart';

class HomePageParent extends StatelessWidget {
  FirebaseUser user;
  UserRepository userRepository;

  HomePageParent({@required this.user, @required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(userRepository: userRepository),
      child: HomePage(user: user, userRepository: userRepository),
    );
  }
}

class HomePage extends StatelessWidget {
  FirebaseUser user;
  HomePageBloc homePageBloc;
  UserRepository userRepository;

  HomePage({@required this.user, @required this.userRepository});

  @override
  Widget build(BuildContext context) {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("email"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                homePageBloc.add(LogOutButtonPressedEvent());
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(user.email),
            ),
            BlocListener<HomePageBloc, HomePageState>(
              listener: (context, state) {
                if (state is LogOutSuccess) {
                  navigateToLogInPage(context);
                }
              },
              child: BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is LogOutInitial) {
                    return Container();
                  } else if (state is LogOutSuccess) {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void navigateToLogInPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LoginPageParent(userRepository: userRepository);
    }));
  }
}