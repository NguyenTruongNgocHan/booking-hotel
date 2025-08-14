import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  const AppPrimaryButton({super.key, required this.label, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon ?? Icons.search),
      label: Text(label),
      style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary),
    );
  }
}
