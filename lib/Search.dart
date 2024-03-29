import 'package:flutter/material.dart';

class Search extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchState();
  }
}

class SearchState extends State<Search> {
  static var categories = ['اصناف','تصنيف رئيسي','تصنيف فرعي'];
  static var newValue = 'اصناف';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          DropdownButton(
            items: categories.map((String dropDownStringItem){
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            value:newValue,
            onChanged: (valueSelectedByUser){
              setState((){   newValue = valueSelectedByUser;});
//              newValue = valueSelectedByUser;

              debugPrint('User selected $valueSelectedByUser');
            },

          ),
        ],
      ),
    );
  }

}



class DataSearch extends SearchDelegate<String> {

//  final cities = [
//    "alex",
//    'cairo',
//    "mansora",
//    'damnhour',
//    'gharbia',
//    'daqahlia',
//    'dammita',
//    'luxor',
//    'aswan',
//    'sohag',
//    'asuit',
//    'behira',
//    'menofya',
//    'sharkia',
//    'bany swief',
//    'elwady elgded',
//  ];
//  final recentCities = ["alex", 'cairo', "mansora", 'damnhour'];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
    IconButton(icon: Icon(Icons.search), onPressed: (){}),
    IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = '';
      } //onPressed
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: show when someone searches for something
  //  final suggestionList = query.isEmpty ? recentCities : cities.where((str)=>str.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: Text('test'),

        //chlidren
        ),
        );

  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.red,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }


}
