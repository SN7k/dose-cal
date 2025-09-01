import 'package:flutter/material.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(), title: const Text('Terms and Conditions')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: const Color(0xFF161B29),
              borderRadius: BorderRadius.circular(24)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _Pill(text: 'Last Update : 27 / 03 / 2019'),
                SizedBox(height: 16),
                _Para(
                    'Vivamus ex felis, ullamcorper ac metus ac, finibus egestas nibh…'),
                _Bullets([
                  'Donec molestie ultricies dolor…',
                  'Maecenas pharetra ligula…',
                  'Donec commodo gravida…'
                ]),
                _Para('Vestibulum consequat massa aliquet…'),
                _Para('Vivamus ex felis, ullamcorper ac metus…'),
              ]),
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  const _Pill({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xFF2563EB), borderRadius: BorderRadius.circular(14)),
      child: Text(text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}

class _Para extends StatelessWidget {
  final String text;
  const _Para(this.text);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(text),
      );
}

class _Bullets extends StatelessWidget {
  final List<String> items;
  const _Bullets(this.items);
  @override
  Widget build(BuildContext context) => Column(
        children: items
            .map((t) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  '),
                    Expanded(child: Text(t)),
                  ],
                ))
            .toList(),
      );
}
