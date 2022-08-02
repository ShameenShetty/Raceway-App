import 'package:flutter/material.dart';

class TicketInfoPage extends StatelessWidget {
  const TicketInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView();
  }
}

Map<String, String> ticketInfo = {
  '\$1': '150 tickets',
  '\$2': '125 tickets',
  '\$3': '75 tickets',
  '\$5': '75 tickets',
  '\$10': '50 tickets',
  '\$20': '25 tickets',
  '\$30': '25 tickets',
  '\$50': '20 tickets',
};

class RacewayInfoPage extends StatelessWidget {
  const RacewayInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Lottery Ticket Info'),
          const SizedBox(
            height: 15,
          ),
          // Lottery ticket info table
          Table(
              border: TableBorder.all(color: Colors.black),
              children: ticketInfo.entries
                  .map((mapElem) => TableRow(
                        children: [
                          Center(
                            child: Text(mapElem.key),
                          ),
                          Center(
                            child: Text(mapElem.value),
                          )
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
