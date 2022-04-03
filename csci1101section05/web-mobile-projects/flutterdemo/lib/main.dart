import 'package:flutter/material.dart';
import 'package:flutterdemo/playgame.dart';

void main() {
  runApp(const MaterialApp(
    title: "Roll Call Demo",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController emailAddressController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  String emailAddress = "";
  String password = "";
  String difficultyLevel = "Easy";

  @override
  void initState()
  {
    emailAddressController.addListener(() {
      setState(() {
        emailAddress = emailAddressController.text;
      });
    });

    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email Address"
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password"
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "Difficulty",
                        style: TextStyle(fontSize: 18)
                      ),
                    ),
                    DropdownButton(
                      value: difficultyLevel,
                      items: const [
                        DropdownMenuItem(
                          child: Text("Easy"),
                          value: "Easy"
                        ),
                        DropdownMenuItem(
                            child: Text("Medium"),
                            value: "Medium"
                        ),
                        DropdownMenuItem(
                            child: Text("Hard"),
                            value: "Hard"
                        ),
                        DropdownMenuItem(
                            child: Text("Expert"),
                            value: "Expert"
                        ),
                      ],
                      hint: const Text("Select Difficulty Level"),
                      onChanged: (value) {
                        setState(() {
                          difficultyLevel = value.toString();
                        });
                      },
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              ButtonTheme(
                height: 50,
                child: ElevatedButton(
                  child: const Text("Play Game"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    onPrimary: Colors.white
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PlayGame()));
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
