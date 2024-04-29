// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateUserState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateUserStateCopyWith<CreateUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserStateCopyWith<$Res> {
  factory $CreateUserStateCopyWith(
          CreateUserState value, $Res Function(CreateUserState) then) =
      _$CreateUserStateCopyWithImpl<$Res, CreateUserState>;
  @useResult
  $Res call({bool isLoading, String? imageFile});
}

/// @nodoc
class _$CreateUserStateCopyWithImpl<$Res, $Val extends CreateUserState>
    implements $CreateUserStateCopyWith<$Res> {
  _$CreateUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateUserStateImplCopyWith<$Res>
    implements $CreateUserStateCopyWith<$Res> {
  factory _$$CreateUserStateImplCopyWith(_$CreateUserStateImpl value,
          $Res Function(_$CreateUserStateImpl) then) =
      __$$CreateUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? imageFile});
}

/// @nodoc
class __$$CreateUserStateImplCopyWithImpl<$Res>
    extends _$CreateUserStateCopyWithImpl<$Res, _$CreateUserStateImpl>
    implements _$$CreateUserStateImplCopyWith<$Res> {
  __$$CreateUserStateImplCopyWithImpl(
      _$CreateUserStateImpl _value, $Res Function(_$CreateUserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? imageFile = freezed,
  }) {
    return _then(_$CreateUserStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateUserStateImpl extends _CreateUserState {
  const _$CreateUserStateImpl({this.isLoading = false, this.imageFile = null})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? imageFile;

  @override
  String toString() {
    return 'CreateUserState(isLoading: $isLoading, imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, imageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserStateImplCopyWith<_$CreateUserStateImpl> get copyWith =>
      __$$CreateUserStateImplCopyWithImpl<_$CreateUserStateImpl>(
          this, _$identity);
}

abstract class _CreateUserState extends CreateUserState {
  const factory _CreateUserState(
      {final bool isLoading, final String? imageFile}) = _$CreateUserStateImpl;
  const _CreateUserState._() : super._();

  @override
  bool get isLoading;
  @override
  String? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$CreateUserStateImplCopyWith<_$CreateUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
