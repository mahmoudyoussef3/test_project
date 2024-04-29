import 'package:venderuzmart/domain/handlers/api_result.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class SubscriptionsFacade {
  Future<ApiResult<SubscriptionResponse>> getSubscriptions({required int page});

  Future<ApiResult> purchaseSubscription(
      {required int id, required int paymentId});

  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int id,
    required int paymentId,
  });
}
