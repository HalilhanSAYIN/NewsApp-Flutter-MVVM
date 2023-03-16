class Const {
  static const apiKey = 'YOUR API KEY HERE';
  static const String topNews =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
  static String topNewsbyCategory(String category) {
    return 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey';
  }

  static const Map<String, String> categories = {
    'General': 'general',
    'Entertainment': 'entertainment',
    'Business': 'business',
    'Science': 'science',
    'Sports': 'sports',
  };
}
