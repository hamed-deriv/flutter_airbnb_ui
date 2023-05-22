import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/models/listing.dart';
import 'package:flutter_airbnb_ui/widgets/book_flip.dart';

class ListingPage extends StatelessWidget {
  const ListingPage(
    this.listing, {
    super.key,
  });

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification.metrics.pixels < -40) {
            // Navigator.of(context).pop();
            return true;
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 200),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Hero(
                        tag: 'listing_hero_${listing.id}',
                        flightShuttleBuilder: (
                          BuildContext flightContext,
                          Animation<double> animation,
                          HeroFlightDirection flightDirection,
                          BuildContext fromHeroContext,
                          BuildContext toHeroContext,
                        ) {
                          return BookFlip(
                            listing,
                            parentAnimation: animation,
                          );
                        },
                        child: BookFlip(
                          listing,
                          initialFlipProgress: 1,
                        ),
                      ),
                    ),
                    ...List.generate(100, (index) => Text('foo')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
