import 'package:yelp_nyc_business/core/models/business.dart';
import 'package:yelp_nyc_business/core/models/result.dart';

abstract class YelpService {
  Future<ResultModel<List<BusinessModel>>> getNYCBusinessList();
}
