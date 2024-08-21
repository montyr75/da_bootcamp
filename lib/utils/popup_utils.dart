import 'dart:async';

import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'screen_utils.dart';
import 'utils.dart';

const dialogMaxWidth = 400.0;

Future<void> showConfirmDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? yesMsg,
  String? noMsg,
  required VoidCallback onConfirm,
  bool autoDismiss = true,
}) {
  final styles = context.textStyles;

  return SmartDialog.show(
    builder: (_) {
      return FantasyDialog(
        title: Text(title ?? "Are you sure?", style: styles.displayMedium),
        content: Text(message, style: styles.displaySmall),
        actions: [
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: Text(noMsg ?? "No"),
          ),
          TextButton(
            onPressed: () async {
              if (autoDismiss) {
                await SmartDialog.dismiss();
              }

              onConfirm();
            },
            child: Text(yesMsg ?? "Yes"),
          ),
        ],
      );
    },
  );
}

Future<void> showInfoDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? closeMsg,
}) {
  final styles = context.textStyles;

  return SmartDialog.show(
    builder: (_) {
      return FantasyDialog(
        title: Text(title ?? "Info", style: styles.displayMedium),
        content: Text(message, style: styles.displaySmall),
        actions: [
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: Text(closeMsg ?? "Close"),
          ),
        ],
      );
    },
  );
}

void showStringInputDialog({
  required String title,
  required String label,
  String submitLabel = "Submit",
  String? initialValue,
  required ValueChanged<String> onInput,
  int maxLength = StringInputDialog.defaultMaxLength,
}) {
  SmartDialog.show(
    builder: (_) {
      return StringInputDialog(
        initialValue: initialValue,
        title: title,
        label: label,
        submitLabel: submitLabel,
        onInput: onInput,
        maxLength: maxLength,
      );
    },
  );
}

void showSuccessToast(String msg) {
  SmartDialog.showNotify(msg: msg, notifyType: NotifyType.success);
}

void showErrorToast(String msg) {
  SmartDialog.showNotify(msg: msg, notifyType: NotifyType.error);
}

class StringInputDialog extends StatefulWidget {
  static const defaultMaxLength = 80;

  final String? initialValue;
  final String title;
  final String label;
  final String submitLabel;
  final ValueChanged<String> onInput;
  final int maxLength;

  const StringInputDialog({
    super.key,
    this.initialValue,
    required this.title,
    required this.label,
    required this.submitLabel,
    required this.onInput,
    this.maxLength = defaultMaxLength,
  });

  @override
  State<StringInputDialog> createState() => _StringInputDialogState();
}

class _StringInputDialogState extends State<StringInputDialog> {
  final ctrl = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      focusNode.requestFocus();

      if (widget.initialValue != null) {
        ctrl.text = widget.initialValue!;
      }

      ctrl.selectAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: dialogMaxWidth),
        child: TextFormField(
          controller: ctrl,
          autofocus: true,
          focusNode: focusNode,
          keyboardType: TextInputType.name,
          enableSuggestions: false,
          autocorrect: false,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            labelText: widget.label,
            isDense: true,
          ),
          onChanged: (value) {
            setState(() {});
          },
          onFieldSubmitted: (_) => _submit(),
        ),
      ),
      actions: [
        const TextButton(
          onPressed: SmartDialog.dismiss,
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: ctrl.text.trim().isNotEmpty ? _submit : null,
          child: Text(widget.submitLabel),
        ),
      ],
    );
  }

  void _submit() {
    final input = ctrl.text.trim();

    if (input.isNotEmpty) {
      widget.onInput(input);
    }

    SmartDialog.dismiss();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }
}

class FantasyDialog extends StatelessWidget {
  static const maxWidth = 350.0;

  final Widget title;
  final Widget content;
  final List<Widget> actions;

  const FantasyDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingAllXXL,
      constraints: const BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          boxXXL,
          content,
          boxXXL,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions,
          ),
        ],
      ),
    );
  }
}
