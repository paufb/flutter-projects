import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:wikipedia_browser/api/models/page.dart';

class APIService {
  Future<PageSummaryResponse> getRandomPageSummary() async {
    final uri = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/random/summary',
    );
    final response = await get(uri);
    if (response.statusCode != 200) {
      throw HttpException('Error fetching random page summary');
    }
    return PageSummaryResponse.fromJson(jsonDecode(response.body));
  }
}
