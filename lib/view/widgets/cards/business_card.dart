import 'package:flutter/material.dart';
import 'package:yelp_nyc_business/core/models/business.dart';

class BusinessCard extends StatelessWidget {
  final BusinessModel business;
  const BusinessCard({required this.business, super.key});

  Widget _nameAndRating(BuildContext context) => Row(
        children: [
          Text(business.name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white)),
          // Ratings
          Expanded(child: Container()),
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

  Widget _image(BuildContext context) => Stack(children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            business.imageUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 60,
              padding: const EdgeInsets.all(8),
              color: Colors.black.withOpacity(0.6),
              child: _nameAndRating(context),
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
          ListTile(
            title: Text(business.name),
            subtitle: Text(business.alias),
          ),
        ],
      ),
    );
  }
}
