import 'package:flutter/material.dart';

class ChangeListViewBGColor extends StatefulWidget {
  _ChangeListViewBGColorState createState() => _ChangeListViewBGColorState();
}

class _ChangeListViewBGColorState extends State<ChangeListViewBGColor> {
  final List<String> _listViewData = [
    "A List View with many Text - Here's one!",
    "A List View with many Text - Here's another!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
  ];

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change ListView Bg Color Example'),
      ),
      body: ListView.builder(
        itemCount: _listViewData.length,
        itemBuilder: (context, index) => Container(
          color: _selectedIndex != null && _selectedIndex == index
              ? Colors.red
              : Colors.white,
          child: ListTile(
            title: Text(_listViewData[index]),
            onTap: () => _onSelected(index),
          ),
        ),
      ),
    );
  }
}