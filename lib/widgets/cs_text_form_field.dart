import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CsTextFormField extends StatelessWidget {
  ///[TextFormField] utilizados no aplicativo
  const CsTextFormField({
    required this.hintText,
    this.onChanged,
    this.validator,
    this.controller,
    this.enabled = true,
    this.autocorrect = true,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.focus,
    this.textCapitalization = TextCapitalization.none,
    this.toolbarOptions,
    this.textInputAction,
    this.maxLength,
    this.maxLines = 1,
    this.label,
    this.obrigatorio = false,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.filled = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  ///[TextFormField] secondary utilizados no aplicativo
  const CsTextFormField.secondary({
    required this.hintText,
    this.onChanged,
    this.validator,
    this.controller,
    this.enabled = true,
    this.autocorrect = true,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.focus,
    this.textCapitalization = TextCapitalization.none,
    this.toolbarOptions,
    this.textInputAction,
    this.maxLength,
    this.maxLines = 1,
    this.label,
    this.obrigatorio = false,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.filled = true,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  final TextEditingController? controller;
  final bool enabled;

  final bool autocorrect;
  final bool autofocus;
  final bool enableSuggestions;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final FocusNode? focus;
  final TextCapitalization textCapitalization;
  final ToolbarOptions? toolbarOptions;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final String? label;
  final bool obrigatorio;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? errorText;
  final AutovalidateMode autovalidateMode;
  final bool filled;
  final void Function()? onTap;

  EdgeInsets _definePadding() {
    const double defaultPadding = 20;
    const double padding = 50;

    if (suffixIcon != null && prefixIcon != null) {
      return const EdgeInsets.symmetric(
        horizontal: padding,
        vertical: defaultPadding,
      );
    }

    if (suffixIcon != null) {
      return const EdgeInsets.all(defaultPadding).copyWith(right: padding);
    }

    if (prefixIcon != null) {
      return const EdgeInsets.all(defaultPadding).copyWith(left: padding);
    }

    return const EdgeInsets.all(defaultPadding);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          _Label(label: label!, obrigatorio: obrigatorio),
        ],
        InkWell(
          onTap: onTap,
          splashColor: Colors.grey[100],
          hoverColor: Colors.grey[50],
          highlightColor: Colors.grey[50],
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              TextFormField(
                //Campos obrigatórios
                onChanged: onChanged,
                validator: validator,
                controller: controller,

                //Campos opcionais
                enabled: enabled,
                autocorrect: autocorrect,
                autofocus: autofocus,
                enableSuggestions: enableSuggestions,
                obscureText: obscureText,
                inputFormatters: inputFormatters,
                keyboardType: keyboardType,
                focusNode: focus,
                textCapitalization: textCapitalization,
                toolbarOptions: toolbarOptions,
                maxLength: maxLength,
                maxLines: maxLines,
                scrollPhysics: const BouncingScrollPhysics(),
                textInputAction: textInputAction,
                autovalidateMode: autovalidateMode,
                decoration: InputDecoration(
                  filled: filled,
                  fillColor: Colors.grey[200],
                  alignLabelWithHint: true,
                  hintText: hintText,
                  errorText: errorText,
                  hintStyle: theme.inputDecorationTheme.hintStyle,
                  errorStyle: theme.inputDecorationTheme.errorStyle,
                  border: filled
                      ? InputBorder.none
                      : theme.inputDecorationTheme.border,
                  enabledBorder: filled
                      ? InputBorder.none
                      : theme.inputDecorationTheme.enabledBorder,
                  errorBorder: filled
                      ? InputBorder.none
                      : theme.inputDecorationTheme.errorBorder,
                  focusedErrorBorder: filled
                      ? InputBorder.none
                      : theme.inputDecorationTheme.focusedBorder,
                  focusedBorder: filled
                      ? InputBorder.none
                      : theme.inputDecorationTheme.focusedErrorBorder,
                  disabledBorder: filled
                      ? InputBorder.none
                      : theme.inputDecorationTheme.disabledBorder,
                  contentPadding: _definePadding(),
                  enabled: enabled,
                ),
                style: theme.textTheme.labelMedium,
              ),

              ///Define a posição do ícone que será exibida no [TextField], se possuir
              if (prefixIcon != null) ...[
                Positioned(
                  top: 5,
                  bottom: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: prefixIcon!,
                  ),
                ),
              ],

              ///Define a posição do ícone que será exibida no [TextField], se possuir
              if (suffixIcon != null) ...[
                Positioned(
                  top: 5,
                  right: 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: suffixIcon!,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    required this.label,
    required this.obrigatorio,
    Key? key,
  }) : super(key: key);

  final String label;
  final bool obrigatorio;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(left: 12, top: 10, bottom: 5),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: theme.colorScheme.primaryContainer,
                fontSize: 15,
              ),
            ),
            if (obrigatorio) ...[
              const TextSpan(
                text: ' *',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
