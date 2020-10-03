import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stadia_app/image_assets.dart';
import 'package:stadia_app/model/LastPlayedGameModel.dart';
import 'package:stadia_app/model/friends.dart';
import 'package:stadia_app/pages/SecondaryHomePage.dart';
import 'package:stadia_app/styleguide/colors.dart';
import 'package:stadia_app/styleguide/textStyles.dart';
import 'package:stadia_app/widgets/ContentHeading.dart';
import 'package:stadia_app/widgets/LastPlayedgameTile.dart';
import 'package:stadia_app/widgets/RoundedImageWidget.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:18.0),
        child: Stack(
          children: [
            Transform.translate(
                offset: Offset(screenWidth * 0.4, 10.0),
                child: Transform.rotate(
                    angle: 0.1,
                    child: SvgPicture.asset(
                      logo,
                      height: screenHeight * 0.4,
                      color: logoTintColor,
                    ))),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Icon(Icons.menu, color: primaryTextColor),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondaryHomePage()));
                          },
                        ),
                        Icon(
                          Icons.search,
                          color: primaryTextColor,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              RoundedImageWidget(imagePath: john_Snow, ranking: 39, showRanking: true,isOnline: true,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Hello',
                                        style: userNameTextStyle,
                                      ),
                                      TextSpan(text: '\n'),
                                      TextSpan(text: "Jon Snow", style: userNameTextStyle),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0, bottom: 16, top: 16),
                          child: Material(
                            elevation: 4,
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "HOURS PLAYED",
                                        style: hoursPlayedLabelTextStyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "297 Hours",
                                    style: hoursPlayedTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        ContentHeading(heading: "Last played games"),
                        for (var i = 0; i < lastPlayedGames.length; i++)
                          LastPlayedGameTile(
                            lastPlayedGame: lastPlayedGames[i],
                            screenWidth: screenWidth,
                            gameProgress: lastPlayedGames[i].gameProgress,
                          ),
                       ContentHeading(heading: "Friends"),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: <Widget>[
                          for (var i = 0; i < friends.length; i++)
                            RoundedImageWidget(
                              imagePath: friends[i].imagePath,
                              isOnline: friends[i].isOnline,
                              name: friends[i].name,
                            ),
                        ],
                      ),
                    ),
                  )
                   ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
