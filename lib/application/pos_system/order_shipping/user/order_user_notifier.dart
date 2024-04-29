import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_user_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class OrderUserNotifier extends StateNotifier<OrderUserState> {
  final UsersFacade _usersRepository;
  String _query = '';
  bool _hasMore = true;
  int _page = 0;
  Timer? _timer;

  OrderUserNotifier(this._usersRepository)
      : super(OrderUserState(
            userTextController: TextEditingController(),
            userPhoneTextController: TextEditingController()));

  void addCreatedUser(UserData? user) {
    List<UserData> users = List.from(state.users);
    if (user != null) {
      users.insert(0, user);
    }
    state = state.copyWith(users: users);
  }

  void clearSelectedUserInfo() {
    state = state.copyWith(selectedUser: null, selectedIndex: 0);
    state.userTextController?.text = '';
  }

  void setSelectedUser(int index) {
    final selectedUser = state.users[index];
    state = state.copyWith(selectedIndex: index, selectedUser: selectedUser);
    state.userTextController?.text =
        '${selectedUser.firstname ?? AppHelpers.getTranslation(TrKeys.noName)} ${selectedUser.lastname ?? ''}';
    state.userPhoneTextController?.text = selectedUser.phone ?? "";
  }

  void setInitialUser(UserData? user) {
    if (user == null) return;
    state = state.copyWith(selectedUser: user);
    state.userTextController?.text =
        '${user.firstname ?? ""} ${user.lastname ?? ''}';
    state.userPhoneTextController?.text = user.phone ?? "";
  }

  Future<void> _search({RefreshController? refreshController}) async {
    refreshController?.resetNoData();
    _page = 0;
    _hasMore = true;
    state = state.copyWith(isLoading: true);
    final response = await _usersRepository.searchUsers(
      query: _query.isEmpty ? null : _query.trim(),
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<UserData> users = data.data ?? [];
        state = state.copyWith(users: users, isLoading: false);
        _hasMore = users.length >= 14;
      },
      failure: (failure, status) {
        debugPrint('===> search user fail $failure');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  void setQuery({
    RefreshController? refreshController,
    required String text,
  }) {
    if (text.trim() == _query) {
      return;
    }
    _query = text.trim();
    _timer?.cancel();
    _timer = Timer(
      const Duration(milliseconds: 300),
      () {
        _search(refreshController: refreshController);
      },
    );
  }

  Future<void> fetchMoreUsers({RefreshController? refreshController}) async {
    if (!_hasMore) {
      refreshController?.loadNoData();
      return;
    }
    final response = await _usersRepository.searchUsers(
      query: _query.isEmpty ? null : _query.trim(),
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<UserData> newUsers = data.data ?? [];
        List<UserData> users = List.from(state.users);
        users.addAll(newUsers);
        _hasMore = newUsers.length >= 14;
        state = state.copyWith(users: users);
        refreshController?.loadComplete();
      },
      failure: (failure, status) {
        refreshController?.loadFailed();
        debugPrint('===> fetch more users fail $failure');
      },
    );
  }

  Future<void> refreshUsers({RefreshController? refreshController}) async {
    debugPrint('===> refresh users function called');
    _page = 0;
    final response = await _usersRepository.searchUsers(
      query: _query.isEmpty ? null : _query.trim(),
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<UserData> users = data.data ?? [];
        state = state.copyWith(users: users);
        _hasMore = users.length >= 14;
        refreshController?.refreshCompleted();
        refreshController?.resetNoData();
      },
      failure: (failure, status) {
        debugPrint('===> refresh users fail $failure');
        refreshController?.refreshFailed();
      },
    );
  }

  Future<void> initialFetchUsers(
      {RefreshController? refreshController,
      ValueChanged<UserData?>? onSuccess}) async {
    _query = '';
    if (state.users.isNotEmpty) {
      if (state.selectedUser == null) {
        UserData? selectedUser = state.users[0];
        state = state.copyWith(selectedIndex: 0, selectedUser: selectedUser);
        state.userTextController?.text =
            '${selectedUser.firstname ?? AppHelpers.getTranslation(TrKeys.noName)} ${selectedUser.lastname ?? ''}';
        onSuccess?.call(selectedUser);
      }
      return;
    }
    _hasMore = true;
    _page = 0;
    state = state.copyWith(isLoading: true);
    final response = await _usersRepository.searchUsers(
      query: _query.isEmpty ? null : _query.trim(),
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<UserData> users = data.data ?? [];
        UserData? selectedUser;
        if (users.isNotEmpty) {
          selectedUser = users[0];
        }
        state = state.copyWith(
          users: users,
          selectedUser: selectedUser,
          selectedIndex: 0,
          isLoading: false,
        );
        if (selectedUser != null) {
          state.userTextController?.text =
              '${selectedUser.firstname} ${selectedUser.lastname ?? ''}';
        }
        _hasMore = users.length >= 14;
      },
      failure: (error, status) {
        debugPrint('====> fetch users fail $error');
        state = state.copyWith(isLoading: false);
      },
    );
  }
}
