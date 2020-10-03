import 'package:flutter/material.dart';
import 'package:stadia_app/image_assets.dart';
import 'package:stadia_app/model/LastPlayedGameModel.dart';
import 'package:stadia_app/styleguide/colors.dart';
import 'package:stadia_app/styleguide/textStyles.dart';
import 'package:stadia_app/widgets/ContentHeading.dart';
import 'package:stadia_app/widgets/PopularWithFriendsWidget.dart';

class SecondaryHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  game_sekiro,
                  height: 400,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  color: Colors.grey.withOpacity(0.5),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                            child: InkWell(
                              child: Icon(Icons.menu, color: Colors.white),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "NEW GAME",
                                  style: newGameTextStyle,
                                ),
                                TextSpan(text: '\n'),
                                TextSpan(
                                  text: "Sekiro: Shadows Dies Twice",
                                  style: newGameNameTextStyle,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: null,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                              decoration: BoxDecoration(
                                gradient: appGradient,
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text(
                                "Play",
                                style: newGameTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
         Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ContentHeading(heading: "Popular with Friends"),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (var i = 0; i < popularWithFriends.length; i++)
                          PopularWithFriendsWidget(
                            imagePath: popularWithFriends[i],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ContentHeading(heading: "Continue playing"),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: screenHeight * 0.20,
                      decoration: BoxDecoration(
                        gradient: appGradient,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                child: Image.asset(
                                  lastPlayedGames[0].imagePath,
                                  height: screenHeight * 0.13,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 25,
                                right: 25,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: lastPlayedGames[0].name, style: headingTwoTextStyle.copyWith(color: Colors.white, fontSize: 16)),
                                  TextSpan(text: '\n'),
                                  TextSpan(text: "${lastPlayedGames[0].hoursPlayed} hours played", style: bodyTextStyle.copyWith(color: Colors.white, fontSize: 16, height: 1.5),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}