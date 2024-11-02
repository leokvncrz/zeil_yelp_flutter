import 'package:yelp_nyc_business/core/models/result.dart';

abstract class YelpService {
  Future<ResultModel> getNYCBusinessList();
}
