import 'package:flutter/material.dart';
import 'package:raceway_app/Pages/tab_pages.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

const double windowWidth = 1200;
const double windowHeight = 800;

class Platform {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Raceway App'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Ticket Info',
              ),
              Tab(
                text: 'Raceway Info',
              ),
            ],
          ),
        ),
        body: const SafeArea(
            bottom: false,
            child: TabBarView(children: [
              TicketInfoPage(),
              RacewayInfoPage(),
            ])),
      ),
    );
  }
}
