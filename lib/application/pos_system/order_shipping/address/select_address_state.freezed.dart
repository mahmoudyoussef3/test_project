// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectAddressState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  bool get isChoosing => throw _privateConstructorUsedError;
  List<Place> get searchedPlaces => throw _privateConstructorUsedError;
  GoogleMapController? get mapController => throw _privateConstructorUsedError;
  LocationData? get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectAddressStateCopyWith<SelectAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectAddressStateCopyWith<$Res> {
  factory $SelectAddressStateCopyWith(
          SelectAddressState value, $Res Function(SelectAddressState) then) =
      _$SelectAddressStateCopyWithImpl<$Res, SelectAddressState>;
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      bool isChoosing,
      List<Place> searchedPlaces,
      GoogleMapController? mapController,
      LocationData? location});
}

/// @nodoc
class _$SelectAddressStateCopyWithImpl<$Res, $Val extends SelectAddressState>
    implements $SelectAddressStateCopyWith<$Res> {
  _$SelectAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? isChoosing = null,
    Object? searchedPlaces = null,
    Object? mapController = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isChoosing: null == isChoosing
          ? _value.isChoosing
          : isChoosing // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedPlaces: null == searchedPlaces
          ? _value.searchedPlaces
          : searchedPlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectAddressStateImplCopyWith<$Res>
    implements $SelectAddressStateCopyWith<$Res> {
  factory _$$SelectAddressStateImplCopyWith(_$SelectAddressStateImpl value,
          $Res Function(_$SelectAddressStateImpl) then) =
      __$$SelectAddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      bool isChoosing,
      List<Place> searchedPlaces,
      GoogleMapController? mapController,
      LocationData? location});
}

/// @nodoc
class __$$SelectAddressStateImplCopyWithImpl<$Res>
    extends _$SelectAddressStateCopyWithImpl<$Res, _$SelectAddressStateImpl>
    implements _$$SelectAddressStateImplCopyWith<$Res> {
  __$$SelectAddressStateImplCopyWithImpl(_$SelectAddressStateImpl _value,
      $Res Function(_$SelectAddressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? isChoosing = null,
    Object? searchedPlaces = null,
    Object? mapController = freezed,
    Object? location = freezed,
  }) {
    return _then(_$SelectAddressStateImpl(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isChoosing: null == isChoosing
          ? _value.isChoosing
          : isChoosing // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedPlaces: null == searchedPlaces
          ? _value._searchedPlaces
          : searchedPlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationData?,
    ));
  }
}

/// @nodoc

class _$SelectAddressStateImpl extends _SelectAddressState {
  const _$SelectAddressStateImpl(
      {this.isSearching = false,
      this.isSearchLoading = false,
      this.isChoosing = false,
      final List<Place> searchedPlaces = const [],
      this.mapController,
      this.location})
      : _searchedPlaces = searchedPlaces,
        super._();

  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isSearchLoading;
  @override
  @JsonKey()
  final bool isChoosing;
  final List<Place> _searchedPlaces;
  @override
  @JsonKey()
  List<Place> get searchedPlaces {
    if (_searchedPlaces is EqualUnmodifiableListView) return _searchedPlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedPlaces);
  }

  @override
  final GoogleMapController? mapController;
  @override
  final LocationData? location;

  @override
  String toString() {
    return 'SelectAddressState(isSearching: $isSearching, isSearchLoading: $isSearchLoading, isChoosing: $isChoosing, searchedPlaces: $searchedPlaces, mapController: $mapController, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAddressStateImpl &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            (identical(other.isChoosing, isChoosing) ||
                other.isChoosing == isChoosing) &&
            const DeepCollectionEquality()
                .equals(other._searchedPlaces, _searchedPlaces) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSearching,
      isSearchLoading,
      isChoosing,
      const DeepCollectionEquality().hash(_searchedPlaces),
      mapController,
      location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAddressStateImplCopyWith<_$SelectAddressStateImpl> get copyWith =>
      __$$SelectAddressStateImplCopyWithImpl<_$SelectAddressStateImpl>(
          this, _$identity);
}

abstract class _SelectAddressState extends SelectAddressState {
  const factory _SelectAddressState(
      {final bool isSearching,
      final bool isSearchLoading,
      final bool isChoosing,
      final List<Place> searchedPlaces,
      final GoogleMapController? mapController,
      final LocationData? location}) = _$SelectAddressStateImpl;
  const _SelectAddressState._() : super._();

  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  bool get isChoosing;
  @override
  List<Place> get searchedPlaces;
  @override
  GoogleMapController? get mapController;
  @override
  LocationData? get location;
  @override
  @JsonKey(ignore: true)
  _$$SelectAddressStateImplCopyWith<_$SelectAddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
