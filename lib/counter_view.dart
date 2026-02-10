import 'package:flutter/material.dart';
import 'counter_controller.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final CounterController _controller = CounterController();
  final TextEditingController _stepController = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 1 - Multi-Step Counter")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Nilai Counter:"),
            Text(
              '${_controller.value}',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _stepController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Step",
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                final step = int.tryParse(val) ?? 1;
                _controller.setStep(step);
              },
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _controller.increment()),
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _controller.decrement()),
                  child: const Text("-"),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _controller.reset()),
                  child: const Text("Reset"),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text("History (5 terakhir):"),
            const SizedBox(height: 8),

            Expanded(
              child: ListView(
                children: _controller.history
                    .map((e) => ListTile(title: Text(e)))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
