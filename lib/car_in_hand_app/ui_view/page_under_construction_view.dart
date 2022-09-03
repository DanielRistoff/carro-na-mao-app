import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageUnderConstructionView extends StatelessWidget {
  const PageUnderConstructionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/icons/404.svg",
          height: 395,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
