import 'package:covid_19/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/helpers/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainCard extends StatelessWidget {
  final String description;
  final String numberOfCases;
  final Color arrowColor;
  final EdgeInsets cardMargin;

  MainCard(
      {@required this.description,
      @required this.numberOfCases,
      @required this.arrowColor,
      @required this.cardMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 12,
      margin: cardMargin,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              numberOfCases,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  description,
                  style:
                      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 2,
                ),
                FaIcon(
                  FontAwesomeIcons.caretUp,
                  color: arrowColor,
                  size: SizeConfig.safeBlockHorizontal * 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
