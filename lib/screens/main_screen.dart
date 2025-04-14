import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'account_screen.dart';
import 'menu_screen.dart';

class MainScreen extends StatefulWidget {
  static final GlobalKey<_MainScreenState> mainScreenKey =
      GlobalKey<_MainScreenState>();

  const MainScreen({Key? key}) : super(key: key);

  // Static method to navigate to a specific tab from anywhere in the app
  static void navigateToTab(BuildContext context, int index) {
    final state = mainScreenKey.currentState;
    if (state != null) {
      state._tabController.animateTo(index);
    }
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
    const MenuScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _screens.length, vsync: this);

    // Listen for tab changes
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(), // Disable swiping
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppConstants.bottomNavColor,
          selectedItemColor: AppConstants.primaryColor,
          unselectedItemColor: Colors.black54,
          currentIndex: _tabController.index,
          onTap: (index) {
            _tabController.animateTo(index);
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: AppConstants.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: AppConstants.account,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: AppConstants.cart,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              activeIcon: Icon(Icons.menu),
              label: AppConstants.menu,
            ),
          ],
        ),
      ),
    );
  }
}
