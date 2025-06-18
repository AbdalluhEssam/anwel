import 'package:flutter/material.dart';

enum SnackBarType { success, error, warning, loading }

void showCustomSnackBar(
    BuildContext context, {
      required String message,
      required SnackBarType type,
      Duration duration = const Duration(seconds: 3),
    }) {
  Widget icon;
  Color backgroundColor;

  switch (type) {
    case SnackBarType.success:
      icon = const Icon(Icons.check_circle, color: Colors.white);
      backgroundColor = Colors.green;
      break;
    case SnackBarType.error:
      icon = const Icon(Icons.error_outline, color: Colors.white);
      backgroundColor = Colors.redAccent;
      break;
    case SnackBarType.warning:
      icon = const Icon(Icons.warning_amber_rounded, color: Colors.black87);
      backgroundColor = Colors.amber;
      break;
    case SnackBarType.loading:
      icon =  SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
      backgroundColor = Colors.blueAccent;
      break;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          icon,
          const SizedBox(width: 12),
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(16),
    ),
  );
}