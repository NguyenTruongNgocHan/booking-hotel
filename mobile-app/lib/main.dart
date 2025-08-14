import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BookingHotelApp());
}

class BookingHotelApp extends StatelessWidget {
  const BookingHotelApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Hotel',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
