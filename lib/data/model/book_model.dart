class Book {
  final int id;
  final String title;
  final List<String> subjects;
  final List<Person> authors;
  final List<Person> translators;
  final List<String> bookshelves;
  final List<String> languages;
  final bool? copyright;
  final String mediaType;
  final Format formats;
  final int downloadCount;

  Book({
    required this.id,
    required this.title,
    required this.subjects,
    required this.authors,
    required this.translators,
    required this.bookshelves,
    required this.languages,
    this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      title: json['title'] as String,
      subjects: (json['subjects'] as List<dynamic>).cast<String>(),
      authors: (json['authors'] as List<dynamic>)
          .map((author) => Person.fromJson(author))
          .toList(),
      translators: (json['translators'] as List<dynamic>)
          .map((translator) => Person.fromJson(translator))
          .toList(),
      bookshelves: (json['bookshelves'] as List<dynamic>).cast<String>(),
      languages: (json['languages'] as List<dynamic>).cast<String>(),
      copyright: json['copyright'] as bool?,
      mediaType: json['media_type'] as String,
      formats: Format.fromJson(json['formats'] as Map<String, dynamic>),
      downloadCount: json['download_count'] as int,
    );
  }
}

class Format {
  final String? textHtml;
  final String? textHtmlUtf8;
  final String? applicationEpubZip;
  final String? applicationXmobipocketEbook;
  final String? textPlainUtf8;
  final String? applicationRdfXml;
  final String? imageJpeg;
  final String? applicationOctetStream;
  final String? textPlainUsAscii;

  Format({
    this.textHtml,
    this.textHtmlUtf8,
    this.applicationEpubZip,
    this.applicationXmobipocketEbook,
    this.textPlainUtf8,
    this.applicationRdfXml,
    this.imageJpeg,
    this.applicationOctetStream,
    this.textPlainUsAscii,
  });

  factory Format.fromJson(Map<String, dynamic> json) {
    return Format(
      textHtml: json['text/html'],
      textHtmlUtf8: json['text/html; charset=utf-8'],
      applicationEpubZip: json['application/epub+zip'],
      applicationXmobipocketEbook: json['application/x-mobipocket-ebook'],
      textPlainUtf8: json['text/plain; charset=utf-8'],
      applicationRdfXml: json['application/rdf+xml'],
      imageJpeg: json['image/jpeg'],
      applicationOctetStream: json['application/octet-stream'],
      textPlainUsAscii: json['text/plain; charset=us-ascii'],
    );
  }
}

class Person {
  final int? birthYear;
  final int? deathYear;
  final String name;

  Person({this.birthYear, this.deathYear, required this.name});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      birthYear: json['birth_year'] as int?,
      deathYear: json['death_year'] as int?,
      name: json['name'] as String,
    );
  }
}
