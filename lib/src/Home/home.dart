import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_first/src/Pages/first_page.dart';
import 'package:project_first/src/Pages/second_page.dart';
import 'package:project_first/src/Pages/third_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

// initialize the controller
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Facebook",
          // ${controller.index + 1}",
          style: GoogleFonts.aBeeZee(
            color: Colors.blue,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        // centerTitle: true,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(icon: Icon(Icons.home, color: Colors.grey)),
            Tab(icon: Icon(Icons.star, color: Colors.grey)),
            Tab(icon: Icon(Icons.person_add, color: Colors.grey)),
            Tab(icon: Icon(Icons.home, color: Colors.grey)),
            Tab(icon: Icon(Icons.star, color: Colors.grey)),
            Tab(icon: Icon(Icons.person_add, color: Colors.grey)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.animateTo(2);
        },
        child: Icon(Icons.add, size: 32),
      ),
    );
  }
}
