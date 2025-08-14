import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

// Đổi 'booking_app' theo tên trong pubspec.yaml nếu cần
import 'package:booking_app/main.dart';

void main() {
  testWidgets('Home renders with title Booking Hotel', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const BookingHotelApp());

    // Kiểm tra có AppBar title
    expect(find.text('Booking Hotel'), findsOneWidget);

    // Kiểm tra có ô nhập thành phố mặc định
    expect(find.byType(TextField), findsOneWidget);
    expect(find.textContaining('Thành phố'), findsOneWidget);

    // Kiểm tra có nút "Tìm phòng"
    expect(find.text('Tìm phòng'), findsOneWidget);
  });
}
