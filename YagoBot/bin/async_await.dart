Future<String> bot() async {
  return '';
}

void main() async {
  ///Função
  // myFutureFunc().then((value) => print('O Valor é: $value'));
   final future = await myFutureFunc(); // muito menos verboso
  print('O Valor é: ${future}');
  ///Error
  // myFutureFuncError(1, 1)
  //     .then((value) => print('O Valor é: $value'))
  //     .catchError((e) {
  //   print('Achamos um erro! $e');
  // });
  ///When Complete
  // myFutureFunc().whenComplete(
  //     () => print('Vou ser escrito independente de Errors ou Resultados'));

  try {
    // muito menos verboso
    final futureError = await myFutureFuncError(1, 1);
    print('O Valor é $futureError');
  } catch (e) {
    print('Achamos um erro!');
  } finally {
    print('Vou ser escrito independente de Errors ou Resultados');
  }

  print('Done with main()'); // vai ser chamado depois porque esperou de fato todos terminarem
}

Future<int> myFutureFunc() async {
  print('Esperando 3 segundos...');
  await Future.delayed(Duration(seconds: 3));
  print('I have a function in the Future!');
  return 12;
}

Future<int> myFutureFuncError(int a, int b) async {
  if (a > b) {
    print('This is going to be an Error');
    throw Exception('Erro incomum');
  }
  print('Esperando 5 segundos.....');
  await Future.delayed(Duration(seconds: 5));
  print('I am a functional function :)');
  return 42;
}
