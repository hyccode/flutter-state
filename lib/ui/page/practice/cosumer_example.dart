import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CosumerExamplePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///这里用到了MultiProvider，针对多个Provider的使用场景
    ///在这里我们初始化了CounterProvider并且指定了child为MaterialApp
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
      child: MaterialApp(
        home: CosumerPage(),
      ),
    );
  }
}

class CosumerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyPageState2();
}

class MyPageState1 extends State<CosumerPage> {
  @override
  Widget build(BuildContext context) {
    //获取CounterProvider
    CounterProvider counterProvider = Provider.of<CounterProvider>(context);

    print('MyPageState1页面重绘了。。。。。。。。。。。');

    return Scaffold(
      appBar: AppBar(
        title: Text('my page'),
      ),
      body: Center(
          child: Text(
        //获取数据
        'value: ${counterProvider.value}',
        style: TextStyle(fontSize: 20),
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigation),
          onPressed: () {
            //调用increment方法改变数据
            counterProvider.increment();
          }),
    );
  }
}

class MyPageState2 extends State<CosumerPage> {
  ///初始化CounterProvider
  CounterProvider _counterProvider = new CounterProvider();

  @override
  Widget build(BuildContext context) {
    print('MyPageState2页面重绘了。。。。。。。。。。。');

    //整个页面使用ChangeNotifier来包裹
    return ChangeNotifierProvider(
      create: (_) => _counterProvider,
      child:
          //child里面的内容不会因为数据的改变而重绘
          Scaffold(
        appBar: AppBar(
          title: Text('my page'),
        ),
        body: Center(child:
            //使用Cousumer来获取Provider
            Consumer(builder: (BuildContext context,
                CounterProvider counterProvider, Widget child) {
          print('Text重绘了。。。。。。');
          return Text(
            //获取数据
            'value: ${counterProvider.value}',
            style: TextStyle(fontSize: 20),
          );
        })),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.navigation),
            onPressed: () {
              //调用increment方法改变数据
              _counterProvider.increment();
            }),
      ),
    );
  }
}

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
