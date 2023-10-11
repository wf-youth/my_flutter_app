import 'package:flutter/material.dart';

import './movie/list/index.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color.fromARGB(255, 229, 115, 115),
        // fontFamily: 'Georgia',
        textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 28, fontStyle: FontStyle.italic),
            bodyMedium: TextStyle(
              fontSize: 14,
            ),
            titleMedium: TextStyle(textBaseline: TextBaseline.alphabetic)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHomePage> {
  static final _controller = PageController(initialPage: 0);
  int currentIndex = 0;

  void changeCurrent(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('首页'),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
          drawer: const Drawer(
            child: MyDrawer(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              changeCurrent(value);
              _MyHomeState._controller.jumpToPage(currentIndex);
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: '列表',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined),
                label: '我的',
              )
            ],
          ),
          body: PageView(
            onPageChanged: (value) {
              changeCurrent(value);
            },
            // 设置控制器
            controller: _controller,
            // 设置子项集
            children: const [
              MovieList(),
              Text('消息'),
              Text('我的'),
            ],
          ),
        ));
  }
}

//Drawer
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 0),
      children: [
        const CustomerInfo(),
        ListTile(
            title: const Text('用户反馈'),
            trailing: const Icon(Icons.feedback),
            onTap: () {}),
        ListTile(
            title: const Text('注销'),
            trailing: const Icon(Icons.close),
            onTap: () {})
      ],
    );
  }
}

//个人信息 头像等
class CustomerInfo extends StatefulWidget {
  const CustomerInfo({super.key});

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  @override
  Widget build(BuildContext context) {
    return const UserAccountsDrawerHeader(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              //渐变位置
              begin: Alignment.topRight, //右上
              end: Alignment.bottomLeft, //左下
              stops: [
            0.0,
            1.0
          ], //[渐变起始点, 渐变结束点]
              //渐变颜色[始点颜色, 结束颜色]
              colors: [
            Color.fromARGB(255, 229, 115, 115),
            Color.fromARGB(255, 183, 170, 240)
          ])),
      accountName: Text('测试'),
      accountEmail: Text('test@qq.com'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://p9-passport.byteacctimg.com/img/user-avatar/8b472f29b528ad097a78d288ef895900~200x200.awebp'),
      ),
    );
  }
}
