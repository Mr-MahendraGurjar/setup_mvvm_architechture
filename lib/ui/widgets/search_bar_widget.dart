import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dividers.dart';

class SearchBarWidget extends StatefulWidget {
  final TextEditingController _editingController;
  final Function(String) _filterResult;
  final VoidCallback _onClearEdit;

  SearchBarWidget(
    this._editingController,
    this._filterResult,
    this._onClearEdit,
  );

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  FocusNode? _searchCodeFocus;
  Color? _searchDividerColor;
  bool _showCloseBtn = false;

  @override
  void initState() {
    super.initState();
    _searchCodeFocus = FocusNode();
    _searchCodeFocus!.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _searchCodeFocus!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          _searchCodeFocus!.requestFocus();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SvgPicture.asset(
                    AssetsUtil.iconSearch,
                    width: 25,
                    height: 25,
                  ),
                ),
                Delimiter.width(8),
                Flexible(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      primaryColor: colors().primaryTextColorLight,
                    ),
                    child: TextField(
                      focusNode: _searchCodeFocus,
                      onChanged: (value) {
                        _filterSearchResults(value);
                      },
                      controller: widget._editingController,
                      style: AppTextStyles.n16(colors().editTextColor),
                      decoration: InputDecoration(
                        hintText: str(context).searchHintText,
                        hintStyle:
                            AppTextStyles.n16(colors().primaryTextColorLight),
                        border: InputBorder.none,
                        suffixIcon: _showCloseBtn
                            ? IconButton(
                                highlightColor: colors().inkWellHighlights,
                                icon:
                                    SvgPicture.asset(AssetsUtil.iconClearText),
                                onPressed: () {
                                  setState(() {
                                    _showCloseBtn = false;
                                  });
                                  WidgetsBinding.instance!
                                      .addPostFrameCallback((_) {
                                    widget._editingController.clear();
                                    widget._onClearEdit();
                                  });
                                })
                            : SizedBox(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DefaultDivider(
              color: _searchDividerColor,
            ),
          ],
        ),
      ),
    );
  }

  void _onFocusChange() {
    setState(() {
      if (_searchCodeFocus!.hasFocus ||
          widget._editingController.value.text.length >= 1) {
        _searchDividerColor = colors().primary;
      } else {
        _searchDividerColor = null;
      }
    });
  }

  void _filterSearchResults(String query) {
    if (!_showCloseBtn || query.length >= 1) {
      _showCloseBtn = true;
    } else {
      _showCloseBtn = false;
    }
    setState(() {});
    widget._filterResult(query);
  }
}
