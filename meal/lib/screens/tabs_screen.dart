import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
import './../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': Categories(),
      'title': 'Categories',
    },
    {
      'page': FavouriteScreen(),
      'title': 'Your Favourite',
    },
  ];

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourite"),
          )
        ],
      ),
    );
  }
}

// for upside tab
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Meals"),
//           bottom: TabBar(
//             tabs: <Widget>[
//               Tab(icon: Icon(Icons.category), text: "Categories"),
//               Tab(icon: Icon(Icons.star), text: "Favourite"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[Categories(), FavouriteScreen()],
//         ),
//       ),
//     );
//   }
// }
