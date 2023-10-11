import 'package:flutter/material.dart';

class BuildContent extends StatefulWidget {
  final Color color;
  final String info;

  const BuildContent({super.key, required this.color, required this.info});

  @override
  State<BuildContent> createState() => _BuildContentState();
}

class _BuildContentState extends State<BuildContent>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    animationController.forward();
  }

  @override
  void dispose() {
    AnimationController.unbounded(vsync: this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: widget.color,
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (_, child) => Text(
            widget.info,
            style: TextStyle(
                color: Colors.white,
                fontSize: 50 * (animationController.value)),
          ),
        ),
      ),
    );
  }
}
