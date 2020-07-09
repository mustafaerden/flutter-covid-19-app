import 'package:covid_19/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/helpers/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopCountriesCard extends StatelessWidget {
  final String flag;
  final String country;
  final String cases;

  TopCountriesCard(
      {@required this.flag, @required this.country, @required this.cases});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(
      //   top: 10.0,
      // ),
      child: Material(
        color: kCardColor,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 35,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                  flag,
                  height: SizeConfig.safeBlockHorizontal * 6,
                  width: SizeConfig.safeBlockHorizontal * 10,
                ),
                Text(
                  country,
                  style:
                      TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.caretUp,
                      color: Colors.red,
                      size: SizeConfig.safeBlockHorizontal * 5.5,
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 0.5,
                    ),
                    Text(
                      cases,
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
