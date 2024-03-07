import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechat/app_components/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatAppService {
  //get firestore instanceand fire auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go through every user separately
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

  //send mesage
  Future<void> sendMessage(String receiverID, message) async {
    //get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);

    //create a chat room for 2 users

    List<String> uids = [currentUserID, receiverID];
    uids.sort(); // sort ids to make sure that chat room is the same for any 2 peeps
    //ids are primary keys , maybe i draw a database later
    String chatRoomID = uids.join('_');

    //add new message to firestore db
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.convToMap());
  }

  //get msgS

  Stream<QuerySnapshot> getUserMessages(String firstUserID, secondUserID) {
    //CREATE CHATROOM ID FOR 2 USERS
    List<String> uids = [firstUserID, secondUserID];
    uids.sort();
    String chatRoomID = uids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
