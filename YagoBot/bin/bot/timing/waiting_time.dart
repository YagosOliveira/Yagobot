
///All the Waiting times of the Bot

class BotClock{

  Future clock(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }


  Stream<int> timedCounter(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
  }
}