import 'package:flutter/material.dart';

class SystemMaintenanceDialog extends StatelessWidget {
  const SystemMaintenanceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            Image.asset(
              "assets/images/img_system_maintenance.png",
              height: 120,
            ),

            const SizedBox(height: 16),

            /// Title
            const Text(
              "System Maintenance",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 10),

            /// Description
            const Text(
              "Cash withdrawal is currently unavailable. Please try again later.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),

            const SizedBox(height: 22),

            /// Close Button
            SizedBox(
              width: 120,
              height: 36,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Close"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showSystemMaintenanceDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const SystemMaintenanceDialog();
    },
  );
}
