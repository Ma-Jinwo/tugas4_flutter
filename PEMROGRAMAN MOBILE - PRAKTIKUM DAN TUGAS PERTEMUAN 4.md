

## PRAKTIKUM PERTEMUAN 4
## LAYOUT, ACTIVITY AND STATEFUL MANAGEMENT

## Struktur Folder Flutter
Adapun struktur folder Projek flutter adalah sebagai berikut:


`. android berisi source code untuk aplikasi android;
`. ios berisi source code untuk aplikasi iOS;
.` lib berisi source code Dart, di sini kita akan menulis kode aplikasi;
`. test berisi source code Dart untuk testing aplikasi;
|) ‘ .gitignore adalah file Git;
)|‘ .metadata merupakan file yang berisi metadata project yang di-generate otomatis;
)|‘ .packages merupakan file yang berisi alamat path package yang dibuat oleh pub;
)|‘ flutter_app.iml merupakan file XML yang berisi keterangan project;
)|‘ pubspec.lock merupakan file yang berisi versi-versi library atau package. File ini
dibuat oleh pub. Fungsinya untuk mengunci versi package.
)|‘ pubspec.yaml merupakan file yang berisi informasi tentang project dan libraray
yang dibutuhkan;
|) ‘ README.md merupakan file markdown yang berisi penjelasan tentang source code.

## Membuat Hello World
Buka projek aplikasi_flutter_pertamaku menggunakan VSCode agar lebih ringan.
Buka file main.dart yang terletak pada folder lib kemudian ubah menjadi




## 6.
- class MyApp extends StatelessWidget {
- const MyApp({Key? key}) : super(key: key);
## 9.
## 10. @override
- Widget build(BuildContext context) {
- return MaterialApp(
- title: "Aplikasi Flutter Pertama",
- home: Scaffold(
- appBar: AppBar(
- title: const Text('Belajar Flutter'),
## 17.

## ),
## 18.

## ),

## 19. );

## 20. }
## 21. }

Ketika dijalankan akan menghasilkan

Kemudian untuk menambahkan tampilan dibagian dalam (body), pada fungsi Scaffold terdapat
parameter body. Silahkan modifikasi main.dart menjadi seperti berikut :
- import 'package:flutter/material.dart';
- void main() {

## 5. }
- runApp(const MyApp());
## 2.





- home: Scaffold(
- appBar: AppBar(
- title: Text('Belajar Flutter'),
## 17.

## ),
- body: const Center(
- child: Text("Hello World"),
## 20.

## ),
## 21.

## ),

## 22. );

## 23. }
## 24. }

Sehingga akan menghasilkan
- import 'package:flutter/material.dart';

- void main() {
## 5. }

- class MyApp extends StatelessWidget {
## 9.
- Widget build(BuildContext context) {
- title: "Aplikasi Flutter Pertama",
return MaterialApp( 12.
## 10. @override
- const MyApp({Key? key}) : super(key: key);
## 6.
- runApp(const MyApp());
## 2.

Pada aplikasi di atas, kita membuat StatelessWidget yang berisi widget
MaterialApp(). Kemudian di dalam MateralApp() berisi widget lagi: Scaffold, AppBar,
Center, dan Text. Ini adalah widget dasar.
## Penjelasan:
- MyApp adalah StatelessWidget, merupakan widget induk;
- MaterialApp   adalah   widget   yang   membungkus   beberapa   widget   yang
menggunakan tema material design
- Scaffold adalah widget untuk struktur dasar material design;
- AppBar adalah widget untuk membuat AppBar;
- Center adalah Widget layout untuk membuat widget ke tengah;
- Text adalah widget untuk membuat teks.
Untuk mempermudah dalam pembacaan kode dan maintenance dapat
dilakukan  dengan  memisahkan  MyApp  dengan  halaman  yang  ingin  ditampilkan.
Silahkan buat sebuah file dengan nama hello_world.dart di dalam folder lib


Kemudian  bagian  Scaffold  pada  main.dart  yang  telah  dibuat  tadi  akan  kita
masukkan ke dalam hello_world.dart, sehingga pada hello_world.dart akan menjadi

- import 'package:flutter/material.dart';
## 2.
- class HelloWorld extends StatelessWidget {
## 4. @override
- Widget build(BuildContext context) {
## 6.

return Scaffold(
## 7.

appBar: AppBar(
## 8.

title: const Text('Belajar Flutter'),
## 9.

## ),
## 10.

body: const Center(
## 11.

child: Text('Hello World'),
## 12.

## ),
## 13.

## );
## 14. }

## 15. }

Pada file main.dart kita modifikasi kembali pada bagian home menjadi

- import 'package:aplikasi_flutter_pertamaku/hello_world.dart';
- import 'package:flutter/material.dart';
## 3.
- void main() {
- runApp(const MyApp());
## 6. }
## 7.
- class MyApp extends StatelessWidget {
- const MyApp({Key? key}) : super(key: key);
## 10.
## 11. @override
- Widget build(BuildContext context) {
- Return const MaterialApp(
- title: "Aplikasi Flutter Pertama",
- home: HelloWorld(),
## 16. );
## 17. }
## 18. }

Pada  bagian  home,  kita  memanggil  class  HelloWorld  yang  telah  kita  buat
sebelumnya pada file hello_world.dart

Jika kita perhatikan pada bagian body, terdapat Widget Center  kemudian didalam
Widget  Center  tersebut  terdapat  parameter  child  untuk  meletakkan  Widget  lain
didalam widget tersebut, dalam hal ini adalah Widget Text
## Center(
child: Text('Hello World'),
## ),

Catatan : dalam  Widget selain child, terdapat pula children dengan type data
array yang  dimana kita dapat menempatkan beberapa Widget didalamnya
contohnya pada Widget Column dan Row

- class MyApp extends StatelessWidget {
## 6. }
- void main() {
- import 'package:flutter/material.dart';
Untuk mempercepat dalam pembuatan class pada VSCode dapat dilakukan dengan
mengetik st kemudian memilih stateless widget ataupun stateless widget kemudian
ketikkan nama class yang diinginkan


## Membuat Widget Column
Buat sebuah file dengan nama column_widget.dart didalam folder lib, kemudian
ketikkan kode berikut

Kemudian pada file main.dart ubah kodenya menjadi

- import 'package:aplikasi_flutter_pertamaku/column_widget.dart';
## 3.

- runApp(const MyApp());
## 7.
- const MyApp({Key? key}) : super(key: key);
- import 'package:flutter/material.dart';

- class ColumnWidget extends StatelessWidget {
## 5.
- Widget build(BuildContext context) {
- appBar: AppBar(
## 11. ),
- children: const [
- Text('Kolom 3'),
- Text('Kolom 4')
## 19. ));
## 21. }
## 20. }
## ], 18.
Text('Kolom 2'), 16.
Text('Kolom 1'), 14.
body: Column( 12.
title: const Text('Widget Column'), 10.
return Scaffold( 8.
## 6. @override
- const ColumnWidget({Key? key}) : super(key: key);
## 2.


## 10.
## 11. @override
- Widget build(BuildContext context) {
- return const MaterialApp(
- title: "Aplikasi Flutter Pertama",
- home: ColumnWidget(),
## 16. );
## 17. }
## 18. }

Dan hasilnya akan menjadi seperti berikut

Column biasanya digunakan untuk membuat Form

## Membuat Widget Row
Untuk menampilkan Widget dalam posisi horizontal dapat menggunakan Widget Row.
Buat sebuah file didalam folder lib dengan nama row_widget.dart, kemudian ketikkan
kode berikut
- import 'package:flutter/material.dart';
## 2.
- class RowWidget extends StatelessWidget {
- const RowWidget({Key? key}) : super(key: key);
## 5.
## 6. @override
- Widget build(BuildContext context) {
- return Scaffold(
- appBar: AppBar(
- title: const Text('Widget Row'),
## 11. ),
- body: Row(
- children: const [
- Text('Row 1'),
- Text('Row 2'),
- Text('Row 3'),
- Text('Row 4')
## 18. ],
## 19. ),
## 20. );
## 21. }
## 22. }

Kemudian seperti sebelumnya masukkan class RowWidget tersebut kedalam home
pada main.dart, dan hasilnya akan menjadi



StatelessWidget dan StatefullWidget
StatelessWidget  adalah  class  widget  yang  propertinya immutable,  artinya  nilainya
tidak bisa diubah, sedangkan StatefullWidget nilainya dapat berubah-ubah.

Contoh StatelessWidget :
- class HelloWorld extends StatelessWidget {
- const HelloWorld({ Key? key }) : super(key: key);
## 3.
## 4. @override
- Widget build(BuildContext context) {
- return Container(
## 7.
## 8. );

## 14. }
## 12.
- Widget build(BuildContext context) {
- class _HelloWorldState extends State<HelloWorld> {
## 6. }
## 4. @override
- const HelloWorld({ Key? key }) : super(key: key);

Contoh StatefullWidget

- class HelloWorld extends StatefulWidget {
## 3.

- _HelloWorldState createState() => _HelloWorldState();
## 7.

## 9. @override
- return Container(
## 13. );

## 15. }


## Membuat Form
Selanjutnya kita akan belajar membuat form pada flutter, agar lebih rapi untuk tampilan
halaman akan kita kelompokkan dalam sebuah folder tersendiri, dalam hal ini kita
membuat folder dengan nama ui didalam folder lib.

Kemudian didalam folder ui tersebut kita buat sebuah file dengan nama produk_form.dart
## 9. }
## 10. }



Kemudian Ketikkan kode berikut

- import 'package:flutter/material.dart';
- class ProdukForm extends StatefulWidget {
## 5.
- _ProdukFormState createState() => _ProdukFormState();
## 9.
## 11. @override
- return Scaffold(
- title: const Text('Form Produk'),
- body: SingleChildScrollView(
- children: [
- TextField(decoration: const InputDecoration(labelText: "Nama Produk")),
- ElevatedButton(onPressed: () {}, child: const Text('Simpan'))
## 25. ),
## 27. );
## 29. }
## 28. }
## ), 26.
## ], 24.
TextField(decoration: const InputDecoration(labelText: "Harga")), 22.
TextField(decoration: const InputDecoration(labelText: "Kode Produk")), 20.
child: Column( 18.
## ), 16.
appBar: AppBar( 14.
- Widget build(BuildContext context) {
- class _ProdukFormState extends State<ProdukForm> {
## 8. }
## 6. @override
- const ProdukForm({Key? key}) : super(key: key);
## 2.



Ubah pada main.dart dengan memanggil class ProdukForm, sehingga hasilnya
akan menjadi


Pemisahan Widget Kedalam fungsi-fungsi
Agar kode mudah dibaca dan dikembangkan, akan lebih baik jika widget-widget yang
digunakan     dipisahkan     kedalam     method/function     tertentu,     misalnya     pada
produk_form.dart terdapat widget seperti TextField dan Button, pada widget tersebut
akan kita pisahkan kedalam method tersendiri didalam class, sehingga menjadi seperti
berikut



## 8. }
## 9.
- class _ProdukFormState extends State<ProdukForm> {
## 11. @override
- Widget build(BuildContext context) {
- return Scaffold(
- appBar: AppBar(
- title: const Text('Form Produk'),
## 16.

## ),

- body: SingleChildScrollView(
- child: Column(
- children: [
- _textboxKodeProduk(),
- _textboxNamaProduk(),
- _textboxHargaProduk(),
- _tombolSimpan()
## 24.

## ],
## 25.

## ),

## 26.

## ),

## 27. );

## 28. }
## 29.
- _textboxKodeProduk() {
- return TextField(decoration: const InputDecoration(labelText: "Kode Produk"));
## 32. }
## 33.
- _textboxNamaProduk() {
- return TextField(decoration: const InputDecoration(labelText: "Nama Produk"));
## 36. }
## 37.
- _textboxHargaProduk() {
- return TextField(decoration: const InputDecoration(labelText: "Harga"));
## 40. }
## 41.
- _tombolSimpan() {
- return ElevatedButton(onPressed: () {}, child: const Text('Simpan'));
## 44. }
## 45. }

## Membuat Detail Produk
Buat sebuah file dengan nama produk_detail.dart di dalam folder ui, kemudian
ketikkan kode berikut
- import 'package:flutter/material.dart';
## 2.
- class ProdukDetail extends StatefulWidget {
- final String? kodeProduk;
- final String? namaProduk;
- final int? harga;
## 7.
- import 'package:flutter/material.dart';

- class ProdukForm extends StatefulWidget {
## 5.
- _ProdukFormState createState() => _ProdukFormState();
## 6. @override
- const ProdukForm({Key? key}) : super(key: key);
## 2.

- const ProdukDetail({Key? key, this.kodeProduk, this.namaProduk, this.harga})
- : super(key: key);
## 10.
## 11. @override
- _ProdukDetailState createState() => _ProdukDetailState();
## 13. }
## 14.
- class _ProdukDetailState extends State<ProdukDetail> {
## 16. @override
- Widget build(BuildContext context) {
- return Scaffold(


Membuat fungsi tombol simpan dan menampilkan data pada Detail Produk
Buka kembali file produk_form.dart tambahkan attribute
final _kodeProdukTextboxController     =     TextEditingController(); final
_namaProdukTextboxController = TextEditingController(); final
_hargaProdukTextboxController = TextEditingController();

pada Class ProdukFormState sehingga menjadi

- import 'package:aplikasi_flutter_pertamaku/ui/produk_detail.dart';
- import 'package:flutter/material.dart';
## 3.
- class ProdukForm extends StatefulWidget {
- const ProdukForm({Key? key}) : super(key: key);
## 6.
## 7. @override
- _ProdukFormState createState() => _ProdukFormState();
## 9. }
## 10.
- class _ProdukFormState extends State<ProdukForm> {
- final _kodeProdukTextboxController = TextEditingController();
- final _namaProdukTextboxController = TextEditingController();
- final _hargaProdukTextboxController = TextEditingController();
## 15.
## 16. @override
- Widget build(BuildContext context) {
- return Scaffold(
- appBar: AppBar(
- title: const Text('Form Produk'),
## 21. ),
- body: SingleChildScrollView(
- child: Column(
- children: [
- appBar: AppBar(
## 21. ),
- children: [
- Text("Nama Produk : ${widget.namaProduk}"),
## 27. ],
## 29. );
## 31. }
## 30. }
## ), 28.
Text("Harga : ${widget.harga}") 26.
Text("Kode Produk : " + widget.kodeProduk.toString()), 24.
body: Column( 22.
title: const Text('Detail Produk'), 20.

- _textboxKodeProduk(),
- _textboxNamaProduk(),
- _textboxHargaProduk(),
- _tombolSimpan()
## 29. ],
## 30. ),
## 31. ),
## 32. );
## 33. }
## 34.
- _textboxKodeProduk() {
- return TextField(
- decoration: const InputDecoration(labelText: "Kode Produk"));
## 38. }
## 39.
- _textboxNamaProduk() {
- return TextField(
- decoration: const InputDecoration(labelText: "Nama Produk"));
## 43. }
## 44.
- _textboxHargaProduk() {
- return TextField(decoration: const InputDecoration(labelText: "Harga"));
## 47. }
## 48.
- _tombolSimpan() {
- return ElevatedButton(onPressed: () {}, child: const Text('Simpan'));
## 51. }
## 52. }

Pada setiap masing-masing TextField yang telah dibuat, data yang diinput dikirim ke attribute
TextEditingController() yang telah kita buat sebelumnya
Pada fungsi _textboxKodeProduk() menjadi
_textboxKodeProduk() {
return TextField(
decoration: const InputDecoration(labelText: "Kode Produk"), controller:
_kodeProdukTextboxController,
## );
## }

Pada fungsi _textboxNamaProduk() menjadi
_textboxNamaProduk() {
return TextField(
decoration: const InputDecoration(labelText: "Kode Produk"), controller:
_namaProdukTextboxController,
## );
## }

Pada fungsi _textboxhargaProduk() menjadi
_textboxHargaProduk() {
return TextField(
decoration: const InputDecoration(labelText: "Kode Produk"), controller:
_hargaProdukTextboxController,
## );
## }


Kemudian pada fungsi _tombolSimpan() pada saat diklik akan mengirim data
inputan dan menampilkan data tersebut pada ProdukDetail yang telah kita buat
sebelumnya
_tombolSimpan() {
return ElevatedButton(
onPressed: () {
String kodeProduk = _kodeProdukTextboxController.text;   String
namaProduk = _namaProdukTextboxController.text; int harga  =
int.parse(
_hargaProdukTextboxController.text); //parsing dari String ke int
// pindah ke halaman Produk Detail dan mengirim data
Navigator.of(context).push(MaterialPageRoute(
builder: (context) => ProdukDetail(
kodeProduk: kodeProduk,
namaProduk: namaProduk, harga:
harga,
## )));
## },
child: const Text('Simpan'));
## }
Sehingga keseluruhan kode menjadi

- import 'package:aplikasi_flutter_pertamaku/ui/produk_detail.dart';
- import 'package:flutter/material.dart';
## 3.
- class ProdukForm extends StatefulWidget {
- const ProdukForm({Key? key}) : super(key: key); 6.
## 7. @override
- _ProdukFormState createState() => _ProdukFormState();
## 9. }
## 10.
- class _ProdukFormState extends State<ProdukForm> {
- final _kodeProdukTextboxController = TextEditingController();
- final _namaProdukTextboxController = TextEditingController();
- final _hargaProdukTextboxController = TextEditingController(); 15.
## 16. @override
- Widget build(BuildContext context) {
- return Scaffold(
- appBar: AppBar(
- title: const Text('Form Produk'),
## 21. ),
- body: SingleChildScrollView(
- child: Column(
- children: [
- _textboxKodeProduk(),
- _textboxNamaProduk(),
- _textboxHargaProduk(),
- _tombolSimpan()
## 29. ],
## 30. ),
## 31. ),
## 32. );
## 33. }
## 34.
- _textboxKodeProduk() {
- return TextField(
- decoration: const InputDecoration(labelText: "Kode Produk"),

- controller: _kodeProdukTextboxController,
## 39. );
## 40. }
## 41.
- _textboxNamaProduk() {
- return TextField(
- decoration: const InputDecoration(labelText: "Nama Produk"),
- controller: _namaProdukTextboxController,
## 46. );
## 47. }
## 48.
- _textboxHargaProduk() {
- return TextField(
- decoration: const InputDecoration(labelText: "Harga"),
- controller: _hargaProdukTextboxController,
## 53. );
## 54. }
## 55.


- _tombolSimpan() {
- return ElevatedButton(
- onPressed: () {
- String kodeProduk = _kodeProdukTextboxController.text;
- String namaProduk = _namaProdukTextboxController.text;
- int harga = int.parse(
- _hargaProdukTextboxController.text); //parsing dari String ke int
- // pindah ke halaman Produk Detail dan mengirim data
- Navigator.of(context).push(MaterialPageRoute(
- builder: (context) => ProdukDetail(
- kodeProduk: kodeProduk,
- namaProduk: namaProduk,
- harga: harga,
## 69. )));
## 70. },
- child: const Text('Simpan'));
## 72. }
## 73. }


Membuat ListView Produk
Buat sebuah file dengan nama produk_page.dart di dalam folder ui, kemudian
ketikkan kode berikut



## 6. @override
- _ProdukPageState createState() => _ProdukPageState();
## 8. }
## 9.
- class _ProdukPageState extends State<ProdukPage> {
## 11. @override
- Widget build(BuildContext context) {
- return Scaffold(
- appBar: AppBar(
- title: const Text('Data Produk'),
## 16. ),
- body: ListView(
- children: const [
## 19. // List 1
## 20. Card(
- child: ListTile(
- title: Text('Kulkas'),
- subtitle: Text('2500000'),
## 24. ),
## 25. ),
## 26. // List 2
## 27. Card(
- child: ListTile(
- title: Text('TV'),
- subtitle: Text('5000000'),
## 31. ),
## 32. ),
## 33. // List 3
## 34. Card(
- child: ListTile(
- title: Text('Mesin Cuci'),
- subtitle: Text('1500000'),
## 38. ),
## 39. )
## 40. ],
## 41. ),
## 42. );
## 43. }
## 44. }

Kemudian daftarkan ProdukPage pada main.dart, dan hasilnya akan menjadi seperti berikut
- import 'package:flutter/material.dart';
- class ProdukPage extends StatefulWidget {
## 5.
- const ProdukPage({Key? key}) : super(key: key);
## 2.



Membuat Route (Pindah Halaman)
Buka file produk_page.dart, kemudian modifikasi pada bagian AppBar menjadi seperti berikut
AppBar(
title: const Text("Data Produk"), actions: [
GestureDetector(
// menampilkan icon +
child: const Icon(Icons.add),
//pada saat icon + di tap onTap: () async {
//berpindah ke halaman ProdukForm Navigator.push(
context, MaterialPageRoute(
builder: (context) => const ProdukForm()));
## })
## ],
## )
GestureDetector adalah widget yang digunakan untuk mendeteksi gesture pada widget
seperti gesture ontap, doubletab dan lain-lain.







Secara Keseluruhan kode tersebut akan menjadi
- import 'package:aplikasi_flutter_pertamaku/ui/produk_form.dart';
- import 'package:flutter/material.dart';
## 3.
- class ProdukPage extends StatefulWidget {
- const ProdukPage({Key? key}) : super(key: key); 6.
## 7. @override
- _ProdukPageState createState() => _ProdukPageState();
## 9. }
## 10.
- class _ProdukPageState extends State<ProdukPage> {
## 12. @override
- Widget build(BuildContext context) {
- return Scaffold(
- appBar: AppBar(
- title: const Text('Data Produk'),
- actions: [
- GestureDetector(
- // menampilkan icon +
- child: const Icon(Icons.add),
- onTap: () async {
- // berpindah ke halaman ProdukForm
## 23. Navigator.push(
- context,
- MaterialPageRoute(
- builder: (context) => const ProdukForm()));
## 27. })
## 28. ],
## 29. ),
- body: ListView(
- children: const [
## 32. // List 1
## 33. Card(
- child: ListTile(
- title: Text('Kulkas'),
- subtitle: Text('2500000'),
## 37. ),
## 38. ),
## 39. // List 2
## 40. Card(
- child: ListTile(
- title: Text('TV'),
- subtitle: Text('5000000'),
## 44. ),
## 45. ),
## 46. // List 3
## 47. Card(
- child: ListTile(
- title: Text('Mesin Cuci'),
- subtitle: Text('1500000'),
## 51. ),
## 52. )
## 53. ],
## 54. ),
## 55. );
## 56. }
## 57. }



Hasilnya akan muncul icon + pada bagian kanan AppBar, jika diklik akan membuka
ProdukForm


Pemisahan Widget ke dalam Class StatelessWidget
Selain  pemisahan  widget  ke  dalam  suatu  function/method,  pemisahan  juga  dapat
dilakukan  menggunakan class StatelessWidget, pada contoh kali ini kita akan
memisahkan  Card  dengan  membuat  class  tersendiri.  Buka  file  produk_page.dart,
kemudian buat sebuah class ItemProduk diluar class ProdukPage

class ItemProduk extends StatelessWidget {
final String? kodeProduk; final
String? namaProduk; final int?
harga;

const ItemProduk({Key? key, this.kodeProduk, this.namaProduk, this.harga})
: super(key: key);

## @override
Widget build(BuildContext context) {
return Card( child:
ListTile(

title: Text(namaProduk.toString()), subtitle:
Text(harga.toString()),
## ),
## );
## }
## }

Sehingga kode pada produk_page.dart menjadi

- import 'package:aplikasi_flutter_pertamaku/ui/produk_form.dart';
- import 'package:flutter/material.dart';
## 3.
- class ProdukPage extends StatefulWidget {
- const ProdukPage({Key? key}) : super(key: key);
## 6.
## 7. @override
- _ProdukPageState createState() => _ProdukPageState();
## 9. }
## 10.
- class _ProdukPageState extends State<ProdukPage> {
## 12. @override
- Widget build(BuildContext context) {
- return Scaffold(
- appBar: AppBar(
- title: const Text('Data Produk'),
- actions: [
- GestureDetector(
- // menampilkan icon +
- child: const Icon(Icons.add),
- onTap: () async {
- // berpindah ke halaman ProdukForm
## 23. Navigator.push(
- context,
- MaterialPageRoute(
- builder: (context) => const ProdukForm()));
## 27.

## })
## 28.

## ],

## 29.

## ),

- body: ListView(
- children: const [
## 32. // List 1
- ItemProduk(
- kodeProduk: "A001",
- namaProduk: "Kulkas",
## 36.

harga: 2500000,
## 37.

## ),

## 38. // List 2
- ItemProduk(
- kodeProduk: "A002",
- namaProduk: "TV",
## 42.

harga: 5000000,
## 43.

## ),

## 44. // List 3
- ItemProduk(
- kodeProduk: "A003",
- namaProduk: "Mesin Cuci",
## 48.

harga: 1500000,
## 49.

## ),

## 50.

## ],

## 51.

## ),

## 52.

## );

## 53. }
## 54. }

## 55.
- class ItemProduk extends StatelessWidget {
- final String? kodeProduk;
- final String? namaProduk;
- final int? harga;
## 60.



Menampilkan Detail Produk saat ListView diklik
Pada  bagian  ini  kita  akan  menambahkan  sebuah  fungsi  dimana  saat  salah  satu
ListView Produk di klik, maka akan membuka halaman Detail Produk yang telah kita
buat sebelumnya.

Kita akan memodifikasi Class ItemProduk pada   file produk_page.dart. Untuk
menambahkan widget diatas widget yang telah dibuat dapat dilakukan dengan cara,
arahkan kursor pada widget, misalnya dalam hal ini adalah widget Card


Pada bagian kiri akan muncul logo lampu, kemudian klik lampu tersebut dan pilih
widget yang ingin ditambahkan atau dalam hal ini kita akan memilih Warp with widget..
- const ItemProduk({Key? key, this.kodeProduk, this.namaProduk, this.harga})
## 63.
- Widget build(BuildContext context) {
- child: ListTile(
- subtitle: Text(harga.toString()),
## 71. );
## 73. }
## 72. }
## ), 70.
title: Text(namaProduk.toString()), 68.
return Card( 66.
## 64. @override
: super(key: key); 62.


Kemudian akan menjadi


Setelah itu ubah widget menjadi GestureDetector dan kita juga menambahkan onTap
yang kemudian akan membuka halaman Detail Produk, sehingga kode untuk Class
ItemProduk menjadi.

class ItemProduk extends StatelessWidget {
final String? kodeProduk; final
String? namaProduk; final int?
harga;

const ItemProduk({Key? key, this.kodeProduk, this.namaProduk, this.harga})
: super(key: key);

## @override
Widget build(BuildContext context) {
return GestureDetector( child:
## Card(
child: ListTile(
title: Text(namaProduk.toString()), subtitle:
Text(harga.toString()),
## ),
## ),
onTap: () { Navigator.push(
context,
MaterialPageRoute(
builder: (context) => ProdukDetail(
kodeProduk: kodeProduk,
namaProduk: namaProduk, harga:
harga,
## )));
## },
## );
## }
## }

Adapun untuk keseluruhan kode pada produk_page.dart sebagai berikut

- import 'package:aplikasi_flutter_pertamaku/ui/produk_detail.dart';
- import 'package:flutter/material.dart';

- class ProdukPage extends StatefulWidget {
## 7.
- _ProdukPageState createState() => _ProdukPageState();
## 11.
## 13. @override
- return Scaffold(
- title: const Text('Data Produk'),
- GestureDetector(
- child: const Icon(Icons.add),
- // berpindah ke halaman ProdukForm
onTap: () async { 22.
// menampilkan icon + 20.
actions: [ 18.
appBar: AppBar( 16.
- Widget build(BuildContext context) {
- class _ProdukPageState extends State<ProdukPage> {
## 10. }
## 8. @override
- const ProdukPage({Key? key}) : super(key: key);
## 4.
- import 'package:aplikasi_flutter_pertamaku/ui/produk_form.dart';


## 24. Navigator.push(
- context,
- MaterialPageRoute(
- builder: (context) => const ProdukForm()));
## 28.

## })
## 29.

## ],

## 30.

## ),

- body: ListView(
- children: const [
## 33. // List 1
- ItemProduk(
- kodeProduk: "A001",
- namaProduk: "Kulkas",
## 37.

harga: 2500000,
## 38.

## ),

## 39. // List 2
- ItemProduk(
- kodeProduk: "A002",
- namaProduk: "TV",
## 43.

harga: 5000000,
## 44.

## ),

## 45. // List 3
- ItemProduk(
- kodeProduk: "A003",
- namaProduk: "Mesin Cuci",
## 49.

harga: 1500000,
## 50.

## ),

## 51.

## ],

## 52.

## ),

## 53. );

## 54. }
## 55. }
## 56.
- class ItemProduk extends StatelessWidget {
- final String? kodeProduk;
- final String? namaProduk;
- final int? harga;
## 61.
- const ItemProduk({Key? key, this.kodeProduk, this.namaProduk, this.harga})
- : super(key: key);
## 64.
## 65. @override
- Widget build(BuildContext context) {
- return GestureDetector(
- child: Card(
- child: ListTile(
- title: Text(namaProduk.toString()),
- subtitle: Text(harga.toString()),
## 72.

## ),

## 73.

## ),

- onTap: () {
## 75. Navigator.push(
- context,
- MaterialPageRoute(
- builder: (context) => ProdukDetail(
- kodeProduk: kodeProduk,
- namaProduk: namaProduk,
- harga: harga,

## 82. )));
## 83.

## },

## 84. );

## 85. }
## 86. }




## TUGAS PRAKTIKUM INDIVIDU :

## BUATLAH MENU DENGAN STATE MANAGEMENT MELIPUTI :
## 1. MENU  1.  BIODATA  MAHASISWA  TERDIRI  DARI  BIODATA  PRIBADI,
## PENDIDIKAN, PEKERJAAN, DAN ORGANISASI.
## 2. MENU KE 2. MENU FORM NILAI MAHASISWA DENGAN LISTVIEW PADA
## CONTOH YANG DIBERIKAN !
## 3. MENU KE 3. PROFILE PENGGUNA

## TUGAS DIKUMPULKAN MAKSIMAL HARI MINGGU, 11 OKTOBER 2026 JAM 23.59
## !


