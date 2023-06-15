// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleModel _$SampleModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['profile_complete'],
    disallowNullValues: const ['avatar'],
  );
  return SampleModel(
    json['id'] as String,
    json['name'] as String,
    json['nickname'] as String,
    json['avatar'] as String,
    json['profile_complete'] as bool,
    json['graduated'] as bool? ?? false,
    _convertTobool(json['expert']),
    json['current_address'] as String?,
  );
}

Map<String, dynamic> _$SampleModelToJson(SampleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'profile_complete': instance.profile_complete,
      'avatar': instance.avatar,
      'graduated': instance.graduated,
      'current_address': instance.address,
      'expert': instance.expert,
    };
