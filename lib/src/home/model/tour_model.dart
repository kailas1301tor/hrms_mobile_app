class TourModel {
  final String id;
  final String title;
  final String subtitle;
  final String image;
  final String rating;
  final String reviews;

  TourModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.rating,
    required this.reviews,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating'] ?? '',
      reviews: json['reviews'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'image': image,
      'rating': rating,
      'reviews': reviews,
    };
  }
}
