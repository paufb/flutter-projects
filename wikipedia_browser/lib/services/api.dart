import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:wikipedia_browser/api/models/page.dart';

class APIService {
  static final _authority = "en.wikipedia.org";
  static final _unencodedPathBase = "/api/rest_v1/page";

  static Uri buildHtmlUri(String title) =>
      Uri.https(_authority, '$_unencodedPathBase/html/$title');

  static Uri buildMobileHtmlUri(String title) =>
      Uri.https(_authority, '$_unencodedPathBase/mobile-html/$title');

  Future<PageSummaryResponse> getRandomPageSummary() async {
    final uri = Uri.https(_authority, "$_unencodedPathBase/random/summary");
    final response = await get(uri);
    if (response.statusCode != 200) {
      throw HttpException('Error fetching random page summary');
    }
    return PageSummaryResponse.fromJson(jsonDecode(response.body));
  }
}
