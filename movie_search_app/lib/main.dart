import 'package:flutter/material.dart';
import 'package:movie_search_app/view/display_page.dart';
import 'package:movie_search_app/view/search_page.dart';
import 'package:movie_search_app/viewmodel/api_call.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            Scaffold(backgroundColor: Colors.black, body: Composer.compose()));
  }
}

class Composer {
  static SearchPage compose() {
    ApiCall apiCall = ApiCall();
    DisplayPage displayPage = DisplayPage(apiCall: apiCall);
    SearchPage searchPage = SearchPage(displayPage: displayPage);
    searchPage.onTap = (String movieName, BuildContext context) {
      displayPage.movieName = movieName;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => displayPage));
    };
    return searchPage;
  }
}
