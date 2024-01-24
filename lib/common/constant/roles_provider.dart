String getMessageForRole(String role) {
  switch (role) {
    case '1':
      return 'Berhasil Login Sebagai Admin';
    case '2':
      return 'Berhasil Login Sebagai Pihak Tata Tertib';
    case '3':
      return 'Berhasil Login Sebagai Wakasek Kesiswaan';
    case '4':
      return 'Berhasil Login Sebagai Walikelas';
    case '5':
      return 'Berhasil Login Sebagai Guru';
    case '6':
      return 'Berhasil Login Sebagai Siswa';
    case '7':
      return 'Berhasil Login Sebagai Walimurid';
    default:
      return 'Role not recognized';
  }
}
