import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PixelfordImage {
  final String id;
  final String author;
  final String url;
  @JsonKey(name: 'download_url')
  final String downloadUrl;

  PixelfordImage({
    required this.id,
    required this.author,
    required this.url,
    required this.downloadUrl,
  });

  factory PixelfordImage.fromJson(Map<String, dynamic> json) =>
      _$PixelfordImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixelfordImageToJson(this);
}
