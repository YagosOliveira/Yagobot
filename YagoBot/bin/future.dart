/*Future<String> bot() async {
  return '';
}

void main() {
  ///Objeto
  final Future myFuture = Future(() {
    print('Going back to the Future!');
    return 21; // retorna apenas depois que a função já terminou!
  }).then((value) => print('O valor é: $value ')); // esse then vem depois que o valor Futuro veio!
  ///Função
  myFutureFunc().then((value) => print('O Valor é: $value'));// esse then vem depois que o valor Futuro veio!
  ///Error
  myFutureFuncError(1,1).then((value) => print('O Valor é: $value')).catchError((e){print('Achamos um erro! $e');});
  ///When Complete
  myFutureFunc().whenComplete(() => print('Vou ser escrito independente de Errors ou Resultados'));

  print('Done with main()'); // vai ser chamado antes de todos os Futuros!
}

Future<int> myFutureFunc() async {
  await Future.delayed(Duration(seconds: 3));
  print('I have a function in the Future!');
  return 12;
}

Future<int> myFutureFuncError(int a, int b) async {
  if(a>b) {
    print('This is going to be an Error');
    throw Exception('Erro incomum');
  }
  await Future.delayed(Duration(seconds: 5));
  print('I am a functional function :)');
  return 42;
}*/
