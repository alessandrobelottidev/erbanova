import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';

class FormField extends StatelessWidget {
  FormField({required this.label, required this.state});

  String label;
  String state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.green[700],
        decoration: InputDecoration(
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
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return '$label è obbligatorio';
          }
        },
        onSaved: (String? value) {
          if (value != null) {
            state = value;
          }
        },
      ),
    ));
  }
}

class SectionLabel extends StatelessWidget {
  SectionLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 0.0, left: 8.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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

  Widget _buildTemperatureField() {
    return FormField(label: 'Temperatura', state: _temperature);
  }

  Widget _buildHumidityField() {
    return FormField(label: 'Umidità', state: _humidity);
  }

  Widget _buildPHField() {
    return FormField(label: 'PH', state: _ph);
  }

  Widget _buildECField() {
    return FormField(label: 'EC', state: _ec);
  }

  Widget _buildTDSField() {
    return FormField(label: 'TDS', state: _tds);
  }

  Widget _buildWaterTemperatureField() {
    return FormField(label: 'Temp. Acqua', state: _waterTemperature);
  }

  /*Widget _buildVisibleRootsSelect() {
    return null;
  }

  Widget _buildVisibleDamageSelect() {
    return null;
  }

  Widget _buildSproutedSeedSelect() {
    return null;
  }

  Widget _buildGrowthProblemsSelect() {
    return null;
  }

  Widget _buildChlorosisAndFoliarProblemsSelect() {
    return null;
  }

  Widget _buildSignsOfMoldSelect() {
    return null;
  }*/

  Widget _buildOtherProblemsField() {
    return FormField(label: 'Altri problemi', state: _otherProblems);
  }

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
                          _buildTemperatureField(),
                          _buildHumidityField(),
                        ],
                      ),
                      SectionLabel(
                        text: 'Valori acqua',
                      ),
                      Row(
                        children: <Widget>[
                          _buildPHField(),
                          _buildWaterTemperatureField(),
                        ],
                      ),
                      Row(
                        children: [
                          _buildTDSField(),
                          _buildECField(),
                        ],
                      ),

                      /*SectionLabel(text: 'Controlli sulla pianta',),
                      Row(
                        children: <Widget>[
                          
                          _buildSproutedSeedSelect(),
                          _buildGrowthProblemsSelect(),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          _buildChlorosisAndFoliarProblemsSelect(),
                          _buildSignsOfMoldSelect(),
                        ],
                      ),*/
                      SectionLabel(
                        text: 'Altro',
                      ),
                      Row(
                        children: <Widget>[
                          _buildOtherProblemsField(),
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
