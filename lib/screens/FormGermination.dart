import 'package:flutter/material.dart';

// Utilities
import 'package:erbanova/utilities/PdfApi.dart';

// Widgets
import 'package:erbanova/widgets/AppBar.dart';
import 'package:erbanova/widgets/ContainerField.dart';
import 'package:erbanova/widgets/SectionLabel.dart';
import 'package:erbanova/widgets/RadioField.dart';

class FormGermination extends StatefulWidget {
  final String basePath;
  const FormGermination({required this.basePath});

  @override
  _FormGerminationState createState() => _FormGerminationState();
}

class _FormGerminationState extends State<FormGermination> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _temperature = '';
  String _humidity = '';
  String _ph = '';
  String _ec = '';
  String _tds = '';
  String _waterTemperature = '';
  String _otherProblems = '';

  bool _visibleRoots = false;
  bool _damageSignals = false;
  bool _sproutedSeed = false;
  bool _chlorosisAndFoliarProblems = false;
  bool _growthProblems = false;
  bool _signsOfMold = false;

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
    return Scaffold(
      appBar: ErbanovaAppBarText('Crea nuovo report germinazione'),
      //resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.lightGreen[200],
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, top: 24.0, right: 10.0, bottom: 0.0),
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
                  SectionLabel(
                    text: 'Controlli radici',
                  ),
                  RadioRow(
                    rowChildren: [
                      RadioField(
                        selectText: 'Radici visibili: ',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _visibleRoots,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _visibleRoots = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _visibleRoots,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _visibleRoots = value;
                              });
                            }
                          },
                        ),
                      ),
                      RadioField(
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
                  SectionLabel(text: 'Controlli sulla pianta'),
                  RadioRow(
                    rowChildren: [
                      RadioField(
                        selectText: 'Seme germogliato: ',
                        paddingLeft: false,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _sproutedSeed,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _sproutedSeed = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _sproutedSeed,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _sproutedSeed = value;
                              });
                            }
                          },
                        ),
                      ),
                      RadioField(
                        selectText: 'Problemi di crescita',
                        paddingLeft: true,
                        radioTrue: Radio(
                          value: true,
                          groupValue: _growthProblems,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _growthProblems = value;
                              });
                            }
                          },
                        ),
                        radioFalse: Radio(
                          value: false,
                          groupValue: _growthProblems,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _growthProblems = value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  RadioRow(
                    rowChildren: [
                      RadioField(
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
                                    _waterTemperature.isNotEmpty) {
                                  print('Temperatura: ' + _temperature);
                                  print('Umidità: ' + _humidity);
                                  print('PH: ' + _ph);
                                  print('EC: ' + _ec);
                                  print('TDS: ' + _tds);
                                  print('Temp. Acqua: ' + _waterTemperature);

                                  print('Radici visibili: ' +
                                      checkRadio(_visibleRoots));
                                  print('Segni di danni: ' +
                                      checkRadio(_damageSignals));
                                  print('Semi germogliati: ' +
                                      checkRadio(_sproutedSeed));
                                  print('Clorosi e problemi fogliari: ' +
                                      checkRadio(_chlorosisAndFoliarProblems));
                                  print('Problemi di crescita: ' +
                                      checkRadio(_growthProblems));
                                  print('Segni di muffa: ' +
                                      checkRadio(_signsOfMold));

                                  print(': ' + _otherProblems);

                                  final pdf = await PdfApi.generateCenteredText(
                                      widget.basePath + '/Report Germinazione',
                                      'Temperatura: ' + _temperature);
                                  Navigator.pop(context, true);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          action: SnackBarAction(
                                            label: 'Chiudi',
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar;
                                            },
                                          ),
                                          content: Row(
                                            children: [
                                              Icon(
                                                Icons.error,
                                                color: Colors.white,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Expanded(
                                                  child: Text(
                                                      'Alcuni input non sono compilati!'),
                                                ),
                                              )
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
