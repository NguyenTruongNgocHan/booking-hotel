import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityCtrl = TextEditingController(text: "Ho Chi Minh City");
  DateTime? _checkIn, _checkOut;
  int _guests = 2;

  Future<void> _pickDate({required bool isCheckIn}) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: (isCheckIn ? _checkIn : _checkOut) ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkIn = picked;
          if (_checkOut != null && _checkOut!.isBefore(_checkIn!)) {
            _checkOut = _checkIn!.add(const Duration(days: 1));
          }
        } else {
          _checkOut = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Booking Hotel")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tìm phòng của bạn", style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            TextField(
              controller: _cityCtrl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_on_outlined),
                hintText: "Thành phố, khách sạn...",
              ),
            ),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () => _pickDate(isCheckIn: true),
                  child: const InputDecorator(
                    decoration: InputDecoration(prefixIcon: Icon(Icons.calendar_today)),
                    child: Text("Nhận phòng"),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () => _pickDate(isCheckIn: false),
                  child: const InputDecorator(
                    decoration: InputDecoration(prefixIcon: Icon(Icons.calendar_month_outlined)),
                    child: Text("Trả phòng"),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: InputDecorator(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.people_outline)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: _guests,
                      items: [1,2,3,4,5].map((e)=>DropdownMenuItem(value:e, child: Text("$e khách"))).toList(),
                      onChanged: (v) => setState(()=> _guests = v ?? 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(child: AppPrimaryButton(label: "Tìm phòng", onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fake search…")));
              })),
            ]),
          ],
        ),
      ),
    );
  }
}
