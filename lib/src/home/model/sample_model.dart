class SampleModel {
  final String title;
  final String description;

  SampleModel({required this.title, required this.description});

  factory SampleModel.fromJson(Map<String, dynamic> json) {
    return SampleModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  factory SampleModel.mock() {
    return SampleModel(
      title: 'Sample Title',
      description: 'This is a sample description from the simplified architecture.',
    );
  }
}
