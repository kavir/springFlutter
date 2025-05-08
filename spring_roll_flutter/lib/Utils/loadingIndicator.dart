// lib/common/dialog/loading_indicator.dart

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:spring_roll_flutter/Utils/constants/colors.dart';

class CustomLoadingIndicator {
  static final CustomLoadingIndicator _instance =
      CustomLoadingIndicator._internal();

  factory CustomLoadingIndicator() {
    return _instance;
  }

  CustomLoadingIndicator._internal();

  SimpleFontelicoProgressDialog? dialog;

  void show(BuildContext context, {String message = ''}) {
    dialog ??= SimpleFontelicoProgressDialog(context: context);
    dialog?.show(
      message: message,
      backgroundColor: Colors.transparent,
      type: SimpleFontelicoProgressDialogType.custom,
      loadingIndicator: LoadingAnimationWidget.dotsTriangle(
        color: AppColors.primary, // Customize this color
        size: 50,
      ),
    );
  }

  void hide() {
    if (dialog != null) {
      dialog?.hide();
      dialog = null; // Reset the instance
    }
  }
}
