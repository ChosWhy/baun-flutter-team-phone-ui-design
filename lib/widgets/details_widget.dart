import 'package:flutter/material.dart';

class InfoDetailsWidgetOfPage extends StatelessWidget {
  const InfoDetailsWidgetOfPage({
    super.key,
    required this.phoneNumber,
    required this.widht,
  });

  final String phoneNumber;
  final double widht;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.phone,
            size: 20,
          ),
          title: Text(phoneNumber),
          subtitle: Text("Cep"),
          trailing: Container(
            width: widht / 3,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.settings_phone_outlined)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.chat_bubble_outline)),
            ]),
          ),
        ),

        ///push the files
        Padding(
          padding: EdgeInsets.only(top: 15, right: 25, left: 72),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dosyaları gönder",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
                color: Colors.grey,
              ),
            ],
          ),
        ),

        ///Divider
        Padding(
          padding: EdgeInsets.only(right: 25, left: 72),
          child: Divider(
            color: Colors.black12,
            thickness: 1,
          ),
        ),

        ///WhatsApp
        ListTile(
          title: Text("WhatsApp"),
          leading: Icon(
            Icons.phone_outlined,
            size: 20,
          ),

          ///whatsApp ıconu mevcut degil!!
          trailing: Container(
            width: widht / 3,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.settings_phone_outlined)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.chat_bubble_outline)),
            ]),
          ),
        ),

        ///Divider
        Padding(
          padding: EdgeInsets.only(right: 25, left: 72),
          child: Divider(
            color: Colors.black12,
            thickness: 1,
          ),
        ),

        ///Alarm
        ListTile(
          leading: Icon(
            Icons.add_alert,
            size: 20,
          ),
          title: Text("Varsayılan"),
          subtitle: Text("Zil sesi"),
          trailing: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
        )
      ],
    );
  }
}
