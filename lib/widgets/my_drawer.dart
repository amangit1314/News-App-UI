import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Map<String, List> newsData = Map<String, List>();
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.25,
      child: Drawer(
        backgroundColor: Colors.blue,
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            DrawerHeader(
              child: Container(
                height: 142,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTptQ4WR9J0chkeZDrVrFP_gZqK7V-noognr-JuYPQF0kZ0Cw51ljht8vrxb0bibXqXLCU&usqp=CAU"),
              ),
              decoration: BoxDecoration(color: Colors.transparent),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
