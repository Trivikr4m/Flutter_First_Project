import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: ScaffoldDemoApp(), debugShowCheckedModeBanner: false),
  );
}

class ScaffoldDemoApp extends StatefulWidget {
  _ScaffoldDemoAppState createState() => _ScaffoldDemoAppState();
}

class _ScaffoldDemoAppState extends State<ScaffoldDemoApp> {
  int _counter = 0; //a variable to keep track of counter value
  int _selectedIndex = 0; //Holds index of selected BottomNavigation bar

  //Method to increase the couter and show a snackabar with new value
  void _incrementCounter() {
    setState(() {
      _counter++; //increment the counter by 1
    });

    //Displys a small message at the bottom(SnackBar)
    // ignore: empty_constructor_bodies
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Counter incremented to $_counter"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  //method to show a bottom sheet modal
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context, //Required context to attach modal to screen
      builder: (context) => Container(
        height: 150,
        color: Colors.amber[100],
        child: Center(
          child: Text("This is Bottom Sheet", style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 135, 188),

      //AppBar shown at the top of the screen
      appBar: AppBar(
        title: Text('Scaffold Demo App'),
        actions: [
          IconButton(icon: Icon(Icons.info), onPressed: _showBottomSheet),
        ],
      ),

      //Drawer (Navigation panel that slides in form the lef)
      drawer: Drawer(
        child: ListView(
          //Vertical list inside drawer
          padding: EdgeInsets.zero, //Remove default padding
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.brown),
              child: Text(
                'Navigaiton Menu',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            ListTile(
              title: Text('Home'), //Menu option
              onTap: () => Navigator.pop(context), //closes the drawer
            ),
            ListTile(
              title: Text('Settings'), //Another menu option
              onTap: () => Navigator.pop(context), //closing the drawer
            ),
          ],
        ),
      ),

      //Main Content of the screen(centered text)
      body: Center(
        child: Text(
          'Counter : $_counter', //displays current counter value
          style: TextStyle(
            color: const Color.fromARGB(255, 8, 2, 0),
            fontSize: 55,
          ),
        ),
      ),

      //Floating  action button in the bottom-right corner
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'increment',
        child: Icon(Icons.add),
      ),

      //Buttons that stay at bottom (bottom navigation bar)
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () => setState(() {
            _counter = 0; //Reset counter value to 0
          }),
          child: Text('Reset'), //Button Label
        ),

        ElevatedButton(
          onPressed: _showBottomSheet, //shows the bottom sheeet
          child: Text('Show Bottom Sheet'), //button label
        ),
      ],

      //bottom navigation bar with Home and Setting options
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //highilghts selected tab
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          //shows which tab was selected
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Selected tab ${index + 1}",
              ), //display selected tba index
              duration: Duration(seconds: 5),
            ),
          );
        },

        items: [
          //Home tab
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          //Setting tab
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
