import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topic6/models/icecream.dart';
import 'package:topic6/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference icecreamCollection =
      Firestore.instance.collection('icecream');

  Future updateUserData(String sugars, String name, int strength) async {
    return await icecreamCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //icecream list from snapshot
  List<iceCream> _icecreamListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return iceCream(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugar: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  //gets icecream streams
  Stream<List<iceCream>> get icecreams {
    return icecreamCollection.snapshots().map(_icecreamListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return icecreamCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
