import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:flutter/material.dart';

class SubFormButton extends StatelessWidget {
  final String buttonText;

  SubFormButton({required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        // onTap: widget.onClickCancelButton(),
        child: Container(
          width: 150,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: colors().editBorderColor)),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          margin: EdgeInsets.only(right: 10),
        ),
      ),
    );
  }
}
