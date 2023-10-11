import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'dart:math';

//组件
import './buildContent.dart';
// 输入框组件
import './GuessField.dart';

final dio = Dio();
Random random = Random();

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  // 随机数
  int count = 0;
  // 是否禁止
  bool isDisable = false;
  // 输入的结果
  int isBig = -1;

  // 输入框控制器
  TextEditingController fieldController = TextEditingController();

  // 输入器点击确定
  void onCheck() {
    int? guessValue = int.tryParse(fieldController.text);
    // 游戏未开始，或者输入非整数，无视
    if (guessValue == null) return;

    if (guessValue == count) {
      setState(() {
        isBig = -1;
        isDisable = false;
      });
      return;
    }

    setState(() {
      isBig = guessValue > count ? 1 : 0;
    });

    print('内容: ${fieldController.text}');
  }

  void _changeCount() {
    setState(() {
      count = random.nextInt(100);
      isDisable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GuessField(controller: fieldController, checkCallback: onCheck),
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    if (isBig == 1)
                      const BuildContent(color: Colors.redAccent, info: '大了'),
                    const Spacer(),
                    if (isBig == 0)
                      const BuildContent(color: Colors.blueAccent, info: '小了'),
                    // Expanded(child: Container(color: Colors.blueAccent)),
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isDisable)
                        const Text(
                          '随机数',
                          style: TextStyle(fontSize: 30),
                        ),
                      Text(
                        isDisable ? '**' : '$count',
                        style: const TextStyle(fontSize: 50),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isDisable ? Colors.grey : null,
        onPressed: isDisable ? null : _changeCount,
        child: const Icon(Icons.generating_tokens_outlined),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    getHttp();
  }

  void getHttp() async {
    final response = await dio.get(
        'http://test.rewuyqt.com/m/AgentAction.do?dispatch=fetch&key=AgentAction.fetch');
    print(response);
  }
}
