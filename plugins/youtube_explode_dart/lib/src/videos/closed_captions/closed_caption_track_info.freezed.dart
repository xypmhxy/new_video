// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closed_caption_track_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClosedCaptionTrackInfo _$ClosedCaptionTrackInfoFromJson(
    Map<String, dynamic> json) {
  return _ClosedCaptionTrackInfo.fromJson(json);
}

/// @nodoc
mixin _$ClosedCaptionTrackInfo {
  /// Manifest URL of the associated track.
  Uri get url => throw _privateConstructorUsedError;

  /// Language of the associated track.
  Language get language => throw _privateConstructorUsedError;

  /// Whether the associated track was automatically generated.
  bool get isAutoGenerated => throw _privateConstructorUsedError;

  /// Track format
  ClosedCaptionFormat get format => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClosedCaptionTrackInfoCopyWith<ClosedCaptionTrackInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosedCaptionTrackInfoCopyWith<$Res> {
  factory $ClosedCaptionTrackInfoCopyWith(ClosedCaptionTrackInfo value,
          $Res Function(ClosedCaptionTrackInfo) then) =
      _$ClosedCaptionTrackInfoCopyWithImpl<$Res, ClosedCaptionTrackInfo>;
  @useResult
  $Res call(
      {Uri url,
      Language language,
      bool isAutoGenerated,
      ClosedCaptionFormat format});

  $LanguageCopyWith<$Res> get language;
}

/// @nodoc
class _$ClosedCaptionTrackInfoCopyWithImpl<$Res,
        $Val extends ClosedCaptionTrackInfo>
    implements $ClosedCaptionTrackInfoCopyWith<$Res> {
  _$ClosedCaptionTrackInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? language = null,
    Object? isAutoGenerated = null,
    Object? format = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      isAutoGenerated: null == isAutoGenerated
          ? _value.isAutoGenerated
          : isAutoGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ClosedCaptionFormat,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageCopyWith<$Res> get language {
    return $LanguageCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ClosedCaptionTrackInfoCopyWith<$Res>
    implements $ClosedCaptionTrackInfoCopyWith<$Res> {
  factory _$$_ClosedCaptionTrackInfoCopyWith(_$_ClosedCaptionTrackInfo value,
          $Res Function(_$_ClosedCaptionTrackInfo) then) =
      __$$_ClosedCaptionTrackInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Uri url,
      Language language,
      bool isAutoGenerated,
      ClosedCaptionFormat format});

  @override
  $LanguageCopyWith<$Res> get language;
}

/// @nodoc
class __$$_ClosedCaptionTrackInfoCopyWithImpl<$Res>
    extends _$ClosedCaptionTrackInfoCopyWithImpl<$Res,
        _$_ClosedCaptionTrackInfo>
    implements _$$_ClosedCaptionTrackInfoCopyWith<$Res> {
  __$$_ClosedCaptionTrackInfoCopyWithImpl(_$_ClosedCaptionTrackInfo _value,
      $Res Function(_$_ClosedCaptionTrackInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? language = null,
    Object? isAutoGenerated = null,
    Object? format = null,
  }) {
    return _then(_$_ClosedCaptionTrackInfo(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      isAutoGenerated: null == isAutoGenerated
          ? _value.isAutoGenerated
          : isAutoGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ClosedCaptionFormat,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClosedCaptionTrackInfo extends _ClosedCaptionTrackInfo {
  const _$_ClosedCaptionTrackInfo(this.url, this.language,
      {this.isAutoGenerated = false, required this.format})
      : super._();

  factory _$_ClosedCaptionTrackInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ClosedCaptionTrackInfoFromJson(json);

  /// Manifest URL of the associated track.
  @override
  final Uri url;

  /// Language of the associated track.
  @override
  final Language language;

  /// Whether the associated track was automatically generated.
  @override
  @JsonKey()
  final bool isAutoGenerated;

  /// Track format
  @override
  final ClosedCaptionFormat format;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClosedCaptionTrackInfo &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.isAutoGenerated, isAutoGenerated) ||
                other.isAutoGenerated == isAutoGenerated) &&
            (identical(other.format, format) || other.format == format));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, language, isAutoGenerated, format);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClosedCaptionTrackInfoCopyWith<_$_ClosedCaptionTrackInfo> get copyWith =>
      __$$_ClosedCaptionTrackInfoCopyWithImpl<_$_ClosedCaptionTrackInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClosedCaptionTrackInfoToJson(
      this,
    );
  }
}

abstract class _ClosedCaptionTrackInfo extends ClosedCaptionTrackInfo {
  const factory _ClosedCaptionTrackInfo(final Uri url, final Language language,
      {final bool isAutoGenerated,
      required final ClosedCaptionFormat format}) = _$_ClosedCaptionTrackInfo;
  const _ClosedCaptionTrackInfo._() : super._();

  factory _ClosedCaptionTrackInfo.fromJson(Map<String, dynamic> json) =
      _$_ClosedCaptionTrackInfo.fromJson;

  @override

  /// Manifest URL of the associated track.
  Uri get url;
  @override

  /// Language of the associated track.
  Language get language;
  @override

  /// Whether the associated track was automatically generated.
  bool get isAutoGenerated;
  @override

  /// Track format
  ClosedCaptionFormat get format;
  @override
  @JsonKey(ignore: true)
  _$$_ClosedCaptionTrackInfoCopyWith<_$_ClosedCaptionTrackInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
