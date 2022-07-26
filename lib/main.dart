import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TicketList(),
  ));
}

class TicketList extends StatefulWidget {
  const TicketList({Key? key}) : super(key: key);

  @override
  State<TicketList> createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raceway App',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Arima'),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('First Text'),
              Text('Second Text'),
              Text('Third Text'),
              ElevatedButton(
                onPressed: () {
                  print("you clicked on the elevated button");
                },
                child: Icon(Icons.mail),
              ),
              IconButton(
                  iconSize: 50.0,
                  onPressed: () {
                    print("you pressed the icon button\n");
                  },
                  icon: const Icon(Icons.addchart_rounded))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Open'),
        onPressed: () {},
      ),
    );
  }
}
