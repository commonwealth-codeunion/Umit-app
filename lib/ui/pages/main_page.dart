import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/ui/pages/navigation/favorite_page.dart';
import 'package:umit/ui/pages/navigation/home_page/home_page.dart';
import 'package:umit/ui/pages/navigation/settings_page/settings.page.dart';
import 'package:umit/ui/pages/navigation/tests_page/tests_page.dart';

FirebaseUser user;

class MainPage extends StatefulWidget {
  MainPage({Key key, this.userRepository, this.user}) : super(key: key);
  UserRepository userRepository;
  FirebaseUser user;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;

  List<Widget> _widgetOptions = <Widget>[
    FavoritePage(),
    TestsPage(),
    HomePage(),
    SettingsPageParent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  initState() {
    setState(() {
      user = widget.user;
    });
    super.initState();
  }

  /// Функция скрытия иконки профиля в AppBar при переключении на влкадку настроек
  // _actionHide() {
  //   if (_selectedIndex == 3) {
  //     return null;
  //   } else
  //     return <Widget>[
  //       Container(
  //         width: 45,
  //         height: 45,
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           border: Border.all(
  //             color: Theme.of(context).accentColor,
  //             width: 3,
  //           ),
  //         ),
  //         child: FlatButton(
  //           padding: const EdgeInsets.all(3),
  //           onPressed: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => ProfilePage(),
  //               ),
  //             );
  //           },
  //           shape: CircleBorder(),
  //           child: CircleAvatar(
  //             child: Icon(
  //               Icons.person,
  //               size: 34,
  //               color: Colors.white,
  //             ),
  //             backgroundColor: Colors.black26,
  //           ),
  //         ),
  //       ),
  //       SizedBox(width: 9),
  //     ];
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            unselectedItemColor: Theme.of(context).unselectedWidgetColor,
            iconSize: 30,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Понравки'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.extension),
                title: Text('Тестирование'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Главная'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Настройки'),
              ),
            ],
          ),
          body: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
