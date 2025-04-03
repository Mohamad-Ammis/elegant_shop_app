import 'dart:developer';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';

class ElegantNotificationService {
  static OverlayEntry? _currentOverlayEntry;

  static void showSuccessSnackBar(String title, String message) {
    _showNotification(
      ElegantNotification.success(
        animationCurve: Curves.bounceInOut,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        toastDuration: const Duration(milliseconds: 2500),
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        title: Text(title, style: const TextStyle(fontFamily: kFontFamily)),
        description: Text(
          message,
          style: const TextStyle(fontFamily: kFontFamily),
        ),
      ),
    );
  }

  static void showErrorSnackBar(String title, String message) {
    _showNotification(
      ElegantNotification.error(
        animationCurve: Curves.bounceInOut,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        toastDuration: const Duration(milliseconds: 2500),
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        title: Text(title, style: const TextStyle(fontFamily: kFontFamily)),
        description: Text(
          message,
          style: const TextStyle(fontFamily: kFontFamily),
        ),
      ),
    );
  }

  static void showInfoSnackBar(String title, String message) {
    _showNotification(
      ElegantNotification.info(
        
        height: 120,
        animationCurve: Curves.bounceInOut,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        toastDuration: const Duration(milliseconds: 2500),
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        title: Text(title, style: const TextStyle(fontFamily: kFontFamily)),
        description: Text(
          message,
          style: const TextStyle(fontFamily: kFontFamily),
        ),
      ),
    );
  }

  static void _showNotification(ElegantNotification notification) {
    _dismissCurrentNotification();

    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) {
      log("❌check setup navigator key in material app");
      return;
    }

    _currentOverlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Material(color: Colors.transparent, child: notification),
          ),
    );

    overlay.insert(_currentOverlayEntry!);

    Future.delayed(notification.toastDuration, () {
      _dismissCurrentNotification();
    });
  }

  static void _dismissCurrentNotification() {
    if (_currentOverlayEntry != null) {
      try {
        _currentOverlayEntry?.remove();
        _currentOverlayEntry = null;
      } catch (e) {
        log("⚠️ dismissNotification failed: $e");
      }
    }
  }
}
