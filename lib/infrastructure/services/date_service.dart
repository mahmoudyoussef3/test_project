import 'package:intl/intl.dart';
import 'app_helpers.dart';
import 'tr_keys.dart';

abstract class DateService {
  DateService._();

  static String dateFormatForChat(DateTime? time) {
    if ((DateTime.now().difference(time ?? DateTime.now()).inHours) > 24 &&
        (DateTime.now().difference(time ?? DateTime.now()).inDays) < 7) {
      return DateFormat("EEEE").format(time ?? DateTime.now());
    }
    if ((DateTime.now().difference(time ?? DateTime.now()).inDays) < 365) {
      return DateFormat("d MMM").format(time ?? DateTime.now());
    }
    if ((DateTime.now().difference(time ?? DateTime.now()).inDays) > 365) {
      return DateFormat("MMM/d/yyyy").format(time ?? DateTime.now());
    }
    return DateFormat("HH:mm").format(time ?? DateTime.now());
  }

  static DateTime dateFormatYMD(DateTime? time) {
    return DateTime.tryParse(
            DateFormat("yyyy-MM-dd").format(time ?? DateTime.now())) ??
        DateTime.now();
  }

  static String dateFormatMDYHm(DateTime? time) {
    return DateFormat("d MMM yyyy - HH:mm").format(time ?? DateTime.now());
  }

  static String dateFormatYMDHm(DateTime? time) {
    return DateFormat("yyyy-MM-dd HH:mm").format(time ?? DateTime.now());
  }

  static String dateFormatDMY(DateTime? time) {
    return DateFormat("d MMM, yyyy").format(time ?? DateTime.now());
  }
  static String dateFormatDMM(DateTime? time) {
    return DateFormat("d MMM").format(time ?? DateTime.now());
  }

  static String dateFormatEDMY(DateTime? time) {
    return DateFormat("EEEE, d MMM yyyy").format(time ?? DateTime.now());
  }

  static String dateFormatDM(DateTime? time) {
    if (DateTime.now().year == time?.year) {
      return DateFormat("d MMMM").format(time ?? DateTime.now());
    }
    return DateFormat("d MMMM, yyyy").format(time ?? DateTime.now());
  }

  static String dateFormatForNotification(DateTime? time) {
    return DateFormat("d MMM, h:mm a").format(time ?? DateTime.now());
  }

  static String dateFormatDay(DateTime? time) {
    return DateFormat("yyyy-MM-dd").format(time ?? DateTime.now());
  }

  static String dateFormat(DateTime? time) {
    return DateFormat("MMM d,yyyy").format(time ?? DateTime.now());
  }

  static String dateFormatForOrder(DateTime? time) {
    return '${DateFormat('dd.MM.yyyy').format(time ?? DateTime.now())} | ${DateFormat('HH:mm').format(time ?? DateTime.now())}';
  }

  static String dateFormatForBooking(List<DateTime?> time) {
    return '${DateFormat('dd.MM.yyyy').format(time.first ?? DateTime.now())} | ${DateFormat('HH:mm').format(time.first ?? DateTime.now())}-${DateFormat('HH:mm').format(time.last ?? DateTime.now())}';
  }

  static String timeFormatForBooking(List<DateTime?> time) {
    return '${DateFormat('HH:mm').format(time.first ?? DateTime.now())}-${DateFormat('HH:mm').format(time.last ?? DateTime.now())}';
  }

  static String dateFormatMulti(List<DateTime?> time) {
    String response = '';
    if (time.isEmpty) {
      response += AppHelpers.getTranslation(TrKeys.selectTime);

      return response;
    }
    for (int i = 0; i < time.length; i++) {
      if (time[i] != null) {
        response += DateFormat("d MMM yyyy").format(time[i]!);
        if (i == 0 && time.length > 1) {
          response += '  -  ';
        }
      }
    }
    return response;
  }

  static String timeFormatMulti(List<DateTime?> time) {
    String response = '';
    if (time.isEmpty) {
      response += AppHelpers.getTranslation(TrKeys.selectTime);

      return response;
    }
    for (int i = 0; i < time.length; i++) {
      if (time[i] != null) {
        response += DateFormat("HH:mm").format(time[i]!);
        if (i == 0 && time.length > 1) {
          response += ' - ';
        }
      }
    }
    return response;
  }

  static String timeFormat(DateTime? time) {
    return DateFormat("HH:mm").format(time ?? DateTime.now());
  }
}
