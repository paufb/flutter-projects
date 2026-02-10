class PageSummaryResponse {
  final _Titles titles;
  final String extract;
  final String extract_html;
  final _Image thumbnail;
  final _Image originalimage;
  final String lang;
  final String dir;
  final String description;

  PageSummaryResponse({
    required this.titles,
    required this.extract,
    required this.extract_html,
    required this.thumbnail,
    required this.originalimage,
    required this.lang,
    required this.dir,
    required this.description,
  });

  factory PageSummaryResponse.fromJson(Map<String, dynamic> json) =>
      PageSummaryResponse(
        titles: _Titles.fromJson(json["titles"]),
        extract: json["extract"],
        extract_html: json["extract_html"],
        thumbnail: _Image.fromJson(json["thumbnail"]),
        originalimage: _Image.fromJson(json["originalimage"]),
        lang: json["lang"],
        dir: json["dir"],
        description: json["description"],
      );
}

class _Titles {
  final String canonical;
  final String normalized;
  final String display;

  _Titles({
    required this.canonical,
    required this.normalized,
    required this.display,
  });

  factory _Titles.fromJson(Map<String, dynamic> json) => _Titles(
    canonical: json["canonical"],
    normalized: json["normalized"],
    display: json["display"],
  );
}

class _Image {
  final String source;
  final int width;
  final int height;

  _Image({required this.source, required this.width, required this.height});

  factory _Image.fromJson(Map<String, dynamic> json) => _Image(
    source: json["source"],
    width: json["width"],
    height: json["height"],
  );
}
