import 'package:flutter/material.dart';
import 'package:merge_table/merge_table.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMergeTable(),
    );
  }

  Widget buildMergeTable() {
    return MergeTable(
      borderColor: Colors.black,
      alignment: MergeTableAlignment.center,
      rowHeight: 80,
      columns: [
        MColumn(header: const Text("Pump")),
        MColumn(header: const Text("Product")),
        MColumn(header: const Text("Seal")),
        MMergedColumns(
          header: const Text("Reading"),
          columns: [
            const Text("Before"),
            const Text("Then"),
            const Text("After")
          ],
        ),
        MColumn(header: const Text("Write")),
      ],
      rows: [
        [
          MRow(const Text("1")),
          MRow(const Text("2")),
          MRow(const Text("3")),
          MMergedRows([
            const Text("4"),
            const Text("5"),
            const Text("8"),
          ]),
          MRow(const Text("6")),
        ],
        [
          MRow(const Text("1")),
          MRow(const Text("2")),
          MRow(const Text("3")),
          MMergedRows([
            const Text("4"),
            const Text("5"),
            const Text("8"),
          ]),
          MRow(const Text("6")),
        ],
      ],
    );
  }
}
