class UserData {
  int? registerno;
  int? slot;
  int choice;
  bool checked;

  UserData({
    required this.registerno,
    required this.slot,
    required this.choice,
    required this.checked,
  });
}

List<UserData> userdata = [
  UserData(registerno: null, slot: null, choice: 1, checked: false)
];
