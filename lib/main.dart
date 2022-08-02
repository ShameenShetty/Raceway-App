import 'package:flutter/material.dart';
import 'package:raceway_app/Pages/tab_pages.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

List<Widget> widgetList = [const TicketInfoPage(), const RacewayInfoPage()];
Map<String, Widget> tabPagesMap = {
  'Ticket List': const TicketInfoPage(),
  'Raceway Info': const RacewayInfoPage(),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabPagesMap.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Raceway App'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (String key in tabPagesMap.keys)
                Tab(
                  text: key,
                )
            ],
          ),
        ),
        body: SafeArea(
            bottom: false,
            child: TabBarView(
                children: tabPagesMap.entries
                    .map((tabPage) => tabPage.value)
                    .toList())),
      ),
    );
  }
}
