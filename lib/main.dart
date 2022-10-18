import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/result.dart';
import 'components/listHistory.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  TextEditingController controllerInput = new TextEditingController();
  String _newValue = "Kelvin";
  double hasil = 0;
  List<String> listViewItem = <String>[];

  void _konversi() {
    setState(
      () {
        _inputUser = double.parse(controllerInput.text);
        if (_newValue == "Kelvin")
          hasil = _inputUser + 273;
        else
          hasil = (4 / 5) * _inputUser;
      },
    );
  }

  var listItem = ["Kelvin", "Reamur"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iftitah Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Temperature Converter"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Input(controllerInput: controllerInput),
              DropdownButton<String>(
                items: listItem.map(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                value: _newValue,
                onChanged: (String? changeValue) {
                  setState(() {
                    _newValue = changeValue.toString();
                  });
                  _konversi();
                  listViewItem.add('$_newValue: $hasil');
                },
              ),
              result(hasil: hasil),
              const ConversionButton(),
              const Center(
                child: Text(
                  'Riwayat Konversi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: listHistory(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.controllerInput,
  }) : super(key: key);

  final TextEditingController controllerInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerInput,
      decoration: const InputDecoration(hintText: 'Masukkan Suhu Dalam celcius'),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}

class ConversionButton extends StatelessWidget {
  const ConversionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      width: 1000,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          // _konversi();
        },
        child: const Text('Konversi'),
      ),
    );
  }
}