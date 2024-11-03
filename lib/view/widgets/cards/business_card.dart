import 'package:flutter/material.dart';
import 'package:yelp_nyc_business/core/models/business.dart';

class BusinessCard extends StatelessWidget {
  final BusinessModel business;
  const BusinessCard({required this.business, super.key});

  Widget _locationAndReviewCount(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(
              business.displayAddress,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          // Review Count
          Text('${business.reviewCount.toString()} reviews',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white)),
        ],
      );

  Widget _nameAndRating(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(business.name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white)),
          ),
          // Ratings
          SizedBox(
            width: 5,
          ),
          Text(business.price,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.green.shade300)),
          SizedBox(
            width: 5,
          ),
          Text(business.rating.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white)),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 15,
          ),
        ],
      );

  Widget _closedBanner(BuildContext context) => business.isClosed
      ? Container(
          height: 200,
          width: double.infinity,
          color: Colors.black.withOpacity(0.6),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text('CLOSED',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white)),
          ))
      : Container();

  Widget _image(BuildContext context) => Stack(children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            business.imageUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
        _closedBanner(context),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 70,
              padding: const EdgeInsets.all(8),
              color: Colors.black.withOpacity(0.6),
              child: Column(
                children: [
                  _nameAndRating(context),
                  _locationAndReviewCount(context),
                ],
              ),
            ),
          ),
        ),
      ]);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _image(context),
        ],
      ),
    );
  }
}
