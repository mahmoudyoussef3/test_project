// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Duration for delay before announcement in IOS so that the announcement won't be interrupted.
const Duration _kIOSAnnouncementDelayDuration = Duration(seconds: 1);

class Form extends StatefulWidget {
  const Form({
    super.key,
    required this.child,
    this.onPopInvoked,
    this.onWillPop,
    this.onChanged,
    this.canPop,
  });

  static FormState? maybeOf(BuildContext context) {
    final _FormScope? scope =
        context.dependOnInheritedWidgetOfExactType<_FormScope>();
    return scope?._formState;
  }

  static FormState of(BuildContext context) {
    final FormState? formState = maybeOf(context);
    assert(() {
      if (formState == null) {
        throw FlutterError(
          'Form.of() was called with a context that does not contain a Form widget.\n'
          'No Form widget ancestor could be found starting from the context that '
          'was passed to Form.of(). This can happen because you are using a widget '
          'that looks for a Form ancestor, but no such ancestor exists.\n'
          'The context used was:\n'
          '  $context',
        );
      }
      return true;
    }());
    return formState!;
  }

  final Widget child;
  @Deprecated(
    'Use canPop and/or onPopInvoked instead. '
    'This feature was deprecated after v3.12.0-1.0.pre.',
  )
  final WillPopCallback? onWillPop;

  final bool? canPop;
  final PopInvokedCallback? onPopInvoked;

  final VoidCallback? onChanged;

  @override
  FormState createState() => FormState();
}

class FormState extends State<Form> {
  int _generation = 0;
  final Set<FormFieldState<dynamic>> _fields = <FormFieldState<dynamic>>{};

  void _fieldDidChange() {
    widget.onChanged?.call();
    _forceRebuild();
  }

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  void _register(FormFieldState<dynamic> field) {
    _fields.add(field);
  }

  void _unregister(FormFieldState<dynamic> field) {
    _fields.remove(field);
  }

  @override
  Widget build(BuildContext context) {
    _validate();
    return _FormScope(
      formState: this,
      generation: _generation,
      child: widget.child,
    );
  }

  bool _validate() {
    bool hasError = false;
    String errorMessage = '';
    for (final FormFieldState<dynamic> field in _fields) {
      hasError = !field.validate() || hasError;
      errorMessage += field.errorText ?? '';
    }

    if (errorMessage.isNotEmpty) {
      final TextDirection directionality = Directionality.of(context);
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        unawaited(Future<void>(() async {
          await Future<void>.delayed(_kIOSAnnouncementDelayDuration);
          SemanticsService.announce(errorMessage, directionality,
              assertiveness: Assertiveness.assertive);
        }));
      } else {
        SemanticsService.announce(errorMessage, directionality,
            assertiveness: Assertiveness.assertive);
      }
    }
    return !hasError;
  }
}

class _FormScope extends InheritedWidget {
  const _FormScope({
    required super.child,
    required FormState formState,
    required int generation,
  })  : _formState = formState,
        _generation = generation;

  final FormState _formState;

  final int _generation;

  Form get form => _formState.widget;

  @override
  bool updateShouldNotify(_FormScope old) => _generation != old._generation;
}

typedef FormFieldValidator<T> = String? Function(T? value);

typedef FormFieldSetter<T> = void Function(T? newValue);
typedef FormFieldBuilder<T> = Widget Function(FormFieldState<T> field);

class FormField<T> extends StatefulWidget {
  const FormField({
    super.key,
    required this.builder,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.enabled = true,
    AutovalidateMode? autovalidateMode,
    this.restorationId,
  }) : autovalidateMode = autovalidateMode ?? AutovalidateMode.disabled;

  final FormFieldSetter<T>? onSaved;

  final FormFieldValidator<T>? validator;
  final FormFieldBuilder<T> builder;

  final T? initialValue;

  final bool enabled;
  final AutovalidateMode autovalidateMode;
  final String? restorationId;

  @override
  FormFieldState<T> createState() => FormFieldState<T>();
}

class FormFieldState<T> extends State<FormField<T>> with RestorationMixin {
  late T? _value = widget.initialValue;
  final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);

  T? get value => _value;

  String? get errorText => _errorText.value;

  bool get hasError => _errorText.value != null;

  bool get hasInteractedByUser => _hasInteractedByUser.value;

  bool get isValid => widget.validator?.call(_value) == null;

  void save() {
    widget.onSaved?.call(value);
  }

  void reset() {
    setState(() {
      _value = widget.initialValue;
      _hasInteractedByUser.value = false;
      _errorText.value = null;
    });
    Form.maybeOf(context)?._fieldDidChange();
  }

  bool validate() {
    setState(() {
      _validate();
    });
    return !hasError;
  }

  void _validate() {
    if (widget.validator != null) {
      _errorText.value = widget.validator!(_value);
    } else {
      _errorText.value = null;
    }
  }

  @protected
  void setValue(T? value) {
    _value = value;
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_errorText, 'error_text');
    registerForRestoration(_hasInteractedByUser, 'has_interacted_by_user');
  }

  @override
  void deactivate() {
    Form.maybeOf(context)?._unregister(this);
    super.deactivate();
  }

  @override
  void dispose() {
    _errorText.dispose();
    _hasInteractedByUser.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enabled) {
      switch (widget.autovalidateMode) {
        case AutovalidateMode.always:
          _validate();
          break;
        case AutovalidateMode.onUserInteraction:
          if (_hasInteractedByUser.value) {
            _validate();
          }
          break;
        case AutovalidateMode.disabled:
          break;
      }
    }
    Form.maybeOf(context)?._register(this);
    return widget.builder(this);
  }
}
