import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wikipedia_browser/services/api.dart';

class PageActionsBottomModalSheet extends StatelessWidget {
  const PageActionsBottomModalSheet({super.key, required this.title});

  final String title;

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
        _buildIconButton(Icons.open_in_new, 'HTML', () async {
          await launchUrl(APIService.buildHtmlUri(title));
        }),
        Divider(height: 0),
        _buildIconButton(Icons.open_in_new, 'Mobile HTML', () async {
          await launchUrl(APIService.buildMobileHtmlUri(title));
        }),
      ],
    );
  }
}
