import 'package:brew_crew/Screens/Home/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //reference to collection
  final CollectionReference brewsCollection =
      FirebaseFirestore.instance.collection('brews');

  final String? userID;

  DatabaseService({this.userID});
  Future updateUserData(String sugars, String name, String strength) async {
    print("Updating...");
    return await brewsCollection
        .doc(userID)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((document) {
      var docment = document.data;
      return Brew(
          name: document["name"].toString(),
          sugars: document["sugars"].toString(),
          strength: document['strength'].toString());
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return brewsCollection
        .snapshots()
        .map((snapshot) => _brewListFromSnapshot(snapshot));
  }
}
