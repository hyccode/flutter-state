import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProxyProviderExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ProxyProvider<Counter, Translations>(
          create: (_) => Translations(0),
          update: (_, counter, tra) {
            Translations(counter.count);
            return tra;
          },
        ),
        ProxyProvider3<Counter, Counter, Counter, Translations>(
          create: (_) => Translations(0),
          update: (_, counter, counter1, counter2, tra) {
            Translations(counter.count);
            return tra;
          },
        ),
      ],
      child: ProviderExampleResultPage(),
    );
  }
}

class Counter with ChangeNotifier implements ReassembleHandler{
  int _count = 0;

  int get count => _count;



  void increment() {
    _count++;
    notifyListeners();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    // print();
  }


}

class Translations {
  Translations(this._value) {
    print(_value);
  }

  final int _value;

  String get title => 'You clicked $_value times';
}

class ProviderExampleResultPage extends StatelessWidget {
  const ProviderExampleResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            const Count(),
            const Count1(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        '${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}

class Count1 extends StatelessWidget {
  const Count1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        '${context.watch<Translations>().title} ',
        style: Theme.of(context).textTheme.headline4);
  }
}
