import 'package:flutter/material.dart';
import 'package:wikipedia_browser/services/api.dart';
import 'package:wikipedia_browser/widgets/page_preview_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Future.wait(
            List.generate(5, (_) => apiService.getRandomPageSummary()),
          ),
          builder: (_, snapshot) {
            return switch ((snapshot.connectionState, snapshot.hasError)) {
              (ConnectionState.waiting, _) => const Center(
                child: CircularProgressIndicator(),
              ),
              (_, true) => Center(
                child: Text('Error getting news: ${snapshot.error}'),
              ),
              (_, _) => ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: snapshot.data!.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (_, index) {
                  final summary = snapshot.data![index];
                  return PagePreviewCard(
                    title: summary.titles.normalized,
                    thumbnailSource: summary.thumbnail.source,
                    description: summary.extract,
                  );
                },
              ),
            };
          },
        ),
      ),
    );
  }
}
