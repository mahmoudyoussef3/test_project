// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FoodCategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodCategoriesStateCopyWith<FoodCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCategoriesStateCopyWith<$Res> {
  factory $FoodCategoriesStateCopyWith(
          FoodCategoriesState value, $Res Function(FoodCategoriesState) then) =
      _$FoodCategoriesStateCopyWithImpl<$Res, FoodCategoriesState>;
  @useResult
  $Res call({bool isLoading, List<CategoryData> categories});
}

/// @nodoc
class _$FoodCategoriesStateCopyWithImpl<$Res, $Val extends FoodCategoriesState>
    implements $FoodCategoriesStateCopyWith<$Res> {
  _$FoodCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodCategoriesStateImplCopyWith<$Res>
    implements $FoodCategoriesStateCopyWith<$Res> {
  factory _$$FoodCategoriesStateImplCopyWith(_$FoodCategoriesStateImpl value,
          $Res Function(_$FoodCategoriesStateImpl) then) =
      __$$FoodCategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<CategoryData> categories});
}

/// @nodoc
class __$$FoodCategoriesStateImplCopyWithImpl<$Res>
    extends _$FoodCategoriesStateCopyWithImpl<$Res, _$FoodCategoriesStateImpl>
    implements _$$FoodCategoriesStateImplCopyWith<$Res> {
  __$$FoodCategoriesStateImplCopyWithImpl(_$FoodCategoriesStateImpl _value,
      $Res Function(_$FoodCategoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
  }) {
    return _then(_$FoodCategoriesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
    ));
  }
}

/// @nodoc

class _$FoodCategoriesStateImpl extends _FoodCategoriesState {
  const _$FoodCategoriesStateImpl(
      {this.isLoading = false, final List<CategoryData> categories = const []})
      : _categories = categories,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<CategoryData> _categories;
  @override
  @JsonKey()
  List<CategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'FoodCategoriesState(isLoading: $isLoading, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodCategoriesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodCategoriesStateImplCopyWith<_$FoodCategoriesStateImpl> get copyWith =>
      __$$FoodCategoriesStateImplCopyWithImpl<_$FoodCategoriesStateImpl>(
          this, _$identity);
}

abstract class _FoodCategoriesState extends FoodCategoriesState {
  const factory _FoodCategoriesState(
      {final bool isLoading,
      final List<CategoryData> categories}) = _$FoodCategoriesStateImpl;
  const _FoodCategoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CategoryData> get categories;
  @override
  @JsonKey(ignore: true)
  _$$FoodCategoriesStateImplCopyWith<_$FoodCategoriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
