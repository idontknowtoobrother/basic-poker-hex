import 'player.dart';


class Bot extends Player {

  bool _isBot = true;
  Bot(super._name, super._chip);

  bool isBot() => _isBot;

}