import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';
import 'package:erbanova/widgets/FormField.dart' as CustomForm;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ErbanovaAppBarText('Crea nuovo report germinazione'),
      body: Container(
        color: Colors.lightGreen[200],
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, top: 24.0, right: 10.0, bottom: 0.0),
          child: Column(
            children: [
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SectionLabel(
                        text: 'Valori ambientali',
                      ),
                      Row(
                        children: <Widget>[
                          CustomForm.FormField(
                              label: 'Temperatura', state: _temperature),
                          CustomForm.FormField(
                              label: 'Umidità', state: _humidity),
                        ],
                      ),
                      SectionLabel(
                        text: 'Valori acqua',
                      ),
                      Row(
                        children: <Widget>[
                          CustomForm.FormField(label: 'PH', state: _ph),
                          CustomForm.FormField(
                              label: 'Temp. Acqua', state: _waterTemperature),
                        ],
                      ),
                      Row(
                        children: [
                          CustomForm.FormField(label: 'TDS', state: _tds),
                          CustomForm.FormField(label: 'EC', state: _ec),
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
                          CustomForm.FormField(
                              label: 'Altri problemi', state: _otherProblems),
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
                                  onPressed: () {
                                    /*if (_formKey != null) {
                                      if (_formKey.currentState.validate())
                                    }*/
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
            ],
          ),
        ),
      ),
    );
  }
}
