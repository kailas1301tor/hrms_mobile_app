class TripModel {
  final String id;
  final String title;
  final String location;
  final String rating;
  final String reviews;
  final String imageUrl;

  TripModel({
    required this.id,
    required this.title,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      rating: json['rating'] ?? '',
      reviews: json['reviews'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'rating': rating,
      'reviews': reviews,
      'imageUrl': imageUrl,
    };
  }
}
