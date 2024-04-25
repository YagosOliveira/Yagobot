// criando uma Stream
//Normalmente estamos pegando dados de fora ( geralmente um Stream )
// mas para fins didáticos vamos simular uma Stream aqui

import 'dart:async';

Stream<int> timedCounter(int interval, [int? maxCount]) async* {
  //A partir do momento que alguem estiver ouvindo
  // essa função o corpo começa a contar

  ///Ou seja, como regra, toda Stream precisa ter
  ///um subscriber (alguem que escuta) antes de começar a rodar.
  ///Isso ocorre porque caso a Stream esteja rodando e ninguem esta vendo
  ///estamos gastando recursos preciosos a troco de nada.
  int i = 1;
  while (i != maxCount) {
    // print('Contando: $i'); a responsabilidade da mensagem deve ser da Stream?
    await Future.delayed(Duration(seconds: interval));
    yield i++;
    // caso alguem de fora cancele (pare de ouvir) ele retorna o ultimo valor e encerra a Stream.
    //caso alguem pause a Stream, o loop vai ficar congelado no yield até segunda ordem.
    //Não será explicado questões de erros na Stream*** ( Muito complexo e muito demorado criar um erro na Stream falsa que criamos, onde o aluno que fez o curso de exceptions consegue se virar com as Exceptions de uma Stream verdadeira.)
  }
  // print('Acabou!'); A responsabilidade da mensagem deve ser da Stream?
}

void main() async {
  // final myStream = timedCounter(1);
  final Stream myStream = timedCounter(1,10).asBroadcastStream(); // permite varios subscribers!!

  final StreamSubscription subscription = myStream.listen(
      (event) {
        print('Garantindo o contador: $event');
        // if(event.isEven) { //Manipulando a Stream!
        //   print('Garantindo o contador: $event');
        // }
      },
      onError: (e) {
        print('Erro!');
      },
      cancelOnError: false,
      onDone: () {
        print('Terminou!!');
      });
  // await Future.delayed(Duration(seconds: 3));
  // subscription.pause();
  // print('Pausado no inicio do 3º segundo');
  // print('Esperando 3 segundos para continuar a Stream...');
  // await Future.delayed(Duration(seconds: 3));
  // subscription.resume();
  // print('Mais 3 segundos de Stream antes do fim...');
  // await Future.delayed(Duration(seconds: 3));
  // subscription.cancel();

  //Manipulando
  myStream
      .map((event) => 'Subscriber 2 assistindo: $event')
      .listen((print));
}

// /Falta mostrar falar do await for
