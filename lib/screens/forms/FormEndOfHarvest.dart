import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

// Utilities
import 'package:erbanova/utilities/PdfApi.dart';

// Widgets
import 'package:erbanova/widgets/AppBar.dart';
import 'package:erbanova/widgets/ContainerField.dart';
import 'package:erbanova/widgets/SectionLabel.dart';
import 'package:erbanova/widgets/RadioField.dart';

class FormEndOfHarvest extends StatefulWidget {
  final String basePath;
  const FormEndOfHarvest({required this.basePath});

  @override
  _FormEndOfHarvestState createState() => _FormEndOfHarvestState();
}

class _FormEndOfHarvestState extends State<FormEndOfHarvest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _typeOfProduction = false;

  String _numberOfInitialPlants = '';
  String _numberOfFinalPlants = '';
  String _weightBeforeDrying = '';
  String _weightAfterDrying = '';

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      labelStyle: new TextStyle(color: Colors.black87),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green[700]!),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green[700]!),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green[700]!),
      ),
    );
  }

  Widget _builderFormField(String label, String state) {
    return ContainerField(
      textFormField: TextFormField(
        decoration: inputDecoration(label),
        cursorColor: Colors.green[700],
        onChanged: (value) {
          switch (state) {
            case '_numberOfInitialPlants':
              this._numberOfInitialPlants = value;
              break;
            case '_numberOfFinalPlants':
              this._numberOfFinalPlants = value;
              break;
            case '_weightBeforeDrying':
              this._weightBeforeDrying = value;
              break;
            case '_weightAfterDrying':
              this._weightAfterDrying = value;
              break;
            default:
              print('error');
          }

          setState(() {});
        },
      ),
    );
  }

  String checkRadio(bool radio) {
    return (radio) ? 'Interna' : 'Esterna';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: ErbanovaAppBarText('Crea report germinazione'),
      body: Container(
        color: Colors.lightGreen[200],
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, top: 0.0, right: 10.0, bottom: 10.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SectionLabel(text: 'Modulo di fine raccolto'),
                  RadioRow(rowChildren: [
                    RadioField(
                        selectText: 'Tipo di Produzione',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _typeOfProduction,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                this._typeOfProduction = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _typeOfProduction,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                this._typeOfProduction = value;
                              });
                            }
                          },
                        ),
                        screenWidth: screenWidth)
                  ], screenWidth: screenWidth),
                  Row(
                    children: <Widget>[
                      _builderFormField('Numero di Piante Iniziali',
                          '_numberOfInitialPlants'),
                      _builderFormField(
                          'Numero di Piante Finali', '_numberOfFinalPlants'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _builderFormField(
                          'Peso Totale (Non Essiccato)', '_weightBeforeDrying'),
                      _builderFormField('Peso Totale (Dopo Essiccatura)',
                          '_weightAfterDrying'),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 6.0),
                          child: Container(
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_numberOfInitialPlants.isNotEmpty &&
                                    _numberOfFinalPlants.isNotEmpty &&
                                    _weightBeforeDrying.isNotEmpty &&
                                    _weightAfterDrying.isNotEmpty) {
                                  await PdfApi.generateFormEndOfHarvest(
                                      path: widget.basePath +
                                          '/Report Fine Raccolto',
                                      lot: basename(widget.basePath),
                                      params: [
                                        checkRadio(_typeOfProduction),
                                        _numberOfInitialPlants,
                                        _numberOfFinalPlants,
                                        _weightBeforeDrying,
                                        _weightAfterDrying,
                                      ]);
                                  Navigator.pop(context, true);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          action: SnackBarAction(
                                            label: 'Chiudi',
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                            },
                                          ),
                                          content: Row(
                                            children: [
                                              Icon(
                                                Icons.error,
                                                color: Colors.white,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    'Alcuni moduli o foto non sono stati inseriti!'),
                                              ),
                                            ],
                                          )));
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green[700]!),
                              ),
                              child: Text(
                                'Crea PDF',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
