import 'dart:html';

import 'package:flutter/material.dart';
import 'package:movie_search_app/viewmodel/api_call.dart';

class DisplayPage extends StatefulWidget {
  final ApiCall apiCall;
  late String movieName;

  DisplayPage({Key? key, required this.apiCall}) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  loadingState isLoading = loadingState.preloading;
  @override
  void initState() {
    super.initState();
    widget.apiCall.LoadingState = () {
      setState(() {
        isLoading = widget.apiCall.isLoading;
      });
    };
    widget.apiCall.getMovieData(widget.movieName);
  }

  @override
  Widget build(BuildContext context) {
    switch (isLoading) {
      case loadingState.loadedWithData:
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Color.fromARGB(255, 45, 34, 47),
            body: Container(
              child: Column(
                children: [
                  Container(
                    color: Colors.black,
                    width: double.infinity,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Movie Search App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(30.0),
                          child: Image.network(
                            widget.apiCall.poster,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.apiCall.title,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w100),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Year:${widget.apiCall.year}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'Released: ${widget.apiCall.released}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    'Genre: ${widget.apiCall.genre}',
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Writer: ${widget.apiCall.writer}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Cast: ${widget.apiCall.actors}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Plot: ${widget.apiCall.plot}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Language: ${widget.apiCall.language}',
                                  style: TextStyle(color: Colors.yellow),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Awards: ${widget.apiCall.awards}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      case loadingState.loadedWithErrors:
        return Text("Error cannot Load Data");
      case loadingState.isLoading:
        return Text("Wait while the data is loading");
      default:
        return Text("Error cannot Load Data because of default");
    }
  }
}
