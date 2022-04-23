// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return _Rating.fromJson(json);
}

/// @nodoc
class _$RatingTearOff {
  const _$RatingTearOff();

  _Rating call({required double rate, required int count}) {
    return _Rating(
      rate: rate,
      count: count,
    );
  }

  Rating fromJson(Map<String, Object> json) {
    return Rating.fromJson(json);
  }
}

/// @nodoc
const $Rating = _$RatingTearOff();

/// @nodoc
mixin _$Rating {
  double get rate => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingCopyWith<Rating> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingCopyWith<$Res> {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) then) =
      _$RatingCopyWithImpl<$Res>;
  $Res call({double rate, int count});
}

/// @nodoc
class _$RatingCopyWithImpl<$Res> implements $RatingCopyWith<$Res> {
  _$RatingCopyWithImpl(this._value, this._then);

  final Rating _value;
  // ignore: unused_field
  final $Res Function(Rating) _then;

  @override
  $Res call({
    Object? rate = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$RatingCopyWith<$Res> implements $RatingCopyWith<$Res> {
  factory _$RatingCopyWith(_Rating value, $Res Function(_Rating) then) =
      __$RatingCopyWithImpl<$Res>;
  @override
  $Res call({double rate, int count});
}

/// @nodoc
class __$RatingCopyWithImpl<$Res> extends _$RatingCopyWithImpl<$Res>
    implements _$RatingCopyWith<$Res> {
  __$RatingCopyWithImpl(_Rating _value, $Res Function(_Rating) _then)
      : super(_value, (v) => _then(v as _Rating));

  @override
  _Rating get _value => super._value as _Rating;

  @override
  $Res call({
    Object? rate = freezed,
    Object? count = freezed,
  }) {
    return _then(_Rating(
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rating implements _Rating {
  const _$_Rating({required this.rate, required this.count});

  factory _$_Rating.fromJson(Map<String, dynamic> json) =>
      _$$_RatingFromJson(json);

  @override
  final double rate;
  @override
  final int count;

  @override
  String toString() {
    return 'Rating(rate: $rate, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Rating &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rate) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$RatingCopyWith<_Rating> get copyWith =>
      __$RatingCopyWithImpl<_Rating>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatingToJson(this);
  }
}

abstract class _Rating implements Rating {
  const factory _Rating({required double rate, required int count}) = _$_Rating;

  factory _Rating.fromJson(Map<String, dynamic> json) = _$_Rating.fromJson;

  @override
  double get rate => throw _privateConstructorUsedError;
  @override
  int get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RatingCopyWith<_Rating> get copyWith => throw _privateConstructorUsedError;
}
