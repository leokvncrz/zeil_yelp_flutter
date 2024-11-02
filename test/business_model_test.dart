import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:yelp_nyc_business/core/models/business.dart';

void main() {
  group('Business Model Test', () {
    test('Business Model parsed from JSON', () async {
      // Get from JSON file
      final jsonFile = File('test/data/test_business.json');
      final jsonString = jsonFile.readAsStringSync();
      final json = jsonDecode(jsonString);

      // Parse JSON
      final business = BusinessModel.fromJson(json);
      expect(business.id, 'h37t9rA06Sr4EetJjKrfzw');
      expect(business.alias, 'don-angie-new-york');
      expect(business.name, 'Don Angie');
      expect(business.imageUrl,
          'https://s3-media2.fl.yelpcdn.com/bphoto/onJX6_vaMPHXUqIbMrq79A/o.jpg');
      expect(business.isClosed, false);
      expect(business.url,
          'https://www.yelp.com/biz/don-angie-new-york?adjust_creative=fdb_9wxNRFzfx9Sl63cgtQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=fdb_9wxNRFzfx9Sl63cgtQ');
    });
  });
}
