import 'package:flutter/material.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:untitled/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String botName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: connectWithTelegram, child: const Text("connect")),
            Text(botName)
          ],
        ),
      ),
    );
  }

  connectWithTelegram() async {
    try {
      var bot = (await Telegram(BOT_TOKEN).getMe());
      setState(() {
        botName = "connected with telegram username : ${bot.username}";
      });
      var teledart = TeleDart(BOT_TOKEN, Event(botName));
      teledart.start();
    } catch (e) {
      setState(() {
        botName = "can't connected with telegram check bot token";
      });
    }
  }
}
