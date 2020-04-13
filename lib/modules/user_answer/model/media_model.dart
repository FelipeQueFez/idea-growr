class MediaModel {
  final String imagePath;
  final String audioPath;
  final String anotation;

  MediaModel(this.imagePath, this.audioPath, this.anotation);

  MediaModel.fromJsonMap(Map<String, dynamic> json)
      : imagePath = json['imagePath'],
        audioPath = json['audioPath'],
        anotation = json['anotation'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['audioPath'] = this.audioPath;
    data['anotation'] = this.anotation;

    return data;
  }
}
