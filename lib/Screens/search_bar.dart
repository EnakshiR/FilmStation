import 'package:flutter/material.dart';

import 'search_details_page.dart';

//Created a search bar with a clear button and functionality to navigate to a different page when the user submits a search query.
class SearchBarFunction extends StatefulWidget {
  const SearchBarFunction({super.key});

  @override
  State<SearchBarFunction> createState() => _SearchBarFunctionState();
}

class _SearchBarFunctionState extends State<SearchBarFunction> {
  final TextEditingController searchItem = TextEditingController();

  bool showList = false;
  var searchValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: searchItem,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear, color: Colors.white.withOpacity(0.6)),
                onPressed: () {
                  setState(() {
                    searchItem.clear();
                  });
                },
              ),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onSubmitted: (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchedDetails(
                    searchQuery: value,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
