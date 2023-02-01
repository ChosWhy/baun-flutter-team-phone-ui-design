import 'package:flutter/material.dart';
import 'package:phoneapp/widgets/info_page_widget.dart';
import 'datas.dart';

class PhoneCallMainPage extends StatefulWidget {
  PhoneCallMainPage({Key? key}) : super(key: key);

  @override
  State<PhoneCallMainPage> createState() => _PhoneCallMainPageState();
}

class _PhoneCallMainPageState extends State<PhoneCallMainPage> {

  final Color activeColor = Colors.deepPurpleAccent;
  final Color passiveColor = Colors.grey;
  bool isClickPhone = true;
  bool isClickPersons = false;
  bool isClickFavotires = false;

  @override
  Widget build(BuildContext context) {
    final double widht = MediaQuery.of(context).size.width;
    final double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: (heigth * 0.01), right: widht * 0.02, left: widht * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone",
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.table_rows_rounded),
                  ),
                ],
              ),
              Expanded(
                flex: 7,
                child: ListView.builder(
                    itemCount: MyDatas.personAndPhoneNumber.length,
                    itemBuilder: (BuildContext context, int index) =>
                        PersonCall(
                          context: context,
                          dateTime: MyDatas.dateTime[index],
                          heigth: heigth,
                          widht: widht,
                          name: MyDatas.personAndPhoneNumber.keys.elementAt(index),
                          phoneNumber:
                          MyDatas.personAndPhoneNumber.values.elementAt(index),
                        )),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildGestureDetector(widht: widht, heigth: heigth,icon: Icons.phone,text: "Phone",whichOneClick: isClickPhone),
                      buildGestureDetector(widht: widht, heigth: heigth,icon: Icons.person_outline_outlined,text: "Persons",whichOneClick: isClickPersons),
                      buildGestureDetector(widht: widht, heigth: heigth,icon: Icons.star_border_outlined,text: "Favorites",whichOneClick: isClickFavotires),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(
      {required double widht,
      required double heigth,
      required IconData icon,
      required String text,
      required bool whichOneClick,}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch(text){
            case "Phone":
              isClickPhone = true;
              isClickPersons = false;
              isClickFavotires = false;
              break;
            case "Persons":
              isClickPhone = false;
              isClickPersons = true;
              isClickFavotires = false;
              break;
            case "Favorites":
              isClickPhone = false;
              isClickPersons = false;
              isClickFavotires = true;
              break;
          }
        });
      },
      child: Container(
        width: widht / 3.125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: whichOneClick == true ? activeColor : passiveColor,
            ),
            SizedBox(
              height: heigth * 0.004,
            ),
            Text(
              text,
              style: TextStyle(
                  color: whichOneClick == true ? activeColor : passiveColor),
            ),
          ],
        ),
      ),
    );
  }

  ///bunu bu sekilde yapmamın nedeni setstate i kullanmamdan ötürüdür ne yaptım peki cok kez tekrar eden ama setstateyi kullanmam gerekiyor
  ///ama ben bunu aşşagıdaki PersonCall sekilde yazmaya kalksam o zaman setstateyi kullanamam bunun yerine kullanıldıgı yerde sağ tıklayıp refactor method
  ///yaparak class içerisinde method olarak cıkardım!!
}

Widget PersonCall({
  required double widht,
  required double heigth,
  required String name,
  required String dateTime,
  required BuildContext context,
  required String phoneNumber,
}) {
  return Padding(
    padding: EdgeInsets.only(top: (heigth * 0.005), bottom: (heigth * 0.005)),
    child: Container(
      width: widht,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(
          Icons.phone_callback,
        ),
        title: Text(name),
        subtitle: Text("Türkiye"),
        trailing: Container(
          width: widht / 3,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(dateTime),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => InfoPageWidget(
                                name: name,
                                phoneNumber: phoneNumber,
                              )));
                },
                icon: Icon(Icons.info_outlined)),
          ]),
        ),
      ),
    ),
  );
}
