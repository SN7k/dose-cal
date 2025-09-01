import 'package:flutter/material.dart';
import '../models/drugs.dart';

class DrugInfoScreen extends StatelessWidget {
  const DrugInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drug Information")),
      body: ListView(
        children: drugDatabase.entries.map((entry) {
          final drug = entry.key;
          final details = entry.value;
          return Card(
            child: ExpansionTile(
              title: Text(drug,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              children: [
                ListTile(title: Text("Typical dose: ${details['dose']}")),
                ListTile(title: Text("Max dose: ${details['max']}")),
                ListTile(title: Text("Notes: ${details['notes']}")),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
