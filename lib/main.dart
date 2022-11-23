import 'package:flutter/material.dart';
import 'package:merubo/components/message_item_left.dart';
import 'package:merubo/components/message_item_right.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merubo(寄せ書きアプリ)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //初めのメッセージ部分
            Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/chrisumasu.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "小川 翔生",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Happy Birthday",
                      style: TextStyle(color: Colors.amberAccent, fontSize: 45),
                    ),
                  ),
                  Text(
                    "誕生日おめでとう",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              )),
            ),
            //寄せ書きを表示部分
            Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 5),
                  color: Colors.white24),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          color: Colors.white),
                      child: const Text(
                        "Messaging Bord",
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.double),
                      )),
                  ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 40,
                      itemBuilder: (context, index) {
                        if (index % 2 == 1) {
                          return const MessageItemLeft();
                        } else {
                          return const MessageItemRight();
                        }
                      }),
                ],
              ),
            ),
            //最後のメッセージ部分(動画、画像)
            SizedBox(
              height: 200,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber),
                      color: Colors.white30),
                  child: const Center(child: Text("最後のメッセージ"))),
            ),
          ],
        ),
      ),
    );
  }
}
