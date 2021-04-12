import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/mvvm/views/forms/expandable_form_header.dart';
import 'package:setup_mvvm_architechture/mvvm/views/forms/medical_form.dart';
import 'package:setup_mvvm_architechture/ui/theming/decorations.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:setup_mvvm_architechture/ui/widgets/app_action_bars.dart';
import 'package:setup_mvvm_architechture/ui/widgets/common/form_buttons.dart';
import 'package:setup_mvvm_architechture/ui/widgets/custom_widgets/custom_row.dart';
import 'package:setup_mvvm_architechture/ui/widgets/dividers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expandable/expandable.dart';

class ComprehensiveAssessmentForm extends StatefulWidget {
  @override
  _ComprehensiveAssessmentFormState createState() =>
      _ComprehensiveAssessmentFormState();
}

class _ComprehensiveAssessmentFormState
    extends State<ComprehensiveAssessmentForm> {
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              _buildAppBar(context),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _comprehensiveAssesmentForm(),
              // _subForms(),
              expandableWidget()
            ],
          )),
    );
  }

  Widget _comprehensiveAssesmentForm() {
    return Container(
      child: Form(
        key: _formKey,
        autovalidate: false,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _assesmentStatusController,
                  title: 'Assessment Status',
                  isEnabled: false),
              child2: _assesmentStatus(
                  controller: _documentVersionController,
                  title: 'Document Version',
                  isEnabled: false),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assessmentDate(),
              child2: _individualNameWidget(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _dobController, title: 'DOB', isEnabled: false),
              child2: _assesmentStatus(
                  controller: _ageController,
                  title: 'Address Line 2',
                  isEnabled: false),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _addressLine1Controller,
                  title: 'Address Line 1',
                  isEnabled: false),
              child2: _assesmentStatus(
                  controller: _addressLine2Controller,
                  title: 'Address Line 2',
                  isEnabled: false),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _cityController, title: 'City', isEnabled: false),
              child2: _assesmentStatus(
                  controller: _stateController,
                  title: 'State',
                  isEnabled: false),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _zipCodeController,
                  title: 'Zip Code',
                  isEnabled: false),
              child2: _assesmentStatus(
                  controller: _phoneNumberController,
                  title: 'Phone Number',
                  isEnabled: false),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _relationshipStatusController,
                  title: 'Relationship Status',
                  isEnabled: false),
              child2: _assesmentStatus(
                  controller: _GenderController,
                  title: 'Gender',
                  isEnabled: false),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _SexualOrientationController,
                  title: 'Sexual Orientation',
                  isEnabled: false),
              child2: _assesmentStatus(
                  controller: _EthnicityController,
                  title: 'Ethnicity',
                  isEnabled: false),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _RaceController,
                  title: 'Race1',
                  isEnabled: false),
              child2: _dummyContainer(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _LanguagesSpokenController,
                  title: 'Languages Spoken',
                  isEnabled: true),
              child2: _assesmentStatus(
                  controller: _ReadingController,
                  title: 'Reading',
                  isEnabled: true),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _WritingController,
                  title: 'Writing',
                  isEnabled: true),
              child2: _assesmentStatus(
                  controller: _MedicaidSeqController,
                  title: 'Medicaid / Seq #',
                  isEnabled: true),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _SSController, title: 'SS#', isEnabled: true),
              child2: getRadioButtons(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              child1: _assesmentStatus(
                  controller: _MCOController, title: 'MCO', isEnabled: true),
              child2: _assesmentStatus(
                  controller: _VerifiedController,
                  title: 'Verified',
                  isEnabled: true),
            ),
            SizedBox(
              height: 20,
            ),
            FormButtons(
                onClickSubmitButton: onClickSubmitButton,
                onClickCancelButton: onClickCancelButton),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _assesmentStatus({controller, title, isEnabled = true}) {
    return Container(
      width: widgetWidth,
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

  // Widget _individualNameWidget() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width / 2 * 0.6,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           '* Individual Name',
  //           style: AppTextStyles.labelText(),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         DropdownButtonFormField<String>(
  //           decoration: DefaultInputDecoration(),
  //           style: AppTextStyles.n18(
  //             colors().editTextColor,
  //           ),
  //           hint: new Text('--Select--'),
  //           isExpanded: true,
  //           // value: ,
  //           // onChanged: (String newValue) {
  //           //   setState(() {
  //           //     formGeneral['Fields'][count]['Value'] = newValue;
  //           //   });
  //           // },
  //           items: [
  //             DropdownMenuItem(child: Text('foo')),
  //             DropdownMenuItem(child: Text('bar'))
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
          Text(
            '* Can be reached by',
            style: AppTextStyles.labelText(),
          ),
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
                    radioButtonItem = 'Mail';
                    id = 1;
                  });
                },
              ),
              Text(
                'Mail',
                style: new TextStyle(fontSize: 17.0),
              ),
              Radio(
                value: 2,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Phone';
                    id = 2;
                  });
                },
              ),
              Text(
                'Phone',
                style: new TextStyle(
                  fontSize: 17.0,
                ),
              ),
              Radio(
                value: 3,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Home Visit';
                    id = 3;
                  });
                },
              ),
              Text(
                'Home Visit',
                style: new TextStyle(fontSize: 17.0),
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

  Widget _buildAppBar(BuildContext context) => Column(
        children: <Widget>[
          AppActionBar.main(
            title: "Comprehensive Assessment",
            onLeftPressed: () => Navigator.of(context).pop(),
            showRightIcon: false,
          ),
          DefaultDivider(),
        ],
      );

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

  Widget _subForms() {
    return Container(
      child: ExpansionTile(
        title: Text('Medical'),
        children: [
          SizedBox(
            height: 20,
          ),
          CustomRow(
            child1: _assessmentDate(),
            child2: _individualNameWidget(),
          ),
          SizedBox(
            height: 20,
          ),
          CustomRow(
            child1: _assessmentDate(),
            child2: _individualNameWidget(),
          ),
        ],
      ),
    );
  }

  Widget expandableWidget() {
    return Container(
      width: widgetWidth * 2.3,
      child: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: Column(
          children: <Widget>[
            ExpandalbeFormHeader(formTitle: 'Medical', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Mental Health', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Financial', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Housing', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Domestic Violence', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Legal', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Areas for Safegaurd Review', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Independent Living Skills', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Need for behavioral support services', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Educational/Vocaltional Status', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Self-Directed Services', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Transition Planning (for students ages 14-21)', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'General', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Safety Risk Assessment', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Depression Screening', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Substance Abuse Screening', formWidget: MedicalForm()),
            ExpandalbeFormHeader(formTitle: 'Safety Plan', formWidget: MedicalForm()),
          ],
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