class CustomerReview {
  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  String name;
  String review;
  String date;

  factory CustomerReview.fromJson(Map<String, dynamic> customerReview) =>
      CustomerReview(
        name: customerReview['name'],
        review: customerReview['review'],
        date: customerReview['date'],
      );
}
