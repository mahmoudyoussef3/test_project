import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/app_helpers.dart';
import 'enums.dart';

extension Time on DateTime {
  bool toEqualTime(DateTime time) {
    if (time.year != year) {
      return false;
    } else if (time.month != month) {
      return false;
    } else if (time.day != day) {
      return false;
    }
    return true;
  }

  bool toEqualTimeWithHour(DateTime time) {
    if (time.year != year) {
      return false;
    } else if (time.month != month) {
      return false;
    } else if (time.day != day) {
      return false;
    } else if (time.hour != hour) {
      return false;
    }
    return true;
  }

  bool compareWithoutTime(DateTime date) {
    return day == date.day && month == date.month && year == date.year;
  }

  int getDayDifference(DateTime date) => DateTime.utc(year, month, day)
      .difference(DateTime.utc(date.year, date.month, date.day))
      .inDays
      .abs();

  int getThreeDayDifference(DateTime date) {
    return (difference(DateTime(date.year, date.month, date.day)).inDays.abs() /
            3)
        .ceil();
  }

  int getWeekDifference(DateTime date, {WeekDays start = WeekDays.monday}) =>
      (firstDayOfWeek(start: start)
                  .difference(date.firstDayOfWeek(start: start))
                  .inDays
                  .abs() /
              7)
          .ceil();

  List<DateTime> datesOfWeek({WeekDays start = WeekDays.monday}) {
    final startDay =
        DateTime(year, month, day - (weekday - start.index - 1) % 7);

    return [
      startDay,
      DateTime(startDay.year, startDay.month, startDay.day + 1),
      DateTime(startDay.year, startDay.month, startDay.day + 2),
      DateTime(startDay.year, startDay.month, startDay.day + 3),
      DateTime(startDay.year, startDay.month, startDay.day + 4),
      DateTime(startDay.year, startDay.month, startDay.day + 5),
      DateTime(startDay.year, startDay.month, startDay.day + 6),
    ];
  }

  List<DateTime> datesOfThree() {
    final startDay = DateTime(year, month, day);
    return [
      startDay,
      DateTime(startDay.year, startDay.month, startDay.day + 1),
      DateTime(startDay.year, startDay.month, startDay.day + 2),
    ];
  }

  DateTime firstDayOfWeek({WeekDays start = WeekDays.monday}) =>
      DateTime(year, month, day - ((weekday - start.index - 1) % 7));

  DateTime lastDayOfWeek({WeekDays start = WeekDays.monday}) =>
      DateTime(year, month, day + (6 - (weekday - start.index - 1) % 7));

  DateTime get firstDayOfMonth => DateTime(year, month, 1);

  DateTime get lastDayOfMonth =>
      month < 12 ? DateTime(year, month + 1, 0) : DateTime(year + 1, 1, 0);

  int get getTotalMinutes => hour * 60 + minute;

  DateTime copyFromMinutes([int totalMinutes = 0]) => DateTime(
        year,
        month,
        day,
        totalMinutes ~/ 60,
        totalMinutes % 60,
      );

  DateTime get withoutTime => DateTime(year, month, day);

  DateTime toTime(String? time) {
    return withoutTime.copyWith(
      hour: int.tryParse(time?.substring(0, 2) ?? '0'),
      minute: int.tryParse(time?.substring(3, 5) ?? '00'),
    );
  }

  DateTime addDay(int day) => add(Duration(days: day));

  DateTime addMinute(int minute) => add(Duration(minutes: minute));

  DateTime get fixThreeDay {
    int differentDay = 3 - (getDayDifference(DateTime.now()) - 1) % 3;
    return differentDay == 3 ? this : subtractDay(differentDay);
  }

  List<WeekDays> get threeDay {
    List<WeekDays> list = WeekDays.values.where((e) {
      return e.index == weekday - 2 ||
          e.index == weekday - 1 ||
          e.index == weekday;
    }).toList();
    if (weekday == 7) {
      list.add(WeekDays.monday);
    }
    return list;
  }

  DateTime subtractDay(int day) => subtract(Duration(days: day));

  bool get isDayStart => hour % 24 == 0 && minute % 60 == 0;
}

extension FindPriceIndex on List<num> {
  double findPriceIndex(num price) {
    if (price != 0) {
      int startIndex = 0;
      int endIndex = 0;
      for (int i = 0; i < length; i++) {
        if ((this[i]) >= price.toInt()) {
          startIndex = i;
          break;
        }
      }
      for (int i = 0; i < length; i++) {
        if ((this[i]) <= price) {
          endIndex = i;
        }
      }
      if (startIndex == endIndex) {
        return length.toDouble();
      }

      num a = this[startIndex] - this[endIndex];
      num b = price - this[endIndex];
      num c = b / a;
      return startIndex.toDouble() + c;
    } else {
      return 0;
    }
  }
}

extension FindPrice on List<IncomeChartResponse> {
  num findPrice(DateTime time) {
    num price = 0;
    for (int i = 0; i < length; i++) {
      if (this[i].time!.toEqualTime(time)) {
        price = this[i].totalPrice ?? 0;
      }
    }
    return price;
  }

  num findPriceWithHour(DateTime time) {
    num price = 0;
    for (int i = 0; i < length; i++) {
      if (this[i].time!.toEqualTimeWithHour(time)) {
        price = this[i].totalPrice ?? 0;
      }
    }
    return price;
  }
}

extension FindPriceChart on List<ChartData> {
  num findPrice(DateTime time) {
    num price = 0;
    for (int i = 0; i < length; i++) {
      if (this[i].time!.toEqualTime(time)) {
        price = this[i].count ?? 0;
      }
    }
    return price;
  }

  num findPriceWithHour(DateTime time) {
    num price = 0;
    for (int i = 0; i < length; i++) {
      if (this[i].time!.toEqualTimeWithHour(time)) {
        price = this[i].count ?? 0;
      }
    }
    return price;
  }
}

extension FindPriceBookingChart on List<BookingChartData> {
  num findPrice(DateTime time) {
    num price = 0;
    for (int i = 0; i < length; i++) {
      if (this[i].time!.toEqualTime(time)) {
        price = this[i].totalPrice ?? 0;
      }
    }
    return price;
  }

  num findPriceWithHour(DateTime time) {
    num price = 0;
    for (int i = 0; i < length; i++) {
      if (this[i].time!.toEqualTimeWithHour(time)) {
        price = this[i].totalPrice ?? 0;
      }
    }
    return price;
  }
}

extension BoolParsing on String {
  bool toBool() {
    return this == "true" || this == "1";
  }

  DateTime toTime({DateTime? date}) {
    return (date ?? DateTime.now()).withoutTime.copyWith(
          hour: int.tryParse(substring(0, 2)) ?? 0,
          minute: int.tryParse(substring(3, 5)) ?? 0,
        );
  }
}

extension Minutes on MinuteSlotSize {
  int get minutes {
    switch (this) {
      case MinuteSlotSize.minutes5:
        return 5;
      case MinuteSlotSize.minutes15:
        return 15;
      case MinuteSlotSize.minutes30:
        return 30;
      case MinuteSlotSize.minutes60:
        return 60;
    }
  }
}

extension CalendarList on List<BookingData> {
  void addEventInSortedManner(BookingData event) {
    var addIndex = -1;
    for (var i = 0; i < length; i++) {
      if (event.startDate!.compareTo(this[i].startDate!) <= 0) {
        addIndex = i;
        break;
      }
    }

    if (addIndex > -1) {
      insert(addIndex, event);
    } else {
      add(event);
    }
  }
}

extension ExtendedIterable<E> on Iterable<E> {
  Iterable mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension ColorToHex on Color {
  String toHex() => "#${toString().substring(10, 16)}";
}

extension HexToColor on String {
  Color? toColor() {
    if (AppHelpers.checkIfHex(this)) {
      return Color(int.parse('0xFF${substring(1, 7)}'));
    } else {
      return null;
    }
  }
}
