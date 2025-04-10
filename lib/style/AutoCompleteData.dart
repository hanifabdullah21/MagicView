class AutoCompleteData<T> {
  String? option;
  bool enable;
  T? data;

  AutoCompleteData(this.option, this.data, {this.enable = true});
}

/// Contoh konversi data dari List of Object <T> menjadi List<AutocompleteData>
List<AutoCompleteData<T>> convertDataToAutoCompleteDataList<T>(List<T> data) {
  return data
      .map((option) => AutoCompleteData<T>("YOUR OPTION", option))
      .toList();
}
