class Photo {
  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  Photo({
     this.id,
     this.author,
     this.width,
     this.height,
     this.url,
     this.downloadUrl,
  });

  factory Photo.fromJson(Map<String?, dynamic> json) {
    return Photo(
      id: json['id'].toString(),
      author: json['author'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      downloadUrl: json['download_url'],
    );
  }
}
