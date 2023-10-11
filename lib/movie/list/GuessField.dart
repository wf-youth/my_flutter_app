import 'package:flutter/material.dart';

class GuessField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback checkCallback;

  const GuessField(
      {super.key, required this.controller, required this.checkCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(13),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  controller: controller,
                  style: const TextStyle(textBaseline: TextBaseline.alphabetic),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      filled: true,
                      fillColor: Color(0xffF3F6F9),
                      constraints: BoxConstraints(maxHeight: 35),
                      hintText: '请输入0~100的数字',
                      hintStyle:
                          TextStyle(color: Colors.black12, fontSize: 14))),
            ),
            IconButton(
                onPressed: checkCallback,
                icon: const Icon(
                  Icons.check,
                ))
          ],
        ));
  }
}
