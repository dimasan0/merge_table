import 'package:flutter/material.dart';
import 'package:merge_table/merge_table.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController verticalScroll = ScrollController();
  final ScrollController horizontalScroll = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("data"),
            const SizedBox(
              height: 16,
            ),
            buildMergeTable(),
          ],
        ),
      ),
    );
  }

  Widget buildMergeTable() {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 500,
      ),
      child: Stack(
        children: [
          Scrollbar(
            controller: horizontalScroll,
            thumbVisibility: true,
            thickness: 12,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: horizontalScroll,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 2000,
                ),
                child: Scrollbar(
                  controller: verticalScroll,
                  thumbVisibility: true,
                  thickness: 12,
                  child: SingleChildScrollView(
                    controller: verticalScroll,
                    scrollDirection: Axis.vertical,
                    child: IntrinsicWidth(
                      child: MergeTable(
                        borderColor: Colors.black,
                        alignment: MergeTableAlignment.center,
                        // rowHeight: 80,
                        columns: generateColumn(),
                        rows: generateRows(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return MergeTable(
    //   borderColor: Colors.black,
    //   alignment: MergeTableAlignment.center,
    //   // rowHeight: 80,
    //   columns: generateColumn(),
    //   rows: generateRows(),
    // );
  }

  List<BaseMColumn> generateColumn() {
    List<dynamic> columns = [
      "tes",
      "Product",
      "Seal",
      {
        "Reading": ["Before", "Then", "After"]
      },
      "Write",
      {
        "asw": [
          "anj",
          "ajg",
        ]
      },
      "jir",
    ];

    return List.generate(columns.length, (index) {
      if (columns[index] is Map) {
        String colHeader = columns[index].keys.toList()[0];
        List<String> colChild = columns[index].values.toList()[0];
        return MMergedColumns(
            header: buildColumnContainer(colHeader),
            columns: List.generate(colChild.length, (index) {
              return buildColumnContainer(colChild[index]);
            }));
      }

      String message = columns[index];
      return MColumn(
        header: buildColumnContainer(message),
      );
    });
  }

  Widget buildColumnContainer(text) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      // width: 50 + 60,
      child: text.length > 35
          ? Tooltip(
              message: text,
              triggerMode: TooltipTriggerMode.tap,
              margin: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            )
          : Text(
              text,
              textAlign: TextAlign.center,
            ),
    );
  }

  List<List<BaseMRow>> generateRows() {
    List<List<dynamic>> rows = [
      [
        "tes 1",
        "Product 1",
        "Seal 1",
        ["Before 1", "Then 1", "After 1"],
        "Write 1",
        // "asw 1",
        ["anj 1", "ajg 1"],
        "jir 1",
      ],
      [
        "tes 2",
        "Product 2",
        "Seal 2",
        ["Before 2", "Then 2", "After 2"],
        "Write 2",
        // "asw 2",
        ["anj 2", "ajg 2"],
        "jir 2",
      ],
    ];

    return List.generate(rows.length, (index) {
      return generateCell(rows[index]);
    });
  }

  List<BaseMRow> generateCell(rows) {
    return List.generate(rows.length, (index) {
      if (rows[index] is List) {
        return MMergedRows(List.generate(rows[index].length,
            (idx) => buildColumnContainer(rows[index][idx])));
      }
      return MRow(buildColumnContainer(rows[index]));
    });
  }
}
