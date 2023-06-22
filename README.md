# MagicView

Mudah digunakan, mudah dikustomisasi.

Sekumpulan widget yang sudah dikustomisasi untuk dapat lebih memudahkan dalam menggunakannya.

## Daftar Widget

- [MagicText](#magictext) - Widget Text
- [MagicTextIcon](#magictexticon) - Widget Text dengan Gambar
- [MagicButton](#magicbutton) - Widget Tombol
- [MagicTextField](#magictextfield) - Widget TextField

## MagicText

Sebuah Kustomisasi Widget Text.

```sh
MagicText(
  "Magic Text Created By Hanif Abdullah",
)
```

Secara default gaya (style) MagicView diatur dari variabel [MagicFactory.magicTextStyle] dengan
properti berikut

```sh
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

```sh
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

```sh
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

```sh
MagicText("teks");
```

2. Head (default ukuran font = 18 dan ketebalan font = FontWeight.bold)

```sh
MagicText.head('teks');
```

3. Subhead (default ukuran font = 16 dan ketebalan font = FontWeight.w600)

```sh
MagicText.subhead('teks');
```

4. Hint (default ukuran font = 12 dan ketebalan font = FontWeight.w400)

```sh
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

```sh
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

```sh
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

```sh
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

```sh
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

```sh
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

```sh
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

```sh
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

```sh
MagicTextField.border(
  controller,
  hint: "Masukkan nama",
)
```

4. `borderPassword` : Pada tipe ini menampilkan [MagicTextField] yang merupakan kombinasi antara
   tipe `border` dan tipe `password`
```sh
MagicTextField.borderPassword(
  controller,
  hint: "Masukkan nama",
)
```

| Nama                     | Tipe                         | Keterangan                                                                                                                                               |
|--------------------------|------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| type                     | MagicTextFieldType?          | Tipe yang tersedia pada Widget MagicTextField                                                                                                            |
| controller               | TextEditingController        | Controller                                                                                                                                               |
| keyboardType             | TextInputType?               | Mengatur tampilan keyboard                                                                                                                               |
| textInputAction          | TextInputAction?             | Mengatur bentuk aksi 'enter' di keyboard                                                                                                                 |
| textStyle                | MagicTextStyle?              | Mengatur gaya teks                                                                                                                                       |
| readOnly                 | bool                         | Mengatur MagicTextField dapat diedit atau tidak. Secara default bernilai `false`                                                                         |
| enabled                  | bool?                        | Mengatur MagicTextField dapat diedit atau tidak. Berbeda dengan readOnly, ketika enabled bernilai `true`, MagicTextField akan memasuki mode disabled     |
| obscureText              | bool                         | Mengatur tampilan teks, akan disembunyikan dan diganti `*` atau tidak. Secara default bernilai `false`                                                   |
| cursorColor              | Color?                       | Mengatur warna cursor                                                                                                                                    |
| onEditingComplete        | Function()?                  | Menangani aksi ketika sudah selesai mengedit                                                                                                             |
| onFieldSubmitted         | Function(String)?            | Menangani aksi ketika sudah selesai mengetik dan menekan `enter`                                                                                         |
| onChange                 | Function(String)?            | Menangani aksi setiap ada perubahan pengetikan                                                                                                           |
| validator                | String? Function(String?)?   | Menangani aksi validasi                                                                                                                                  |
| autoValidateMode         | AutovalidateMode?            | Menangani aksi validasi akan dilakukan kapan                                                                                                             |
| onTap                    | Function()?                  | Menangani aksi ketika MagicTextField di-Tap                                                                                                              |
| focusNode                | FocusNode?                   |                                                                                                                                                          |
| textCapitalization       | TextCapitalization           | Memberikan hint                                                                                                                                          |
| hint                     | String?                      | Mengatur gaya dari hint                                                                                                                                  |
| hintStyle                | MagicTextStyle?              | Memberikan label. Jika hint dan label diisi, maka hint akan diabaikan dan label yang akan ditampilkan                                                    |
| label                    | String?                      | Mengatur gaya dari label                                                                                                                                 |
| labelStyle               | MagicTextStyle?              | Mengatur Widget kustom untuk label. Jika labelCustom diisi maka label, labelStyle, dan floatingLabelStyle akan diabaikan                                 |
| labelCustom              | Widget?                      | Mengatur perataan dari label yang mengambang                                                                                                             |
| floatingLabelAlignment   | FloatingLabelAlignment?      | Mengatur kemunculan label mengambang                                                                                                                     |
| floatingLabelBehavior    | FloatingLabelBehavior?       | Mengatur gaya dari label mengambang                                                                                                                      |
| floatingLabelStyle       | MagicTextStyle?              | Mengatur ikon                                                                                                                                            |
| icon                     | Widget?                      | Mengatur warna dari ikon                                                                                                                                 |
| iconColor                | Color?                       | Mengatur ikon pada awalan MagicTextField                                                                                                                 |
| prefixIcon               | Widget?                      | Mengatur warna prefixIcon                                                                                                                                |
| prefixIconColor          | Color?                       | Mengatur teks pada awalan MagicTextField. Terletak antara prefixIcon dan tempat untuk mengetik.                                                          |
| prefixText               | String?                      | Mengatur gaya dari prefix                                                                                                                                |
| prefixTextStyle          | MagicTextStyle?              | Mengatur Widget pada awalan MagicTextField. Terletak antara prefixIcon dan tempat untuk mengetik.                                                        |
| prefix                   | Widget?                      | Mengatur ikon pada akhiran MagicTextField. Jika type = MagicTextFieldType.PASSWORD atau MagicTextFieldType.BORDER_PASSWORD, suffixIcon akan diabaikan    |
| suffixIcon               | Widget?                      | Mengatur suffixIcon jika type = MagicTextFieldType.PASSWORD atau MagicTextFieldType.BORDER_PASSWORD dan obscureText = false                              |
| suffixIconEyeOpen        | Widget?                      | Mengatur suffixIcon jika type = MagicTextFieldType.PASSWORD atau MagicTextFieldType.BORDER_PASSWORD dan obscureText = true                               |
| suffixIconEyeClose       | Widget?                      | Mengatur warna dari suffixIcon                                                                                                                           |
| suffixIconColor          | Color?                       | Mengatur teks pada akhiran MagicTextField. Terletak antara suffixIcon dan tempat untuk mengetik.                                                         |
| suffixText               | String?                      | Mengatur gaya dari suffixText                                                                                                                            |
| suffixTextStyle          | MagicTextStyle?              | Mengatur Widget pada awalan MagicTextField. Terletak antara suffixIcon dan tempat untuk mengetik.                                                        |
| suffix                   | Widget?                      | Mengatur garis batas / border pada MagicTextField                                                                                                        |
| counterText              | String?                      | Mengatur teks counter. Terletak pada kanan bawah MagicTextField                                                                                          |
| counterStyle             | MagicTextStyle?              | Mengatur gaya teks counterText                                                                                                                           |
| helperText               | String?                      | mengatur teks helper. Terletak pada kiri bawah MagicTextField                                                                                            |
| helperStyle              | MagicTextStyle?              | Mengatur gaya teks helperText                                                                                                                            |
| errorText                | String?                      | Mengatur teks error. Terletak pada kiri bawah MagicTextField. Jika helperText tidak bernilai null akan terganti dengan errorText                         |
| errorStyle               | MagicTextStyle?              | Mengatur gaya teks errorText                                                                                                                             |
| fillColor                | Color?                       | Mengatur warna dari MagicTextField. Akan diabaikan jika filled bernilai null atau false                                                                  |
| filled                   | bool?                        | Mengatur MagicTextField berwarna atau tidak                                                                                                              |
| padding                  | EdgeInsetsGeometry?          | Mengatur padding                                                                                                                                         |
| constraints              | BoxConstraints?              | Mengatur ukuran dari MagicTextField                                                                                                                      |







