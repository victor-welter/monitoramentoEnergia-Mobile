String? capitalizeFirstLetter(String? text) {
  if (text == null) {
    return null;
  }

  text = text.trim();
  text = text.toLowerCase();

  if (text.length <= 1) {
    return text.toUpperCase();
  }

  final List<String> words = text.split(' ');

  final capitalizedWords = words.map((word) {
    word = word.trim();

    if (word != '') {
      final String firstLetter = word.substring(0, 1).toUpperCase();
      final String remainingLetters = word.substring(1);
      return '$firstLetter$remainingLetters';
    }
    return '';
  });

  return capitalizedWords.join(' ');
}

String? capitalizePhrase(String? text) {
  if (text == null) {
    return null;
  }

  text = text.trim();
  text = text.toLowerCase();

  final List<String> phrases = text.split('.');

  final capitalizedPhrases = phrases.map((p) {
    p = p.trim();

    if (p != '') {
      final firstLetter = p.substring(0, 1).toUpperCase();
      final otherLetters = p.substring(1);

      return '$firstLetter$otherLetters';
    }
  });

  return capitalizedPhrases.join('. ');
}

String valorNull(String? value, [String? pattern]) {
  if (value == null || value.trim().isEmpty || value == 'null') {
    return pattern ?? 'Sem informação';
  }

  return value;
}
