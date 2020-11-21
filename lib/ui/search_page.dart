import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/model/restaurants.dart';
import 'package:restaurant_app/widgets/no_data.dart';

class SearchPage extends StatefulWidget {
  static const routeName = "/search_page";
  final List<Restaurants> restaurants;

  SearchPage({@required this.restaurants});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<Restaurants> _searchData;
  TextEditingController _searchRest = TextEditingController();

  _onSearchTextChanged(String txt) {
    _searchData.clear();
    if (txt.isEmpty) {
      setState(() {});
      return;
    }

    widget.restaurants.forEach((rest) {
      if (rest.name.toLowerCase().contains(txt)) {
        _searchData.add(rest);
      }
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Restaurant'),),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.search),
                title: TextFormField(
                  controller: _searchRest,
                  decoration: InputDecoration(
                      hintText: 'Search Restautant',
                      border: InputBorder.none
                  ),
                  onChanged: _onSearchTextChanged,
                ),
                trailing: IconButton(icon: Icon(Icons.cancel), onPressed: () {
                  _searchRest.clear();
                  _onSearchTextChanged("");
                }),

              ),
            ),

          ),
          Expanded(
            child: _searchData.length != 0 && _searchRest.text.isNotEmpty
            ? ListView()
            : NoDataView(msg: "Find the restaurants."),
          ),
        ],
      ),
    );
  }

}