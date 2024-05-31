class Eduration {
  int? months;
  int? weeks;
  int? days;
  int? hours;
  int? minutes;
  int? seconds;

  Eduration({this.months, this.weeks, this.days, this.hours, this.minutes, this.seconds});
}

Eduration parseDuration(String input, {String separator = ' '}) {
  final parts = input.split(separator).map((t) => t.trim()).toList();

  int? months;
  int? weeks;
  int? days;
  int? hours;
  int? minutes;
  int? seconds;

  for (String part in parts) {
    final match = RegExp(r'^(\d+)(M|w|d|h|m|s)$').matchAsPrefix(part);
    if (match == null) throw FormatException('Invalid duration format');

    int value = int.parse(match.group(1)!);
    String durationUnit = match.group(2)!; // Use a more descriptive variable name

    switch (durationUnit) {
      case 'M':
        if (months != null) {
          throw FormatException('Months specified multiple times');
        }
        months = value;
        break;
      case 'w':
        if (weeks != null) {
          throw FormatException('Weeks specified multiple times');
        }
        weeks = value;
        break;
      case 'd':
        if (days != null) {
          throw FormatException('Days specified multiple times');
        }
        days = value;
        break;
      case 'h':
        if (hours != null) {
          throw FormatException('Hours specified multiple times');
        }
        hours = value;
        break;
      case 'm':
        if (minutes != null) {
          throw FormatException('Minutes specified multiple times');
        }
        minutes = value;
        break;
      case 's':
        if (seconds != null) {
          throw FormatException('Seconds specified multiple times');
        }
        seconds = value;
        break;
      default:
        throw FormatException('Invalid duration unit $durationUnit');
    }
  }

  return Eduration(
    months: months ?? 0,
    weeks: weeks ?? 0,
    days: days ?? 0,
    hours: hours ?? 0,
    minutes: minutes ?? 0,
    seconds: seconds ?? 0,
  );
}