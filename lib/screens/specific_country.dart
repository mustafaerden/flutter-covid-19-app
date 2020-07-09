import 'package:flutter/material.dart';
import 'package:covid_19/helpers/size_config.dart';
import 'package:covid_19/helpers/constants.dart';
import 'package:date_format/date_format.dart';

class CountryScreen extends StatelessWidget {
  final String country;
  final String flag;
  final int updated;
  final String cases;
  final String todayCases;
  final String deaths;
  final String todayDeaths;
  final String recovered;
  final String todayRecovered;
  final String active;
  final String critical;
  final String tests;
  final String population;

  CountryScreen(
      {@required this.country,
      @required this.flag,
      @required this.updated,
      @required this.cases,
      @required this.todayCases,
      @required this.deaths,
      @required this.todayDeaths,
      @required this.recovered,
      @required this.todayRecovered,
      @required this.active,
      @required this.critical,
      @required this.tests,
      @required this.population});

  formatUpdatedDate() {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(updated);
    var formattedDate = formatDate(dateTime, [MM, ' ', d, ', ', yyyy]);
    return formattedDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              country,
              style: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.blockSizeHorizontal * 5.5,
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 2,
            ),
            Image.network(
              flag,
              height: SizeConfig.safeBlockHorizontal * 5,
              width: SizeConfig.safeBlockHorizontal * 10,
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4,
                vertical: SizeConfig.safeBlockHorizontal * 2,
              ),
              child: Text(
                'Last Update  |  ' + formatUpdatedDate(),
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
            specificCountryCard('Population', population),
            specificCountryCard('Total Cases', cases),
            specificCountryCard('Today\'s Cases', todayCases),
            specificCountryCard('Total Deaths', deaths),
            specificCountryCard('Today\'s Deaths', todayDeaths),
            specificCountryCard('Total Recovered', recovered),
            specificCountryCard('Today\'s Recovered', todayRecovered),
            specificCountryCard('Active Cases', active),
            specificCountryCard('Critical Cases', critical),
            specificCountryCard('Total Tests', tests),
          ],
        ),
      ),
    );
  }

  Card specificCountryCard(String title, String caseNumber) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 4,
        vertical: SizeConfig.safeBlockHorizontal * 1.5,
      ),
      color: kCardColor,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 4,
              ),
            ),
            Text(
              caseNumber,
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
