import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PixelfromImage {
  String id;
  String filename;
  String? title;

  @JsonKey(name: 'url_full_size')
  String urlFullSize;

  @JsonKey(name: 'url_small_size')
  String urlSmallSize;

  PixelfromImage(
      {this.title,
      required this.filename,
      required this.id,
      required this.urlFullSize,
      required this.urlSmallSize});

  factory PixelformImage.fromJson(Map<String, dynamic> json) =>
      _$PixelformImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixelformImageToJson(this);
}
