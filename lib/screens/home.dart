import 'package:crcrme_material_theme/screens/button_showcase.dart';
import 'package:crcrme_material_theme/screens/input_showcase.dart';
import 'package:crcrme_material_theme/screens/dialog_showcase.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> _selected = [true, false];
  int _currentStep = 0;
  bool expansionPanel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CR CRME Flutter Template"),
      ),
      drawer: Drawer(
          child: Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  ListTile(
                    title: const Text("Button Showcase"),
                    onTap: () =>
                        Navigator.pushNamed(context, ButtonShowcase.routeName),
                  ),
                  ListTile(
                    title: const Text("Input Showcase"),
                    onTap: () =>
                        Navigator.pushNamed(context, InputShowcase.routeName),
                  ),
                  ListTile(
                    title: const Text("Dialog Showcase"),
                    onTap: () =>
                        Navigator.pushNamed(context, DialogShowcase.routeName),
                  ),
                ],
              ))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          children: [
            const Text(
                "Voici une application qui montre tous (presque) les widgets Flutter ainsi que leur theme !"),
            const Text("Naviguez via le Drawer en haut à gauche !"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionPanelList(
                  expansionCallback: (int panelIndex, bool isExpanded) {
                    setState(() {
                      expansionPanel = !isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                        isExpanded: expansionPanel,
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool open) =>
                            const Text("Expansion Panel List"),
                        body: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Chip(label: Text("Chip 1")),
                            Chip(label: Text("Chip 2")),
                            Chip(label: Text("Chip 3"))
                          ],
                        ))
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Card"),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                      LinearProgressIndicator(
                        value: null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  onSelectAll: (value) {
                    setState(() {
                      _selected = [value!, value];
                    });
                  },
                  columns: const [
                    DataColumn(label: Text("Column 1")),
                    DataColumn(label: Text("Column 2")),
                    DataColumn(label: Text("Column 3")),
                    DataColumn(label: Text("Column 4")),
                    DataColumn(label: Text("Column 5"))
                  ],
                  rows: [
                    DataRow(
                        selected: _selected[0],
                        onSelectChanged: (bool? v) {
                          setState(() {
                            _selected[0] = v!;
                          });
                        },
                        cells: const [
                          DataCell(Text("Cell 1-1")),
                          DataCell(Text("Cell 1-2")),
                          DataCell(Text("Cell 1-3")),
                          DataCell(Text("Cell 1-4")),
                          DataCell(Text("Cell 1-5"))
                        ]),
                    DataRow(
                        selected: _selected[1],
                        onSelectChanged: (bool? v) {
                          setState(() {
                            _selected[1] = v!;
                          });
                        },
                        cells: const [
                          DataCell(Text("Cell 2-1")),
                          DataCell(Text("Cell 2-2")),
                          DataCell(Text("Cell 2-3")),
                          DataCell(Text("Cell 2-4")),
                          DataCell(Text("Cell 2-5"))
                        ])
                  ]),
            ),
            Stepper(
                currentStep: _currentStep,
                onStepContinue: () {
                  setState(() {
                    _currentStep = (_currentStep + 1) % 3;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep = 0;
                  });
                },
                steps: const [
                  Step(
                      title: Text("Step 1"),
                      content: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sit amet ultrices nisi.")),
                  Step(
                      title: Text("Step 2"),
                      content: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sit amet ultrices nisi.")),
                  Step(
                      title: Text("Step 3"),
                      content: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sit amet ultrices nisi."))
                ])
          ],
        )),
      ),
    );
  }
}
