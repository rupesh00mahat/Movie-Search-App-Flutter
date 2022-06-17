import 'package:flutter/material.dart';
import 'package:movie_search_app/view/display_page.dart';
import 'package:movie_search_app/viewmodel/api_call.dart';

class SearchPage extends StatefulWidget {
  late Function onTap;
  final DisplayPage displayPage;
  SearchPage({Key? key, required this.displayPage}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String userInput = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Movie Search App',
            style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w100),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: 500,
            child: TextField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Enter name of the movie',
                ),
                onChanged: (value) {
                  setState(() {
                    userInput = value;
                  });
                }),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
              color: Colors.white,
              width: 200,
              height: 50,
              child: TextButton(
                  onPressed: () {
                    widget.onTap(userInput, context);
                  },
                  child: const Text(
                    'Search The Movie',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w100),
                  )))
        ],
      ),
    );
  }
}
