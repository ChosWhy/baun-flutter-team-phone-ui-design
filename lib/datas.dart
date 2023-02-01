class MyDatas{
  static Map<String, String> personAndPhoneNumber = {
    "Furkan": "05518439206",
    "Mustafa": "05279580459",
    "Ege": "05154234547",
    "Cansu": "05458590107",
    "Deniz": "05354764972",
    "Mualla": "05427514544",
    "Hacer": "05278316701",
    "Elif": "05475516230",
    "Ecrin": "05543007648",
    "Damla": "05287418492",
    "Gulay": "05189452366",
    "Mucahit": "05580489239",
    "Abdulkadir": "05440875498",
  };
  static List<String> dateTime = [
    "11.39",
    "Dün",
    "Dün",
    "Dün",
    "Dün",
    "Dün",
    "Dün",
    "27.01",
    "27.01",
    "26.01",
    "26.01",
    "26.01",
    "25.01",
    "25.01",
  ];

  static Map<String,String> favorites = {};
}
///buraya incelicek arkadaşlar öğrenmek isterlerse su acıklamayı okusunlara anlayamayanlar bana yazsın
///onlara özel olarak anlatıyım yine derste değinicegim ekstradan!


///açıklama! :normalde phone_cal_main sayfasında statefull widgetının ekstra olarak private yani kapalı bi classı oluyor
///ve biz oraya tanımladıgımız için listelerimizi ve maplarimizi dger classlara çekemiyorum bu yuzden ordan alıp
///MyDatas classına çekmiş bulundum burda da static yaptım bunun nedeni ise şimdi daha öncelerden gördünüz classları
///classlara ulasmak için instance(nesne) olsuturuyoruz ama bu nesneler her defasında olusturdugumuzda hepsinin kendine has özellikleri oluyor
///mesela ögrenci classı olsun furkan için instance olusturursam bu olusturdugum instance ile sadece furkanı etkilerim
///veya atıyorum X kisisini olusturdum ve ben bu instance lada X kişisini etkilerim ama
///ben static yaparsam bu bütün instanceler için geçerli oluyor yani öğrencilerin tamamı için geçerli oluyor
///bu yüzden bu verileri tuttugum yerleri static yapıyorum
///
/// diger classlara ulasmak için ise bu classın ismini yzadıktan sonra nokta koyarsanız tüm static elemanlara erişirsiniz
/// MyDatas. şeklinde