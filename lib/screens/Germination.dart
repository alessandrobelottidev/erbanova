import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';

class Germination extends StatefulWidget {
  @override
  _GerminationState createState() => _GerminationState();
}

class _GerminationState extends State<Germination> {
  final List exampleList = ["Test1", "Test2", "Test3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ErbanovaAppBarText('Fase di germinazione'),
      body: Container(
        color: Colors.lightGreen[200],
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, top: 24.0, right: 10.0, bottom: 0.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 128.0,
                child: ListView.builder(
                  itemCount: exampleList.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        onTap: () {},
                        title: Text(
                          exampleList[i],
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
