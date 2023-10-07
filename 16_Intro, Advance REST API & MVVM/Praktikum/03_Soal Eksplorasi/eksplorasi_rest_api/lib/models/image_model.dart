class ImageModel {
  final String svgData;

  ImageModel({required this.svgData});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(svgData: json['svgData']);
  }
}
