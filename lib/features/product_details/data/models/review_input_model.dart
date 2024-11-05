class ReviewInputModel {
  final String user;
  final String product;
  final String rating;
  final String comment;
  final String apiUrl;

  ReviewInputModel(
      {required this.user,
      required this.product,
      required this.rating,
      required this.comment,
      required this.apiUrl});
  toJson() {
    return {
      "user": user,
      "product": product,
      "rating": rating,
      "comment": comment
    };
  }
}
