import 'package:flutter/material.dart';
import 'package:oumlil_app/bottom_sheet.dart';
import 'package:oumlil_app/providres/game_provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  final GlobalKey _six = GlobalKey();
  final GlobalKey _seven = GlobalKey();
  final GlobalKey _eight = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context).startShowCase(
          [_one, _two, _three, _four, _five, _six, _seven, _eight]),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, child) {
        return Scaffold(
          body: Center(
            child: Stack(
              children: <Widget>[
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Colors.red,
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //button add
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Showcase(
                                    key: _one,
                                    description: 'Decrease Player 1 score',
                                    child: IconButton(
                                      onPressed: () {
                                        gameProvider.remove1();
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 50,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Showcase(
                                    key: _two,
                                    description: 'Player 1 current score',
                                    child: Text(
                                      gameProvider.value1.toString(),
                                      style: TextStyle(
                                        fontSize: gameProvider.value1
                                                    .toString()
                                                    .length <=
                                                3
                                            ? 100
                                            : gameProvider.value1
                                                        .toString()
                                                        .length <=
                                                    4
                                                ? 80
                                                : gameProvider.value1
                                                            .toString()
                                                            .length <=
                                                        5
                                                    ? 60
                                                    : 40,
                                        color: Colors.white,
                                        shadows: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Showcase(
                                    key: _three,
                                    description: 'Increase Player 1 score',
                                    child: IconButton(
                                      onPressed: () {
                                        gameProvider.add1();
                                        checkWinner(context, gameProvider);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 50,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 30),
                                child: Text(
                                  gameProvider.player1,
                                  style: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                gameProvider.player2,
                                style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      gameProvider.remove2();
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 50,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    gameProvider.value2.toString(),
                                    style: TextStyle(
                                      fontSize: gameProvider.value2
                                                  .toString()
                                                  .length <=
                                              3
                                          ? 100
                                          : gameProvider.value2
                                                      .toString()
                                                      .length <=
                                                  4
                                              ? 80
                                              : gameProvider.value2
                                                          .toString()
                                                          .length <=
                                                      5
                                                  ? 60
                                                  : 40,
                                      color: Colors.white,
                                      shadows: const [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      gameProvider.add2();
                                      checkWinner(context, gameProvider);
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 50,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Showcase(
                    key: _four,
                    description: 'Reset the game scores',
                    child: IconButton(
                      onPressed: () {
                        gameProvider.reset();
                      },
                      icon: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.restart_alt_sharp,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                ),

                //seetings button
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 5),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Showcase(
                        key: _five,
                        title: 'Game Settings',
                        description:
                            'Change player names and set winning score',
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (context) => const SettingsBottomSheet(),
                            );
                          },
                          icon: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: const Icon(
                              Icons.settings,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void checkWinner(BuildContext context, GameProvider gameProvider) {
    String? winner = gameProvider.getWinner();
    if (winner != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text(winner),
          content: const Text(
            'You are the winner',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                gameProvider.resetAll();
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
