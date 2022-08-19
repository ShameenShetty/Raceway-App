import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:raceway_app/Data/lottery_ticket_data.dart';
import 'package:raceway_app/main.dart';
import 'package:raceway_app/model/lottery_ticket.dart';
import 'package:raceway_app/pages/add_new_ticket.dart';
import 'package:extended_image/extended_image.dart';

class TicketInfoPage extends StatelessWidget {
  const TicketInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (LotteryTicket ticket in allTicketsList)
            lotteryTicketCardTemplate(
                ticket.ticketNumber, ticket.ticketName, ticket.ticketPrice)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewTicket()));
        },
        child: const Icon(Icons.add),
      ),
    );
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

String racewayScheduleLink = 'https://i.imgur.com/ktmkn1Q.png';

class RacewayInfoPage extends StatelessWidget {
  const RacewayInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
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
          const SizedBox(
            height: 15,
          ),
          const Text('Schedule'),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            child: Hero(
              tag: 'Raceway Schedule',
              child: Image.network(racewayScheduleLink),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailScreen();
              }));
            },
            onDoubleTap: () {
              print('image was doubled tapped');
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                print('uploading a new schedule to the app');
              },
              child: Text('Upload New Schedule'))
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: ExtendedImage.network(
            racewayScheduleLink,
            fit: BoxFit.contain,
            //enableLoadState: false,
            mode: ExtendedImageMode.gesture,
            onDoubleTap: (ExtendedImageGestureState state) {
              print('was double tapped');
              // TODO -
              // try adding the feature, where if I double tap it, it returns
              // to the original size
            },
            initGestureConfigHandler: (state) {
              return GestureConfig(
                minScale: 0.9,
                animationMinScale: 0.7,
                maxScale: 3.0,
                animationMaxScale: 3.5,
                speed: 1.0,
                inertialSpeed: 100.0,
                initialScale: 1.0,
                inPageView: false,
                initialAlignment: InitialAlignment.center,
              );
            },
          ),
        ),

        // PinchZoom(
        //   maxScale: 2.5,
        //   onZoomStart: () {
        //     print('Start zooming');
        //   },
        //   onZoomEnd: () {
        //     print('Stop zooming');
        //   },
        //   child: Image.network(racewayScheduleLink),
        // ),
      ),
    );
  }
}

class TodoCheckListPage extends StatefulWidget {
  const TodoCheckListPage({Key? key}) : super(key: key);

  @override
  State<TodoCheckListPage> createState() => _TodoCheckListPageState();
}

bool _checked1 = false;
bool _checked2 = false;
bool _checked3 = false;

List<CheckListItem> checkList = [
  CheckListItem(
      text: 'Finish lottery paperwork',
      icon: const Icon(Icons.insert_drive_file_outlined),
      checkBoxValue: _checked1),
  CheckListItem(
      text: 'Turn on music',
      icon: const Icon(Icons.music_note),
      checkBoxValue: _checked2),
  CheckListItem(
      text: 'Finish lottery paperwork',
      icon: const Icon(Icons.checklist),
      checkBoxValue: _checked3),
];

class CheckListItem {
  final String text;
  final Icon icon;
  bool? checkBoxValue;

  CheckListItem(
      {required this.text, required this.icon, required this.checkBoxValue});
}

class _TodoCheckListPageState extends State<TodoCheckListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text('TODO Checklist'),
        const SizedBox(
          height: 15,
        ),
        // Lottery ticket info table
        Column(
            children: checkList
                .map((checkListElem) => CheckboxListTile(
                      title: Text(checkListElem.text),
                      secondary: checkListElem.icon,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkListElem.checkBoxValue,
                      onChanged: (value) {
                        setState(() {
                          checkListElem.checkBoxValue = value;
                        });
                        print('setting the bool value is $value');
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.black,
                    ))
                .toList()),

        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
