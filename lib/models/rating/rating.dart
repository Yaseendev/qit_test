import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

@Freezed()
class Rating with _$Rating {
  const factory Rating({required double rate, required int count}) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
