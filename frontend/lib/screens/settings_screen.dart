import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          _group('Notifications', [
            _switch('General Notification', true),
            _switch('Sound', true),
            _switch('Vibrate', false),
          ]),
          _group('Security', [
            _switch('Remember me', true),
            _switch('Biometric ID', false),
          ]),
          _group('App', [
            _switch('App Updates', true),
            _switch('New Service Available', true),
            _switch('Tips Available', true),
          ]),
        ],
      ),
    );
  }

  static Widget _group(String title, List<Widget> children) => Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: const Color(0xFF161B29),
              borderRadius: BorderRadius.circular(16)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8, top: 4),
              child: Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            ...children,
          ]),
        ),
      );

  static Widget _switch(String t, bool v) => SwitchListTile(
      value: v,
      onChanged: (_) {},
      title: Text(t),
      activeThumbColor: const Color(0xFF5B6BE1));
}
