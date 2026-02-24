class BranchResponse {
  final List<String> data;

  BranchResponse({this.data = const []});

  factory BranchResponse.fromJson(Map<String, dynamic> json) {
    return BranchResponse(
      data: json['data'] != null ? List<String>.from(json['data']) : [],
    );
  }
}
