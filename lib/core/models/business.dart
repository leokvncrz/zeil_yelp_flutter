import 'package:equatable/equatable.dart';

class BusinessModel extends Equatable {
  final String id;
  final String alias;
  final String name;
  final String imageUrl;
  final bool isClosed;
  final String url;
  final String price;
  final int reviewCount;
  final String displayAddress;
  final double rating;

  const BusinessModel({
    required this.id,
    required this.alias,
    required this.name,
    required this.imageUrl,
    required this.isClosed,
    required this.url,
    required this.price,
    required this.displayAddress,
    required this.reviewCount,
    required this.rating,
  });

  BusinessModel.fromJson(dynamic json)
      : this(
          id: json['id'],
          alias: json['alias'],
          name: json['name'],
          imageUrl: json['image_url'],
          isClosed: json['is_closed'],
          price: json['price'],
          url: json['url'],
          displayAddress: json['location']['display_address'].join(', '),
          reviewCount: json['review_count'],
          rating: json['rating'],
        );

  @override
  List<Object?> get props => [
        id,
        alias,
        name,
        imageUrl,
        isClosed,
        price,
        url,
        reviewCount,
        rating,
      ];
}
