import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _containerHeight = 70;

    return Scaffold(
      appBar: AppBar(
        title: Text('Animated NavBar'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          Container(
            color: Colors.blueGrey,
          ),
          Container(
            color: Colors.red,
          ),
          // ModalSheet(),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.black,
          ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        height: _containerHeight,
        duration: Duration(
          milliseconds: 100,
        ),
        child: BottomNavyBar(
          animationDuration: Duration(milliseconds: 350),
          showElevation: false,
          itemCornerRadius: 10,
          //containerHeight: _containerHeight,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            });
          },
          selectedIndex: _currentIndex,
          items: [
            BottomNavyBarItem(
              activeColor: Colors.white,
              //inactive color black hi chahiye
              inactiveColor: Colors.black,
              icon: Icon(
                Icons.home,
                //color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Icon(Icons.store),
              title: Text(
                'Store',
                style: TextStyle(color: Colors.white),
              ),
              inactiveColor: Colors.black,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Icon(Icons.search),
              textAlign: TextAlign.center,
              inactiveColor: Colors.black,
              title: Text('Search'),
            ),
            BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Icon(Icons.explore),
              inactiveColor: Colors.black,
              title: Text(
                'Explore',
                style: TextStyle(color: Colors.white),
              ),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              inactiveColor: Colors.black,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _containerHeight = 0;
          });
        },
        child: Icon(Icons.arrow_downward),
      ),
    );
  }
}
