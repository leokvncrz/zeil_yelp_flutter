import 'package:dio/dio.dart';
import 'package:yelp_nyc_business/core/interfaces/yelp_service.dart';
import 'package:yelp_nyc_business/core/models/business.dart';
import 'package:yelp_nyc_business/core/models/result.dart';

class YelpServiceImpl implements YelpService {
  @override
  Future<ResultModel<List<BusinessModel>>> getNYCBusinessList(
      {int offset = 0}) async {
    try {
      final yelpResult = await Dio().get(
          'https://api.yelp.com/v3/businesses/search?location=NYC&offset=$offset',
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${const String.fromEnvironment("API_KEY")}'
            },
          ));
      return ResultModel.success(
          message: yelpResult.data['total'].toString(),
          args: _parseBusinessList(yelpResult.data['businesses']));
    } on DioException catch (e) {
      return ResultModel.error(message: e.response!.data.toString());
    } catch (e) {
      return ResultModel.error(message: e.toString());
    }
  }

  List<BusinessModel> _parseBusinessList(List businesses) {
    return businesses
        .map((business) => BusinessModel.fromJson(business))
        .toList();
  }
}
