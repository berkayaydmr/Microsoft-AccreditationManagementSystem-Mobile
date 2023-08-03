class Messages {
  static const String welcomeMessage = 'Hoş geldiniz!';
  static const String errorMessage = 'Bir hata oluştu.';
  static const String successMessage = 'İşlem başarıyla tamamlandı.';
  static const String userNotFoundError = 'Kullanıcı Adı veya Parola Hatalı!';
  static const String userAlreadyExists = 'Kullanıcı Zaten Mevcut!';

  static const String emptyUsernameError = 'Kullanıcı Adı Boş Bırakılamaz!';
  static const String usernameLengthError = 'Kullanıcı Adı En Az 4 Karakter Olmalıdır!';
  static const String usernameFormatError =
      'Geçersiz karakterler içeriyor. Sadece harf, rakam ve alt çizgi kullanabilirsiniz.';

  static const String emptyPasswordError = 'Parola Boş Bırakılamaz!';
  static const String passwordLengthError = 'Parola en az 3 karakter olmalıdır!';
  static const String passwordFormatError = 'Parola en az bir büyük harf, bir küçük harf, bir rakam ve bir özel karakter içermelidir!';

  static const String emptyEmailError = 'E-posta Adresi Boş Bırakılamaz!';
  static const String invalidEmailError = 'Geçersiz E-posta Adresi!';

  static const String emptyNameError = 'Ad Boş Bırakılamaz!';
  static const String nameLengthError = 'Ad en az 2 karakter olmalıdır!';

  static const String emptySurnameError = 'Soyad Boş Bırakılamaz!';
  static const String surnameLengthError = 'Soyad en az 2 karakter olmalıdır!';

  static void showMessage(String message) {
    print('Message: $message');
  }
}
