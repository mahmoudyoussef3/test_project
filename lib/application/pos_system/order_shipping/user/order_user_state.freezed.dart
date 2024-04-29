// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderUserState {
  List<UserData> get users => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  UserData? get selectedUser => throw _privateConstructorUsedError;
  TextEditingController? get userTextController =>
      throw _privateConstructorUsedError;
  TextEditingController? get userPhoneTextController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderUserStateCopyWith<OrderUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderUserStateCopyWith<$Res> {
  factory $OrderUserStateCopyWith(
          OrderUserState value, $Res Function(OrderUserState) then) =
      _$OrderUserStateCopyWithImpl<$Res, OrderUserState>;
  @useResult
  $Res call(
      {List<UserData> users,
      int selectedIndex,
      bool isLoading,
      UserData? selectedUser,
      TextEditingController? userTextController,
      TextEditingController? userPhoneTextController});
}

/// @nodoc
class _$OrderUserStateCopyWithImpl<$Res, $Val extends OrderUserState>
    implements $OrderUserStateCopyWith<$Res> {
  _$OrderUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? selectedIndex = null,
    Object? isLoading = null,
    Object? selectedUser = freezed,
    Object? userTextController = freezed,
    Object? userPhoneTextController = freezed,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedUser: freezed == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      userTextController: freezed == userTextController
          ? _value.userTextController
          : userTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      userPhoneTextController: freezed == userPhoneTextController
          ? _value.userPhoneTextController
          : userPhoneTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderUserStateImplCopyWith<$Res>
    implements $OrderUserStateCopyWith<$Res> {
  factory _$$OrderUserStateImplCopyWith(_$OrderUserStateImpl value,
          $Res Function(_$OrderUserStateImpl) then) =
      __$$OrderUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserData> users,
      int selectedIndex,
      bool isLoading,
      UserData? selectedUser,
      TextEditingController? userTextController,
      TextEditingController? userPhoneTextController});
}

/// @nodoc
class __$$OrderUserStateImplCopyWithImpl<$Res>
    extends _$OrderUserStateCopyWithImpl<$Res, _$OrderUserStateImpl>
    implements _$$OrderUserStateImplCopyWith<$Res> {
  __$$OrderUserStateImplCopyWithImpl(
      _$OrderUserStateImpl _value, $Res Function(_$OrderUserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? selectedIndex = null,
    Object? isLoading = null,
    Object? selectedUser = freezed,
    Object? userTextController = freezed,
    Object? userPhoneTextController = freezed,
  }) {
    return _then(_$OrderUserStateImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedUser: freezed == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      userTextController: freezed == userTextController
          ? _value.userTextController
          : userTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      userPhoneTextController: freezed == userPhoneTextController
          ? _value.userPhoneTextController
          : userPhoneTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ));
  }
}

/// @nodoc

class _$OrderUserStateImpl extends _OrderUserState {
  const _$OrderUserStateImpl(
      {final List<UserData> users = const [],
      this.selectedIndex = 0,
      this.isLoading = false,
      this.selectedUser,
      this.userTextController,
      this.userPhoneTextController})
      : _users = users,
        super._();

  final List<UserData> _users;
  @override
  @JsonKey()
  List<UserData> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final UserData? selectedUser;
  @override
  final TextEditingController? userTextController;
  @override
  final TextEditingController? userPhoneTextController;

  @override
  String toString() {
    return 'OrderUserState(users: $users, selectedIndex: $selectedIndex, isLoading: $isLoading, selectedUser: $selectedUser, userTextController: $userTextController, userPhoneTextController: $userPhoneTextController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderUserStateImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedUser, selectedUser) ||
                other.selectedUser == selectedUser) &&
            (identical(other.userTextController, userTextController) ||
                other.userTextController == userTextController) &&
            (identical(
                    other.userPhoneTextController, userPhoneTextController) ||
                other.userPhoneTextController == userPhoneTextController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      selectedIndex,
      isLoading,
      selectedUser,
      userTextController,
      userPhoneTextController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderUserStateImplCopyWith<_$OrderUserStateImpl> get copyWith =>
      __$$OrderUserStateImplCopyWithImpl<_$OrderUserStateImpl>(
          this, _$identity);
}

abstract class _OrderUserState extends OrderUserState {
  const factory _OrderUserState(
          {final List<UserData> users,
          final int selectedIndex,
          final bool isLoading,
          final UserData? selectedUser,
          final TextEditingController? userTextController,
          final TextEditingController? userPhoneTextController}) =
      _$OrderUserStateImpl;
  const _OrderUserState._() : super._();

  @override
  List<UserData> get users;
  @override
  int get selectedIndex;
  @override
  bool get isLoading;
  @override
  UserData? get selectedUser;
  @override
  TextEditingController? get userTextController;
  @override
  TextEditingController? get userPhoneTextController;
  @override
  @JsonKey(ignore: true)
  _$$OrderUserStateImplCopyWith<_$OrderUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
