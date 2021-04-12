import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/mvvm/model/form_model.dart';
import 'package:setup_mvvm_architechture/ui/theming/decorations.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:flutter/material.dart';

class JsonSchema extends StatefulWidget {
  FormModel? formModel;

  JsonSchema({this.formModel});

  @override
  _JsonSchemaState createState() => _JsonSchemaState();
}

class _JsonSchemaState extends State<JsonSchema> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.formModel!.title!,
            style: AppTextStyles.n18fw600(Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            // focusNode: _companyCodeFocus,
            decoration: DefaultInputDecoration(
              labelText: str(context).companyCodeHint,
            ),
            keyboardType: TextInputType.text,
            style: AppTextStyles.n18(
              colors().editTextColor,
            ),
            // validator: (value) => ,
            // onSaved: (value) =>
            //     viewModel!.companyCode = value!.trim(),
          ),
        ],
      );
  }
}
