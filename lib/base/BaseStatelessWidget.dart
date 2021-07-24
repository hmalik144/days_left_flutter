import 'package:days_left/Utils/ViewUtils.dart';
import 'package:days_left/data/ViewState.dart';
import 'BaseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  BaseModel getBaseModel();
  Widget displayWidget(context, model, child);

  @override
  Widget build(BuildContext parent) {
    return ViewModelBuilder<BaseModel>.reactive(
        builder: (context, model, child) {
          var state = model.viewState;

          if (state is HasStarted)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (state is HasError)
            WidgetsBinding.instance.addPostFrameCallback(
                    (_) => ViewUtils.displayToast(parent, state.error));

          return Center(
            child: displayWidget(context, model, child),
          );
        },
        viewModelBuilder: () => getBaseModel());
  }
}
