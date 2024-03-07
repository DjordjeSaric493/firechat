import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
  });

  //convert data to a map -> we're working with key/value pairs
  Map<String, dynamic> convToMap() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'recieverID': receiverID,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
