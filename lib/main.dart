import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:judou/index/index.dart';
import 'package:judou/discovery/search.dart';
import 'package:judou/profile/profile.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(JuDouApp());
}

/// TODO： List
/// 网络请求: dio -> https://github.com/flutterchina/dio
class JuDouApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Color.fromARGB(255, 45, 45, 45),
            dividerColor: Colors.grey[80],
            iconTheme: IconThemeData(color: Colors.black38),
            textTheme: TextTheme(title: TextStyle(fontSize: 20, fontFamily: 'PingFang'))));
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _widgetOptions = [IndexPage(), DiscoveryPage(), ProfilePage()];

  void _onItemTapped(int index) {
    debugPrint('$index');
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/home.png')),
                  title: Text(''),
                  activeIcon: Icon(Icons.autorenew)),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/descovery.png')),
                  title: Text(''),
                  activeIcon: Icon(Icons.explore)),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text(''), activeIcon: Icon(Icons.person))
            ],
            currentIndex: _selectedIndex,
            fixedColor: Theme.of(context).accentColor,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed));
  }
}
