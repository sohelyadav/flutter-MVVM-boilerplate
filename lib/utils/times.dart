import 'package:intl/intl.dart';

class Times {
  ///
  //Digital month to English abbreviation
  ///
  static String numberMonth2NamedMonth(
    String numberedMonth, {
    bool abbreviation = true,
  }) {
    if (numberedMonth == '1' || numberedMonth == '01') {
      return abbreviation ? 'JAN' : 'January';
    } else if (numberedMonth == '2' || numberedMonth == '02') {
      return abbreviation ? 'FEB' : 'February';
    } else if (numberedMonth == '3' || numberedMonth == '03') {
      return abbreviation ? 'MAR' : 'March';
    } else if (numberedMonth == '4' || numberedMonth == '04') {
      return abbreviation ? 'APR' : 'April';
    } else if (numberedMonth == '5' || numberedMonth == '05') {
      return abbreviation ? 'MAY' : 'May';
    } else if (numberedMonth == '6' || numberedMonth == '06') {
      return abbreviation ? 'JUN' : 'June';
    } else if (numberedMonth == '7' || numberedMonth == '07') {
      return abbreviation ? 'JUL' : 'July';
    } else if (numberedMonth == '8' || numberedMonth == '08') {
      return abbreviation ? 'AUG' : 'August';
    } else if (numberedMonth == '9' || numberedMonth == '09') {
      return abbreviation ? 'SEP' : 'September';
    } else if (numberedMonth == '10') {
      return abbreviation ? 'OCT' : 'October';
    } else if (numberedMonth == '11') {
      return abbreviation ? 'NOV' : 'November';
    } else if (numberedMonth == '12') {
      return abbreviation ? 'DEC' : 'December';
    } else {
      return 'UNKOWN';
    }
  }

  static String nameMonth2NumberMonth(
    String nameMonth,
  ) {
    if (nameMonth == 'JAN' || nameMonth == 'January') {
      return '01';
    } else if (nameMonth == 'FEB' || nameMonth == 'February') {
      return '02';
    } else if (nameMonth == 'MAR' || nameMonth == 'March') {
      return '03';
    } else if (nameMonth == 'APR' || nameMonth == 'April') {
      return '04';
    } else if (nameMonth == 'MAY' || nameMonth == 'May') {
      return '05';
    } else if (nameMonth == 'JUN' || nameMonth == 'June') {
      return '06';
    } else if (nameMonth == 'JUL' || nameMonth == 'July') {
      return '07';
    } else if (nameMonth == 'AUG' || nameMonth == 'August') {
      return '08';
    } else if (nameMonth == 'SEP' || nameMonth == 'September') {
      return '09';
    } else if (nameMonth == 'OCT' || nameMonth == 'October') {
      return '10';
    } else if (nameMonth == 'NOV' || nameMonth == 'November') {
      return '11';
    } else if (nameMonth == 'DEC' || nameMonth == 'December') {
      return '12';
    } else {
      return 'UNKOWN';
    }
  }

  static String timestamp2String(int timestamp,
      {String format = 'yyyy-MM-dd hh:mm:ss'}) {
    return DateFormat(format).format(
      DateTime.fromMillisecondsSinceEpoch(timestamp),
    );
  }

  static String time2period(DateTime time) {
    String format = 'HH';
    int hour = int.parse(DateFormat(format).format(time));
    if (hour > 6 && hour < 12) {
      return 'morning';
    } else if (hour >= 12 && hour < 18) {
      return 'afternoon';
    } else {
      return 'evening';
    }
  }

  static String currentPeriod() {
    String format = 'HH';
    int hour = int.parse(DateFormat(format).format(DateTime.now()));
    if (hour > 6 && hour < 12) {
      return 'morning';
    } else if (hour >= 12 && hour < 18) {
      return 'afternoon';
    } else {
      return 'evening';
    }
  }

  /// 06:00 PM => 1800
  static String converAmPmToMilitaryTiming(String initialTiming) {
    if (initialTiming.isEmpty) return "";
    int result;
    result = int.parse(initialTiming.split(":")[0] +
        initialTiming.split(":")[1].substring(0, 2));
    // result = int.parse(initialTiming.replaceAll(":", "").substring(0, 5));

    if (initialTiming.toUpperCase().contains("PM")) {
      result = result + 1200;
    }
    return result.toString();
  }

  /// 1800 => 06:00 PM
  static String convertMilitaryTimingToAmPm(String initialTiming) {
    if (initialTiming.isEmpty) return "";
    return DateFormat("jm").format(DateTime(
        1,
        1,
        1,
        int.parse(initialTiming[0] + initialTiming[1]),
        int.parse(initialTiming[2] + initialTiming[3])));
  }

  static int getHRSFromMilitary(String initialTiming) {
    if (initialTiming.isEmpty) return 0;
    if (initialTiming.length == 3) initialTiming = "0" + initialTiming;
    return int.parse(DateFormat("HH").format(DateTime(
        1,
        1,
        1,
        int.parse(initialTiming[0] + initialTiming[1]),
        int.parse(initialTiming[2] + initialTiming[3]))));
  }

  static int getMinuteFromMilitary(String initialTiming) {
    if (initialTiming.isEmpty) return 0;
    if (initialTiming.length == 3) initialTiming = "0" + initialTiming;

    return int.parse(DateFormat("mm").format(DateTime(
        1,
        1,
        1,
        int.parse(initialTiming[0] + initialTiming[1]),
        int.parse(initialTiming[2] + initialTiming[3]))));
  }

  /// Relative to today's date (today, yesterday, etc.)

  //Current month and date
  static String currentNamedMonthDay() {
    final now = DateTime.now();
    final namedMonth = numberMonth2NamedMonth(
      now.month.toString(),
      abbreviation: false,
    );
    return '$namedMonth ${now.day}';
  }

  /// Relative to today's date (today, yesterday, etc.)
  static String relativeDate(DateTime time) {
    final now = DateTime.now();
    final difference = now.day - time.day;
    if (difference == 0) {
      return 'TODAY';
    } else if (difference == 1) {
      return 'YESTERDAY';
    } else {
      return '$difference DAYS AGO';
    }
  }

  static String getWeekDay(DateTime day) {
    switch (day.weekday) {
      case DateTime.sunday:
        return "Sunday";
      case DateTime.saturday:
        return "Saturday";
      case DateTime.friday:
        return "Friday";
      case DateTime.thursday:
        return "Thursday";
      case DateTime.wednesday:
        return "Wednesday";
      case DateTime.tuesday:
        return "Tuesday";
      case DateTime.monday:
        return "Monday";
      default:
        return "Monday";
    }
  }
}
