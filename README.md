# MagicView

Mudah digunakan, mudah dikustomisasi.

Sekumpulan widget yang sudah dikustomisasi untuk dapat lebih memudahkan dalam menggunakannya.

## MagicFactory

Pertama untuk mengatur nilai default untuk setiap Widget, anda dapat mengatur [MagicFactory](#magicfactory) di main.dart

```dart
MagicFactory.initMagicFactory(
    colorBrand: Colors.blue,
    colorBrand2: Colors.pink,
  );
```

Properti [MagicFactory] yang dapat digunakan

| Nama                        | Tipe                  | Keterangan                                                                                                            |
|-----------------------------|-----------------------|-----------------------------------------------------------------------------------------------------------------------|
| colorBrand                  | Color                 | [REQUIRED] Mengatur warna utama                                                                                       |
| colorBrand2                 | Color                 | [REQUIRED] Mengatur warna sekunder                                                                                    |
| colorStroke                 | Color?                | Mengatur warna border, digunakan untuk warna border di MagicButton                                                     |
| colorText                   | Color?                | Mengatur warna teks untuk MagicText                                                                                   |
| colorDisable                | Color?                | Mengatur warna disable, seperti digunakan untuk MagicButton disable                                                    |
| colorError                  | Color?                | Mengatur warna error                                                                                                  |
| fontFamily                  | FontFamily?           | Mengatur Font                                                                                                         |
| magicTextStyle              | MagicTextStyle?       | Mengatur style default untuk MagicText                                                                                |
| magicTextFieldBorder        | MagicTextFieldBorder? | Mengatur border untuk MagicTextField                                                                                 |
| buttonBorderRadius          | double?               | Mengatur radius untuk MagicButton atau MagicTextField                                                                 |
| useScreenUtil               | bool                  | Mengatur penggunaan ScreenUtil. Jika bernilai true maka fontSize akan dikonversi ke .sp                                |
| limitSmallMediumScreen      | double?               | Mengatur batas. width < limit = Small dan width > limit = Medium                                                      |
| limitMediumLargeScreen      | double?               | Mengatur batas. width < limit = Medium dan width > limit = Large                                                       |
| iconSuccess                 | Widget?               | Mengatur icon Success dialog ketika EnumIconDialogType.success                                                        |
| iconFailed                  | Widget?               | Mengatur icon Success dialog ketika EnumIconDialogType.failed                                                         |
| iconWarning                 | Widget?               | Mengatur icon Success dialog ketika EnumIconDialogType.warning                                                        |


Jika anda ingin mengimplementasikan ScrenUtil maka anda wajib menuliskan kode berikut di main.dart

```dart
ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: YourMaterialApp, //Jika anda menggunakan GetX
      builder: YourMaterialApp, //Jika anda tidak menggunakan GetX
    )
```

> Baca selengkapnya di [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil)

## Daftar Widget

- [MagicText](#magictext) - Widget Text
- [MagicTextIcon](#magictexticon) - Widget Text dengan Gambar
- [MagicButton](#magicbutton) - Widget Tombol
- [MagicTextField](#magictextfield) - Widget TextField
- [MagicDropdown](#magicdropdown) - Widget Dropdown
- [MagicAutoComplete](#magicautocomplete) - Widget AutoComplete
- [MagicDialog](#magicdialog) - Widget Dialog
- [MagicLayout](#magiclayout) - Widget Mengatur Responsive Layout

## MagicText

Sebuah Kustomisasi Widget Text.

```dart
MagicText(
  "Magic Text Created By Hanif Abdullah",
)
```

Secara default gaya (style) MagicView diatur dari variabel [MagicFactory.magicTextStyle] dengan
properti berikut

```dart
static MagicTextStyle magicTextStyle = MagicTextStyle(
    maxLines: null,
    textAlign: null,
    textOverflow: null,
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: colorText,
    fontStyle: FontStyle.normal,
  );
```

Terdapat 2 cara untuk mengatur gaya (style) untuk widget ini :

1. Mengisi property style, maka Widget akan diatur menyesuaikan seluruh property yang ada didalamnya

```dart
MagicText(
  "Magic Text Created By Hanif Abdullah",
  style: MagicTextStyle(
    maxLines: 1,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.lato,
    color: Colors.black,
    fontSize: 14,
    fontStyle: FontStyle.normal,
    textOverflow: null,
    textAlign: null
  )
)
```

2. Mengisi property selain style, maka Widget akan diatur sesuai property yang diisi saja. Property
   yang kosong akan menyesuaikan dari default MagicTextStyle [MagicFactory.magicTextStyle]

```dart
MagicText(
  "Magic Text Created By Hanif Abdullah",
  fontWeight: FontWeight.normal,
  fontFamily: FontFamily.lato,
  color: Colors.black,
  fontSize: 14,
)
```

Terdapat 4 tipe yang disediakan untuk menggunakan MagicText

1. Default

```dart
MagicText("teks");
```

2. Head (default ukuran font = 18 dan ketebalan font = FontWeight.bold)

```dart
MagicText.head('teks');
```

3. Subhead (default ukuran font = 16 dan ketebalan font = FontWeight.w600)

```dart
MagicText.subhead('teks');
```

4. Hint (default ukuran font = 12 dan ketebalan font = FontWeight.w400)

```dart
MagicText.hint('teks');
```

Properti [MagicTextStyle] yang dapat digunakan

| Nama                  | Tipe                   | Keterangan                              |
|-----------------------|------------------------|-----------------------------------------|
| `maxLines`            | `int?`                 | Mengatur maksimal baris dalam Widget    |
| `textAlign`           | `TextAlign?`           | Mengatur perataan teks                  |
| `textOverflow`        | `TextOverflow?`        | Mengatur                                |
| `fontFamily`          | `FontFamily?`          | Mengatur jenis dari font                |
| `fontWeight`          | `FontWeight?`          | Mengatur ketebalan dari font            |
| `fontSize`            | `int?`                 | Mengatur ukuran dari font               |
| `fontStyle`           | `FontStyle?`           | Mengatur gaya dari font (normal/miring) |
| `letterSpacing`       | `double?`              | Mengatur jarak antar huruf              |
| `color`               | `Color?`               | Mengatur warna dari font                |
| `decoration`          | `TextDecoration?`      | Mengatur dekorasi                       |
| `decorationStyle`     | `TextDecorationStyle?` | Mengatur gaya dekorasi                  |
| `decorationColor`     | `Color?`               | Mengatur warna dekorasi                 |
| `decorationThickness` | `double?`              | Mengatur ketebalan dekorasi             |

## MagicTextIcon

Sebuah kustomisasi Widget Text dengan Gambar.

Terdapat 3 tipe yang dapat dipakai

1. `asset` Memuat gambar dari aset lokal

```dart
MagicTextIcon.asset(
  "MagicTextIcon",
  asset: "assets/asset-example.png",
  side: MagicTextIconSide.left,
  spaces: 8,
  width: 16,
  height: 16,
  textStyle: MagicFactory.magicTextStyle,
  horizontalAlignment: MainAxisAlignment.start,
  verticalAlignment: CrossAxisAlignment.start,
)
```

2. `network` Memuat gambar dari internet

```dart
MagicTextIcon.network(
  "MagicTextIcon",
  url: "https://cdn-icons-png.flaticon.com/128/415/415733.png",
  side: MagicTextIconSide.left,
  spaces: 8,
  width: 16,
  height: 16,
  textStyle: MagicFactory.magicTextStyle,
  horizontalAlignment: MainAxisAlignment.start,
  verticalAlignment: CrossAxisAlignment.start,
)
```

3. `icon` Memuat gambar dari IconData

```dart
MagicTextIcon.icon(
  "MagicTextIcon",
  icon: Icons.apple,
  side: MagicTextIconSide.left,
  spaces: 8,
  size: 16,
  textStyle: MagicFactory.magicTextStyle,
  horizontalAlignment: MainAxisAlignment.start,
  verticalAlignment: CrossAxisAlignment.start,
),
```

Properti yang dapat digunakan

| Nama                  | Tipe                  | Tersedia di           | Keterangan                               |
|-----------------------|-----------------------|-----------------------|------------------------------------------|
| `asset`               | `String`              | `asset`               | Memuat gambar dari aset lokal            |
| `url`                 | `String`              | `network`             | Memuat gambar dari internet              |
| `icon`                | `IconData`            | `icon`                | Memuat gambar dari icon                  |
| `spaces`              | `double`              | semua                 | Mengatur jarak antara teks dengan gambar |
| `size`                | `double`              | `icon`                | Mengatur ukuran dari gambar              |
| `width`               | `double`              | `asset` dan `network` | Mengatur lebar gambar                    |
| `height`              | `double`              | `asset` dan `network` | Mengatur tinggi gambar                   |
| `textStyle`           | `MagicTextStyle`      | semua                 | Mengatur gaya teks                       |
| `horizontalAlignment` | `MainAxisAlignment?`  | semua                 | Mengatur perataan horisontal             |
| `verticalAlignment`   | `CrossAxisAlignment?` | semua                 | Mengatur perataan vertikal               |
| `color`               | `Color?`              | semua                 | Mengatur warna dari gambar               |

## MagicButton

Sebuah Kustomisasi Widget Button.

```dart
MagicButton(
  () {
    // Do Something here
  },
  text: "Tekan Disini",
);
```

Pada `MagicButton` terdapat properti `textStyle`. Jika properti ini diberi nilai maka
properti `textColor`, `textSize`, `fontWeight` dan `fontFamily` akan diabaikan.

Anda juga dapat mengganti teks biasa dengan Widget yang lain dengan mendefinisikan nilai
dari `child`. Contohnya di bawah ini teks biasa diganti dengan [MagicTextIcon](#magictexticon).
Namun perlu diperhatikan jika anda memberikan nilai pada `child` maka properti `text`, `textColor`
, `textSize`
, `fontWeight` dan `fontFamily` akan diabaikan.

```dart
MagicButton(
  () {},
  text: "Teks",
  child: MagicTextIcon.network(
  "MagicTextIcon with Network",
  url: "https://cdn-icons-png.flaticon.com/128/415/415733.png",
  side: MagicTextIconSide.left,
  spaces: 8,
  width: 16,
  height: 16,
  textStyle: MagicFactory.magicTextStyle,
  horizontalAlignment: MainAxisAlignment.start,
  verticalAlignment: CrossAxisAlignment.start,
  ),
)
```

Properti [MagicButton](#magicbutton) yang dapat digunakan

| Nama          | Tipe                  | Keterangan                                                                                                                                                                     |
|---------------|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `child`       | `Widget?`             | Mengatur kustom child. Dapat diisi dengan Widget yang lain                                                                                                                     |
| `text`        | `String`              | Mengatur teks. Diabaikan jika `child` diisi.                                                                                                                                   |
| `textStyle`   | `MagicTextStyle?`     | Mengatur perataan teks. Diabaikan jika `child` diisi.                                                                                                                          |
| `textColor`   | `Color?`              | Mengatur warna teks. Diabaikan jika `child` atau `textStyle diisi`                                                                                                             |
| `fontFamily`  | `FontFamily?`         | Mengatur jenis teks. Diabaikan jika `child` atau `textStyle diisi`                                                                                                             |
| `fontWeight`  | `FontWeight?`         | Mengatur ketebalan teks. Diabaikan jika `child` atau `textStyle diisi`                                                                                                         |
| `textSize`    | `int?`                | Mengatur ukuran teks. Diabaikan jika `child` atau `textStyle diisi`                                                                                                            |
| `background`  | `Color?`              | Mengatur warna dasar dari tombol. [MagicFactory.colorBrand] merupakan nilai defaultnya                                                                                         |
| `foreground`  | `Color?`              | Mengatur warna dari tombol. Akan terlihat jika tombol di-hover atau diklik.                                                                                                    |
| `strokeColor` | `Color?`              | Mengatur warna garis. Diabaikan jika `strokeWidth` = 0. Jika `strokeWidth` > 0 dan `strokeColor` = null maka otomatis warna garis akan diambil dari [MagicFactory.colorStroke] |
| `strokeWidth` | `double?`             | mengatur ketebalan garis. Default berisi 0.                                                                                                                                    |
| `radius`      | `double?`             | mengatur kelengkungan setiap sisi tombol. Default berisi [MagicFactory.buttonRadius]                                                                                           |
| `padding`     | `EdgeInsetsGeometry?` | Mengatur padding antara tombol dengan child-nya                                                                                                                                |

## MagicTextField

Sebuah kustomisasi Widget TextField.

Semua FontFamily yang ada pada Widget ini akan mengikuti yang diatur di [MagicFactory.fontFamily]

Terdapat 4 tipe yang dapat digunakan :

1. `default` : Pada tipe ini menampilkan [MagicTextField] tanpa border dan suffix icon

```dart
MagicTextField(
  controller,
  hint: "Masukkan nama",
)
```

2. `password` : Pada tipe ini menampilkan [MagicTextField] yang digunakan untuk mengetik kata sandi,
   dengan teks dirahasiakan dan terdapat `suffixIcon`. Untuk mengatur `suffixIcon` anda dapat
   menggunakan `suffixIconEyeClose` ketika teks dirahasiakan dan `suffixIconEyeOpen` ketika teks
   dibuka. Jika `suffixIconEyeClose` dan `suffixIconEyeOpen` tidak diisi maka akan ada Widget
   default yang mengisi.

```dart
MagicTextField.password(
  controller,
  hint: "Masukkan nama",
  #  suffixIconEyeClose: YourWidget(),
  #  suffixIconEyeOpen: YourWidget(),
)
```

3. `border` : Pada tipe ini menampilkan [MagicTextField] dengan border. Secara default border akan
   diambil dari [MagicFactory.border]. Anda dapat mengkustomisasi border sendiri dengan menambahkan
   properti `border` pada [MagicTextField]

```dart
MagicTextField.border(
  controller,
  hint: "Masukkan nama",
)
```

4. `borderPassword` : Pada tipe ini menampilkan [MagicTextField] yang merupakan kombinasi antara
   tipe `border` dan tipe `password`
```dart
MagicTextField.borderPassword(
  controller,
  hint: "Masukkan nama",
)
```

| Nama                   | Tipe                       | Keterangan                                                                                                                                           |
|------------------------|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| type                   | MagicTextFieldType?        | Tipe yang tersedia pada Widget MagicTextField                                                                                                        |
| controller             | TextEditingController      | Controller                                                                                                                                           |
| keyboardType           | TextInputType?             | Mengatur tampilan keyboard                                                                                                                           |
| textInputAction        | TextInputAction?           | Mengatur bentuk aksi 'enter' di keyboard                                                                                                             |
| textStyle              | MagicTextStyle?            | Mengatur gaya teks                                                                                                                                   |
| readOnly               | bool                       | Mengatur MagicTextField dapat diedit atau tidak. Secara default bernilai `false`                                                                     |
| enabled                | bool?                      | Mengatur MagicTextField dapat diedit atau tidak. Berbeda dengan readOnly, ketika enabled bernilai `true`, MagicTextField akan memasuki mode disabled |
| obscureText            | bool                       | Mengatur tampilan teks, akan disembunyikan dan diganti `*` atau tidak. Secara default bernilai `false`                                               |
| cursorColor            | Color?                     | Mengatur warna cursor                                                                                                                                |
| onEditingComplete      | Function()?                | Menangani aksi ketika sudah selesai mengedit                                                                                                         |
| onFieldSubmitted       | Function(String)?          | Menangani aksi ketika sudah selesai mengetik dan menekan `enter`                                                                                     |
| onChange               | Function(String)?          | Menangani aksi setiap ada perubahan pengetikan                                                                                                       |
| validator              | String? Function(String?)? | Menangani aksi validasi                                                                                                                              |
| autoValidateMode       | AutovalidateMode?          | Menangani aksi validasi akan dilakukan kapan                                                                                                         |
| onTap                  | Function()?                | Menangani aksi ketika MagicTextField di-Tap                                                                                                          |
| focusNode              | FocusNode?                 |                                                                                                                                                      |
| textCapitalization     | TextCapitalization         | Memberikan hint                                                                                                                                      |
| hint                   | String?                    | Mengatur gaya dari hint                                                                                                                              |
| hintStyle              | MagicTextStyle?            | Memberikan label. Jika hint dan label diisi, maka hint akan diabaikan dan label yang akan ditampilkan                                                |
| label                  | String?                    | Mengatur gaya dari label                                                                                                                             |
| labelStyle             | MagicTextStyle?            | Mengatur Widget kustom untuk label. Jika labelCustom diisi maka label, labelStyle, dan floatingLabelStyle akan diabaikan                             |
| labelCustom            | Widget?                    | Mengatur perataan dari label yang mengambang                                                                                                         |
| floatingLabelAlignment | FloatingLabelAlignment?    | Mengatur kemunculan label mengambang                                                                                                                 |
| floatingLabelBehavior  | FloatingLabelBehavior?     | Mengatur gaya dari label mengambang                                                                                                                  |
| floatingLabelStyle     | MagicTextStyle?            | Mengatur ikon                                                                                                                                        |
| icon                   | Widget?                    | Mengatur warna dari ikon                                                                                                                             |
| iconColor              | Color?                     | Mengatur ikon pada awalan MagicTextField                                                                                                             |
| prefixIcon             | Widget?                    | Mengatur warna prefixIcon                                                                                                                            |
| prefixIconColor        | Color?                     | Mengatur teks pada awalan MagicTextField. Terletak antara prefixIcon dan tempat untuk mengetik.                                                      |
| prefixText             | String?                    | Mengatur gaya dari prefix                                                                                                                            |
| prefixTextStyle        | MagicTextStyle?            | Mengatur Widget pada awalan MagicTextField. Terletak antara prefixIcon dan tempat untuk mengetik.                                                    |
| prefix                 | Widget?                    | Mengatur ikon pada akhiran MagicTextField. Jika type = MagicTextFieldType.PASSWORD atau MagicTextFieldType.BORDER_PASSWORD, suffixIcon akan diabaikan |
| suffixIcon             | Widget?                    | Mengatur suffixIcon jika type = MagicTextFieldType.PASSWORD atau MagicTextFieldType.BORDER_PASSWORD dan obscureText = false                          |
| suffixIconEyeOpen      | Widget?                    | Mengatur suffixIcon jika type = MagicTextFieldType.PASSWORD atau MagicTextFieldType.BORDER_PASSWORD dan obscureText = true                           |
| suffixIconEyeClose     | Widget?                    | Mengatur warna dari suffixIcon                                                                                                                       |
| suffixIconColor        | Color?                     | Mengatur teks pada akhiran MagicTextField. Terletak antara suffixIcon dan tempat untuk mengetik.                                                     |
| suffixText             | String?                    | Mengatur gaya dari suffixText                                                                                                                        |
| suffixTextStyle        | MagicTextStyle?            | Mengatur Widget pada awalan MagicTextField. Terletak antara suffixIcon dan tempat untuk mengetik.                                                    |
| suffix                 | Widget?                    | Mengatur garis batas / border pada MagicTextField                                                                                                    |
| counterText            | String?                    | Mengatur teks counter. Terletak pada kanan bawah MagicTextField                                                                                      |
| counterStyle           | MagicTextStyle?            | Mengatur gaya teks counterText                                                                                                                       |
| helperText             | String?                    | mengatur teks helper. Terletak pada kiri bawah MagicTextField                                                                                        |
| helperStyle            | MagicTextStyle?            | Mengatur gaya teks helperText                                                                                                                        |
| errorText              | String?                    | Mengatur teks error. Terletak pada kiri bawah MagicTextField. Jika helperText tidak bernilai null akan terganti dengan errorText                     |
| errorStyle             | MagicTextStyle?            | Mengatur gaya teks errorText                                                                                                                         |
| fillColor              | Color?                     | Mengatur warna dari MagicTextField. Akan diabaikan jika filled bernilai null atau false                                                              |
| filled                 | bool?                      | Mengatur MagicTextField berwarna atau tidak                                                                                                          |
| padding                | EdgeInsetsGeometry?        | Mengatur padding                                                                                                                                     |
| constraints            | BoxConstraints?            | Mengatur ukuran dari MagicTextField                                                                                                                  |
| inputFormatter         | List<TextInputFormatter>?  | Mengatu format teks pada MagicTextField                                                                                                              |

## MagicDropDown

Sebuah Kustomisasi Widget Dropdown.

```dart
MagicDropDown<YourModel>(
  value: yourValue,
  items: yourItems,
  hint: yourHint,
  itemString: (data) {
    /// Example : data?.name ?? ""
    return yourItemString;
  },
  onChange: (data) {
    /// Do Something
  },
)
```

| Nama                  | Type                | Keterangan                                                                                                       |
|-----------------------|---------------------|------------------------------------------------------------------------------------------------------------------|
| items                 | List\<T\>            | [REQUIRED] Menagtur isi dropdown |
| itemString            | String Function(T?) | [REQUIRED] Mengatur teks yang ditampilkan di menu |
| onChange              | Function(T)?         | [REQUIRED] Fungsi untuk mengatur nilai setelah dipilih dari menu |
| autoValidateMode      | AutovalidateMode?   | Menagtur jenis validasi |
| border                | MagicTextFieldBorder? | Mengatur garis batas / border pada [MagicTextField] |
| counterStyle          | MagicTextStyle?     | Mengatur gaya teks [counterText] |
| counterText           | String?             | Mengatur teks counter. Terletak pada kanan bawah [MagicTextField] |
| disableHint           | String?             | Mengatur hint saat [MagicDropDown] disable |
| disableHintStyle      | MagicTextStyle?     | Mengatur hint style saat [MagicDropDown] disable |
| errorStyle            | MagicTextStyle?     | Mengatur gaya teks [errorText] |
| errorText             | String?             | Mengatur teks error. Terletak pada kiri bawah [MagicTextField]. Jika [helperText] tidak bernilai null akan terganti dengan [errorText] |
| fillColor             | Color?              | Mengatur warna dari [MagicTextField]. Akan diabaikan jika [filled] bernilai null atau false |
| filled                | bool?               | Mengatur [MagicTextField] berwarna atau tidak |
| floatingLabelAlignment| FloatingLabelAlignment? | Mengatur perataan dari [label] yang mengambang                                                                |
| floatingLabelBehavior | FloatingLabelBehavior? | Mengatur kemunculan [label] mengambang                                                                          |
| floatingLabelStyle    | MagicTextStyle?     | Mengatur gaya dari [label] mengambang                                                                           |
| helperStyle           | MagicTextStyle?     | Mengatur gaya teks [helperText] |
| helperText            | String?             | Mengatur teks helper. Terletak pada kiri bawah [MagicTextField] |
| hint                  | String?             | Memberikan hint                                                                                                  |
| hintStyle             | MagicTextStyle?     | Mengatur gaya dari [hint]                                                                                        |
| icon                  | Widget?             | Mengatur ikon                                                                                                   |
| iconColor             | Color?              | Mengatur warna dari ikon                                                                                        |
| iconDropdown          | Widget?             | Mengatur ikon dropdown |
| iconDropdownColorDisable | Color?            | Mengatur warna ikon dropdon saat disable |
| iconDropdownColorEnable | Color?            | Mengatur warna ikon dropdon saat enable |
| iconDropdownSize      | double?             | Mengatur ukuran ikon dropdown |
| itemBuilder           | Widget Function(String itemString, T data)? | Mengatur tampilan dari daftar menu |
| itemColor             | Color?              | Menagtur warna dari item |
| itemHeight            | double?             | Mengatur tinggi setiap item |
| itemString            | String Function(T?) | Mengatur teks yang ditampilkan di menu |
| label                 | String?             | Memberikan label. Jika [hint] dan [label] diisi, maka [hint] akan diabaikan dan [label] yang akan ditampilkan   |
| labelCustom           | Widget?             | Mengatur Widget kustom untuk label. Jika [labelCustom] diisi maka [label], [labelStyle], dan [floatingLabelStyle] akan diabaikan |
| labelStyle            | MagicTextStyle?     | Mengatur gaya dari [label]                                                                                      |
| maxMenuHeight         | double?             | Mengatur tinggi maksimal menu |
| prefix                | Widget?             | Mengatur Widget pada awalan [MagicTextField]. Terletak antara [prefixIcon] dan tempat untuk mengetik. [prefix] akan muncul jika [prefixText] bernilai null dan [MagicTextField] dalam status fokus |
| prefixIcon            | Widget?             | Mengatur ikon pada awalan [MagicTextField]                                                                     |
| prefixIconColor       | Color?              | Mengatur warna [prefixIcon]                                                                                     |
| prefixText            | String?             | Mengatur teks pada awalan [MagicTextField]. Terletak antara [prefixIcon] dan tempat untuk mengetik. [prefixText] akan muncul jika [prefix] bernilai null dan [MagicTextField] dalam status fokus |
| prefixTextStyle       | MagicTextStyle?     | Mengatur gaya dari [prefixText]                                                                                   |
| suffix                | Widget?             | Mengatur Widget pada awalan [MagicTextField]. Terletak antara [suffixIcon] dan tempat untuk mengetik. [suffix] akan muncul jika [suffixText] bernilai null dan [MagicTextField] dalam status fokus |
| suffixIcon            | Widget?             | Mengatur ikon pada akhiran [MagicTextField] |
| suffixIconColor       | Color?              | Mengatur warna dari [suffixIcon] |
| suffixIconEyeClose    | Widget?             | Mengatur [suffixIcon] jika [type] = [MagicTextFieldType.PASSWORD] atau [MagicTextFieldType.BORDER_PASSWORD] dan [obscureText] = true |
| suffixIconEyeOpen     | Widget?             | Mengatur [suffixIcon] jika [type] = [MagicTextFieldType.PASSWORD] atau [MagicTextFieldType.BORDER_PASSWORD] dan [obscureText] = false |
| suffixText            | String?             | Mengatur teks pada akhiran [MagicTextField]. Terletak antara [suffixIcon] dan tempat untuk mengetik. [suffixText] akan muncul jika [suffix] bernilai null dan [MagicTextField] dalam status fokus |
| suffixTextStyle       | MagicTextStyle?     | Mengatur gaya dari [suffixText] |
| value                 | T?                  | Mengatur nilai |
| validator             | String? Function(String? text, T? data)? | Mengatur validasi dropdown |

## MagicAutoComplete

Sebuah Kustomisasi Widget Autocomplete.

```dart
MagicAutoComplete<ExampleModel>(
  controller: controller,
  list: items.map((e) => AutoCompleteData(e.name, e)).toList(),
  onSelected: (value) {
    setState(() {
      selectedData = value;
      controller.text = selectedData?.option ?? "";
    });
  })
```

| Nama                        | Type                                                       | Keterangan                                                                                                    |
|-----------------------------|------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| controller                  | TextEditingController                                      | [REQUIRED] Controller untuk fieldViewBuilder                                                                  |
| list                        | List<AutoCompleteData<T>>                                 | [REQUIRED] Pilihan yang ditampilkan                                                                           |
| onSelected                  | Function(AutoCompleteData<T>)?                            | [REQUIRED ] Aksi ketika pilihan tersebut dipilih                                                               |
| displayStringForOption      | String Function(AutoCompleteData<T>)?                     | Menampilkan String pilihan yang dipilih                                                                      |
| fieldViewBuilder            | Widget Function(BuildContext, TextEditingController, FocusNode, VoidCallback)? | Mengatur kustomisasi dari `fieldViewBuilder`. Jika [fieldViewBuilder] != null maka [textFieldStyle] akan diabaikan. Perlu diperhatikan jika melakukan kustomisasi, harap parameter ini disesuaikan ke dalam kustom dari tampilan anda. |
| maxHeightOption             | double?                                                    | Mengatur tinggi maksimal dari tampilan pilihan                                                               |
| maxWidthOption              | double?                                                    | Mengatur lebar maksimal dari tampilan pilihan (dikurangi 40) karena margin horizontal 20. Default MediaQuery.of(context).size.width                                          |
| optionHighlightTextStyle    | MagicTextStyle?                                            | Mengatur gaya teks dari highlight default `optionsViewBuilder`. Jika [optionHighlightTextStyle] berisi null maka gaya teks akan disesuaikan secara default                        |
| optionTextStyle             | MagicTextStyle?                                            | Mengatur gaya teks dari default `optionsViewBuilder`. Jika [optionTextStyle] berisi null maka gaya teks akan disesuaikan secara default                                      |
| optionsBuilder              | FutureOr<Iterable<AutoCompleteData<T>>> Function(TextEditingValue)? | Kustomisasi Options Builder. Secara default jika teks di `fieldViewBuilder` kosong maka akan menampilkan seluruh [list]. Jika ada isinya maka [list] akan difilter berdasarkan [AutoCompleteData.option] yang mengandung teks di `fieldViewBuilder` |
| optionsViewBuilder          | Widget Function(BuildContext, Function(AutoCompleteData<T>), Iterable<AutoCompleteData<T>>)? | Mengatur kustomisasi tampilan pilihan. Jika [optionsViewBuilder] != null maka [maxWidthOption] dan [maxHeightOption] diabaikan                                     |
| textFieldStyle              | MagicTextFieldStyle?                                       | Mengatur gaya dari `fieldViewBuilder`. [MagicTextFieldStyle] berisi seluruh gaya yang dapat diterapkan pada [MagicTextField]                                                |

## MagicDialog

Sebuah widget untuk menampilkan dialog.

Secara mudah anda dapat menampilkan dialog yang sesuai dengan keinginan anda dengan menggunakan [MagicDialog].

```dart
showMagicDialog(
  context,
  child: YOUR_WIDGET 
);
```

| Nama               | Tipe         | Keterangan                                                                                                 |
|--------------------|--------------|------------------------------------------------------------------------------------------------------------|
| context            | BuildContext | [REQUIRED]                                                            |
| child              | Widget       | [REQUIRED] Widget konten atau isi dari dialog                                                              |
| barrierDismissable | bool         | Digunakan untuk menutup dialog jika menekan di bagian area luar dialog. Secara default bernilai true    |
| background         | Color?       | Warna background dari dialog                                                                              |
| maxHeight          | double?      | Mengatur maksimal tinggi dari dialog. Secara default bernilai sesuai dengan tinggi perangkat - 100      |
| cornerRadius       | double?      | Mengatur radius sudut dialog                                                                             |
| elevation          | double?      | Mengatur elevation                                                                                       |
| padding            | double?      | Mengatur padding                                                                                         |

Selain fungsi ```showMagicDialog``` anda dapat menggunakan fungsi ```showMagicAlertDialog``` yang akan menampilkan dialog informatif yang berisi ikon, judul, kontan, tombol utama dan tombol sekunder.

```dart
showMagicAlertDialog(
  context,
  title: "YOUR TITLE",
  content: "YOUR KONTEN.",
  iconType: EnumDialogIconType.failed,
  barrierDismissable: true,
  textPrimary: "Ulangi",
  onPrimary: (){
      
  },
  background: Colors.black,
);
```

| Nama                  | Tipe                     | Keterangan                                                                                                                  |
|-----------------------|--------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| content               | String?                  | [REQUIRED] Teks untuk isi dialog                                                                                           |
| contentStyle          | MagicTextStyle?          | Style Teks untuk konten                                                                                                    |
| iconType              | EnumDialogIconType?      | Mode icon. Diambil dari EnumDialogIconType yang berisi none, success, failed, warning, custom. Secara default bernilai EnumDialogIconType.none |
| icon                  | Widget?                  | Jika iconType bernilai EnumDialogIconType.custom, anda dapat mengisi icon disini                                           |
| title                 | String?                  | Teks untuk judul                                                                                                           |
| titleStyle            | MagicTextStyle?          | Style teks untuk judul                                                                                                     |
| barrierDismissable    | bool                     | Digunakan untuk menutup dialog jika menekan di bagian area luar dialog. Secara default bernilai true                       |
| textPrimary           | String?                  | Teks untuk tombol primary                                                                                                  |
| onPrimary             | Function()?              | Aksi untuk tombol primary                                                                                                  |
| colorPrimary          | Color?                   | Warna untuk tombol primary                                                                                                 |
| textColorPrimary      | Color?                   | Warna teks untuk tombol primary                                                                                            |
| textSizePrimary       | double?                  | Ukuran teks untuk tombol primary                                                                                            |
| textSecondary         | String?                  | Teks untuk tombol sekunder                                                                                                 |
| onSecondary           | Function()?              | Aksi untuk tombol sekunder                                                                                                 |
| colorSecondary        | Color?                   | Warna tombol sekunder                                                                                                      |
| textColorSecondary    | Color?                   | Warna teks untuk tombol sekunder                                                                                           |
| textSizeSecondary     | double?                  | Ukuran teks untuk tombol sekunder                                                                                           |
| background            | Color?                   | Warna background dialog                                                                                                     |
| borderColor           | Color?                   | Warna batas dialog                                                                                                         |
| borderWidth           | double                   | Ketebalan batas dialog. Secara default bernilai 2                                                                           |

## MagicLayout

Mengatur Widget Reponsive Layout

```dart
MagicLayout(
      largeScreen: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 5.0),
        itemBuilder: (context, index) {
          return widgets[index];
        },
        shrinkWrap: true,
        itemCount: widgets.length,
      ),
      mediumScreen: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 5.0),
        itemBuilder: (context, index) {
          return widgets[index];
        },
        shrinkWrap: true,
        itemCount: widgets.length,
      ),
      smallScreen: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 5.0),
        itemBuilder: (context, index) {
          return widgets[index];
        },
        shrinkWrap: true,
        itemCount: widgets.length,
      ),
    );
```









