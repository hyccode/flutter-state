import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class ExposingExamplePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider.value( value:Counter(),),
//       ],
//       child: ProviderExampleResultPage(),
//     );
//   }
// }
// class ExposingExamplePage extends StatelessWidget {
//
//   int count;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => MyModel(count),),
//       ],
//       child: ProviderExampleResultPage(),
//     );
//   }
// }

class ExposingExamplePage extends StatelessWidget {

  int count;


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ProxyProvider(update: (_,count,__) => MyModel(count),),
      ],
      child: ProviderExampleResultPage(),
    );
  }
}

class MyModel with ChangeNotifier {
  int _count = 0;


  MyModel(this._count);

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
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
            TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                  hintText: 'Contact Name'),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () => context.read<MyModel>().increment(),
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
        '${context.watch<MyModel>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}
