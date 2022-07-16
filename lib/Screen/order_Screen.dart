import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:pusher_client/pusher_client.dart';

import '../myThem.dart';
import '../notificationApi.dart';
import '../provider/darkTheme.dart';
import '../pusherController.dart';

class Order extends StatefulWidget {
  final payload;

  Order({this.payload});

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {


  @override
  void initState()  {
    super.initState();
  // _initAppTheme();
    //   inti();
   // PusherController().setChannelName("hamza");
   // PusherController().setEventName("noti");
  //  PusherController().initPusher();
    //PusherController().connectPusher();
    //PusherController().subscribePusher();
   // print("------------------------------------");
   // print( PusherController().eventStream.toString());
   // print("------------------------------------");


  }

  inti() {
    PusherOptions options = PusherOptions(
      cluster: "ap2",
    );
    PusherClient pusher = PusherClient(
      "44f1ce32e7383ebc0ac1",
      options,
      enableLogging: false,
      autoConnect: false,
    );
    pusher.connect();
    pusher.onConnectionStateChange((state) {
      print(
          "previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });
    pusher.onConnectionError((error) {
      print("errornnnnn: ${error!.message}");
    });
    Channel channel = pusher.subscribe("hamza");
    channel.bind("noti", (onEvent) {
      if (mounted) {
        print("-------------------------");
        final data = json.decode(onEvent!.data.toString());
        print("->>>${data}");

        NotificationApi.showNotification(
          title: data['tittle'],
          body: data['body'],
          payload: "oz.ss",
        );
        print("-------------------------");
      }
    });

// Unsubscribe from channel
//    pusher.unsubscribe("hamza");
//
//    pusher.disconnect();
  }



  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<DarkThem>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Order'),

      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, int index) {
            // final recentChat = recentChats[index];
            return Column(
              children: [
                Reservations(),
                Divider(
                  height: 2,
                )
              ],
            );
          }),
    );
  }
}

class Reservations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return Container(
        width: wd,
        height: 75,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage("assets/images/bp_avatar.png"),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                print(wd);
//                        Navigator.push(context,
//                            CupertinoPageRoute(builder: (context) {
//                              return ChatRoom(
//                                user: recentChat.sender,
//                              );
//                            }));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: wd / 2.25,
                    child: Text(
                      "SHAHER JREIDAH",
                      style: MyTheme.heading2.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Accountant",
                      style: MyTheme.bodyText1,
                    ),
                  ),
                  Container(
                    width: wd / 2.25,
                    child: Text(
                      "60 mutual Connection hanaa",
                      style: MyTheme.bodyText1,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              //  crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: wd / 8,
                    height: wd / 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(width: 2)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.close),
                    )),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: wd / 8,
                  height: wd / 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                          width: 2, color: Theme.of(context).accentColor)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
