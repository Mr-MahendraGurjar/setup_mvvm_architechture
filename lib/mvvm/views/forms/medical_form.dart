import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/ui/theming/decorations.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:setup_mvvm_architechture/ui/widgets/app_action_bars.dart';
import 'package:setup_mvvm_architechture/ui/widgets/common/form_buttons.dart';
import 'package:setup_mvvm_architechture/ui/widgets/common/sub_form_buttons.dart';
import 'package:setup_mvvm_architechture/ui/widgets/custom_widgets/custom_row.dart';
import 'package:setup_mvvm_architechture/ui/widgets/custom_widgets/custom_row_medical.dart';
import 'package:setup_mvvm_architechture/ui/widgets/dividers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MedicalForm extends StatefulWidget {
  @override
  _MedicalFormState createState() => _MedicalFormState();
}

class _MedicalFormState extends State<MedicalForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController _assesmentStatusController =
      TextEditingController();
  final TextEditingController _documentVersionController =
      TextEditingController();
  final TextEditingController _assessmentDateController =
      TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _relationshipStatusController =
      TextEditingController();
  final TextEditingController _GenderController = TextEditingController();
  final TextEditingController _SexualOrientationController =
      TextEditingController();
  final TextEditingController _EthnicityController = TextEditingController();
  final TextEditingController _RaceController = TextEditingController();
  final TextEditingController _LanguagesSpokenController =
      TextEditingController();
  final TextEditingController _ReadingController = TextEditingController();
  final TextEditingController _WritingController = TextEditingController();
  final TextEditingController _MedicaidSeqController = TextEditingController();
  final TextEditingController _SSController = TextEditingController();
  final TextEditingController _MCOController = TextEditingController();
  final TextEditingController _VerifiedController = TextEditingController();

  List<DropdownMenuItem<ListItem>>? _dropdownMenuItems;
  ListItem? _selectedItem;
  var widgetWidth;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems![0].value;
  }

  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

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

  @override
  Widget build(BuildContext context) {
    widgetWidth = MediaQuery.of(context).size.width / 2 * 0.6;
    return Container(
      child: _medicalForm(),
    );
  }

  Widget _medicalForm() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: _formKey,
        autovalidate: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _diagnosesForm(),
            _medicationsForm(),
          ],
        ),
      ),
    );
  }

  Widget _diagnosesForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          '1. Diagnoses',
          style: AppTextStyles.formHeaders(),
        ),
        SizedBox(height: 10),
        Text(
          'List all current conditions and the most recent test date and result, if applicable, associated with each condition. For example: Hypertension (BP/date measured); Diabetes (HbA1c/result date); Asthma; Hyperlipidemia (LDLC/result date); Congestive Heart Failure; COPD; HIV/AIDS (CD4 count/result date); cancer; renal disease; liver disease; obesity; stroke history; vision/hearing impairment; neuropathy; incontinence, etc.',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        SizedBox(height: 20),
        SubFormButton(buttonText: 'Add Diagnoses'),
        SizedBox(height: 20),
        Divider(),
      ],
    );
  }

  Widget _medicationsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          '2. Medications (Prescriptions and Adherence)',
          style: AppTextStyles.formHeaders(),
        ),
        SizedBox(height: 10),
        Text(
          'List all current medications, including over-the-counter medicines and vitamins. In the event of a home visit, please ask the member to gather all of the medications in order to obtain the most accurate medication history possible.',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        SizedBox(height: 20),
        SubFormButton(buttonText: 'Add Medications'),
        SizedBox(height: 30),
        _medicationSubForm(),
        Divider(),
      ],
    );
  }

  Widget _medicationSubForm() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Text(
            'For Questions 2a – 2c, check the number next to the appropriate answer. Then add up the checked numbers to calculate a score.',
            style: AppTextStyles.formSubHeaders(),
          ),
          SizedBox(height: 16),
          Text(
            '2a. How often does the member (in his/her own perception) have difficulty taking medications on time? On time means no more than 2 hours before or 2 hours after the time that the doctor instructed.',
            style: AppTextStyles.formQuestion(),
          ),
          getRadioButtons(),
        ],
      ),
    );
  }

  Widget _assesmentStatus({controller, title, isEnabled = true}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 * 0.6,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: AppTextStyles.labelText(),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            enabled: isEnabled,
            decoration: DefaultInputDecoration(),
            keyboardType: TextInputType.text,
            style: AppTextStyles.n18(
              colors().editTextColor,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _assessmentDate() {
    return Container(
      width: widgetWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '* Assessment Date',
            style: AppTextStyles.labelText(),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _assessmentDateController,
            // enabled: false,
            decoration: DefaultInputDecoration(
                suffixIcon: Icon(Icons.date_range_outlined)),
            keyboardType: TextInputType.text,
            style: AppTextStyles.n18(
              colors().editTextColor,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              setState(() async {
                var selectedValue = await _selectDate(context);
                _assessmentDateController.text =
                    DateFormat('MM/dd/yyyy h:m:s a')
                        .format(DateFormat("MM/dd/yyyy").parse(selectedValue));
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _individualNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '* Individual Name',
          style: AppTextStyles.labelText(),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: widgetWidth,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: colors().editBorderColor)),
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
      ],
    );
  }

  String radioItem = '';
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;
  Widget getRadioButtons() {
    return Container(
      width: widgetWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Never';
                    id = 1;
                  });
                },
              ),
              Text(
                'Never',
                style: new TextStyle(fontSize: 17.0),
              ),
              Radio(
                value: 2,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Rarely';
                    id = 2;
                  });
                },
              ),
              Text(
                'Rarely',
                style: new TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                value: 3,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Most of the time';
                    id = 1;
                  });
                },
              ),
              Text(
                'Most of the time',
                style: new TextStyle(fontSize: 17.0),
              ),
              Radio(
                value: 4,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Always';
                    id = 2;
                  });
                },
              ),
              Text(
                'Always',
                style: new TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<String> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    String formattedDate = '';
    final DateTime picked = (await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1969),
        lastDate: DateTime(2101)))!;
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      formattedDate = DateFormat('MM/dd/yyyy').format(selectedDate);
      print(formattedDate);
    }
    return formattedDate;
  }

  Widget _dummyContainer() => Container(
        width: widgetWidth,
      );

  void onClickSubmitButton() {
    print('submit111111');
  }

  void onClickCancelButton() {
    print('cance1111l');
    Navigator.of(context).pop();
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
