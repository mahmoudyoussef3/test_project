// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ready_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReadyOrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<OrderData> get orders => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadyOrdersStateCopyWith<ReadyOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadyOrdersStateCopyWith<$Res> {
  factory $ReadyOrdersStateCopyWith(
          ReadyOrdersState value, $Res Function(ReadyOrdersState) then) =
      _$ReadyOrdersStateCopyWithImpl<$Res, ReadyOrdersState>;
  @useResult
  $Res call({bool isLoading, List<OrderData> orders, int totalCount});
}

/// @nodoc
class _$ReadyOrdersStateCopyWithImpl<$Res, $Val extends ReadyOrdersState>
    implements $ReadyOrdersStateCopyWith<$Res> {
  _$ReadyOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orders = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadyOrdersStateImplCopyWith<$Res>
    implements $ReadyOrdersStateCopyWith<$Res> {
  factory _$$ReadyOrdersStateImplCopyWith(_$ReadyOrdersStateImpl value,
          $Res Function(_$ReadyOrdersStateImpl) then) =
      __$$ReadyOrdersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<OrderData> orders, int totalCount});
}

/// @nodoc
class __$$ReadyOrdersStateImplCopyWithImpl<$Res>
    extends _$ReadyOrdersStateCopyWithImpl<$Res, _$ReadyOrdersStateImpl>
    implements _$$ReadyOrdersStateImplCopyWith<$Res> {
  __$$ReadyOrdersStateImplCopyWithImpl(_$ReadyOrdersStateImpl _value,
      $Res Function(_$ReadyOrdersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orders = null,
    Object? totalCount = null,
  }) {
    return _then(_$ReadyOrdersStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReadyOrdersStateImpl extends _ReadyOrdersState {
  const _$ReadyOrdersStateImpl(
      {this.isLoading = false,
      final List<OrderData> orders = const [],
      this.totalCount = 0})
      : _orders = orders,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<OrderData> _orders;
  @override
  @JsonKey()
  List<OrderData> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'ReadyOrdersState(isLoading: $isLoading, orders: $orders, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadyOrdersStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_orders), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadyOrdersStateImplCopyWith<_$ReadyOrdersStateImpl> get copyWith =>
      __$$ReadyOrdersStateImplCopyWithImpl<_$ReadyOrdersStateImpl>(
          this, _$identity);
}

abstract class _ReadyOrdersState extends ReadyOrdersState {
  const factory _ReadyOrdersState(
      {final bool isLoading,
      final List<OrderData> orders,
      final int totalCount}) = _$ReadyOrdersStateImpl;
  const _ReadyOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  List<OrderData> get orders;
  @override
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$ReadyOrdersStateImplCopyWith<_$ReadyOrdersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
