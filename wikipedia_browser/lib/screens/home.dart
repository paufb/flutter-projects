import 'package:flutter/material.dart';
import 'package:wikipedia_browser/api/models/page.dart';
import 'package:wikipedia_browser/services/api.dart';
import 'package:wikipedia_browser/widgets/page_preview_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiService = APIService();
  final List<PageSummaryResponse> _pageSummaries = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  bool _isInitialLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRandomPages(10);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _fetchRandomPages(5);
      }
    });
  }

  Future<void> _fetchRandomPages(int amount) async {
    if (_isLoadingMore) return;
    if (_isInitialLoading) _isInitialLoading = false;
    setState(() => _isLoadingMore = true);
    final pageSummaries = await Future.wait(
      List.generate(amount, (_) => apiService.getRandomPageSummary()),
    );
    setState(() {
      _pageSummaries.addAll(pageSummaries);
      _isLoadingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isInitialLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                _pageSummaries.clear();
                await _fetchRandomPages(10);
              },
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.all(12),
                itemCount: _pageSummaries.length + 1,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (_, index) {
                  if (index == _pageSummaries.length) {
                    return _isLoadingMore
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : const SizedBox.shrink();
                  }
                  final summary = _pageSummaries[index];
                  return PagePreviewCard(
                    title: summary.titles.normalized,
                    thumbnailSource: summary.thumbnail.source,
                    description: summary.extract,
                  );
                },
              ),
            ),
    );
  }
}
