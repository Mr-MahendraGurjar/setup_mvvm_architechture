import 'package:firebase_core/firebase_core.dart';
import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/app/app_router.dart';
import 'package:setup_mvvm_architechture/app/navigationKeys.dart';
import 'package:setup_mvvm_architechture/app/service_locator.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/arch/logger.dart';
import 'package:setup_mvvm_architechture/ui/theming/decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static Locale getLocale(BuildContext context) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    return state.locale!;
  }

  static void updateAppState(BuildContext context) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setState(() {
      state.locale = Locale(EN);
      Logger.log('App locale => ${state.locale}');
    });
  }
}

class _MyAppState extends State<MyApp> {
  Locale? locale; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locale,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (this.locale == null) {
          this.locale = Locale(AppLocalizations.supportedLanguageCodes.first);
        }
        return this.locale;
      },
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales:
          AppLocalizations.supportedLanguageCodes.map((val) => Locale(val)),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: AppRouter.home,
      navigatorKey: keyAppNavigator,
      onGenerateRoute: (settings) =>
          AppRouter.onGenerateRoute(settings, context),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Cx360',
              style: TextStyle(fontSize: 30),
            ),
          )
          // getRadioButtons(),
          // dropDownExample(),
          // getDateTimePicker(),
          // checkBoxExamle(),
          // getTextField(),
          // getButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  getButton() {
    return InkWell(
      onTap: () {
        networkRepository().getApiKey('AMH_QA');
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), border: Border.all()),
        child: Text('Button'),
      ),
    );
  }

  int _value = 1;

  String radioItem = '';

  Widget getRadioButtons() {
    return Column(
      children: <Widget>[
        RadioListTile(
          groupValue: radioItem,
          title: Text('Radio Button Item 1'),
          value: 'Item 1',
          onChanged: (String? val) {
            setState(() {
              print(val);
              radioItem = val!;
            });
          },
        ),
        RadioListTile(
          groupValue: radioItem,
          title: Text('Radio Button Item 2'),
          value: 'Item 2',
          onChanged: (String? val) {
            print(val);
            setState(() {
              radioItem = val!;
            });
          },
        ),
      ],
    );
  }

  Widget dropDownExample() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), border: Border.all()),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              value: _selectedItem,
              items: _dropdownMenuItems,
              onChanged: (ListItem? value) {
                setState(() {
                  _selectedItem = value!;
                });
              }),
        ),
      ),
    );
  }

  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<DropdownMenuItem<ListItem>>? _dropdownMenuItems;
  ListItem? _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems![0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  Widget getDateTimePicker() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () => _selectDate(context),
          child: Text(currentDate.toString()),
        ),
      ],
    );
  }

  bool valuefirst = false;
  bool valuesecond = false;

  Widget checkBoxExamle() {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Text(
              'Checkbox: ',
              style: TextStyle(fontSize: 17.0),
            ),
            Checkbox(
              checkColor: Colors.greenAccent,
              activeColor: Colors.red,
              value: this.valuefirst,
              onChanged: (bool? value) {
                setState(() {
                  this.valuefirst = value!;
                });
              },
            ),
            Checkbox(
              value: this.valuesecond,
              onChanged: (bool? value) {
                setState(() {
                  this.valuesecond = value!;
                });
              },
            ),
          ],
        ),
      ],
    ));
  }

  Widget getTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: 4,
        decoration: DefaultInputDecoration(
          labelText: 'Enter Sample Text',
        ),
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
