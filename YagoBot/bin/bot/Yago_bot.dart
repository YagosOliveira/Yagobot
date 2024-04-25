//criar o main do BOT

//responsavel por iniciar o robo e puxar todas as funções

import 'dart:async';
import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/time_questions.dart';
import 'timing/waiting_time.dart';

void main() async {
  String YagoBOT = 'YagoBOT:\n';
  var a = true;
  String usuario = '';

  final myStream = BotClock().timedCounter(1, 10);
  final StreamSubscription subscription = myStream.listen((event) {
    print(
        '                                             YagoBOT esta ativo por mais ${10 - event} segundos');
  }, onDone: () {
    print('-- O tempo do Bot se encerrou! Termine sua ultima pergunta! --');
    a = false;
  });

  print('-- Iniciando o YagoBOT, aguarde..--');
  await BotClock().clock(2); // implementado em aula
  print('YagoBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(YagoBOT + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      TimeQuestions(usuario).timeQuestion();
    } else if (GoodManners(usuario).isThisManners()) {
      //Basta adicionar novas perguntas aqui!
      GoodManners(usuario).goodManners();
    } else {
      await BotClock().clock(1);
      print(YagoBOT +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      await BotClock().clock(1);
      print(YagoBOT + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);
  await BotClock().clock(2);
  subscription.cancel();
  print('--Encerrando YagoBOT--');
}
