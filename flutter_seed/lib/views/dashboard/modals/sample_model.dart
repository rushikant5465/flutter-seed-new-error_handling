import 'package:json_annotation/json_annotation.dart';

part 'sample_model.g.dart';

@JsonSerializable()
class SampleModel {
  final String id;
  final String name;
  final String nickname;
  
  @JsonKey(required: true)
  final bool profile_complete;

  @JsonKey(disallowNullValue: true)
  final String avatar;
  
  @JsonKey(defaultValue: false)
  final bool graduated;

  @JsonKey(name: 'current_address')
  final String? address;

@JsonKey(fromJson: _convertTobool)
  final bool? expert;

  SampleModel(this.id, this.name, this.nickname, this.avatar, this.profile_complete ,this.graduated, this.expert, this.address);
  factory SampleModel.fromJson(Map<String, dynamic> json) => _$SampleModelFromJson(json);
}

bool _convertTobool(value) {
  if (value is String) {
    if (value.toLowerCase() == "true")
      return true;
    else
      return false;
  } else
    return value;
}