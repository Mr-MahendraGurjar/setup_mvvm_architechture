import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:flutter/material.dart';

class FormButtons extends StatefulWidget {
  final Function onClickSubmitButton;
  final Function onClickCancelButton;

  FormButtons(
      {required this.onClickSubmitButton, required this.onClickCancelButton});

  @override
  _FormButtonsState createState() => _FormButtonsState();
}

class _FormButtonsState extends State<FormButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          child: InkWell(
            // onTap: widget.onClickCancelButton(),
            child: Container(
              width: 100,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: colors().editBorderColor)),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
              margin: EdgeInsets.only(right: 10),
            ),
          ),
        ),
        Container(
          width: 100,
          child: InkWell(
            // onTap: widget.onClickSubmitButton(),
            child: Container(
              width: 100,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: colors().editBorderColor)),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              margin: EdgeInsets.only(right: 10),
            ),
          ),
        ),
      ],
    );
  }
}
