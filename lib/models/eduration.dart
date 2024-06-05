class Eduration {
  int? months;
  int? weeks;
  int? days;
  int? hours;
  int? minutes;
  int? seconds;

  Eduration({this.months, this.weeks, this.days, this.hours, this.minutes, this.seconds});
}

Eduration parseDuration(String? input, {String separator = ' '}) {
  int? months;
  int? weeks;
  int? days;
  int? hours;
  int? minutes;
  int? seconds;
  if (input != null && input.isNotEmpty){
  final parts = input.split(separator).map((t) => t.trim()).toList();
    int? value = int.parse(parts[0]);
    String? durationUnit = parts[1];
    switch (durationUnit) {
      case 'months':
        months = value;
        break;
      case 'weeks':
        weeks = value;
        break;
      case 'days':
        days = value;
        break;
      case 'hours':
        hours = value;
        break;
      case 'minutes':
        minutes = value;
        break;
      case 'seconds':
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


