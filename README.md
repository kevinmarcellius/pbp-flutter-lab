# Tugas 7 PBP
Kevin Marcellius Alrino <br>
PBP C<br>
2106706193

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya. <br>
State adalah informasi yang bisa dibaca secara synchronous saat widget dibuat dan bisa saja berubah.
Stateless widget adakah widget yang statenya tidak dapat diubah setelah dibuat. Stateless widget meng override build() method returns widget. Contohnya adalah Text, RaisedButton, IconButtons. Stateful widget adalah widget yang statenya bisa diubah setelah dibuat. Stateful widget meng override createState() dan return State. Contohnya CheckBox, RadioButton, Form, TextField.
2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya. <br>
    - Scaffold :
    widget dalam flutter yang digunakan untuk mengimplementasikan struktur visual layout dasar sebagai tempat untuk menempatkan widget.
    - Appbar : sebagai header, tempat meletakkan teks "Program Counter"
    - Center : berfungsi untuk meratakan child widget ke tengah
    - Row & Column : berfungsi untuk mengatur cara meletakkan widget-widget, misalnya untuk mengatur children widget secara vertikal bisa menggunakan column
    - Text : berfungsi untuk menampilkan text
    - Visibility : berfungsi untuk mengatur visibilitas suatu widget, misal suatu kondisi harus terpenuhi jika ingin menampilkan widget. Pada tugas ini, saya menggunakan visibility untuk mengatur button "-" agar tidak muncul di layar jika _counter == 0.
    - Floating Action Button : icon button berbentuk lingkaran yang melayang di atas sebuah content yang biasanya untuk melakukan primary action dari sebuah aplikasi.
    - Padding : berfungsi untuk memberikan jarak antar widget.
3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut. <br>
setState memberi tahu framework bahwa state dari suatu object telah berubah, sehingga framework akan melakukan build ulang object dari state ini.
4. Jelaskan perbedaan antara const dengan final. <br>
Keyword "final" digunakan untuk menyatakan variabel yang tidak dapat diubah lagi setelah dibuat. Pada dart, final yang digunakan pada object menyebabkan objectnya masih bisa diubah. Pada dart, keyword "const" bertindak sama seperti keyword "final". Bedanya const membuat variabel constant dari compile-time saja. Menggunakan const pada suatu object akan membuat state suat object akan strictly fixed saat compile-time.
5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas <br>
    1. buat aplikasi flutter baru dengan command `flutter create counter_7`
    2. pada file `lib\main.dart`, ubah title.
    ```shell
    ...
    home: const MyHomePage(title: 'Program Counter'),
    ...
    ```
    3. pada file `lib\main.dart`, buat suatu method untuk decrement _counter
    ```shell
      void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
      }
    });
    }
    ```
    4. karena kita akan membuat 2 floating button,tambahkan widget padding  untuk mengatur jaraknya. Lalu, tambahkan widget visibility untuk mengatur visibility dari button decrement.
    ```shell
    ...
     floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // add visibility so that decrement button only visible if counter > 0
            Visibility(
              visible: _counter > 0,
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                _incrementCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
      ...
    ```

    5. Tambahkan text "GENAP" dan "GANJIL" serta condition yg diperlukan untuk memunculkan text tersebut
    ```shell 
              children: <Widget>[
            _counter % 2 == 0
                ? const Text(
                    // if counter % 2 == 0, display "GANJIL" with text color red.
                    // else, display "GENAP" with text color blue.
                    "GENAP",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                : const Text(
                    "GANJIL",
                    style: TextStyle(color: Colors.blue),
                  ),
    ```


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
