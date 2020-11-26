import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyPageState2();
}

class MyPageState1 extends State<SelectPage> {
  ///初始化CounterProvider
  CounterProvider _counterProvider = new CounterProvider();

  @override
  Widget build(BuildContext context) {
    print('页面重绘了。。。。。。。。。。。');

    //整个页面使用ChangeNotifier来包裹
    return ChangeNotifierProvider(
      create: (context) => _counterProvider,
      child:
      //child里面的内容不会因为数据的改变而重绘
      Scaffold(
        appBar: AppBar(
          title: Text('my page'),
        ),
        body: Center(
            child:
            //使用Cousumer来获取Provider
            Column(
              children: <Widget>[
                //使用Consumer来获取CounterProvider，为Text提供数据
                Consumer(builder: (BuildContext context,
                    CounterProvider counterProvider, Widget child) {
                  print('Text1重绘了。。。。。。');

                  return Text(
                    //获取数据
                    'Text1 : ${counterProvider.value}',
                    style: TextStyle(fontSize: 20),
                  );
                }),
                //使用Consumer来获取CounterProvider，为Text提供数据
                Consumer(builder: (BuildContext context,
                    CounterProvider counterProvider, Widget child) {
                  print('Text2重绘了。。。。。。');

                  return Text(
                    //获取数据
                    'Text2 : ${counterProvider.value1}',
                    style: TextStyle(fontSize: 20),
                  );
                }),
                RaisedButton(
                  onPressed: () {
                    print('Button 1被点击了。。。。。。。。。。');
                    _counterProvider.increment();
                  },
                  child: Text('Button1'),
                ),
                RaisedButton(
                  onPressed: () {
                    print('Button 2被点击了。。。。。。。。。。');
                    _counterProvider.increment1();
                  },
                  child: Text('Button2'),
                )
              ],
            )),
      ),
    );
  }
}


class MyPageState2 extends State<SelectPage> {
  ///初始化CounterProvider
  CounterProvider _counterProvider = new CounterProvider();

  @override
  Widget build(BuildContext context) {
    print('页面重绘了。。。。。。。。。。。');

    //整个页面使用ChangeNotifier来包裹
    return ChangeNotifierProvider(
      create: (context) => _counterProvider,
      child:
      //child里面的内容不会因为数据的改变而重绘
      Scaffold(
        appBar: AppBar(
          title: Text('my page'),
        ),
        body: Center(
            child:
            //使用Cousumer来获取Provider
            Column(
              children: <Widget>[
                //用Selector替换Consumer
                Selector(
                    builder: (BuildContext context, int data, Widget child) {
                      print('Text 1 重绘了。。。。。。。。。。');
                      return Text(
                        //获取数据
                          'Text1 : ${data.toString()}',
                          style: TextStyle(fontSize: 20));
                    }, selector:
                    (BuildContext context, CounterProvider counterProvider) {
                  //这个地方返回具体的值，对应builder中的data
                  return counterProvider.value;
                }),
                Selector(
                    builder: (BuildContext context, int data, Widget child) {
                      print('Text 2 重绘了。。。。。。。。。。');
                      return Text(
                        //获取数据
                        'Text2 : ${data.toString()}',
                        style: TextStyle(fontSize: 20),
                      );
                    },
                    selector: (BuildContext context,
                        CounterProvider counterProvider) {
                      return counterProvider.value1;
                    }),
                RaisedButton(
                  onPressed: () {
                    print('Button 1被点击了。。。。。。。。。。');
                    _counterProvider.increment();
                  },
                  child: Text('Button1'),
                ),
                RaisedButton(
                  onPressed: () {
                    print('Button 2被点击了。。。。。。。。。。');
                    _counterProvider.increment1();
                  },
                  child: Text('Button2'),
                )
              ],
            )),
      ),
    );
  }
}


class CounterProvider with ChangeNotifier {
  int _count = 0;
  int _count1 = 100;

  int get value => _count;

  int get value1 => _count1;

  void increment() {
    _count++;
    notifyListeners();
  }

  void increment1() {
    _count1++;
    notifyListeners();
  }
}