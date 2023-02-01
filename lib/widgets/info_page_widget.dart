import 'package:flutter/material.dart';
import 'package:phoneapp/datas.dart';
import 'package:phoneapp/widgets/search_history_widget.dart';
import 'details_widget.dart';

class InfoPageWidget extends StatefulWidget {
  InfoPageWidget({required this.name, required this.phoneNumber});
  final String phoneNumber;
  final String name;
  @override
  State<InfoPageWidget> createState() =>
      _InfoPageWidgetState(name: name, phoneNumber: phoneNumber);
}

class _InfoPageWidgetState extends State<InfoPageWidget> {
  _InfoPageWidgetState({required this.name, required this.phoneNumber});
  final String phoneNumber;
  final String name;
  bool isClickToFavorites = false;
  bool isDetailsClick = true;
  bool isSearchClick = false;

  @override
  Widget build(BuildContext context) {
    final double widht = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ///top place
            Container(
              width: widht,
              height: (height / 10) * 3,
              color: Colors.deepPurpleAccent,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButton(color: Colors.white),
                        Icon(
                          Icons.qr_code,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.12,
                    ),
                    Text(name,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),

            ///texts
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMyTextMethod(
                    height: height,
                    widht: widht,
                    text: "Details",
                    whichOneClick: isDetailsClick),
                SizedBox(
                  width: widht * 0.1,
                ),
                buildMyTextMethod(
                    widht: widht,
                    height: height,
                    text: "Search history",
                    whichOneClick: isSearchClick),
              ],
            ),

            ///mid place
            Container(
              width: widht,
                height: height * 0.454,
                child: isDetailsClick == true
                    ? InfoDetailsWidgetOfPage(
                        phoneNumber: phoneNumber, widht: widht)
                    : SearchWidgetOfInfoPage(name: name,phoneNumber: phoneNumber,)),

            ///bottom place
            SizedBox(
              height: height * 0.045,
            ),
            Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.black12))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildMyIconsCard(
                        widht: widht,
                        icon: Icons.star_border_outlined,
                        text: "Add to favorites",
                        ontap: AddToFavorite),
                    buildMyIconsCard(
                        widht: widht,
                        icon: Icons.edit_note,
                        text: "Edit",
                        ontap: Edit),
                    buildMyIconsCard(
                        widht: widht,
                        icon: Icons.table_rows_rounded,
                        text: "Other",
                        ontap: Other),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  GestureDetector buildMyTextMethod(
      {required double widht,
      required double height,
      required String text,
      required bool whichOneClick}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (text) {
            case "Details":
              isDetailsClick = true;
              isSearchClick = false;
              break;
            case "Search history":
              isDetailsClick = false;
              isSearchClick = true;
          }
        });
      },
      child: Container(
        width: widht / 3.7,
        height: height * 0.04,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color:
                    whichOneClick == true ? Colors.indigoAccent : Colors.grey,
                decoration: whichOneClick == true
                    ? TextDecoration.underline
                    : TextDecoration.none),
          ),
        ),
      ),
    );
  }

  ///yine method olarak extract ettigimiz widgetın oldugu yere fonksiyonlarımızı da yazabiliriz!
  void AddToFavorite() {
    setState(() {
      isClickToFavorites = isClickToFavorites == true ? false : true;
    });
    print("tıklandı!");

    ///ne diyorduk burda isClick... eşit mi true ya eşitse false degilse true yap!
    if (!MyDatas.favorites.containsKey(
        name)) //burda sunu kontrol ediyo favorilerde name isimli bişi varmı yoksa ekle diyorum
      MyDatas.favorites[name] =
          phoneNumber; //burda ekleme yaparken basına! koymam bu kosulu true ise false,false ise true yapar
    else
      MyDatas.favorites.remove(name);
    print(MyDatas.favorites);
  }

  void Edit() {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              title: Text("Dikkat!"),
              content: Text(
                  "Henüz görmediginiz bir widget var adı TextField! Burada onu kullanıcaz ileride"),
            ));
  }

  void Other() {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              title: Center(child: Text("Other")),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actions: [
                IconOtherMethod(text: "Share person"),
                IconOtherMethod(text: "Add to dark list"),
                IconOtherMethod(text: "Copy"),
                IconOtherMethod(text: "Delete history"),
                IconOtherMethod(text: "Create shortCut"),
                IconOtherMethod(text: "Delete person"),
                Row(
                  children: [
                    IconOtherMethod(text: "transfer all calls to voicemail"),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                )
              ],
            ));
  }

  GestureDetector IconOtherMethod({required String text}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 6, right: 10, left: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 0.6,
                ),
              ]),
        ),
      ),
    );
  }

  GestureDetector buildMyIconsCard(
      {required double widht,
      required IconData icon,
      required String text,
      required Function() ontap}) {
    ///burda fonksiyonu nasıl parametre olarak tanımladıgımızı gördük. fonksiyonları bu sekilde Function() ontap (ontap burada isimdir. istediğinizi yazabilirsiniz) şeklinde
    ///tanımlayabiliyoruz!
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
        ),
        width: widht / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              text == "Add to favorites" && isClickToFavorites == true
                  ? Icons.star
                  : icon,

              ///burda sunu yapıyorum şimdi 3 farklı ıcon ve texti etkieleyen bir durumndayız özellikle textin"Add to favorites"
              ///kısmını yazıoyurm bu kesinlikle favorites kısmını ele aldırmama sagladı
              size: 28,
            ),
            Text(
              text == "Add to favorites" && isClickToFavorites == true
                  ? "Delete from fav!"
                  : text,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
