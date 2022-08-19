import 'package:flutter/material.dart';
import 'package:raceway_app/Pages/tab_pages.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

List<Widget> widgetList = [const TicketInfoPage(), const RacewayInfoPage()];
Map<String, Widget> tabPagesMap = {
  'Ticket Info': const TicketInfoPage(),
  'Raceway': const RacewayInfoPage(),
  'TODO Checklist': const TodoCheckListPage(),
};

Widget lotteryTicketCardTemplate(number, name, price) {
  return SizedBox(
    height: 70.0,
    child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.amber.shade50,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.fromLTRB(66.0, 8.0, 66.0, 8.0),
        child: Column(
          children: [
            Text('$number'),
            Text('$name'),
            Text('\$$price'),
          ],
        )),
  );
}

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
