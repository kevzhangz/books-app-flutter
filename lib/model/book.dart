class BookModel {
  final VolumeInfo volumeInfo;
  final AccessInfo accessInfo;

  BookModel({required this.volumeInfo, required this.accessInfo});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
        accessInfo: AccessInfo.fromJson(json['accessInfo'])
    );
  }
}

class VolumeInfo {
  final String title;
  final String description;
  final List<dynamic> authors;
  final String language;
  final String publisher;
  final String publishedDate;
  final String previewLink;
  final String infoLink;
  final ImageLinks imageLinks;
  final String categories;

  VolumeInfo(
      {
      required this.title,
      required this.description,
      required this.authors,
      required this.language,
      required this.publisher,
      required this.publishedDate,
      required this.imageLinks,
      required this.previewLink,
      required this.infoLink,
      required this.categories,
      }
  );

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
        title: json['title'],
        description: json['description'] ?? '',
        authors: json['authors'] != null ? json['authors'] as List : [],
        language: json['language'] == 'id' ? 'Indonesia' : 'English',
        publisher: json['publisher'] ?? '',
        publishedDate: json['publishedDate'] ?? '',
        imageLinks: ImageLinks.fromJson(json['imageLinks']),
        previewLink: json['previewLink'],
        infoLink: json['infoLink'],
        categories: json['categories'] != null ? json['categories'][0] : '',
    );
  }
}

class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
        smallThumbnail: json != null ? json['smallThumbnail'] : '',
        thumbnail: json != null ? json['thumbnail'] : '');
  }
}

class AccessInfo {
  String webReaderLink;

  AccessInfo({required this.webReaderLink});

  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return AccessInfo(webReaderLink: json['webReaderLink']);
  }
}