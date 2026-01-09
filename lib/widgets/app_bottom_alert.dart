import 'package:flutter/material.dart';

Future<void> showBottomAlert(
  BuildContext context, {
  required String title,
  required String description,
  String okText = 'OK',
  String? cancelText,
  VoidCallback? onOk,
  VoidCallback? onCancel,
  bool isDismissible = false,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: isDismissible,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16), // iOS edge padding
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.circular(35),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              /// Description
              Text(
                description,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              /// Buttons
              Row(
                children: [
                  if (cancelText != null)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onCancel?.call();
                        },
                        child: Text(cancelText),
                      ),
                    ),

                  if (cancelText != null) const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onOk?.call();
                      },
                      child: Text(okText),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
