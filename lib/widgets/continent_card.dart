import 'package:covid_19/helpers/constants.dart';
import 'package:covid_19/helpers/size_config.dart';
import 'package:flutter/material.dart';

class ContinentCard extends StatelessWidget {
  final String continent;
  final String cases;
  final String todayCases;
  final String deaths;
  final String recovered;

  ContinentCard(
      {@required this.continent,
      @required this.cases,
      @required this.todayCases,
      @required this.deaths,
      @required this.recovered});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4),
      child: Material(
        color: kCardColor,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal * 1,
                    bottom: SizeConfig.safeBlockHorizontal * 1),
                child: Text(
                  continent,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total Cases',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                        ),
                        Text(
                          cases,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Today\'s Cases',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                        ),
                        Text(
                          todayCases,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Recovered',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                        ),
                        Text(
                          recovered,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Deaths',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                        ),
                        Text(
                          deaths,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
