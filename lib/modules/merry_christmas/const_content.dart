class ChristMasContent {
  final l = NewText();
  final _nameEn = 'Virak';
  final _nameKh = 'វីរៈ';
  // final _investText = 'Investment';

  get invest => l.language == 'en' ? _nameEn : _nameKh;
}

class NewText {
  final language = 'k';
}
