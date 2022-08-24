class AppState {
  String? km;
  String? miles;

  AppState({
    required this.km,
    required this.miles,
  });

  AppState.copywith({required AppState prev, String? km, String? miles}) {
    this.km = km ?? prev.km;
    this.miles = miles ?? prev.miles;
  }

  AppState.initial() {
    km = "0";
    miles = "0";
  }
}
