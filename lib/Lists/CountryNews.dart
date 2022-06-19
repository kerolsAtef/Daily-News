import 'package:news_api/Model/CountryModel.dart';

List<Country> getCountries() {
  List<Country> countries = [];
  Country country;

  //country 1
  country = Country();
  country.title = "Egypt";
  country.abbreviation = "eg";
  country.image = "assets/images/egypt.png";
  countries.add(country);

  //country 2
  country = Country();
  country.title = "germany";
  country.abbreviation = "de";
  country.image = "assets/images/germany.png";
  countries.add(country);

  //country 3
  country = Country();
  country.title = "japan";
  country.abbreviation = "jp";
  country.image = "assets/images/japan.png";
  countries.add(country);

  //country 4
  country = Country();
  country.title = "russia";
  country.abbreviation = "ru";
  country.image = "assets/images/russia.png";
  countries.add(country);

  //country 5
  country = Country();
  country.title = "south korea";
  country.abbreviation = "kr";
  country.image = "assets/images/south-korea.png";
  countries.add(country);

  //country 6
  country = Country();
  country.title = "united kingdom";
  country.abbreviation = "gb";
  country.image = "assets/images/united-kingdom.png";
  countries.add(country);

  //country 7
  country = Country();
  country.title = "USA";
  country.abbreviation = "us";
  country.image = "assets/images/united-states-of-america.png";
  countries.add(country);
  return countries;
}
