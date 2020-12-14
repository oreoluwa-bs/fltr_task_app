String dueValue(dueDate) {
  final due = DateTime.now().difference(dueDate) * -1;
  final bool isInAMonth = due.inDays < 31;
  final bool isInADay = due.inDays < 1;
  final bool isInAnHour = due.inHours < 1;
  final bool isExpired = due.inMinutes < 0;
  if (!isInAMonth) {
    return '${((due.inDays / 31).floor())} months';
  } else if (isInADay) {
    if (isInAnHour) {
      if (isExpired) return 'Expired';
      return '${due.inMinutes} minutes';
    }
    return '${due.inHours} hours';
  }
  return '${due.inDays} days';
}

String getMonth(int month) {
  const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final monthString = months[month - 1];
  return '$monthString';
}
