import 'package:flutter/material.dart';

class PageActionsBottomModalSheet extends StatelessWidget {
  const PageActionsBottomModalSheet({super.key, required this.json});

  final String json;

  Widget _buildIconButton(IconData icon, String label, VoidCallback onPressed) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      label: Text(label),
      style: OutlinedButton.styleFrom(
        alignment: AlignmentGeometry.centerLeft,
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      ),
      icon: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        _buildIconButton(Icons.bookmark, 'Save', () {}),
        Divider(height: 0),
        _buildIconButton(Icons.info, 'Information', () {}),
        Divider(height: 0),
        _buildIconButton(Icons.data_object, 'JSON', () {
          showDialog(
            context: context,
            builder: (_) => SimpleDialog(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(json),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
