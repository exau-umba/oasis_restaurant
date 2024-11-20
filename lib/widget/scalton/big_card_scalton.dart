import 'package:flutter/material.dart';

import '../../constants.dart';
import 'big_card_image_slide_scalton.dart';
import 'scalton_line.dart';

class BigCardScalton extends StatelessWidget {
  const BigCardScalton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AspectRatio(
          aspectRatio: 1.81,
          child: BigCardImageSlideScalton(),
        ),
        const SizedBox(height: defaultPadding),
        ScaltonLine(
          width: MediaQuery.of(context).size.width * 0.8,
        ),
        const SizedBox(height: defaultPadding),
        const ScaltonLine(),
        const SizedBox(height: defaultPadding),
        const ScaltonLine(),
      ],
    );
  }
}
