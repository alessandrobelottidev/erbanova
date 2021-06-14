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

class FormBlossom extends StatefulWidget {
  final String basePath;
  const FormBlossom({required this.basePath});

  @override
  _FormBlossomState createState() => _FormBlossomState();
}

class _FormBlossomState extends State<FormBlossom> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _temperature = '';
  String _humidity = '';
  String _ph = '';
  String _ec = '';
  String _tds = '';
  String _waterTemperature = '';
  String _otherProblems = '';

  bool _regularWaterLevel = false;
  bool _regularFertilizerLevel = false;
  bool _regularRootsGrowth = false;
  bool _damageSignals = false;
  bool _hoursOfLightAndDarkRegular = false;
  bool _chlorosisAndFoliarProblems = false;
  bool _signsOfMold = false;
  bool _florealPresence = false;
  bool _malePlantPresence = false;
  bool _signsOfErmafroditism = false;
  bool _yellowishPistils = false;
  bool _amberTricomes = false;
  bool _continueToHarvest = false;

  String _yellowishPistilsPercentage = '';
  String _amberTricomesPercentage = '';
  String _totalGrams = '';

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
              print(this._temperature);
              break;
            case '_humidity':
              this._humidity = value;
              break;
            case '_ph':
              this._ph = value;
              break;
            case '_ec':
              this._ec = value;
              break;
            case '_tds':
              this._tds = value;
              break;
            case '_waterTemperature':
              this._waterTemperature = value;
              break;
            case '_otherProblems':
              this._otherProblems = value;
              break;
            case '_yellowishPistilsPercentage':
              this._yellowishPistilsPercentage = value;
              break;
            case '_amberTricomesPercentage':
              this._amberTricomesPercentage = value;
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
          titleAppBar: 'Crea report fioritura',
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
                  SectionLabel(
                    text: 'Valori acqua',
                  ),
                  Row(
                    children: <Widget>[
                      _builderFormField('PH', '_ph'),
                      _builderFormField('Temp. Acqua', '_waterTemperature'),
                    ],
                  ),
                  Row(
                    children: [
                      _builderFormField('TDS', '_tds'),
                      _builderFormField('EC', '_ec'),
                    ],
                  ),
                  RadioRow(
                    screenWidth: screenWidth,
                    rowChildren: [
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Livello Acqua regolare: ',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _regularWaterLevel,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _regularWaterLevel = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _regularWaterLevel,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _regularWaterLevel = value;
                              });
                            }
                          },
                        ),
                      ),
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Dosaggio Fertilizzante regolare: ',
                        paddingLeft: true,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _regularFertilizerLevel,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _regularFertilizerLevel = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _regularFertilizerLevel,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _regularFertilizerLevel = value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SectionLabel(
                    text: 'Controlli radici',
                  ),
                  RadioRow(
                    screenWidth: screenWidth,
                    rowChildren: [
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Crescita regolare: ',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _regularRootsGrowth,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _regularRootsGrowth = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _regularRootsGrowth,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _regularRootsGrowth = value;
                              });
                            }
                          },
                        ),
                      ),
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Segni di danni: ',
                        paddingLeft: true,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _damageSignals,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _damageSignals = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _damageSignals,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _damageSignals = value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SectionLabel(
                    text: 'Controlli illuminazione',
                  ),
                  RadioRow(
                    screenWidth: screenWidth,
                    rowChildren: [
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Ore di Luce/Buio Rispettate: ',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _hoursOfLightAndDarkRegular,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _hoursOfLightAndDarkRegular = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _hoursOfLightAndDarkRegular,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _hoursOfLightAndDarkRegular = value;
                              });
                            }
                          },
                        ),
                      ),
                      Container(),
                    ],
                  ),
                  SectionLabel(text: 'Controlli sulla pianta'),
                  RadioRow(
                    screenWidth: screenWidth,
                    rowChildren: [
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Clorosi e problemi fogliari: ',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _chlorosisAndFoliarProblems,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _chlorosisAndFoliarProblems = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _chlorosisAndFoliarProblems,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _chlorosisAndFoliarProblems = value;
                              });
                            }
                          },
                        ),
                      ),
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Segni di muffa: ',
                        paddingLeft: true,
                        radioTrue: Radio(
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
                        radioFalse: Radio(
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
                      ),
                    ],
                  ),
                  SectionLabel(
                    text: 'Altro',
                  ),
                  Row(
                    children: <Widget>[
                      _builderFormField('Altri problemi', '_otherProblems'),
                    ],
                  ),
                  RadioRow(
                    screenWidth: screenWidth,
                    rowChildren: [
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Presenza di Fiori: ',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _florealPresence,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _florealPresence = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _florealPresence,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _florealPresence = value;
                              });
                            }
                          },
                        ),
                      ),
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Presenza di piante Maschili: ',
                        paddingLeft: true,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _malePlantPresence,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _malePlantPresence = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _malePlantPresence,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _malePlantPresence = value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: RadioField(
                          screenWidth: screenWidth,
                          selectText: 'Segni di Ermafroditismo: ',
                          paddingLeft: false,
                          radioTrue: Radio(
                            value: true,
                            groupValue: _signsOfErmafroditism,
                            onChanged: (bool? value) {
                              if (value != null) {
                                setState(() {
                                  _signsOfErmafroditism = value;
                                });
                              }
                            },
                          ),
                          radioFalse: Radio(
                            value: false,
                            groupValue: _signsOfErmafroditism,
                            onChanged: (bool? value) {
                              if (value != null) {
                                setState(() {
                                  _signsOfErmafroditism = value;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  RadioRow(
                    screenWidth: screenWidth,
                    rowChildren: [
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Presenza di Pistilli ingialliti: ',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _yellowishPistils,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _yellowishPistils = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _yellowishPistils,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _yellowishPistils = value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _builderFormField('Percentuale indicativa',
                          '_yellowishPistilsPercentage')
                    ],
                  ),
                  RadioRow(
                    screenWidth: screenWidth,
                    rowChildren: [
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Presenza di Tricomi Ambrati: ',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _amberTricomes,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _amberTricomes = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _amberTricomes,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _amberTricomes = value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _builderFormField(
                          'Percentuale indicativa', '_amberTricomesPercentage')
                    ],
                  ),
                  RadioRow(
                    screenWidth: screenWidth,
                    rowChildren: [
                      RadioField(
                        screenWidth: screenWidth,
                        selectText: 'Procedere al raccolto? ',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _continueToHarvest,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _continueToHarvest = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _continueToHarvest,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _continueToHarvest = value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(children: <Widget>[
                    _builderFormField('Totale grammi raccolti', _totalGrams)
                  ]),
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
                                    _ph.isNotEmpty &&
                                    _ec.isNotEmpty &&
                                    _tds.isNotEmpty &&
                                    _waterTemperature.isNotEmpty &&
                                    _yellowishPistilsPercentage.isNotEmpty &&
                                    _amberTricomesPercentage.isNotEmpty &&
                                    _image != null) {
                                  await PdfApi.generateFormBlossom(
                                      path:
                                          widget.basePath + '/Report Fioritura',
                                      lot: basename(widget.basePath),
                                      image: _image,
                                      params: [
                                        _temperature,
                                        _humidity,
                                        _ph,
                                        _ec,
                                        _tds,
                                        _waterTemperature,
                                        checkRadio(_regularWaterLevel),
                                        checkRadio(_regularFertilizerLevel),
                                        checkRadio(_regularRootsGrowth),
                                        checkRadio(_damageSignals),
                                        checkRadio(_hoursOfLightAndDarkRegular),
                                        checkRadio(_chlorosisAndFoliarProblems),
                                        checkRadio(_signsOfMold),
                                        _otherProblems,
                                        checkRadio(_florealPresence),
                                        checkRadio(_malePlantPresence),
                                        checkRadio(_signsOfErmafroditism),
                                        checkRadio(_yellowishPistils),
                                        _yellowishPistilsPercentage,
                                        checkRadio(_amberTricomes),
                                        _amberTricomesPercentage,
                                        checkRadio(_continueToHarvest),
                                        _totalGrams
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
