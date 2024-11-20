import 'package:flutter/material.dart';
import 'package:oasis_restaurant/utils/Constantes/PaddingDelimiter.dart';
import 'package:oasis_restaurant/utils/Constantes/colors.dart';


class FoodInfoMediumCard extends StatelessWidget {
  const FoodInfoMediumCard({
    Key? key,
    required this.image,
    required this.name,
    required this.desc,
    this.rating,
    required this.delivertTime,
    required this.press,
  }) : super(key: key);

  final String image, name, desc;
  final double? rating;
  final int delivertTime;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.25,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: PaddingDelimiter.defaultPadding / 2),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: PaddingDelimiter.defaultPadding / 4),
            Text(
              desc,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: PaddingDelimiter.defaultPadding / 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Rating(rating: rating),
                Text(
                  "$delivertTime min",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors_App.Colorblack.withOpacity(0.74)),
                ),
                //const SmallDot(),
                Text(
                  "Categorie",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors_App.Colorblack.withOpacity(0.74)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
