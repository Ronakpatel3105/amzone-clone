import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_constants.dart';
import '../blocs/product/product_bloc.dart';
import '../blocs/product/product_event.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              _showSearchDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserGreeting(context),
            _buildShopByCategories(context),
            _buildTrendingCategories(context),
            _buildProgramsAndFeatures(context),
            _buildHelpAndSettings(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildUserGreeting(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: AppConstants.primaryColor,
                child: Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello, User',
                    style: AppConstants.headline3,
                  ),
                  Text(
                    'Sign in for the best experience',
                    style: AppConstants.bodyText2.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showSignInDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.secondaryColor,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Sign In / Register',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShopByCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shop By Category',
            style: AppConstants.headline3,
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildCategoryTile(
                icon: Icons.devices,
                title: 'Electronics',
                onTap: () =>
                    _navigateToCategoryProducts(context, 'electronics'),
              ),
              _buildCategoryTile(
                icon: Icons.checkroom,
                title: 'Fashion',
                onTap: () =>
                    _navigateToCategoryProducts(context, "men's clothing"),
              ),
              _buildCategoryTile(
                icon: Icons.home,
                title: 'Home & Kitchen',
                onTap: () => _showCategoryDialog(context, 'Home & Kitchen'),
              ),
              _buildCategoryTile(
                icon: Icons.sports_basketball,
                title: 'Sports & Outdoors',
                onTap: () => _showCategoryDialog(context, 'Sports & Outdoors'),
              ),
              _buildCategoryTile(
                icon: Icons.toys,
                title: 'Toys & Games',
                onTap: () => _showCategoryDialog(context, 'Toys & Games'),
              ),
              _buildCategoryTile(
                icon: Icons.book,
                title: 'Books & Media',
                onTap: () => _showCategoryDialog(context, 'Books & Media'),
              ),
              _buildCategoryTile(
                icon: Icons.local_grocery_store,
                title: 'Grocery',
                onTap: () => _showCategoryDialog(context, 'Grocery'),
              ),
              _buildCategoryTile(
                icon: Icons.pets,
                title: 'Pet Supplies',
                onTap: () => _showCategoryDialog(context, 'Pet Supplies'),
              ),
              _buildCategoryTile(
                icon: Icons.more_horiz,
                title: 'See All',
                onTap: () {
                  context.read<ProductBloc>().add(const FetchCategories());
                  _navigateToAllCategories(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingCategories(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trending',
            style: AppConstants.headline3,
          ),
          const SizedBox(height: 16),
          _buildListItem(
            icon: Icons.trending_up,
            title: 'Best Sellers',
            onTap: () {
              context.read<ProductBloc>().add(const FetchProducts());
              _showFeatureDialog(context, 'Best Sellers',
                  'View the most popular products on Amazon');
            },
          ),
          _buildListItem(
            icon: Icons.new_releases,
            title: 'New Releases',
            onTap: () => _showFeatureDialog(context, 'New Releases',
                'Discover the newest products on Amazon'),
          ),
          _buildListItem(
            icon: Icons.local_offer,
            title: 'Today\'s Deals',
            onTap: () => _showFeatureDialog(context, 'Today\'s Deals',
                'Check out the latest deals and discounts'),
          ),
          _buildListItem(
            icon: Icons.star,
            title: 'Top Rated',
            onTap: () => _showFeatureDialog(
                context, 'Top Rated', 'Browse the highest-rated products'),
          ),
        ],
      ),
    );
  }

  Widget _buildProgramsAndFeatures(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Programs & Features',
            style: AppConstants.headline3,
          ),
          const SizedBox(height: 16),
          _buildListItem(
            icon: Icons.card_membership,
            title: 'Prime Membership',
            onTap: () => _showFeatureDialog(context, 'Prime Membership',
                'Learn about Amazon Prime benefits and join'),
          ),
          _buildListItem(
            icon: Icons.delivery_dining,
            title: 'FREE Shipping',
            onTap: () => _showFeatureDialog(context, 'FREE Shipping',
                'Products eligible for free shipping'),
          ),
          _buildListItem(
            icon: Icons.local_atm,
            title: 'Amazon Pay',
            onTap: () => _showFeatureDialog(context, 'Amazon Pay',
                'Manage your Amazon Pay balance and transactions'),
          ),
          _buildListItem(
            icon: Icons.card_giftcard,
            title: 'Gift Cards',
            onTap: () => _showFeatureDialog(
                context, 'Gift Cards', 'Buy and redeem Amazon gift cards'),
          ),
          _buildListItem(
            icon: Icons.live_tv,
            title: 'Prime Video',
            onTap: () => _showFeatureDialog(context, 'Prime Video',
                'Watch movies and TV shows with Prime Video'),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpAndSettings(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Help & Settings',
            style: AppConstants.headline3,
          ),
          const SizedBox(height: 16),
          _buildListItem(
            icon: Icons.account_circle,
            title: 'Your Account',
            onTap: () => _navigateToAccountTab(context),
          ),
          _buildListItem(
            icon: Icons.language,
            title: 'Language Settings',
            onTap: () => _showFeatureDialog(
                context, 'Language Settings', 'Change your preferred language'),
          ),
          _buildListItem(
            icon: Icons.location_on,
            title: 'Country & Currency',
            onTap: () => _showFeatureDialog(context, 'Country & Currency',
                'Change your country and currency settings'),
          ),
          _buildListItem(
            icon: Icons.notifications,
            title: 'Notification Settings',
            onTap: () => _showFeatureDialog(context, 'Notification Settings',
                'Manage your notification preferences'),
          ),
          _buildListItem(
            icon: Icons.help,
            title: 'Customer Service',
            onTap: () => _showFeatureDialog(context, 'Customer Service',
                'Get help with your orders and issues'),
          ),
          _buildListItem(
            icon: Icons.feedback,
            title: 'Feedback',
            onTap: () => _showFeatureDialog(
                context, 'Feedback', 'Send feedback about the Amazon app'),
          ),
          _buildListItem(
            icon: Icons.info,
            title: 'About',
            onTap: () => _showAboutAppDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppConstants.primaryColor, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppConstants.bodyText2.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppConstants.primaryColor),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  // Navigation methods
  void _navigateToCategoryProducts(BuildContext context, String category) {
    // Dispatch an event to fetch products by category
    context.read<ProductBloc>().add(FetchProductsByCategory(category));

    // Navigate back to the home tab to show results
    _switchToHomeTab(context);

    // Show a message that we're loading products
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Browsing $category'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _navigateToAllCategories(BuildContext context) {
    _showFeatureDialog(
      context,
      'All Categories',
      'Browse all product categories',
    );
  }

  void _showSearchDialog(BuildContext context) {
    _showFeatureDialog(
      context,
      'Search',
      'Search for products across all categories',
    );
  }

  void _showSignInDialog(BuildContext context) {
    _showFeatureDialog(
      context,
      'Sign In',
      'Sign in with your Amazon account for a personalized shopping experience',
    );
  }

  void _showCategoryDialog(BuildContext context, String category) {
    _showFeatureDialog(
      context,
      category,
      'Browse products in the $category category',
    );
  }

  void _switchToHomeTab(BuildContext context) {
    // Find the nearest TabController ancestor and use it to navigate
    final tabController = DefaultTabController.of(context);
    tabController.animateTo(0); // Home tab is at index 0
  }

  void _navigateToAccountTab(BuildContext context) {
    // Find the nearest TabController ancestor and use it to navigate
    final tabController = DefaultTabController.of(context);
    tabController.animateTo(1); // Account tab is at index 1
  }

  void _showAboutAppDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AboutDialog(
        applicationName: 'Amazon Clone',
        applicationVersion: '1.0.0',
        applicationIcon: const Icon(
          Icons.shopping_cart,
          color: AppConstants.primaryColor,
          size: 50,
        ),
        children: [
          const SizedBox(height: 16),
          const Text(
            'This is a Flutter demonstration app created as an Amazon clone for educational purposes.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          const Text(
            'Features include product browsing, cart management, and UI similar to the Amazon shopping app.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  void _showFeatureDialog(
      BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(height: 16),
            const Text(
              'This feature would be implemented in a full version of the app.',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
