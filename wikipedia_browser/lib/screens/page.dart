import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipedia_browser/widgets/page/page_actions_modal_bottom_sheet.dart';
import 'package:wikipedia_browser/widgets/page/page_details.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.canPop() ? context.pop() : context.go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => PageActionsBottomModalSheet(title: title),
              );
            },
          ),
        ],
      ),
      body: PageDetails(title: title),
    );
  }
}
