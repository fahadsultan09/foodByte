import 'package:flutter/material.dart';
import 'package:foodbyte/screens/Profile.dart';
import 'package:foodbyte/screens/favorite_page.dart';
import 'package:foodbyte/screens/order_page.dart';
import 'package:foodbyte/screens/review.dart';
import 'home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Home(),
          ReviewPage(),
          FavoritePage(),
          OrderPage(),
          profilePage(),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width:7),
            IconButton(
              icon: Icon(
                Icons.home,
                size: 24.0,
              ),
              color: _page == 0
                  ? Theme.of(context).accentColor
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(0),
            ),

            IconButton(
              icon:Icon(
                Icons.label,
                size: 24.0,
              ),
              color: _page == 1
                  ? Theme.of(context).accentColor
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(1),
            ),

            IconButton(
              icon: Icon(
                Icons.favorite,
                size: 24.0,
                // color: Theme.of(context).buttonColor,
              ),
              color: _page == 2
                  ? Theme.of(context).accentColor
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(2),
            ),

            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 24.0,
              ),
              color: _page == 3
                  ? Theme.of(context).accentColor
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(3),
            ),

            IconButton(
              icon: Icon(
                Icons.person,
                size: 24.0,
              ),
              color: _page == 4
                  ? Theme.of(context).accentColor
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(4),
            ),

            SizedBox(width:7),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),

      ),

      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   elevation: 10.0,
      //   child: Icon(
      //     Icons.add,
      //   ),
      //   onPressed: ()=>_pageController.jumpToPage(2),
      // ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();


    }
  
    @override
    void dispose() {
      super.dispose();
      _pageController.dispose();
    }
  
    void onPageChanged(int page) {
      setState(() {
        this._page = page;
      });
    }
  
    
}
