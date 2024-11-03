import 'package:flutter/material.dart';
import 'package:yelp_nyc_business/core/models/business.dart';

class BusinessDetails extends StatelessWidget {
  final BusinessModel business;
  const BusinessDetails({required this.business, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(business.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white)),
        ),
        body: Column(
          children: [
            Image.network(
              business.imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(business.displayAddress,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.black)),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Phone: ${business.displayPhone}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                  Row(
                    children: [
                      Text('Price: ',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(business.price,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.green.shade300)),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Ratings: ${business.rating.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black)),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
