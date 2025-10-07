# Menambah Dokumen Baru

{% embed url="https://youtu.be/2xC2yfonrhs" %}

<figure><img src="https://document-management-system-1.gitbook.io/document-management-system/~gitbook/image?url=https%3A%2F%2F1011768869-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FLEturytqtHGPsYdglHaB%252Fuploads%252FDmygr7LgNo2xllYFLvTP%252Fimage.png%3Falt%3Dmedia%26token%3D0e43ad19-2328-475a-bc7d-dfff5acd20b2&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=f44a0095&#x26;sv=2" alt=""><figcaption></figcaption></figure>

Fitur ini digunakan untuk mencatat dokumen fisik atau digital ke dalam sistem **Document Management**.\
Dokumen yang berhasil dicatat akan memiliki informasi lengkap seperti tipe, jumlah, lokasi penyimpanan, serta status ketersediaannya (**Available / Borrowed**).

> Dokumen hanya bisa aktif jika sudah dilakukan proses validasi/aktivasi melalui tombol `Make Available` oleh role **Pengelola**.

#### Panduan untuk User <a href="#panduan-untuk-user" id="panduan-untuk-user"></a>

**Tujuan**

User dapat menginput data awal dokumen yang ingin dicatat ke dalam sistem, namun **tidak dapat langsung mengaktifkan** dokumen tersebut.

#### **Langkah-langkah Input Dokumen oleh User**

1. **Klik tombol New**\
   Masuk ke menu **Documents**, lalu klik tombol **New** di pojok kiri atas untuk membuat dokumen baru.
2.  **Isi Informasi Dokumen**

    <table><thead><tr><th width="135.6666259765625">Field</th><th>Keterangan </th></tr></thead><tbody><tr><td>Name</td><td>Nama atau Judul dokumen</td></tr><tr><td>Type</td><td>Jenis dokumen (Otomatis diisi)</td></tr><tr><td>Customer</td><td>Pihak yang berkaitan dengan dokumen</td></tr><tr><td>Description</td><td>Deskripsi singkat dokumen</td></tr><tr><td>Created Date</td><td>Tanggal pencatatan dokumen</td></tr><tr><td>Quantity</td><td>Jumlah dokumen (bisa lebih dari 1)</td></tr></tbody></table>
3.  **Isi Lokasi Penyimpanan**\
    Tentukan lokasi rak/box tempat dokumen akan disimpan.

    | Field     | Keterangan                 |
    | --------- | -------------------------- |
    | Warehouse | Lokasi Gudang dokumen      |
    | Shelf     | Rak penyimpanan (opsional) |
    | Box       | Nomor Box (opsional)       |
4. **Simpan**\
   Klik tombol **Save**. Dokumen akan tersimpan dengan status **Draft**, dan belum aktif sampai disetujui oleh Pengelola.

### **Panduan untuk Pengelola**

#### **Tujuan**

Role **Pengelola** bertugas memvalidasi dan mengaktifkan dokumen agar dapat digunakan dalam proses lain seperti **Transfer** atau **Borrow**.

#### **Langkah-langkah Aktivasi Dokumen oleh Pengelola**

1. **Buka Dokumen dari Halaman Documents**\
   Pengelola dapat melihat semua dokumen dengan status **Draft**. Pilih dokumen yang akan diaktifkan.
2. **Periksa & Lengkapi Informasi**\
   Pastikan seluruh informasi sudah benar, terutama **lokasi penyimpanan**. Ini penting untuk pelacakan fisik dokumen.
3. **Klik Tombol Make Available**\
   Jika semua informasi lengkap, klik tombol **Make Available** untuk mengubah status dokumen menjadi **Available**.

#### Catatan Tambahan <a href="#catatan-tambahan" id="catatan-tambahan"></a>

* Dokumen dengan status **Available** dapat dipinjam, dipindah, atau dihancurkan melalui fitur lain.
* Hanya **Pengelola** yang dapat mengklik tombol **Make Available**.
* Field **Lokasi** wajib diisi untuk keperluan audit dan pelacakan.

[\
](https://document-management-system-1.gitbook.io/document-management-system/panduan-penggunaan-modul/penambahan-data-dalam-modul)
