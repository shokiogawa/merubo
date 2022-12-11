import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:merubo/contatn.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/bottom_button.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';
import '../../provider/create_message_bord_provider.dart';

// class CreateMessagePage extends ConsumerStatefulWidget {
//   const CreateMessagePage({Key? key}) : super(key: key);
//
//   @override
//   CreateMessagePageState createState() => CreateMessagePageState();
// }
//
// class CreateMessagePageState extends ConsumerState<CreateMessagePage> {
//   late String thumbnailImagePath;
//   late String imagePath;
//   late String voiceMessagePath;
//   late TextEditingController yourNameController;
//   late TextEditingController messageController;
//
//   @override
//   void initState() {
//     final messageData = ref.read(createMessageBord).messages;
//     yourNameController = TextEditingController(text: messageData.userName ?? "");
//     messageController = TextEditingController(text: messageData.content ?? "");
//     thumbnailImagePath = messageData.thumbnail ?? "";
//     imagePath = "";
//     voiceMessagePath = messageData.voiceMessage ?? "";
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     yourNameController.dispose();
//     messageController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final createTopMessageProvider = ref.watch(createMessageBord.notifier);
//     //TODO: Scaffoldで以下の画面を作成。
//     return Container();
//   }
// }

//画面が戻ったら

class CreateMessageScreen extends ConsumerWidget {
  const CreateMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createTopMessageProvider = ref.watch(createMessageBord.notifier);
    final yourNameController = TextEditingController();
    final messageController = TextEditingController();
    final thumbnailController = TextEditingController();
    final voiceMessageController = TextEditingController();
    final imageController = TextEditingController();
    print(yourNameController.text);
    return Scaffold(
      appBar: const ProgressAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "あなたからのメッセージ作成",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //自分の名前
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 自分の名前
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text("あなたのお名前"),
                        ),
                        TextField(
                          // onChanged: (value) {
                          //   createTopMessageProvider.setMessageUserName(value);
                          // },
                          controller: yourNameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(fontSize: 12),
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 自分の名前
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text("あなたの写真(任意)"),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final imageSource = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            // final image = File(imageSource!.path);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.orangeAccent,
                            child: const Text("画像が入る場所"),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text("メッセージ"),
                        ),
                        TextField(
                          onChanged: (value){
                            createTopMessageProvider.setMessageContent(value);
                          },
                          controller: messageController,
                          maxLines: 10,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(fontSize: 12),
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    //音声メッセージ
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text("音声メッセージ(任意)"),
                        ),
                        TextField(
                          controller: voiceMessageController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.voice_chat),
                              contentPadding: EdgeInsets.all(0),
                              hintText: "音声メッセージ",
                              hintStyle: TextStyle(fontSize: 12),
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text("写真(任意)"),
                        ),
                        TextField(
                          controller: imageController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.photo_album),
                              contentPadding: EdgeInsets.all(0),
                              hintText: "写真を選択",
                              hintStyle: TextStyle(fontSize: 12),
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
              onPressed:() {
                ref.read(currentIndexProviderForCreate.notifier).state = 3;
                      createTopMessageProvider.setMessage(
                          yourNameController.text,
                          thumbnailController.text,
                          messageController.text,
                          voiceMessageController.text);
                      Navigator.of(context).pushNamed('/message_bord_create_bottom_message_screen');
                    })
        ],
      ),
    );
  }
}
