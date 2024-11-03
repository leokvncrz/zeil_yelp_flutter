import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:yelp_nyc_business/core/interfaces/yelp_service.dart';
import 'package:yelp_nyc_business/core/models/business.dart';
import 'package:yelp_nyc_business/core/models/result.dart';

class YelpServiceImpl implements YelpService {
  @override
  Future<ResultModel<List<BusinessModel>>> getNYCBusinessList() async {
    await Future.delayed(Duration(seconds: 2));
    // Get from JSON file
    final jsonString = await rootBundle
        .loadString('test/data/get_business_list_response.json');
    final json = jsonDecode(jsonString);
    return ResultModel.success(message: '', args: _parseBusinessList(json));
  }

  List<BusinessModel> _parseBusinessList(dynamic json) {
    final businesses = json['businesses'] as List;
    return businesses
        .map((business) => BusinessModel.fromJson(business))
        .toList();
  }
}
