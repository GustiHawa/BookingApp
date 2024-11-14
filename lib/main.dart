import 'package:flutter/material.dart';
// Import screens
import 'screens/choice_login_screen.dart';

// import screens login user, pemilik, dan admin
import 'screens/user/user_login_screen.dart';
import 'screens/owner/owner_login_screen.dart' as owner;
import "screens/admin/admin_login_screen.dart" as admin;

import 'screens/register_screen.dart';
import 'screens/user/user_home_screen.dart';
import 'screens/user/user_notification_screen.dart';
import 'screens/user/user_history_screen.dart';
import 'screens/user/user_search_screen.dart';
import 'screens/user/user_listcafe_screen.dart';
import 'screens/user/user_detailcafe_screen.dart';
// import 'screens/user/user_booking_screen.dart';
// import 'screens/user/user_payment_screen.dart';
// import 'screens/owner/owner_home_screen.dart';
// import 'screens/owner/owner_manage_store_screen.dart';
// import 'screens/owner/owner_order_screen.dart';
// import 'screens/owner/owner_history_screen.dart';
// import 'screens/owner/owner_notification_screen.dart';
// import 'screens/owner/owner_balance_report_screen.dart';
// import 'screens/admin/admin_dashboard_screen.dart';
// import 'screens/admin/admin_notification_screen.dart';
// import 'screens/admin/admin_verification_screen.dart';
// import 'screens/admin/admin_place_management_screen.dart';
// import 'screens/admin/admin_commission_report_screen.dart';

// Define the missing variables
const primaryColor = Colors.blue;
const backgroundColor = Colors.white;
const appBarTitleStyle = TextStyle(color: Colors.white, fontSize: 20);
const bodyTextStyle = TextStyle(color: Colors.black, fontSize: 16);
const subtitleTextStyle = TextStyle(color: Colors.grey, fontSize: 14);
const headingTextStyle = TextStyle(color: Colors.black, fontSize: 24);
const buttonColor = Colors.blue;
const buttonTextStyle = TextStyle(color: Colors.white, fontSize: 16);

void main() => runApp(const RumahNugasApp());

class RumahNugasApp extends StatelessWidget {
  const RumahNugasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rumah Nugas',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          centerTitle: true,
          titleTextStyle: appBarTitleStyle,
        ),
        textTheme: const TextTheme(
          bodyLarge: bodyTextStyle, // bodyLarge menggantikan bodyText1
          bodyMedium: subtitleTextStyle, // bodyMedium menggantikan bodyText2
          titleLarge: headingTextStyle, // titleLarge menggantikan headline6
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                buttonColor, // Gunakan backgroundColor sebagai pengganti primary
            foregroundColor: Colors
                .white, // Gunakan foregroundColor sebagai pengganti onPrimary
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            textStyle: buttonTextStyle,
          ),
        ),
      ),
      initialRoute: '/', // Set initial route to '/'
      routes: {
        // Common routes
        '/': (context) =>
            const ChoiceLoginScreen(), // ChoiceLoginScreen will be the first screen
        '/register': (context) => const RegisterScreen(),

        // Rute untuk halaman login
        '/loginUser': (context  ) => const UserLoginScreen(),
        '/loginPemilik': (context) => const owner.OwnerLoginScreen(),
        '/loginAdmin': (context) => const admin.AdminLoginScreen(),

        // User routes
        '/userHome': (context) => const UserHomeScreen(),
        '/userSearch': (context) => const UserSearchScreen(),
        '/userNotification': (context) => const UserNotificationScreen(),
        '/userHistory': (context) => const UserHistoryScreen(),
        '/userListcafe': (context) =>
            const UserListCafeScreen(kampus: '', warkopTerdekat: []),
        '/userDetailcafe': (context) => const UserDetailCafeScreen(
              namaCafe: '',
              ratingCafe: '',
              deskripsiCafe: '',
              lokasiCafe: '',
              hargaCafe: '',
            ),

        // Owner routes
        // '/ownerHome': (context) => const OwnerHomeScreen(),
        // '/ownerManageStore': (context) => const OwnerManageStoreScreen(),
        // '/ownerOrder': (context) => const OwnerOrderScreen(),
        // '/ownerHistory': (context) => const OwnerHistoryScreen(),
        // '/ownerNotification': (context) => const OwnerNotificationScreen(),
        // '/ownerBalanceReport': (context) => const OwnerBalanceReportScreen(),

        // Admin routes
        // '/adminDashboard': (context) => const AdminDashboardScreen(),
        // '/adminNotification': (context) => const AdminNotificationScreen(),
        // '/adminVerification': (context) => const AdminVerificationScreen(),
        // '/adminPlaceManagement': (context) => const AdminPlaceManagementScreen(),
        // '/adminCommissionReport': (context) => const AdminCommissionReportScreen(),
      },
    );
  }
}

