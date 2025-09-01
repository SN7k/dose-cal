import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final msgs = [
      _Msg('Hello, good morning 👋', false),
      _Msg('I’m from Customer Service. How can I help?', false),
      _Msg('I need help with a dosing calculation.', true),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Help Center')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: msgs.length,
              itemBuilder: (_, i) => _bubble(msgs[i]),
            ),
          ),
          const Divider(height: 1),
          _composer(),
        ],
      ),
    );
  }

  Widget _bubble(_Msg m) => Align(
        alignment: m.mine ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: m.mine ? const Color(0xFF5B6BE1) : const Color(0xFF161B29),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(m.text),
        ),
      );

  Widget _composer() => Container(
        color: const Color(0xFF0B1220),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your message…',
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.attach_file), onPressed: () {}),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(56, 56), padding: EdgeInsets.zero),
              child: const Icon(Icons.send),
            )
          ],
        ),
      );
}

class _Msg {
  final String text;
  final bool mine;
  _Msg(this.text, this.mine);
}
