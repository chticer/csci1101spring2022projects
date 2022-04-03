import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({Key? key}) : super(key: key);

  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  int currentGuessCount = 0;
  int actualIconCount = 0;

  List<Widget> icons = <Widget>[];

  Widget statusWidget = Container();

  void startGame() {
    currentGuessCount = 0;

    icons.clear();

    Random r = Random();

    actualIconCount = 5 + r.nextInt(15 - 5);

    for (int i = 0; i < actualIconCount; ++i) {
      icons.add(Positioned(
        left: r.nextDouble() * 350,
        top: r.nextDouble() * 350,
        child: Icon(
          FontAwesomeIcons.bicycle,
          size: 36 + r.nextInt((48 - 36) ~/ 2) * 2
        )
      ));
    }

    int fakeIconCount = 3 + r.nextInt(5 - 3);

    for (int i = 0; i < fakeIconCount; ++i) {
      icons.add(Positioned(
        left: r.nextDouble() * 350,
        top: r.nextDouble() * 350,
        child: Icon(
          FontAwesomeIcons.hillRockslide,
          size: 24 + r.nextInt((36 - 24) ~/ 2) * 2
        )
      ));
    }

    updateGameStatus();
  }

  void updateGameStatus()
  {
    setState(() {
      statusWidget = Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: ButtonTheme(
                    height: 50,
                    child: Opacity(
                      opacity: currentGuessCount > 0 ? 1 : 0.25,
                      child: ElevatedButton(
                        child: const Text("Decrease Count"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.white
                        ),
                        onPressed: () {
                          if (currentGuessCount > 0) {
                            setState(() {
                              currentGuessCount -= 1;

                              updateGameStatus();
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(right: 10),
                  child: Text(
                    currentGuessCount.toString(),
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
                ButtonTheme(
                  height: 50,
                  child: Opacity(
                    opacity: currentGuessCount < 99 ? 1 : 0.25,
                    child: ElevatedButton(
                      child: const Text("Increase Count"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white
                      ),
                      onPressed: () {
                        if (currentGuessCount < 99) {
                          setState(() {
                            currentGuessCount += 1;

                            updateGameStatus();
                          });
                        }
                      },
                    ),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center
            ),
          ),
          ElevatedButton(
            child: const Text("Submit Answer"),
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              onPrimary: Colors.white
            ),
            onPressed: endGame
          )
        ],
      );
    });
  }

  void endGame() {
    String statusGameMessage = "";

    if (currentGuessCount == actualIconCount) {
      statusGameMessage = "Correct, there are $actualIconCount bicycles.";
    } else {
      statusGameMessage = "Incorrect, there are $actualIconCount bicycles.";
    }

    setState(() {
      statusWidget = Column(
        children: <Widget>[
          Text(
            statusGameMessage,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center
          ),
          ElevatedButton(
            child: const Text("Play Again"),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              onPrimary: Colors.white
            ),
            onPressed: startGame
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      );
    });
  }

  @override
  void initState() {
    startGame();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "How many bicycles do you see?",
                  style: TextStyle(fontSize: 36),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Stack(children: icons)
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: statusWidget,
              )
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch
        ),
      ),
    );
  }
}