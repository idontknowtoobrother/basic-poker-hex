import 'dart:io';
import 'bot.dart';
import 'card.dart';
import 'dealer.dart';
import 'player.dart';

void main() {
  

  Player player = new Player("Keng", 10000);
  Bot bot = new Bot("Elen", 10000);
  Dealer dealer = new Dealer();

  dealer.startGame(player, bot);

}


