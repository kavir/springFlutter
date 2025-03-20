import 'package:flutter/material.dart';

class ToastUtils {
  static final ToastUtils _instance = ToastUtils._internal();

  factory ToastUtils() {
    return _instance;
  }

  ToastUtils._internal();

  OverlayEntry? _overlayEntry;

  // Helper method to remove the toast overlay after the duration ends
  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  // Method to show the toast with a custom widget
  void _showToast(BuildContext context, Widget toastContent,
      {Duration duration = const Duration(seconds: 2)}) {
    // Check if an overlay is already active, remove it before showing a new one
    if (_overlayEntry != null) {
      _removeOverlay();
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0, // Positioning at the top of the screen
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: toastContent,
        ),
      ),
    );

    Overlay.of(context)?.insert(_overlayEntry!);

    // Remove the toast after the duration
    Future.delayed(duration, _removeOverlay);
  }

  // Method to show the success toast
  void showSuccessToast(BuildContext context, String message) {
    _showToast(
      context,
      _buildCustomToast(
        message: message,
        icon: Icons.check,
        backgroundColor: Colors.green,
        iconColor: Colors.white,
      ),
    );
  }

  // Method to show the error toast
  void showErrorToast(BuildContext context, String message) {
    _showToast(
      context,
      _buildCustomToast(
        message: message,
        icon: Icons.error,
        backgroundColor: Colors.red,
        iconColor: Colors.white,
      ),
    );
  }

  // Build the custom toast widget with an icon and message
  Widget _buildCustomToast({
    required String message,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 24.0),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
              maxLines: 2, // Set maximum number of lines to 2
              overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
            ),
          ),
        ],
      ),
    );
  }
}
