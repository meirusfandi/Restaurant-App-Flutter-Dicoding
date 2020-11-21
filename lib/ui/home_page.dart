import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/model/restaurants.dart';
import 'package:restaurant_app/ui/search_page.dart';
import 'package:restaurant_app/widgets/no_data.dart';
import 'package:restaurant_app/widgets/platform_widgets.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<RestaurantsResult> _restaurantsResult;
  ApiServices _apiServices;

  @override
  void initstate() {
    _apiServices = ApiServices();
    _restaurantsResult = _apiServices.getListRestaurant();
    super.initState();
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant App"),
        actions: [
          FlatButton(
            child: Icon(Icons.search, color: Colors.white,),
            onPressed: () => Navigator.pushNamed(context, SearchPage.routeName),
          )
        ],
      ),
      body: FutureBuilder(
        future: _apiServices.getListRestaurant(),
        builder: (context, AsyncSnapshot<RestaurantsResult> snapshot) {
          final state = snapshot.connectionState;

          if (state != ConnectionState.done) {
            return NoDataView(msg: "Loading...", icons: Icons.refresh,);
          } else {
            if (snapshot.hasData) {
              return NoDataView(msg: "Data found, yeayyyy", icons: Icons.done,);
            } else return NoDataView(msg: snapshot.error, icons: Icons.clear);
          }
        },
      ),
    );
  }

  Widget _buildIOS(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(),
    );
  }

  @override
  Widget build(BuildContext context) {
      // return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIOS);
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant App"),
        actions: [
          FlatButton(
            child: Icon(Icons.search, color: Colors.white,),
            onPressed: () => Navigator.pushNamed(context, SearchPage.routeName),
          )
        ],
      ),
      body: FutureBuilder(
        future: _apiServices.getListRestaurant(),
        builder: (context, snapshot) {
          final state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            if (state == ConnectionState.none) {
              return NoDataView(msg: "No Connection...", icons: Icons.refresh,);
            } else if (state == ConnectionState.waiting) {
              return NoDataView(msg: "Waiting network...", icons: Icons.refresh,);
            }
            return NoDataView(msg: "Loading...", icons: Icons.refresh,);
          } else {
            if (snapshot.hasData) {
              return NoDataView(msg: "Data found, yeayyyy", icons: Icons.done,);
            } else return NoDataView(msg: snapshot.error, icons: Icons.clear);
          }
        },
      ),
    );
  }
}