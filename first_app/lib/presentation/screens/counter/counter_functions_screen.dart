import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {

  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 238, 118),
        title: const Text('Counter Functions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter', style: const TextStyle( fontSize: 160, fontWeight: FontWeight.w100 ),),
            Text('Click${clickCounter > 1 ? 's' : ''}', style: const TextStyle(fontSize: 25))
            ]
          ),
        ),
        floatingActionButton: Column
        (
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          CustomButton(icon: Icons.refresh_outlined, onPressed: () {
            clickCounter = 0;
            setState(() { });
          }),
          const SizedBox(height: 10),
          CustomButton(icon: Icons.exposure_minus_1_outlined, onPressed: _onDecreaseState),
          const SizedBox(height: 10),
          CustomButton(icon: Icons.plus_one, onPressed: _onIncreaseState),
        ],)
    );
  }

  void _onIncreaseState() {
    setState(() {
      clickCounter++;
    });
  }

  void _onDecreaseState()
  {
    if(clickCounter == 0) return;
    setState(() {
      clickCounter--;
    });
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key, required this.icon, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      enableFeedback: true,
      elevation: 4,
      backgroundColor: const Color.fromARGB(255, 252, 238, 118),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
