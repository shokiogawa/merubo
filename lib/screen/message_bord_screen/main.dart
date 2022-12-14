import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/provider/query/message_bord_provider.dart';
import 'package:merubo/widgets/message_card.dart';

class MessageBordScreen extends ConsumerWidget {
  const MessageBordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final screenSize = MediaQuery.of(context).size;
    final asyncValue = ref.watch(messageBordDetailProvider(args));
    return Scaffold(
      body: SingleChildScrollView(
          child: asyncValue.when(
              data: (data) {
                return Column(
                  children: [
                    // Message Bord Top
                    Container(
                      width: screenSize.width,
                      height: screenSize.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                getImageByType(data.messageBord?.type)),
                            fit: BoxFit.cover),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.messageBord?.receiverUserName ?? "unnown",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Congraturation !!",
                              style: TextStyle(
                                  color: Colors.amberAccent, fontSize: 45),
                            ),
                          ),
                          Text(
                            data.messageBord?.title ?? "unnown",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ],
                      )),
                    ),
                    //???????????????????????????
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 50),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 5),
                          color: Colors.white24),
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 5),
                                  color: Colors.white),
                              child: const Text(
                                "Messaging Bord",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                    decorationStyle:
                                        TextDecorationStyle.double),
                              )),
                          ListView.builder(
                              padding: const EdgeInsets.only(top: 0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.messages.length,
                              itemBuilder: (context, index) {
                                return MessageCard(message: data.messages[index]);
                              }),
                        ],
                      ),
                    ),
                    //??????????????????????????????(???????????????)
                    SizedBox(
                      height: 200,
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber),
                              color: Colors.white30),
                          child: Center(
                              child: Text(
                                  data.messageBord?.lastMessage ?? "unnown"))),
                    ),
                  ],
                );
              },
              error: (err, _) {
                const Text("error has occured");
              },
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }
}

String getImageByType(MessageBordType? type) {
  switch (type) {
    case MessageBordType.type1:
      return 'assets/images/chrisumasu.jpg';
    case MessageBordType.type2:
      return 'assets/images/oiwai.jpg';
    default:
      return "";
  }
}

Future<void> test() async {
  // ??????????????????????????????????????????????????????
  // final messageBordRef = FirebaseFirestore.instance
  //     .collection("message_bords")
  //     .where("receiverUserId", isEqualTo: "JewDzzfttNl8algHI7j0")
  //     .withConverter<MessageBord>(
  //         fromFirestore: (snapshot, _) =>
  //             MessageBord.fromJson(snapshot.data()!),
  //         toFirestore: (messageBord, _) => messageBord.toJson());
  // final messageBorSnapshot = await messageBordRef.get();
  // final MessageBord messageBord = messageBorSnapshot.docs[0].data();
  // final messageBordDocId = messageBorSnapshot.docs[0].id;
  // print(messageBord.receiverUserName);

  //????????????????????????????????????????????????????????????
  final messageBordRef2 = FirebaseFirestore.instance
      .collection("message_bords")
      .where("ownerUserId", isEqualTo: "JewDzzfttNl8algHI7j0")
      .withConverter<MessageBord>(
          fromFirestore: (snapshot, _) =>
              MessageBord.fromJson(snapshot.data()!),
          toFirestore: (messageBord, _) => messageBord.toJson());
  final messageBorSnapshot2 = await messageBordRef2.get();
  final MessageBord messageBord2 = messageBorSnapshot2.docs[0].data();
  final messageBordDocId2 = messageBorSnapshot2.docs[0].id;
  print(messageBord2);

  //messageBordId???????????????????????????????????????
  final messagesRef = FirebaseFirestore.instance
      .collection("messages")
      .where("messageBordId", isEqualTo: messageBordDocId2)
      .withConverter<Message>(
          fromFirestore: (snapshot, _) => Message.fromJson(snapshot.data()!),
          toFirestore: (message, _) => message.toJson());
  final messageSnapshot = await messagesRef.get();
  for (var element in messageSnapshot.docs) {
    print(element.data().content);
  }
}
