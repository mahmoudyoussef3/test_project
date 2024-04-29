import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'delivery_zone_state.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class DeliveryZoneNotifier extends StateNotifier<DeliveryZoneState> {
  final ShopsFacade _shopsRepository;

  DeliveryZoneNotifier(this._shopsRepository)
      : super(const DeliveryZoneState());

  Future<void> updateDeliveryZone({VoidCallback? updateSuccess}) async {
    state = state.copyWith(isSaving: true);
    final response =
        await _shopsRepository.updateDeliveryZones(points: state.tappedPoints);
    response.when(
      success: (data) {
        state = state.copyWith(isSaving: false);
        updateSuccess?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isSaving: false);
        debugPrint('===> update delivery zone failed $failure');
      },
    );
  }

  void addTappedPoint(LatLng point) {
    List<LatLng> points = List.from(state.tappedPoints);
    points.add(point);
    final Set<Polygon> polygon = HashSet<Polygon>();
    if (points.isNotEmpty) {
      polygon.add(
        Polygon(
          polygonId: const PolygonId('1'),
          points: points,
          fillColor: Style.primary.withOpacity(0.3),
          strokeColor: Style.primary,
          geodesic: false,
          strokeWidth: 4,
        ),
      );
    }
    state = state.copyWith(tappedPoints: points, polygon: polygon);
  }

  Future<void> fetchDeliveryZone() async {
    state = state.copyWith(isLoading: true, tappedPoints: []);
    final response = await _shopsRepository.getDeliveryZone();
    response.when(
      success: (data) {
        if (data.data != null && data.data!.isNotEmpty) {
          final Set<Polygon> polygon = HashSet<Polygon>();
          final List<List<double>> addresses = data.data?.first.address ?? [];
          List<LatLng> points = [];
          for (final address in addresses) {
            final latLng = LatLng(address[0], address[1]);
            points.add(latLng);
          }
          polygon.add(
            Polygon(
              polygonId: const PolygonId('1'),
              points: points,
              fillColor: Style.primary.withOpacity(0.3),
              strokeColor: Style.primary,
              geodesic: false,
              strokeWidth: 4,
            ),
          );
          state = state.copyWith(
            deliveryZones: addresses,
            polygon: polygon,
            isLoading: false,
          );
        }
      },
      failure: (failure, stutus) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> error with fetching delivery zone $failure');
      },
    );
  }
}
