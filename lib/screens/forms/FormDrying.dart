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
import 'package:erbanova/widgets/SelectText.dart';

class FormDrying extends StatefulWidget {
  final String basePath;
  const FormDrying({required this.basePath});

  @override
  _FormDryingState createState() => _FormDryingState();
}

class _FormDryingState extends State<FormDrying> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _temperature = '';
  String _humidity = '';

  bool _signsOfMold = false;
  bool _airRecycling = false;

  String _flowerState = 'Solamente Fiore';
  String _branchesDryness = 'Non secco';

  bool _completeDrying = false;

  var _image;

  Future getImage() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.camera);

    if (image != null) {
      final File file = File(image.path);
      setState(() {
        _image = file;
      });
    }
  }

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
            case '_temperature':
              this._temperature = value;
              break;
            case '_humidity':
              this._humidity = value;
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
    return (radio) ? 'Sì' : 'No';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: ErbanovaAppBarAct(
          titleAppBar: 'Crea nuovo report germinazione',
          actions: IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () => getImage(),
          )),
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
                  SectionLabel(
                    text: 'Valori ambientali',
                  ),
                  Row(
                    children: <Widget>[
                      _builderFormField('Temperatura', '_temperature'),
                      _builderFormField('Umidità', '_humidity'),
                    ],
                  ),
                  SectionLabel(text: 'Controlli di Routine'),
                  RadioRow(
                    screenWidth: screenWidth,
                    rowChildren: <Widget>[
                      RadioField(
                        selectText: 'Segni di muffa',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: false,
                          groupValue: _signsOfMold,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _signsOfMold = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: true,
                          groupValue: _signsOfMold,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _signsOfMold = value;
                              });
                            }
                          },
                        ),
                        screenWidth: screenWidth,
                      ),
                      RadioField(
                          selectText: 'Ricircolo di aria rispettato',
                          paddingLeft: true,
                          radioTrue: Radio(
                            value: false,
                            groupValue: _airRecycling,
                            onChanged: (bool? value) {
                              if (value != null) {
                                setState(() {
                                  _airRecycling = value;
                                });
                              }
                            },
                          ),
                          radioFalse: Radio(
                            value: true,
                            groupValue: _airRecycling,
                            onChanged: (bool? value) {
                              if (value != null) {
                                setState(() {
                                  _airRecycling = value;
                                });
                              }
                            },
                          ),
                          screenWidth: screenWidth)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        SelectText('Stato del Fiore'),
                        Radio(
                          value: 'Tutto il Ramo',
                          groupValue: _flowerState,
                          onChanged: (value) {
                            if (value != null) {
                              _flowerState = value.toString();
                              setState(() {});
                            }
                          },
                        ),
                        SelectText('Tutto il Ramo'),
                        Radio(
                          value: 'Solamente Fiore',
                          groupValue: _flowerState,
                          onChanged: (value) {
                            if (value != null) {
                              _flowerState = value.toString();
                              setState(() {});
                            }
                          },
                        ),
                        SelectText('Solamente Fiore'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        SelectText('Controllo secchezza rami'),
                        Radio(
                          value: 'Secco',
                          groupValue: _branchesDryness,
                          onChanged: (value) {
                            if (value != null) {
                              _branchesDryness = value.toString();
                              setState(() {});
                            }
                          },
                        ),
                        SelectText('Secco'),
                        Radio(
                          value: 'Non secco',
                          groupValue: _branchesDryness,
                          onChanged: (value) {
                            if (value != null) {
                              _branchesDryness = value.toString();
                              setState(() {});
                            }
                          },
                        ),
                        SelectText('Non secco'),
                      ],
                    ),
                  ),
                  RadioRow(
                    screenWidth: screenWidth,
                    rowChildren: <Widget>[
                      RadioField(
                        selectText: 'Segni di muffa',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: false,
                          groupValue: _signsOfMold,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _signsOfMold = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: true,
                          groupValue: _signsOfMold,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _signsOfMold = value;
                              });
                            }
                          },
                        ),
                        screenWidth: screenWidth,
                      ),
                      RadioField(
                          selectText: 'Essiccatura completa?',
                          paddingLeft: true,
                          radioTrue: Radio(
                            value: false,
                            groupValue: _completeDrying,
                            onChanged: (bool? value) {
                              if (value != null) {
                                setState(() {
                                  _completeDrying = value;
                                });
                              }
                            },
                          ),
                          radioFalse: Radio(
                            value: true,
                            groupValue: _completeDrying,
                            onChanged: (bool? value) {
                              if (value != null) {
                                setState(() {
                                  _completeDrying = value;
                                });
                              }
                            },
                          ),
                          screenWidth: screenWidth)
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
                                if (_temperature.isNotEmpty &&
                                    _humidity.isNotEmpty &&
                                    _image != null) {
                                  await PdfApi.generateFormDrying(
                                      path: widget.basePath +
                                          '/Report Essicatura',
                                      lot: basename(widget.basePath),
                                      image: _image,
                                      params: [
                                        _temperature,
                                        _humidity,
                                        checkRadio(_signsOfMold),
                                        checkRadio(_airRecycling),
                                        _flowerState,
                                        _branchesDryness,
                                        checkRadio(_completeDrying)
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
