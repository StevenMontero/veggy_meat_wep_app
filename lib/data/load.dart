import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veggy/data/data.dart';

// Esta clase solo se usa en caso de quererer subir todos los produtos, tener cuidado puede exeder el uso gratis de fire base
// Consultar antes de usar
class LoadData {
  static void load() {
    print(datamock.length);
    CollectionReference<Map<String, dynamic>> user;
    for (var item in datamock) {
      user =
          FirebaseFirestore.instance.collection(item['ItemGroup'].toString());
      user
          .doc(item['code'].toString())
          .set(item)
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  }
}
