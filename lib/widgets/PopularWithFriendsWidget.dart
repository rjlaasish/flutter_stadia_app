import 'package:flutter/material.dart';
import 'package:stadia_app/image_assets.dart';
import 'package:stadia_app/styleguide/textStyles.dart';

class PopularWithFriendsWidget extends StatelessWidget {
  final String imagePath;

  const PopularWithFriendsWidget({Key key, @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)), child: Image.asset(imagePath,fit: BoxFit.cover,)),
          ),
          Positioned(
            bottom: 10,
            left: 5,
            right: 5,
            child: InkWell(
              onTap: null,
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    "Play",
                    textAlign: TextAlign.center,
                    style: playWhiteTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
