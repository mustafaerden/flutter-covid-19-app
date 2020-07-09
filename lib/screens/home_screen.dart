import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:covid_19/helpers/constants.dart';
import 'package:covid_19/services/covid_api.dart';
import 'package:covid_19/widgets/main_card.dart';
import 'package:covid_19/widgets/continent_card.dart';
import 'package:covid_19/widgets/top_countries_card.dart';
import 'package:covid_19/helpers/size_config.dart';
import 'package:covid_19/screens/specific_country.dart';
import 'package:covid_19/helpers/all_countries_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService _apiService = ApiService();

  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  // String searchBarValue;

  bool isLoading = false;
  String searchErrorMessage;

  String totalCases;
  String totalRecovered;

  List<dynamic> _continentResults = [];
  List<dynamic> _countriesResults = [];

  turnIntToDoubleString(dynamic number) {
    return number.toString().replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  fetchWorldFinal() async {
    var result = await _apiService.fetchWorldFinal();
    setState(() {
      totalCases = result['TotalConfirmed'].toString().replaceAllMapped(
          new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      totalRecovered = result['TotalRecovered'].toString().replaceAllMapped(
          new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    });
  }

  fetchContinentResults() async {
    var result = await _apiService.fetchContinentRecords();

    setState(() {
      _continentResults = result;
    });
  }

  fetchCountries() async {
    var result = await _apiService.fetchCountries();
    if (result != null) {
      for (var i = 0; i < 15; i++) {
        setState(() {
          _countriesResults.add(result[i]);
        });
      }
    }
  }

  fetchSpecificCountry(String country) async {
    searchErrorMessage = null;
    isLoading = true;
    try {
      var result = await _apiService.fetchSpecificCountry(country);
      setState(() {
        isLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CountryScreen(
            country: result['country'],
            flag: result['countryInfo']['flag'],
            updated: result['updated'],
            cases: turnIntToDoubleString(result['cases']),
            todayCases: turnIntToDoubleString(result['todayCases']),
            deaths: turnIntToDoubleString(result['deaths']),
            todayDeaths: turnIntToDoubleString(result['todayDeaths']),
            recovered: turnIntToDoubleString(result['recovered']),
            todayRecovered: turnIntToDoubleString(result['todayRecovered']),
            active: turnIntToDoubleString(result['active']),
            critical: turnIntToDoubleString(result['critical']),
            tests: turnIntToDoubleString(result['tests']),
            population: turnIntToDoubleString(result['population']),
          ),
        ),
      );
    } catch (e) {
      print(e.message);
      setState(() {
        isLoading = false;
        searchErrorMessage = e.message;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWorldFinal();
    fetchContinentResults();
    fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COVID-19 TRACKER',
          style: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockSizeHorizontal * 5.5),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4,
                vertical: SizeConfig.safeBlockHorizontal * 1,
              ),
              child: SimpleAutoCompleteTextField(
                key: key,
                suggestions: allCountriesStaticList,
                decoration: kSearchBarDecoration,
                textSubmitted: (text) {
                  fetchSpecificCountry(text.toLowerCase());
                },
              ),
            ),
            isLoading
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 4,
                    ),
                    child: Text(
                      'Loading...',
                      style: TextStyle(
                          color: Colors.orange,
                          fontStyle: FontStyle.italic,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(0),
                  ),
            searchErrorMessage != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 4,
                    ),
                    child: Text(
                      searchErrorMessage,
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontStyle: FontStyle.italic,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(0),
                  ),
            SizedBox(height: SizeConfig.blockSizeVertical * 1.5),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 4),
              // padding: const EdgeInsets.symmetric(
              //     horizontal: SizeConfig.safeBlockHorizontal * 4),
              child: Text(
                'Global Statistics',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.blockSizeHorizontal * 3.5),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: MainCard(
                    numberOfCases:
                        totalCases != null ? totalCases : 'Loading...',
                    description: 'Total Cases',
                    arrowColor: Colors.redAccent,
                    cardMargin: EdgeInsets.only(
                        top: SizeConfig.safeBlockHorizontal * 2.5,
                        left: SizeConfig.safeBlockHorizontal * 4,
                        right: SizeConfig.safeBlockHorizontal * 3,
                        bottom: SizeConfig.safeBlockHorizontal * 2.5),
                  ),
                ),
                Expanded(
                  child: MainCard(
                    numberOfCases:
                        totalRecovered != null ? totalRecovered : 'Loading...',
                    description: 'Total Recovered',
                    arrowColor: Colors.greenAccent,
                    cardMargin: EdgeInsets.only(
                        top: SizeConfig.safeBlockHorizontal * 2.5,
                        right: SizeConfig.safeBlockHorizontal * 4,
                        bottom: SizeConfig.safeBlockHorizontal * 2.5),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 4,
                right: SizeConfig.safeBlockHorizontal * 4,
                bottom: SizeConfig.safeBlockHorizontal * 2.5,
              ),
              child: Text(
                'Continent Statistics',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 3.5),
              ),
            ),
            LimitedBox(
              maxHeight: SizeConfig.blockSizeVertical * 40,
              child: _continentResults.length > 0
                  ? ListView.builder(
                      itemCount: _continentResults.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return ContinentCard(
                          continent:
                              _continentResults[index]['continent'].toString(),
                          cases: _continentResults[index]['cases']
                              .toString()
                              .replaceAllMapped(
                                  new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (Match m) => '${m[1]},'),
                          todayCases: _continentResults[index]['todayCases']
                              .toString()
                              .replaceAllMapped(
                                  new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (Match m) => '${m[1]},'),
                          recovered: _continentResults[index]['recovered']
                              .toString()
                              .replaceAllMapped(
                                  new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (Match m) => '${m[1]},'),
                          deaths: _continentResults[index]['deaths']
                              .toString()
                              .replaceAllMapped(
                                  new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (Match m) => '${m[1]},'),
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 4,
                right: SizeConfig.safeBlockHorizontal * 4,
                top: SizeConfig.safeBlockHorizontal * 2.5,
              ),
              child: Text(
                'Top Countries',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 3.5),
              ),
            ),
            LimitedBox(
              maxHeight: SizeConfig.blockSizeVertical * 16,
              child: _countriesResults != null
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _countriesResults.length,
                      itemBuilder: (BuildContext context, int index) {
                        return (Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 4,
                              top: SizeConfig.safeBlockHorizontal * 2.5),
                          child: Row(
                            children: <Widget>[
                              TopCountriesCard(
                                country: _countriesResults[index]['country'],
                                flag: _countriesResults[index]['countryInfo']
                                    ['flag'],
                                cases: _countriesResults[index]['cases']
                                    .toString()
                                    .replaceAllMapped(
                                        new RegExp(
                                            r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                        (Match m) => '${m[1]},'),
                              ),
                            ],
                          ),
                        ));
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
