import 'user.dart';

class ReviewModel {
  int? id;
  User? user;
  int? product;
  int? rating;
  String? comment;
  DateTime? dateAdded;
  DateTime? dateModified;
  String? addedSince;
  String? modifiedSince;

  ReviewModel({
    this.id,
    this.user,
    this.product,
    this.rating,
    this.comment,
    this.dateAdded,
    this.dateModified,
    this.addedSince,
    this.modifiedSince,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    id: json['id'],
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        product: json['product'] as int?,
        rating: json['rating'] as int?,
        comment: json['comment'] as String?,
        dateAdded: json['date_added'] == null
            ? null
            : DateTime.parse(json['date_added'] as String),
        dateModified: json['date_modified'] == null
            ? null
            : DateTime.parse(json['date_modified'] as String),
        addedSince: json['added_since'] as String?,
        modifiedSince: json['modified_since'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'product': product,
        'rating': rating,
        'comment': comment,
        'date_added': dateAdded?.toIso8601String(),
        'date_modified': dateModified?.toIso8601String(),
        'added_since': addedSince,
        'modified_since': modifiedSince,
      };
}
