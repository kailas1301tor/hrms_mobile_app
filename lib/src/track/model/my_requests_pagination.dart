import 'package:hrms_mobile/utils/helpers/type_converters.dart';

class MyRequestsPagination {
  final int? total;
  final int? page;
  final int? limit;
  final int? pages;

  MyRequestsPagination({this.total, this.page, this.limit, this.pages});

  factory MyRequestsPagination.fromJson(Map<String, dynamic> json) {
    return MyRequestsPagination(
      total: convertToInt(json['total']),
      page: convertToInt(json['page']),
      limit: convertToInt(json['limit']),
      pages: convertToInt(json['pages']),
    );
  }
}
