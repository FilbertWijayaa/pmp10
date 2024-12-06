import 'package:flutter/material.dart';
import 'package:fw/params/game_params.dart';
import 'package:fw/repository/game_repository.dart';
import 'package:fw/response/game_create_response.dart';

class GameCreatePage extends StatefulWidget {
  const GameCreatePage({super.key});

  @override
  State<GameCreatePage> createState() => _GameCreatePageState();
}

class _GameCreatePageState extends State<GameCreatePage> {
  final gameRepository = GameRepository();
  late Future<GameCreateResponse> futureGame;

  @override
  void initState() {
    futureGame =
          gameRepository.addGame(GameParam(name: 'Filbert Wijaya', price: '30000'));
        super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Game'),
      ),
    );
  }
}
