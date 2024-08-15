<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## Cara Menjalankan Program

Program dibuat menggunakan framework React.js untuk Front-End dan Laravel 11 untuk Backend. Sistem ini dapat bercakap dengan asisten virtual dengan dukungan API OpenAI. Cara menggunakan sistem ini yaitu:

-   Jalankan program pada CLI menggunakan perintah dibawah ini.

```
    php artisan serve
```

dan

```
    npm run dev
```

-   Setelah program berjalan, lakukan login terlebih dahulu yang terdapat pada sisi kanan atas.
-   Setelah melakukan login, maka program akan otomatis mengarahkan user ke halaman utama.
-   Pada halaman utama terdapat 2 section awal yaitu section History dan section New Conversation.
-   User dapat memilih New Conversation untuk dapat memulai percakapan dengan AI.
-   Untuk menampilkan History, user dipersilahkan untuk melakukan refresh website agar percakapan baru dapat muncul pada History.

Section History masih belum bisa terupdate secara otomatis, oleh karena itu website harus direfresh.

## Database

Sistem menyimpan percakapan user pada database, namun untuk saat ini database yang digunakan masih database lokal yang mana harus di import terlebih dahulu. Sistem ini menggunakan database MySQL pada localhost. (Untuk nama database dapat dicocokkan pada file .env)

-   **File database terdapat pada github ini dengan nama [project_telkom_indonesia.sql](https://github.com/Styaa/project_magang_telkomID/blob/main/project_telkom_indonesia.sql)**

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).

# project_magang_telkomID
