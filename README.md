# MagicView

Mudah digunakan, mudah dikustomisasi.

Sekumpulan widget yang sudah dikustomisasi untuk dapat lebih memudahkan dalam menggunakannya.

## Daftar Widget

- [MagicText](#magictext) - Widget Text
- [MagicTextIcon](#magictexticon) - Widget Text dengan Gambar

## MagicText

Sebuah Kustomisasi Widget Text. 

```sh
MagicText(
  "Magic Text Created By Hanif Abdullah",
)
```

Secara default gaya (style) MagicView diatur dari variabel [MagicFactory.magicTextStyle] dengan properti berikut
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

2. Mengisi property selain style, maka Widget akan diatur sesuai property yang diisi saja. Property yang kosong akan menyesuaikan dari default MagicTextStyle [MagicFactory.magicTextStyle]
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

Properti MagicTextStyle yang dapat digunakan

| Nama           | Tipe            | Keterangan                              |
|----------------|-----------------|-----------------------------------------|
| `maxLines`     | `int?`          | Mengatur maksimal baris dalam Widget    |
| `textAlign`    | `TextAlign?`    | Mengatur perataan teks                  |
| `textOverflow` | `TextOverflow?` | Mengatur                                |
| `fontFamily`   | `FontFamily?`   | Mengatur jenis dari font                |
| `fontWeight`   | `FontWeight?`   | Mengatur ketebalan dari font            |
| `fontSize`     | `int?`          | Mengatur ukuran dari font               |
| `fontStyle`    | `FontStyle?`    | Mengatur gaya dari font (normal/miring) |
| `color`        | `Color?`        | Mengatur warna dari font                |

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

| Nama                  | Tipe                   | Tersedia di           | Keterangan                               |
|-----------------------|------------------------|-----------------------|------------------------------------------|
| `asset`               | `String`               | `asset`               | Memuat gambar dari aset lokal            |
| `url`                 | `String`               | `network`             | Memuat gambar dari internet              |
| `icon`                | `IconData`             | `icon`                | Memuat gambar dari icon                  |
| `spaces`              | `double`               | semua                 | Mengatur jarak antara teks dengan gambar |
| `size`                | `double`               | `icon`                | Mengatur ukuran dari gambar              |
| `width`               | `double`               | `asset` dan `network` | Mengatur lebar gambar                    |
| `height`              | `double`               | `asset` dan `network` | Mengatur tinggi gambar                   |
| `textStyle`           | `MagicTextStyle`       | semua                 | Mengatur gaya teks                       |
| `horizontalAlignment` | `MainAxisAlignment?`   | semua                 | Mengatur perataan horisontal             |
| `verticalAlignment`   | `CrossAxisAlignment?`  | semua                 | Mengatur perataan vertikal               |