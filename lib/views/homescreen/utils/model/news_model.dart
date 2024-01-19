class newsmodel {
  var source;
  var author;
  var title;
  var description;
  var url;
  var urlToImage;

  newsmodel(
      {required this.description,
      required this.title,
      required this.author,
      required this.url,
      required this.urlToImage,
      required this.source});

  factory newsmodel.js({required Map data}) {
    return newsmodel(
        description: data['description'],
        title: data['title'],
        url: data['url'],
        urlToImage: data['urlToImage'],
        author: data['author'],
        source: data['source']);
  }
}
