import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_constants.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        title: const Text('Your Account'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              _showSearchDialog(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {
              _showNotificationsDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserHeader(context),
            _buildOrdersAndWishlistSection(context),
            _buildAccountSettings(context),
            _buildPaymentOptions(context),
            _buildMessagesAndContactSection(context),
            _buildAppSettings(context),
            _buildCustomerService(context),
            _buildSignOutButton(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildUserHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: AppConstants.primaryColor,
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello, User',
                  style: AppConstants.headline3,
                ),
                Text(
                  'user@example.com',
                  style: AppConstants.bodyText2.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              _navigateToProfileEdit(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersAndWishlistSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Orders & Lists',
            style: AppConstants.headline3,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildMenuTile(
                icon: Icons.shopping_bag_outlined,
                title: AppConstants.yourOrders,
                onTap: () => _navigateToOrders(context),
              ),
              _buildMenuTile(
                icon: Icons.favorite_border,
                title: AppConstants.wishlist,
                onTap: () => _navigateToWishlist(context),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildMenuTile(
                icon: Icons.replay,
                title: AppConstants.buyAgain,
                onTap: () => _navigateToBuyAgain(context),
              ),
              _buildMenuTile(
                icon: Icons.history,
                title: 'Browsing History',
                onTap: () => _navigateToBrowsingHistory(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettings(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account Settings',
            style: AppConstants.headline3,
          ),
          const SizedBox(height: 16),
          _buildSettingItem(
            icon: Icons.person_outline,
            title: 'Your Profile',
            onTap: () => _navigateToProfile(context),
          ),
          _buildSettingItem(
            icon: Icons.location_on_outlined,
            title: 'Your Addresses',
            onTap: () => _navigateToAddresses(context),
          ),
          _buildSettingItem(
            icon: Icons.shield_outlined,
            title: 'Login & Security',
            onTap: () => _navigateToSecurity(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payments',
            style: AppConstants.headline3,
          ),
          const SizedBox(height: 16),
          _buildSettingItem(
            icon: Icons.credit_card,
            title: 'Your Payment Options',
            onTap: () => _navigateToPaymentOptions(context),
          ),
          _buildSettingItem(
            icon: Icons.receipt_outlined,
            title: 'View Payment History',
            onTap: () => _navigateToPaymentHistory(context),
          ),
          _buildSettingItem(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Manage Gift Cards',
            onTap: () => _navigateToGiftCards(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesAndContactSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Messages & Communication',
            style: AppConstants.headline3,
          ),
          const SizedBox(height: 16),
          _buildSettingItem(
            icon: Icons.message_outlined,
            title: 'Your Messages',
            onTap: () => _navigateToMessages(context),
          ),
          _buildSettingItem(
            icon: Icons.email_outlined,
            title: 'Communication Preferences',
            onTap: () => _navigateToCommunicationPreferences(context),
          ),
        ],
      ),
    );
  }

  Widget _buildAppSettings(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'App Settings',
            style: AppConstants.headline3,
          ),
          const SizedBox(height: 16),
          _buildSettingItem(
            icon: Icons.language_outlined,
            title: 'Country & Language',
            onTap: () => _navigateToLanguageSettings(context),
          ),
          _buildSettingItem(
            icon: Icons.notifications_outlined,
            title: 'Notification Settings',
            onTap: () => _navigateToNotificationSettings(context),
          ),
          _buildSettingItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Legal & Privacy',
            onTap: () => _navigateToPrivacySettings(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerService(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Customer Service',
            style: AppConstants.headline3,
          ),
          const SizedBox(height: 16),
          _buildSettingItem(
            icon: Icons.headset_mic_outlined,
            title: 'Customer Service',
            onTap: () => _navigateToCustomerService(context),
          ),
          _buildSettingItem(
            icon: Icons.help_outline,
            title: 'Help Center',
            onTap: () => _navigateToHelpCenter(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            _showSignOutDialog(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: AppConstants.secondaryColor,
          ),
          child: const Text(
            'Sign Out',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
        ),
      ),
    );
  }

  Widget _buildSettingItem({
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

  // Navigation and Dialog methods
  void _navigateToProfileEdit(BuildContext context) {
    _showFeatureDialog(
        context, 'Edit Profile', 'Edit your profile information');
  }

  void _navigateToOrders(BuildContext context) {
    _showFeatureDialog(context, 'Your Orders',
        'View your order history and track current orders');
  }

  void _navigateToWishlist(BuildContext context) {
    _showFeatureDialog(context, 'Wishlist', 'View your saved items');
  }

  void _navigateToBuyAgain(BuildContext context) {
    _showFeatureDialog(
        context, 'Buy Again', 'Quickly reorder your favorite items');
  }

  void _navigateToBrowsingHistory(BuildContext context) {
    _showFeatureDialog(
        context, 'Browsing History', 'View items you\'ve recently viewed');
  }

  void _navigateToProfile(BuildContext context) {
    _showFeatureDialog(
        context, 'Your Profile', 'Manage your personal information');
  }

  void _navigateToAddresses(BuildContext context) {
    _showFeatureDialog(context, 'Your Addresses',
        'Manage your shipping and billing addresses');
  }

  void _navigateToSecurity(BuildContext context) {
    _showFeatureDialog(
        context, 'Login & Security', 'Update password and security settings');
  }

  void _navigateToPaymentOptions(BuildContext context) {
    _showFeatureDialog(
        context, 'Payment Options', 'Manage your payment methods');
  }

  void _navigateToPaymentHistory(BuildContext context) {
    _showFeatureDialog(context, 'Payment History', 'View your payment history');
  }

  void _navigateToGiftCards(BuildContext context) {
    _showFeatureDialog(context, 'Gift Cards', 'Manage your gift card balance');
  }

  void _navigateToMessages(BuildContext context) {
    _showFeatureDialog(
        context, 'Your Messages', 'View your messages from Amazon');
  }

  void _navigateToCommunicationPreferences(BuildContext context) {
    _showFeatureDialog(context, 'Communication Preferences',
        'Manage email preferences and notifications');
  }

  void _navigateToLanguageSettings(BuildContext context) {
    _showFeatureDialog(context, 'Country & Language',
        'Change your country and language settings');
  }

  void _navigateToNotificationSettings(BuildContext context) {
    _showFeatureDialog(context, 'Notification Settings',
        'Manage your notification preferences');
  }

  void _navigateToPrivacySettings(BuildContext context) {
    _showFeatureDialog(
        context, 'Legal & Privacy', 'View privacy policy and terms of service');
  }

  void _navigateToCustomerService(BuildContext context) {
    _showFeatureDialog(
        context, 'Customer Service', 'Get help with your orders and issues');
  }

  void _navigateToHelpCenter(BuildContext context) {
    _showFeatureDialog(
        context, 'Help Center', 'Find answers to common questions');
  }

  void _showSearchDialog(BuildContext context) {
    _showFeatureDialog(context, 'Search', 'Search for products and orders');
  }

  void _showNotificationsDialog(BuildContext context) {
    _showFeatureDialog(context, 'Notifications', 'View your notifications');
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Clear user data
              context.read<CartBloc>().add(const ClearCart());
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Signed out successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Sign Out'),
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
