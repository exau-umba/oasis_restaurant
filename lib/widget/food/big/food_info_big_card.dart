import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../card/big_card_image_slide.dart';

class FoodInfoBigCard extends StatelessWidget {
  final List<String> images, foodType;
  final String name;
  final double rating;
  final int numOfRating, deliveryTime;
  final bool isFreeDelivery;
  final VoidCallback press;

  const FoodInfoBigCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.numOfRating,
    required this.deliveryTime,
    this.isFreeDelivery = true,
    required this.images,
    required this.foodType,
    required this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // pass list of images here
          BigCardImageSlide(images: images),
          const SizedBox(height: 16 / 2),
          Text(name, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16 / 4),
          //PriceRangeAndFoodtype(foodType: foodType),
          //const SizedBox(height: 16 / 4),
          Row(
            children: [
              //RatingWithCounter(rating: rating, numOfRating: numOfRating),
              const SizedBox(width: 16 / 2),
              SvgPicture.asset(
                "assets/icons/clock.svg",
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.5),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "$deliveryTime Min",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              /*const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16 / 2),
                child: SmallDot(),
              ),*/
              SvgPicture.asset(
                "assets/icons/delivery.svg",
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.5),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(isFreeDelivery ? "Free" : "Paid",
                  style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
