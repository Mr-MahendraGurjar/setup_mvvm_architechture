import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:setup_mvvm_architechture/mvvm/viewmodel/dashboard_view_model.dart';
import 'package:setup_mvvm_architechture/ui/theming/colors.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:stacked/stacked.dart';

class DashboardScreen extends StatefulWidget {



  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  TextEditingController _controller = TextEditingController();
  late Timer _debounce;

  late StreamController _streamController;
  late Stream _stream;

  DashboardScreenModel _dashboardScreenModel = DashboardScreenModel();

  _search() async {
    if (_controller.text == null || _controller.text.length == 0) {
      _streamController.add(null);
      return;
    }
    _dashboardScreenModel.getStreamFromFireStore();

  }

  @override
  void initState() {
    _dashboardScreenModel.getStreamFromFireStore();
    super.initState();

    _streamController = StreamController();
    _stream = _dashboardScreenModel.stream;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardScreenModel>.reactive(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Dashboard"),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(48.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: TextFormField(
                          onChanged: (String text) {
                            if (_debounce?.isActive ?? false) _debounce.cancel();
                            _debounce = Timer(const Duration(milliseconds: 1000), () {

                            });
                          },
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: "Search for a word",
                            contentPadding: const EdgeInsets.only(left: 24.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _search();
                      },
                    )
                  ],
                ),
              ),
            ),
            body: StreamBuilder<QuerySnapshot>(
              stream: model.stream,
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }
                return ListView(
                    children: snapshot.data!.docs
                        .map((DocumentSnapshot documentSnapshot) => ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(documentSnapshot.data()!['image'].toString()),
                      ),
                      title: Text(documentSnapshot.data()!['name'],style: AppTextStyles.n16fw600(AppColorScheme.black),),
                      subtitle: Text(
                          documentSnapshot.data()!['email']),
                      trailing: Text(documentSnapshot.data()!['grades']),
                    ))
                        .toList());
              }
            )),
        viewModelBuilder: () => DashboardScreenModel());
  }
}
