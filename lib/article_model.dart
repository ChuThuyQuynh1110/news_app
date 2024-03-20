class Article {
  final String? source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;
  final String category;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.category,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    final keywords = {
      'Politics': ['politics', 'election', 'government', 'party', 'congress', 'president', 'parliament', 'democracy'],
      'Sports': ['sports', 'football', 'basketball', 'tennis', 'racing', 'olympics'],
      'Health': ['health', 'medical', 'disease', 'virus', 'healthcare', 'hospital'],
      'Music': ['music', 'song', 'band', 'singer', 'musician', 'album', 'concert', 'artist', 'pop', 'rock'],
      'Tech': ['technology', 'industry', 'innovation', 'device', 'app', 'internet', 'software', 'hardware', 'startup', 'coding']
    };

    final title = json['title']?.toString().toLowerCase() ?? '';
    final description = json['description']?.toString().toLowerCase() ?? '';

    String category = 'General'; // Mặc định là General
    keywords.forEach((key, value) {
      if (value.any((keyword) => title.contains(keyword)) || value.any((keyword) => description.contains(keyword))) {
        category = key;
      }
    });

    return Article(
      source: json['source'] != null ? json['source']['name'] : null,
      author: json['author'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'],
      category: category,
    );
  }
}


