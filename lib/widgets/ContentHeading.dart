import 'package:flutter/material.dart';
import 'package:stadia_app/styleguide/textStyles.dart';

class ContentHeading extends StatelessWidget {
final String heading;

  const ContentHeading({Key key, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        heading,
        style: headingOneTextStyle,
      ),
    );
  }
}