-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 19, 2023 at 07:06 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_3`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deactived_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee_flat` int(255) NOT NULL,
  `fee_percent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `group`, `code`, `name`, `deactived_at`, `created_at`, `updated_at`, `icon_url`, `fee_flat`, `fee_percent`) VALUES
(1, 'Virtual Account', 'MYBVA', 'Maybank Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(2, 'Virtual Account', 'PERMATAVA', 'Permata Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(3, 'Virtual Account', 'BNIVA', 'BNI Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(4, 'Virtual Account', 'BRIVA', 'BRI Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(5, 'Virtual Account', 'MANDIRIVA', 'Mandiri Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(6, 'Virtual Account', 'BCAVA', 'BCA Virtual Account', NULL, NULL, NULL, '-', 5500, '0.00'),
(7, 'Virtual Account', 'SMSVA', 'Sinarmas Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(8, 'Virtual Account', 'MUAMALATVA', 'Muamalat Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(9, 'Virtual Account', 'CIMBVA', 'CIMB Niaga Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(10, 'Virtual Account', 'BSIVA', 'BSI Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(11, 'Virtual Account', 'BSIVAOP', 'BSI Virtual Account (Open Payment)', NULL, NULL, NULL, '-', 3333, '0.00'),
(12, 'Virtual Account', 'OCBCVA', 'OCBC NISP Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(13, 'Virtual Account', 'DANAMONVA', 'Danamon Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(14, 'Virtual Account', 'BNCVA', 'BNC Virtual Account', NULL, NULL, NULL, '-', 4250, '0.00'),
(15, 'Convenience Store', 'ALFAMART', 'Alfamart', NULL, NULL, NULL, '-', 3500, '0.00'),
(16, 'Convenience Store', 'INDOMARET', 'Indomaret', NULL, NULL, NULL, '-', 3500, '0.00'),
(17, 'Convenience Store', 'ALFAMIDI', 'Alfamidi', NULL, NULL, NULL, '-', 3500, '0.00'),
(18, 'E-Wallet', 'OVO', 'OVO', NULL, NULL, NULL, '-', 0, '3.00'),
(19, 'E-Wallet', 'QRIS', 'QRIS by ShopeePay', NULL, NULL, NULL, '-', 750, '0.70'),
(20, 'E-Wallet', 'QRISC', 'QRIS (Customizable)', NULL, NULL, NULL, '-', 800, '0.70'),
(21, 'E-Wallet', 'QRIS2', 'QRIS', NULL, NULL, NULL, '-', 750, '0.70'),
(22, 'E-Wallet', 'SHOPEEPAY', 'ShopeePay', NULL, NULL, NULL, '-', 0, '3.00'),
(24, 'COD', 'COD', 'COD - Cash On Delivery', NULL, NULL, NULL, 'https://png.pngtree.com/png-clipart/20210530/original/pngtree-cash-on-delivery-of-cod-icon-png-image_6364045.jpg', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `admin_telp` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`) VALUES
(1, 'BeuatySkinAdmin', 'seller', 'lupapass', '08122612181612', 'beautyskin@gmail.com', 'Jl. Soekarno Hatta No. 9, Semarang, Jawa Tengah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cart`
--

CREATE TABLE `tb_cart` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`) VALUES
(8, 'Skincare'),
(9, 'Bodycare'),
(10, 'Haircare'),
(11, 'Parfume'),
(13, 'Makeup');

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `id_alamat` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kode_pos` varchar(255) NOT NULL,
  `detail_alamat` text DEFAULT NULL,
  `token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`id_pelanggan`, `nama_lengkap`, `email`, `password`, `no_hp`, `id_alamat`, `provinsi`, `kota`, `kelurahan`, `kecamatan`, `kode_pos`, `detail_alamat`, `token`) VALUES
(1, 'eko', 'bagas@smkwikrama1jepara.sch.id', '77', '123456789', 'IDNP10IDNC393IDND4704IDZ50133', 'Jawa Tengah', 'Semarang', 'Semarang Tengah', '', '50133', 'yudistira', 'eca9074b39f479b74d2df675c80740a0'),
(2, 'gita', 'pratiwi@gmail.com', '1234', '085798765', 'IDNP14IDNC201IDND1702IDZ74181', 'Kalimantan Tengah', 'Kotawaringin Barat', 'Kumai', '', '74181', 'pangeran', NULL),
(3, 'Ika Risma', 'ika@gmail.com', '1234', '087987', 'IDNP10IDNC393IDND4704IDZ50132', 'Jawa Tengah', 'Semarang', 'Semarang Tengah', '', '50132', 'jalan nakula raya', NULL),
(4, 'gita', 'gita@gmail.com', '123', '123-45-678', 'IDNP14IDNC161IDND1098IDZ73555', 'Kalimantan Tengah', 'Kapuas', 'Kapuas Tengah', '', '73555', 'jl. soekarno', NULL),
(8, 'Nabilla', 'nabillanef123@gmail.com', 'Nabilla_123', '098765654312', 'IDNP10IDNC348IDND4066IDZ52311', 'Jawa Tengah', 'Pemalang', 'Pemalang', '', '52311', 'jl. moh hatta', '58e55a804408a027544f91cdac528c14'),
(9, 'Ika ', 'ika@gmail.com', 'Ika_123', '08678756789', 'IDNP10IDNC341IDND3955IDZ59111', 'Jawa Tengah', 'Pati', 'Pati', '', '59111', 'Jalan raya no, 12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_product`
--

CREATE TABLE `tb_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_product`
--

INSERT INTO `tb_product` (`product_id`, `category_id`, `product_name`, `product_price`, `product_description`, `product_image`, `product_status`, `date_created`, `stock`) VALUES
(40, 10, 'LAE SA LUAY ', 71250, 'Memperbaiki rambut bercabang & kering\r\nmengilatkan rambut secara natural & tidak berminyak\r\nmeluruskan rambut hanya dalam 1 aplikasi pemakaian\r\nsekaligus jg sangat ampuh mematikan kutu rambut.', 'produk1671890758.png', 1, '2022-12-24 14:05:58', 5),
(41, 10, 'O Sweet Singapore Ginger Shampoo', 105599, 'O Sweet Singapore Ginger Shampoo cocok untuk rambut rontok', 'produk1671891084.png', 1, '2022-12-24 14:11:24', 8),
(42, 10, 'Lavojoy Amino Acid Shampoo', 26100, 'LVJ lavojoy Hold Me Tight Shampoo Lazy Sunday\r\n\r\nMemiliki kandungan Asam Amino, Lactobacillus dan 0% pembersih silikon shampoo. Memberikan efek dapat melembutkan, menambah nutrisi kulit kepala dan membantu mengurangi kerontokan rambut.\r\n\r\nBenefit :\r\n1. Gentle Cleanser\r\nAn Amino Acid-based, 0% silicone and 0% sulfate formula yang menciptakan busa mewah untuk membersihkan kulit kepala dengan lembut dan menyeluruh.\r\n\r\n2. Nourish Scalp and Reduce Hair Loss\r\nLactobacillus untuk menyeimbangkan pH kulit kepala. Ceramides dan Centella Asiatica untuk menutrisi kulit kepala dan membantu mengurangi kerontokan rambut.\r\n\r\n3. Sweet Floral and Fruity Fragrance\r\nTop Notes: Bitte.', 'produk1671891199.png', 1, '2022-12-24 14:13:19', 8),
(43, 10, 'Varesse Serum Shampoo', 150500, 'Varesse Serum Shampoo Hair Loss Defense dengan Herbavit Serum merupakan 2 in 1 Shampoo & Conditioner dengan kombinasi New Herbal Complex Extract dan Multivitamin*\r\n \r\nFungsi:\r\n- mengurangi rambut rontok, ketombe & gatal\r\n- memperkuat akar rambut\r\n- menjadikan rambut lembut, bervolume, mudah diatur dan tetap sehat.\r\n   \r\nNew Herbal Complex Extract: Sophora Angustifolia Root Extract, Horse Chestnut Seed Extract, Nasturtium Officinale Leaf/Stem Extract\r\nMultivitamin: Vitamin A Palmitate, Vitamin B5, Vitamin B8, Vitamin E, Vitamin F, Vitamin H (Biotin).', 'produk1671891391.png', 1, '2022-12-24 14:16:31', 8),
(44, 10, 'Sukin Deep Cleanse Shampoo', 140000, '- untuk kulit kepala/ rambut berminyak/ lepek\r\n- Membersihkan minyak berlebih & residu produk di kulit kepala tanpa menghilangkan minyak alami → mencegah lepek, ketombe & rontok\r\n- Segar lebih lama\r\n- Melindungi rambut dari kondisi eksternal (polusi, panas, etc)\r\n- Tanpa silikon & sulfat (SLS/ SLES), cocok untuk kulit kepala sensitif sekalipun\r\n- Aroma alami Freesia & Lily', 'produk1671891465.png', 1, '2022-12-24 14:17:45', 13),
(45, 10, 'OC Naturals Normal Balance Shampoo', 55961, 'Diperkaya dengan kandungan organic aloe vera & ginseng yang membantu meningkatkan vitalitas dan hidrasi pada rambut menjadikan rambut sehat dan lembut', 'produk1671891547.png', 1, '2022-12-24 14:19:07', 13),
(46, 10, 'Rated Green Real Shea Shampoo', 178500, 'Sampo yang rendah asam, non-silikon dengan surfaktan yang berasal dari bahan alami membersihkan rambutmu dengan lembut, dan tidak menyebabkan iritasi pada kulit kepala. Dengan kandungan Shea Butter cold pressed dipadukan dengan sunflower seed oil, yang mampu menambah nutrisi dan melembabkan rambut rusak serta kurang nutrisi.  Cocok untuk rambut kering, kusut dan rusak.', 'produk1671892143.jpg', 1, '2022-12-24 14:29:04', 6),
(47, 10, 'La Dor Hydro LPP Treatment', 100000, 'Conditioner Hydro LPP adalah conditioner perawatan rambut yang sangat ampuh untuk mengembalikan serat rambut yang rusak , rambut sensitif yang membutuhkan perawatan segera. Terutama di formulasikan untuk rambut yang pernah mengalami proses kimia dan diwarnai. Conditioner ini mengubah nutrisi yang ada di rambut yang rusak dan mengisi nya dengan bahan-bahan yang ada untuk menguatkan rambut dan akhirnya bersinar dan elastis', 'produk1671892183.png', 1, '2022-12-24 14:29:43', 7),
(48, 10, 'Ree Derma Wellnes', 85400, 'Cinnamon & Amino Acid Mild Shampoo adalah sampo yang dapat menjaga kesehatan rambut Anda\r\nalami dan mengurangi masalah rambut rontok.\r\nAsam amino digunakan untuk membantu merawat kesuburan rambut dan penggunaan Kayu Manis adalah untuk melindungi\r\nkulit kepala dari masalah ketombe.\r\nSampo ini juga memberikan sensasi relaksasi aromaterapi alami dan menenangkan\r\nefek pada kulit kepala dan area lain yang mudah teriritasi', 'produk1671892242.png', 1, '2022-12-24 14:30:42', 8),
(49, 10, 'Love Beauty and Planet Shampoo', 54900, 'Kembalikan kesegaran rambut yang bersih menyeluruh dengan kandungan Australian Tea Tree Oil berkualitas tinggi dan keharuman mewah Vetiver yang menyegarkan. Radical Refresher shampoo ini dapat menjadikan rambutmu tampak lebih bervolume. Shampoo ini dikemas dalam 100% botol daur ulang dimana  vegan-certified, cruelty free, bebas dari pewarna, silikon, dan paraben.', 'produk1671892302.png', 1, '2022-12-24 14:31:42', 9),
(50, 10, 'Batiste Clean & Classic Original', 91262, 'Batiste Clean & Classic Original Dry Shampoo menyerap minyak berlebih di akar rambut dengan formula ‘Natural White Starch’, cara tercepat untuk membersihkan sekaligus menata rambut dimanapun anda berada dan memberikan volume seketika pada rambut yang kotor dan lepek sehingga rambut mudah ditata dan tampak segar alami. Membuat rambut anda terasa bersih, segar, dan terasa tebal penuh tekstur secara instant.\r\nFragrance: Citrus Fresh', 'produk1671892402.png', 1, '2022-12-24 14:33:22', 8),
(51, 10, 'Batiste Heavenly Volume', 91262, 'Batiste Heavenly Volume Dry Shampoo menyerap minyak berlebih di akar rambut dengan formula ‘Natural White Starch’, cara tercepat untuk membersihkan sekaligus menata rambut di manapun anda berada dan memberikan volume seketika pada rambut yang kotor dan lepek sehingga rambut mudah ditata dan tampak segar alami. Produk yang sempurna untuk siapa saja yang menyukai efek volume dan aroma menakjubkan.', 'produk1671892462.png', 1, '2022-12-24 14:34:22', 9),
(52, 10, 'ERHAIR Scalperfect Allantoin & Aloe Vera Dry Shampoo - for Sensitive Scalp ', 95200, 'Dikembangkan dengan formula dermatologi, Scalperfect Allantoin & Aloe Vera Dry Shampoo berfungsi sebagai Dry Shampoo dengan Scalp Soothing Formula khusus untuk kulit kepala sensitif yang bekerja efektif menyerap minyak berlebih dengan cepat sekaligus memberikan manfaat antibakteri & antiinflamasi untuk menjaga kesehatan kulit kepala. Formula ringan, tanpa residu putih setelah penggunaan.', 'produk1671892519.png', 1, '2022-12-24 14:35:19', 8),
(53, 10, 'Batiste Fruity & Cheeky Cherry', 91262, 'Batiste Fruity & Cheeky Cherry Dry Shampoo menyerap minyak berlebih di akar rambut dengan formula ‘Natural White Starch’, cara tercepat untuk membersihkan sekaligus menata rambut di manapun anda berada dan memberikan volume seketika pada rambut yang kotor dan lepek sehingga rambut mudah ditata dan tampak segar alami. Aroma cherry yang kuat akan menghidupkan pesona anda.', 'produk1671892580.png', 1, '2022-12-24 14:36:20', 7),
(54, 10, 'Batiste Light & Breezy Fresh ', 91262, 'Batiste Light & Breezy Fresh Dry Shampoo menyerap minyak berlebih di akar rambut dengan formula ‘Natural White Starch’, cara tercepat untuk membersihkan sekaligus menata rambut di manapun anda berada dan memberikan volume seketika pada rambut yang kotor dan lepek sehingga rambut mudah ditata dan tampak segar alami. Cara ideal untuk membersihkan dan menyegarkan rambut secara instant serta membuat rambut terasa tebal.', 'produk1671892674.png', 1, '2022-12-24 14:37:54', 9),
(55, 10, 'CBD Color Shield Conditioner', 43938, 'CBD Color Shield Conditioner. Perawatan intensif khusus untuk rambut yang diwarnai. Memperbaiki batang rambut yang rapuh dan melembutkan rambut\r\n> 3x lebih lembut\r\n> Melindungi warna rambut hingga 10 minggu\r\n> Melembabkan rambut\r\n> Fruity fragrance tahan lama\r\n> Dengan extrak pomegranate & ProVit B5\r\n> Mempertahankan kilau rambut\r\n> Diformulasikan khusus untuk rambut yang diwarnai\r\n> Mempertahankan warna rambut sampai 8x pencucian\r\n> Mudah menyerap ke batang rambut', 'produk1671892787.png', 1, '2022-12-24 14:39:47', 10),
(56, 10, 'Batiste FLoral & Flirty Blush', 91262, 'Batiste Floral & Flirty Blush Dry Shampoo menyerap minyak berlebih di akar rambut dengan formula ‘Natural White Starch’, cara tercepat untuk membersihkan sekaligus menata rambut di manapun anda berada dan memberikan volume seketika pada rambut yang kotor dan lepek sehingga rambut mudah ditata dan tampak segar alami. Kombinasi aroma bunga yang menyenangkan dan menyegarkan.', 'produk1671892825.png', 1, '2022-12-24 14:40:25', 9),
(57, 10, 'Batiste Divine Dark With a Hint of Color', 91262, 'Batiste Divine Dark Dry Shampoo menyerap minyak berlebih di akar rambut dengan formula ‘Natural White Starch’, cara tercepat untuk membersihkan sekaligus menata rambut di manapun anda berada dan memberikan volume seketika pada rambut yang kotor dan lepek sehingga rambut mudah ditata dan tampak segar alami. Batiste Divine Dark diperuntukkan untuk kalian yang memiliki warna rambut gelap – baik dicat ataupun warna rambut alami. Batiste Divine Dark juga membantu untuk menyamarkan rambut putih.', 'produk1671892884.png', 1, '2022-12-24 14:41:24', 17),
(58, 10, 'Batiste Preety & Opulent Oriental', 91262, 'Batiste Pretty & Opulent Oriental Dry Shampoo menyerap minyak berlebih di akar rambut dengan formula ‘Natural White Starch’, cara tercepat untuk membersihkan sekaligus menata rambut di manapun anda berada dan memberikan volume seketika pada rambut yang kotor dan lepek sehingga rambut mudah ditata dan tampak segar alami.', 'produk1671892936.png', 1, '2022-12-24 14:42:16', 9),
(59, 9, 'Nivea Extra White Radiant & Smooth Lotion ', 28170, 'Dengan pemakaian teratur, kombinasi formula yg dapat meratakan kecerahan kulitmu dan melindungi nya agar tidak kembali kusam sekaligus melembabkan dan menghaluskan kulitmu sehingga terasa nyaman sepanjang hari setiap hari. Dengan kandungan 40x Vitamin C dari Ekstrak Camu-camu Berry mampu meratakan kecerahan kulitmu, dan double UV Filters dapat melindungi sehingga mencegah kulit tidak kembali menghitam dan penuaan dini akibat sinar UVA UVB serta Hydra IQ melembabkan dan menghaluskan kulitmu.', 'produk1671893195.jpg', 1, '2022-12-24 14:46:35', 16),
(60, 9, 'Nivea Sun Triple Protect Body Extra Radiance & Smooth ', 88000, 'Body Sun Serum dengan perlindungan tinggi untuk penggunaan sehari-hari. Formula yang tidak lengket dan mudah menyerap. Melindungi kulit dari efek bluelight, UVA, UVB, dan anti-polusi. Formula ekstrak mawar dari Hokkaido dengan 36x kekuatan anti-oksidan*. Kulit kusam menjadi tampak cerah beraura *36x kekuatan anti-oksidan apabila dibandingkan dengan Grapefruit.', 'produk1671893256.png', 1, '2022-12-24 14:47:36', 17),
(61, 9, 'Nivea Body Extra White Repair & Protect Lotion 400Ml ', 51680, 'Mencerahkan, menjaga kuli tetap cerah serta merawat dari 10 tanda kulit kusan dan rusak, sekaligus melembabkan dan menghaluskan.', 'produk1671893307.jpg', 1, '2022-12-24 14:48:27', 15),
(62, 8, 'Nivea Sun Face Triple Protect Hokkaido Rose Sunscreen SPF50+++ 40mL', 68775, '1 SUNSCREEN, 3 PERLINDUNGAN Melindungi dari Bluelight, UVA/UVB, dan Polusi. Hokkaido Rose yang mengandung 36x antioksidan lebih tinggi, membantu mengembalikan kulit kusam menjadi tampak cerah beraura Cocok digunakan setiap hari untuk melidungi kulit wajah dari paparan sinar matahari. Format serum dengan tekstur yang sangat ringan dan cepat menyerap, menjaga kesehatan kulit wajah, tampak lebih cerah dan halus. Rose Extract dibandingkan dengan Grapefruit\r\n-Sunscreen dengan Triple Protect Formula yang melindungi kulit wajahmu dari Blue Light, UVA/UVB, dan Polusi. Cocok digunakan setiap hari untuk melidungi kulit wajah dari paparan sinar matahari. Format serum dengan tekstur yang sangat ringan dan cepat menyerap, menjaga kesehatan kulit wajah, tampak lebih cerah dan halus.\r\nNon Comedogenic.\r\nPeringatan: Jangan terlalu lama berada di bawah sinar matahari meskipun sudah menggunakan sunscreen. Paparan sinar matahari yang berlebihan dapat berbahaya bagi kesehatan. Jangan digunakan pada kulit yang luka. Hindari penggunaan di area sekitar mata. Jika terkena mata, bilas dengan air. Hentikan pemakaian jika terjadi efek yang tidak diinginkan dan konsultasikan ke dokter. Telah diuji secara dermatologi cocok untuk semua jenis kulit.', 'produk1671893412.png', 1, '2022-12-24 14:50:12', 10),
(63, 8, 'Nivea Pearl Bright Micellair Skin Breathe ', 28730, 'Temukan kekuatan NIVEA MicellAIR SKIN BREATHE micellar water All-in-1 Make Up Remover yang dapat:\r\n1.	Membersihkan make up secara efektif dengan lembut hingga lapisan terdalam tanpa residu. \r\n2.	Memberi kelembapan ekstra pada kulit. \r\n3.	Menyegarkan dan kulit bebas bernafas.', 'produk1671893481.png', 1, '2022-12-24 14:51:21', 9),
(64, 8, 'Nivea Sun Face Serum Triple Protect Anti Wrinkle SPF50 PA+++ 40mL ', 68175, '', 'produk1671893544.png', 1, '2022-12-24 14:52:24', 10),
(65, 9, 'Scarlett Whitening Body Lotion Happy ', 72600, 'Aroma : Floral - Amber - Musky\r\nOrange Mandarin - Jasmine - Musk - Amber - Vanilla\r\n\r\nManfaat:\r\n• Membantu menutrisi kulit\r\n• Membantu mencerahkan kulit', 'produk1671893594.png', 1, '2022-12-24 14:53:14', 9),
(66, 8, 'Avockin YOUR SKIN BAE SERIES Toner Niacinamide 7% + Alpha Arbutin 1% + Kale', 124050, 'Avoskin menghadirkan brightening dan hydrating toner dengan kandungan Niacinamide 7% yang dipadukan dengan Alpha Arbutin 1% dan ekstrak kale. Perpaduan kandungan active dan natural dalam Niacinamide 7% + Alpha Arbutin 1% + Kale Time to Glow bermanfaat untuk mencerahkan kulit, membantu mengurangi noda hitam dan menghidrasi kulit secara optimal sehingga memperkuat skin barrier.\r\n\r\nToner ini bisa digunakan untuk semua jenis kulit. Gunakan Niacinamide 7% + Alpha Arbutin 1% + Kale Time to Glow pada pagi dan malam untuk menyempurnakan perawatan kulitmu serta dapatkan efek kulit lembap, cerah, dan glowing alami!', 'produk1671894066.png', 1, '2022-12-24 15:01:06', 8),
(67, 8, 'Avoskin YOUR SKIN BAE SERIES Toner Salicylic Acid 1% + Zinc + Tea Tree Water', 140590, '', 'produk1671894159.png', 1, '2022-12-24 15:02:40', 12),
(68, 8, 'Avoskin YOUR SKIN BAE SERIES Ultimate Hyaluron Marine Collagen 5% + Hyacross 2% + Galactomyces', 140590, 'Ultimate Hyaluron Marine Collagen 5% + Hyacross 2% + Galactomyces Bye Dry Skin diformulasikan secara khusus untuk memberikan efek hidrasi optimal pada kulit serta membantu stimulasi kolagen pada kulit. Kulit yang terjaga kelembapannya akan mampu menyerap produk skincare berikutnya dengan lebih optimal. Yang tidak kalah penting, kulit lembap akan lebih terhindar dari masalah kulit seperti jerawat, kulit kusam, kerutan halus dan bruntusan.\r\n\r\nMenggunakan hydrating toner ini secara rutin akan membantumu mengatasi permasalahan kulit kering. Gunakan produk ini pada pagi dan malam sebelum menggunakan serum maupun essence. Untuk hasil yang maksimal, padukan dengan produk-produk Avoskin lain.', 'produk1671894227.png', 1, '2022-12-24 15:03:47', 9),
(69, 8, 'Azarine Moisture Rich Hydrating Toner', 69000, 'Toner yang diformulasikan dengan ekstrak Ice Plant dan Aquaxyl yang mengikat air dan menjaga kelembapan kulit dalam jangka panjang. Mengandung zat aktif Synchrolife untuk mengatasi kelelahan kulit dan penuaan dini akibat blue light atau radiasi layar gadget.', 'produk1671894304.png', 1, '2022-12-24 15:05:04', 16),
(70, 11, 'BIES Blossom Roses EDP Travel Size', 75000, 'Wangi BLOSSOM ROSES adalah kombinasi sensual dari Rose dan Saffron, ditambah dengan aroma Patchouli dan Musk. Komposisinya adalah sebuah keanggunan seorang ratu sesuai dengan gambaran dari Rose yang menjadi ratu di antara bunga lain. Cantik, menawan, dan abadi.', 'produk1671894384.png', 1, '2022-12-24 15:06:24', 5),
(71, 8, 'Bioderma Sensibio Eye Contour Gel 15ml', 290000, 'Sensibio Eye Contour Gel secara seketika menghilangkan rasa tidak nyaman dan iritasi di sekitar mata, secara biologis memperkuat daya tahan kulit dalam mempertahankan dan meningkatkan daya toleransi kulit yang sensitif.\r\n\r\nSebagai terobosan baru di bidang biologi untuk kulit sensitif, Toléridine®, kandungan bahan paten alami dari D.A.F. (Dermatological Advanced Formulation), menghambat pertumbuhan molekul penyebab peradangan agar kulit menjadi kurang reaktif.\r\n\r\nKafein, kandungan bahan pembuka sumbatan yang terkandung dalam Sensibio Eye berfungsi untuk membantu mengurangi timbulnya belang-bel.', 'produk1671894453.jpg', 1, '2022-12-24 15:07:33', 9),
(72, 9, 'Nivea Body Intensive Serum', 40500, 'Grape Seed & Avocado Oil untuk melembabkan secara intensive dan merawat kulit. \r\n\r\nVitamin E dan formula baru yang tidak lengket dikulit, merawat kulit kering & kulit pecah-pecah menjadi lebih lembut dan halus. \r\n\r\nMenjaga kelembaban kulit selama lebih dari 48 jam ', 'produk1671894564.jpg', 1, '2022-12-24 15:09:24', 9),
(73, 9, 'Azarine Bodysaver Moisturiser Bright Power 100 ml', 45000, 'Body moisturiser dengan tekstur mudah meresap, tidak lengket, dan ringan serta menggunakan fine fragrance yang tahan lama dan mewah. .Diformulasikan dengan bahan Melazero yang tidak hanya mencerahkan namun menghambat produksi hingga menghapus melanin. Galactomyces dapat digunakan sebagai antioksidan hingga menyamarkan garis halus. Tranexamid Acid yang dapat mencerahkan sekaligus memudarkan noda hitam.', 'produk1671894643.png', 1, '2022-12-24 15:10:43', 15),
(74, 8, 'Braylee Pomegranate Eye Mask (60 Pcs)', 64500, 'Eye mask Dengan bahan lembut yang pas diletakan pada bagian bawah area mata untuk melembabkan, mencerahkan serta mengencangkan area tersebut.', 'produk1671894718.png', 1, '2022-12-24 15:11:58', 8),
(75, 8, 'Breylee Serum Mata Roll On Vitamin C - Mencerahkan', 48000, 'Mengandung Vitamin C dan bermacam-macam ektrak tumbuhan, melembabkan, membantu memperbaiki tekstur kulit, antioksidan dengan kemampuan perlindungan, efektif untuk mencegah pembentukan melanin, membantu mencerah- kan warna kulit pada area mata, menyamarkan lingkaran hitam pada area mata, mengurangi kantong mata, dan melembutkan area kulit bawah mata.', 'produk1671894795.png', 1, '2022-12-24 15:13:15', 9),
(76, 11, 'BUTTONSCARVES Cairo Eau De Perfume', 425000, 'Wangi yang lebih hangat dengan sentuhan rempah yang menonjol memberikan sensasi misterius. Sebuah perpaduan yang unik yang memberikan impresi lebih bernuansa. Memberikan pengalaman baru di penciuman anda dengan esensi pedas dari pink peppercorn dipadukan dengan wangi bunga bunga magnolia dan sentuhan kesegaran angin di laut.\r\n\r\nImpressions: Bold, Elegant, and Mysterious (Berani, Elegan, Misterius)\r\nThe Notes:\r\nTop: Pink Peppercorn, Marine, Magnolia\r\nMiddle: Rose, Jasmine/white florals\r\nDry-down: Patchouli, vanilla, musk', 'produk1671894894.png', 1, '2022-12-24 15:14:54', 6),
(77, 9, 'Cetaphil Brighteness Reveal Body Wash', 220115, 'Cetaphil Brightness Reveal Body Wash diformulasikan dari kandungan Aqua, Glycerin, dan Hyaluronic Acid yang dapat membersihkan pori-pori dan melindungi serta melembapkan kulit. Cocok untuk segala jenis kulit.', 'produk1671894964.png', 1, '2022-12-24 15:16:04', 13),
(78, 8, 'Cosrx Advanced Snail Hydrogel Eye Patch', 327250, 'Hydrogel eye patch yang dapat membantu menghidrasi, menutrisi dan mencerahkan area mata. Terbuat dari Snail Secretion Filtrate dan Niacinamide, eye patch ini dapat membantu kulit yang kusam & lelah menjadi ternutrisi dan cerah. Cocok untuk penggunaan malam hari.', 'produk1671895055.png', 1, '2022-12-24 15:17:35', 11),
(79, 8, 'Cosrx AHA dan BHA Clarifying Treatment Toner', 150000, 'AHA/BHA Clarifying Treatment Toner memiliki formula ringan yang berguna untuk menenangkan, menyegarkan, dan melembutkan kulit melalui proses eksfoliasi super lembut dengan bahan AHA+BHA+Purifying Botanical. Dapat diandalkan untuk memperbaiki tekstur kulit, meningkatkan vitalitas, sekaligus mengontrol pori-pori.', 'produk1671895115.jpg', 1, '2022-12-24 15:18:35', 8),
(80, 8, 'Cosrx Centella Water Alcohol-Free Toner', 157500, 'Toner dengan 82% air mineral dari Jeju dan 10% ekstrak air daun Centella Asiatica yang berfungsi untuk menenangkan kulit yang iritasi karena jerawat/stress, menghidrasi, dan menutrisi kulit dengan vitamin dan mineral.', 'produk1671895189.jpg', 1, '2022-12-24 15:19:49', 7),
(81, 8, 'COSRX One Step Green Hero Calming Pad', 209930, 'COSRX One Step Green Hero Calming Pad merupakan set toner wajah yang memberikan sensasi menenangkan kulit sensitif. Diformulasikan dengan green tea dan witch hazel, toner yang lembut ini mampu menyamarkan pori-pori yang terlihat, menghidrasi kulit, mengurangi minyak berlebih dan mengurangi kemerahan pada kulit.', 'produk1671895319.jpg', 1, '2022-12-24 15:21:59', 15),
(82, 9, 'Dear Me Beauty Skin Barrier Body Serum', 67640, 'Body serum dengan Waterburst Technology yang mudah menyerap dan memberikan efek menyegarkan ketika dipakai dengan perpaduan Tuberose dan Jasmine serta kelembutan Musk dan Sandalwood, menciptakan keharuman floral yang hangat tahan hingga 10 jam.\r\n\r\nMencerahkan:  4% Niacinamide yang bermanfaat meratakan  warna kulit, memudarkan bekas jerawat dan kehitaman.\r\nMelindungi: 3 Ceramide memperbaiki skin barrier, dan menjaga kulit dari iritan.\r\nMelembapkan: 4D Hyaluronic Acid adalah gabungan 4 jenis HA yang mampu melembapkan kulit hingga ke lapisan kulit terdalam, mengunci hidrasi kulit.\r\n\r\nJenis kulit: Semua jenis kulit\r\n\r\nHero Ingredients:\r\n4% Niacinamide\r\n4D Hyaluronic Acid\r\n3 Ceramide Complex\r\n\r\nScent: Tuberose, Jasmine, Musk, Sandalwood\r\n\r\nUnique Selling  Points:\r\n✅Non-Greasy.\r\n✅Zero Residue.\r\n\r\n*Aman digunakan ibu hamil dan menyusui\r\n*Dapat digunakan dari usia 9 tahun', 'produk1671895482.png', 1, '2022-12-24 15:24:42', 12),
(83, 8, 'Dear Me Beauty Skin Barrier Toner Essence', 60040, 'Hydrating toner dengan pH 5.5 yang merawat kulit dengan menjaga skin barrier serta mengembalikan pH alami kulit, sekaligus menjaga hidrasi kulit.\r\n \r\n- 10x moisturizing power, dengan kandungan Quadruple Hyaluronic Acid membantu mengunci hidrasi.\r\n- 12x Nano Ceramide dengan Ferment Ice Plan Technology membantu mengunci kelembapan kulit dan menjaga skin barrier\r\n- Diperkaya Cica yang terbukti mampu meredakan peradangan akibat jerawat, kulit rusak, sensitif.\r\n\r\nJenis kulit: Semua jenis kulit\r\n\r\nHero Ingredients:\r\nEncapsulated Ceramide Complex\r\nQuadruple Hyaluronic Acid\r\nCica & Allantoin\r\nPolyglutamic Acid\r\n\r\nUnique Selling  Points:\r\n✅pH 5.5-6.0\r\n✅Dermatologically Tested\r\n✅Alcohol Free\r\n\r\n*Aman digunakan ibu hamil dan menyusui\r\n*Dapat digunakan dari usia 9 tahun\r\n\r\nHasil uji responden mengatakan:\r\n97% setuju Skin Barrier Toner Essence melembapkan kulit dengan\r\nsangat baik.\r\n86,4% setuju Skin Barrier Toner Essence tidak mengiritasi kulit.\r\n86,4% setuju Skin Barrier Toner Essence tidak membuat wajah\r\nberminyak setelah pemakaian.\r\n77,3% setuju Skin Barrier Toner Essence membuat wajah lebih\r\nkenyal setelah pemakaian.', 'produk1671897264.png', 1, '2022-12-24 15:54:24', 12),
(84, 9, 'Dove Care & Protect Body Wash', 120000, 'Sabun mandi yang paling baik adalah yang membuat kulitmu terasa bersih dan ternutrisi setelah mandi. Dengan sabun mandi Dove, kamu bisa mengubah salah satu ritual harianmu menjadi suatu bentuk perawatan untuk menjaga kulitmu tetap cantik dan lembap.', 'produk1671897373.png', 1, '2022-12-24 15:56:13', 10),
(85, 8, 'Emina Lip Mask Vanilla Pretzel', 39500, 'Pelembab bibir yang dapat mengurangi tampilan bibir kering dan pecah-pecah dan memberikan kelembapan ekstra pada bibir di pagi hari. Dapat digunakan sebagai lip care di pagi hari dan sebagai lip mask di malam hari. Kini hadir dalam 3 varian baru : Vanilla Pretzel, Orange Squash dan Milky Matcha.', 'produk1671897444.png', 1, '2022-12-24 15:57:24', 10),
(86, 8, 'Emina Sugar Rush Lip Scrub', 35945, 'Apakah kalian sering memakai lipstick setiap hari? bibir Namun pastikan bibir kalian tetap mendapat nutrisi ya! Kini Emina memiliki Lip scrub yaitu Sugar Rush Lip Scrub dengan Perpaduan manisnya gula dan biji aprikot menghasilkan bibir yang lembut dan memukau. Ekstrak Shea Butter, Olive Oil, dan Jojoba Oil menjaga bibir tetap lembab. Kandungan Vitamin C dan E dalam Lip Scrub menjaga bibirmu agar tidak kering.', 'produk1671897583.jpg', 1, '2022-12-24 15:59:43', 12),
(87, 11, 'FORDIVE 1970', 223200, 'Parfum elegnat dengan aroma  spices dan Woody yang membuat kita merasakan ke utuhan sebuah kemaskulinan, dipadukan dengan aroma sedikit manis dan amber untuk mempertegas aroma sexy dari seorang pria dan sangat cocok untuk digunakan di moment romantis .', 'produk1671897646.png', 1, '2022-12-24 16:00:46', 5),
(88, 11, 'FORDIVE Atlantis', 199200, 'Parfum elegant dengan aroma Fresh Aquatik yang membawa anda untuk merasakan damainya suasana pantai dengan kesegaran yang khas, yang dapat menciptakan perasaan nyaman, relax dan berkarakter.', 'produk1671897709.png', 1, '2022-12-24 16:01:49', 5),
(89, 11, 'FORDIVE Love Yourself', 183200, 'Parfum Elegant dengan aroma Fresh dan floral yang meningkatkan semangat di hari hari yang mulai terasa bosan di balut dengan dengan kualitas terbaik dari Green Mandarin, Cinnamon & Exotic Floral. Ini memberi Anda perasaan elegan & percaya diri.', 'produk1671897764.png', 1, '2022-12-24 16:02:44', 5),
(90, 9, 'Vaseline Healthy Bright Body Lotion UV Lightening', 56672, 'Terpapar sinar UV, polutan, dan hal berbahaya lain setiap hari dapat memicu produksi melanin, sehingga membuat kulitmu tampak lebih gelap dan rusak. Vaseline Healthy White UV Lightening mengandung bahan-bahan aman, seperti Vitamin B3 alami, Triple sunscreens menghalangi sinar UVA dan UVB untuk melindungi kecerahan kulit dari kerusakan lebih lanjut. Lotion ini aman digunakan untuk perawatan sehari - hari dan mencerahkan kulit.', 'produk1671897906.png', 0, '2022-12-24 16:05:06', 20),
(91, 11, 'HMNS Addict', 249000, 'Membuat parfum dengan sifat adiktif. Adalah challenge di balik project ini. Dalam perjalanannya, kita mencari ratusan tanaman. Mengekstraknya satu per satu. Hingga menemukan satu formulasi yang saat disemprotkan, akan mengeluarkan aroma fruity dari berry. Lalu secara misterius berubah menjadi rempah coffee yang membuat nyaman. Lalu ia menutup pertunjukkannya dengan kehangatan dari amber & tonka bean. Sebuah karya yang kita sebut dengan. HMNS Addict\r\n\r\nPerforma\r\nKetahanan: 6 hours\r\nDaya jejak: sedang\r\nProteksi: 2 meter', 'produk1671897991.png', 1, '2022-12-24 16:06:31', 8),
(92, 11, 'HMNS Alpha', 320000, 'Alpha, memiliki karakter segar & menenangkan. Merupakan varian pertama HMNS. Memiliki top notes Citrus & Grass. Serta middle & base notes Cedarwood & Green Tea. Type: Unisex Longevity: Up to 6 hours Sillage: Medium - strong Projection: 2 - 3 meters .', 'produk1671898048.png', 1, '2022-12-24 16:07:28', 7),
(93, 8, 'Nacific Fresh Herb Origin Eye Cream', 149560, 'Kini hadir dalam wajah dan formulasi baru untuk Indonesia!\r\n\r\nProduk krim mata yang dapat menghilangkan kerutan halus di muka. Membuat kulit pada bagian mata yang sensitif kembali menjadi cerah, serta mengencangkan elastisitas kulit. Mengandung Hyaluronic atau disebut juga sodium Hyaluronate bermanfaat untuk melembabkan kulit di daerah mata dan memperkuat bagian dalam kulit agar tidak kendur. Serta mengandung Niacinamide yang bekerja menahan melanin pigment dalam kulit pada siang dan malam hari agar tetap bersinar dan mengkilap.\r\n\r\nSerta mengandung adenosine yang bekerja menghilangkan kerut kerut halus di muka.', 'produk1671898227.png', 1, '2022-12-24 16:10:27', 15),
(94, 13, 'Mybelline Fit Me Concealer', 129900, 'Concealer dengan coverage tinggi dengan hasil natural untuk tampilan fresh. Tersedia dalam 5 shades.\r\nManfaat:\r\nCoverage tinggi namun dengan formula ringan yang membuat kulit tetap dapat bernapas. Concealer adalah “senjata ampuh” untuk tampil flawless\r\nCara pemakaian:\r\nAplikasikan pada bagian wajah yang bernoda dan bawah mata. Ratakan menggunakan tangan.\r\nHighlight Product :\r\n- Coverage lebih menyeluruh\r\n- Cocok untuk menghasilkan makeup natural\r\n- Formula ringan\r\nKomposisi:\r\nWater (Aqua), Cyclopentasiloxane, Hydrogenated Polyisobutene, Glycerin, Sorbitan Isostearate, Propylene Glycol, Titanium Dioxide, Ozokerite, Phenoxyethanol, Magnesium Sulfate, Disteardimonium Hectorite, Disodium Stearoyl Glutamate, Methylparaben, Acrylates Crosspolymer, Alumina, Butylparaben, Aluminum Hydroxide, Tocopherol, Silica, Chamomilla Recutita (Matricaria Flower Extract)', 'produk1672025615.jpg', 1, '2022-12-26 03:33:35', 20),
(95, 13, 'Maybelline Instant Age Rewinder Concealer ', 150400, 'Maybelline Instant Age Rewind Dark Spot Concealer + Treatment merupakan concealer yang juga memberikan perawatan Vitamin C pada area bawah mata serta dapat membantu menyamarkan noda hitam. Produk yang mengandung Goji Berry dan Haloxyl ini juga dapat membantu mengurangi tampilan noda hitam hanya dalam waktu 4 minggu. Hasil akhir yang dewy finish, cocok untuk mengcover area bekas jerawat karena tidak memberikan efek kering sehingga tidak tidak crack.\r\nCara Pemakaian:\r\nPutar Bagian leher yang berwarna merah ini ke kanan seperti gambar arah panah di bawah agar isi concealer dapat keluar. Saat pemakaian pertama kali butuh beberapa kali untuk membuat isinya keluar. Namun setelahnya bisa sekitar 3-4 kali bunyi klik.\r\nGunakan langsnyng ke bawah mata, atau spot yang ingin di cover lalu blend hingga warnanya merata.', 'produk1672025682.jpg', 1, '2022-12-26 03:34:42', 6),
(96, 13, 'Maybelline Fit Me Loose Powder ', 133834, 'Maybelline Fit Me! Loose Finishing Powder adalah bedak dari Maybelline dengan hasil matte yang sesuai dengan warna kulit. Bedak tabur inovasi terbaru ini diciptakan khusus untuk jenis kulit normal cenderung berminyak. Maybelline Fit Me! Loose Finishing Powder diklaim dapat meratakan warna kulit, sehingga hasil akhir atau finishing-nya terlihat lebih natural, kulit tampak tidak berpori, lebih tahan lama, dan bebas kilap hingga 12 jam.\r\n\r\nBedak yang pelengkap complexion usai mengaplikasikan foundation/ concealer mengandung mineral dengan formula yang ringan ini bertujuan untuk mengontrol kadar minyak pada wajah dan menjadikan kulit terlihat lebih halus dan flawless. \r\nCara Pemakaian:\r\nAmbil produk menggunakan kuas bedak, kemudian ketukan kuas terlebih dahulu secara perlahan supaya tidak ada bubuk yang terlalu banyak. Lalu sapukan secara lembut ke seluruh kulit wajah beserta leher Anda agar terlihat membaur dengan warna kulit.', 'produk1672025728.jpg', 1, '2022-12-26 03:35:28', 13),
(97, 13, 'Maybelline The Falsies Lash Lift ', 93549, 'LASH LIFT EFFECT IN A MINUTE! Mudah, cepat, dan ga mahal!\r\nMaskara Waterproof dengan lash lift effect yang tahan hingga 16 jam. All Day Formula infused with fiber yang akan membuat bulu mata terlihat lebih panjang dan tebal. Bulu mata terlihat lentik dengan double curved lifting brush yang dapat menjangkau seluruh bulu matamu. Mata terlihat lebih fresh dengan lash lift effect.', 'produk1672025775.png', 1, '2022-12-26 03:36:15', 17),
(98, 13, 'Maybelline Lash Sensational Sky High Mascara', 120000, '\"Maybelline Lash Sensational Sky High Mascara, merupakan Maskara dengan formula waterproof dan mengandung bambu untuk memanjangkan dan menebalkan bulu mata. Dapatkan hasil bulu mata dramatis dari segala arah.\r\nAllgergy tested\r\nOphthalmologist tested\r\nCocok untuk mata sensitif dan pemakai lensa kontak.\r\nKEUNGGULAN:\r\n- Bulu mata ekstra panjang & tebal\r\n- Dramatis dari segala arah\r\n- Waterproof\r\n- Sikat fleksibel\r\n- Tahan hingga 24 jam\r\n- Mengandung formula yang dapat memanjangkan & menebalkan bulu mata\r\nUkuran: 6ML\r\nNo. BPOM: NE51211200143\"\r\nCARA PEMAKAIAN:\r\n1. Tahan sikat fleksibel maskara Maybelline Lash Sensational Sky High pada bulu mata.\r\n2. Rentangkan dari pangkal bulu mata sampai ujung. Ulangi hingga volume dan panjang yang diinginkan tercapai.\r\nKANDUNGAN:\r\nISODODECANE, CERA ALBA / BEESWAX, COPERNICIA CERIFERA CERA / CARNAUBA WAX, DISTEARDIMONIUM HECTORITE, AQUA / WATER, ALCOHOL DENAT, ALLYL STEARATE/VA COPOLYMER, ORYZA SATIVA CERA / RICE BRAN WAX, PARAFFIN, POLYVINYL LAURATE, VP/EICOSENE COPOLYMER, PROPYLENE CARBONATE, TALC, SYNTHETIC BEESWAX, ETHYLENEDIAMINE/STEARYL DIMER DILINOLEATE COPOLYMER, PEG-30 GLYCERYL STEARATE, RAYON, HYDROGENATED JOJOBA OIL, CAPRYLIC/CAPRIC TRIGLYCERIDE, SILICA, PENTAERYTHRITYL TETRA-DI-T-BUTYL HYDROXYHYDROCINNAMATE, BAMBUSA VULGARIS EXTRACT, BHT. [+/- MAY CONTAIN CI 77491, CI 77492, CI 77499 / IRON OXIDES, CI 77007 / ULTRAMARINES, MICA, CI 77891 / TITANIUM DIOXIDE, CI 75470 / CARMINE, CI 77288 / CHROMIUM OXIDE GREENS, CI 77742 / MANGANESE VIOLET, CI 77510 / FERRIC FERROCYANIDE.', 'produk1672025821.png', 1, '2022-12-26 03:37:01', 18),
(99, 13, 'Ezqa Bronzer ', 75000, 'Warna-warni Bronzer dari Esqa sangat menawan dengan daya tutup yang buildable. Tingkatkan rona pipimu dengan bronzer ini. Bronzer ini Vegan, Halal dan terbuat tanpa bahan kimia berbahaya. Ukurannya sangat cocok untuk travelling\r\nCara Penggunaan:\r\nPulaskan bronzer menggunakan kuas lembut ukuran medium pada tulang pipimu untuk hasil akhir yang lembut alami.\r\nKomposisi:\r\nMica, Talc, Dimethicone, Cyclopentasiloxane, Pentaerythrityl, Tetraisostearate, Barium Sulfate, Triethoxycaprylylsilane, Magnesium Myristate, Dimethiconol, Ethylhexyl Methoxycinnamate, Benzophenone-3, BHT, Sorbitan Laurate, DMDM Hydantoin, Iodopropynyl Butylcarbamate, Water, CI 77491, CI 77492, CI 77499.', 'produk1672025872.png', 1, '2022-12-26 03:37:52', 11),
(100, 13, 'Superstay Matte Ink Un-Nude Liquid Lipstick ', 125000, 'Lip cream terbaik dari Maybelline yang semakin memperkuat karaktermu dengan tekstur cair dan ink formula yang melembabkan serta memberikan hasil warna intens dan tahan lama.\r\nLip cream matte dengan ink formula yang menghasilkan warna-warna intens. Tahan lama sampai 16 jam.\r\nManfaat:\r\n- Aplikator liquid lipstick berbentuk arrow yang unik.\r\n- Ink formula untuk hasil warna matte lip cream intens.\r\n- Tahan lama hingga 16 jam.\r\nCara pemakaian:\r\nLangkah 1. Aplikasikan di bagian tengah bibir bagian atas lalu ikuti kontur bibir.\r\nLangkah 2. Pulas Super Stay Matte Ink di seluruh bagian bibir bawah.', 'produk1672049353.jpg', 1, '2022-12-26 10:09:13', 11),
(101, 13, 'Maybelline Sensational Liquid Matte Lipstick ', 90000, 'Maybelline Sensational Liquid Matte tergolong liquid matte dengan konsistensi yang cenderung cair, namun tetap mudah diratakan dan tidak patchy. Konsistensi yang cair dan lembut ini membuat produk sangat mudah dipulaskan dan terasa breathable. Walaupun cair, lipstik akan langsung matte dalam hitungan detik.', 'produk1672049397.jpg', 1, '2022-12-26 10:09:57', 76),
(102, 13, 'Esqa Radiant Cushion Blush ', 96000, 'Komposisi : \r\nwater, isododecane, cyclopentasiloxane, ethylhexyl palmitate, propylene glycol, dimethicone, silica, butylene glycol, octyldodecanol, mineral oil, caprylic/capric triglyceride, hydrogenated polydecene, sorbitan sesquioleate, steareth-21, chlorphenesin, bht, fragrance, iodopropynyl butylcarbamate.', 'produk1672049490.png', 1, '2022-12-26 10:11:30', 5),
(103, 13, 'Esqa Lip Gloss ', 60000, 'Lip Gloss ini mempunyai full coverage dengan hasil yang mengkilap.\r\nLip Gloss ini memberikan kelembaban yang bertahan lama. Gloss ini vegan dan diperkaya dengan Vitamin E untuk menjaga bibir tetap terhidrasi\r\nIngredients :\r\nHydrogenated Polyisobutene, Polyisobutene, Phenyl Trimethicone, Caprylic/Capric Triglyceride, Ceresin, Dextrin Palmitate/Ethylhexanoate, Tridecyl Trimellitate, Phenoxyethanol, Butyrospermum Parkii (Shea) Butter, Flavour, Ethylhexyl Methoxycinnamate, Tocopheryl Acetate, BHT, Bisabolol, Water. ', 'produk1672049575.png', 1, '2022-12-26 10:12:55', 10);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `pembayaran` varchar(255) NOT NULL,
  `payment_method_code` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `merchant_ref` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `pay_code` varchar(255) NOT NULL,
  `checkout_url` varchar(255) NOT NULL,
  `paid_at` varchar(255) DEFAULT NULL,
  `expired_at` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` varchar(255) DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT current_timestamp(),
  `courier_name` varchar(255) NOT NULL,
  `shipment_description` varchar(255) NOT NULL,
  `shipment_duration` varchar(255) NOT NULL,
  `shipment_price` varchar(255) NOT NULL,
  `total_pembayaran` int(255) NOT NULL,
  `status_pesanan` varchar(255) NOT NULL DEFAULT 'Pesanan Masuk',
  `no_resi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_pelanggan`, `total_harga`, `pembayaran`, `payment_method_code`, `reference`, `merchant_ref`, `amount`, `pay_code`, `checkout_url`, `paid_at`, `expired_at`, `status`, `created_at`, `updated_at`, `courier_name`, `shipment_description`, `shipment_duration`, `shipment_price`, `total_pembayaran`, `status_pesanan`, `no_resi`) VALUES
(1, 1, 374400, 'COD - Cash On Delivery', 'COD', '', '', '374400', '', '', NULL, '2023-06-18 23:04:10', 'PAID', '2023-06-19 23:04:10', NULL, 'JNE', 'Layanan reguler', '1 - 2 days', '9000', 383400, 'Penerimaan', 'asd1223123123'),
(2, 1, 159400, 'BCA Virtual Account', 'BCAVA', 'DEV-T320297501NRUBT', 'INV-PIYQ-2852', '159400', '212673214699441', 'https://tripay.co.id/checkout/DEV-T320297501NRUBT', NULL, '2023-06-18 23:43:29', 'UNPAID', '2023-06-19 23:43:29', NULL, 'JNE', 'Layanan reguler', '1 - 2 days', '9000', 168400, 'Penerimaan', 'sdf hjk,asdk,gbhjdf,ASBJK'),
(3, 1, 84000, 'COD - Cash On Delivery', 'COD', '', '', '84000', '', '', NULL, '2023-06-18 23:55:00', 'UNPAID', '2023-06-19 23:55:00', NULL, 'JNE', 'Layanan reguler', '1 - 2 days', '9000', 93000, 'Penerimaan', 'wdlahjkfasdghjklasdefhjk');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_barang`
--

CREATE TABLE `transaksi_barang` (
  `id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi_barang`
--

INSERT INTO `transaksi_barang` (`id`, `transaksi_id`, `product_id`, `jumlah`) VALUES
(1, 1, 100, 1),
(2, 1, 101, 1),
(3, 1, 95, 1),
(4, 2, 95, 1),
(5, 3, 99, 1);

--
-- Triggers `transaksi_barang`
--
DELIMITER $$
CREATE TRIGGER `update_stok_barang_dari_transaksi_barang` AFTER INSERT ON `transaksi_barang` FOR EACH ROW UPDATE tb_product
     SET stock = stock - NEW.jumlah
   WHERE tb_product.product_id = NEW.product_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_lawas`
--

CREATE TABLE `transaksi_lawas` (
  `id` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_pemesanan` varchar(255) NOT NULL DEFAULT current_timestamp(),
  `total_harga` varchar(255) NOT NULL,
  `pembayaran` varchar(255) NOT NULL,
  `courier_name` varchar(255) NOT NULL,
  `shipment_description` text NOT NULL,
  `shipment_duration` varchar(255) NOT NULL,
  `shipment_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi_lawas`
--

INSERT INTO `transaksi_lawas` (`id`, `id_pelanggan`, `tanggal_pemesanan`, `total_harga`, `pembayaran`, `courier_name`, `shipment_description`, `shipment_duration`, `shipment_price`) VALUES
(5, 6, '2022-12-24 16:10:10', '7500', 'bca', '0', '0', '0', 0),
(17, 9, '2022-12-24 19:42:21', '750000', 'bca', '0', '0', '0', 0),
(18, 9, '2022-12-24 19:51:25', '250000', 'bca', '0', '0', '0', 0),
(31, 8, '2022-12-26 11:12:00', '195000', 'bni', '0', '0', '0', 0),
(32, 15, '2023-04-05 15:15:25', '93549', 'bca', '0', '0', '0', 0),
(33, 16, '2023-05-18 16:46:28', '279549', 'bca', '0', '0', '0', 0),
(34, 16, '2023-05-18 16:47:44', '93549', 'bca', '0', '0', '0', 0),
(35, 16, '2023-05-18 16:49:04', '93549', 'bca', '0', '0', '0', 0),
(36, 16, '2023-05-18 17:01:23', '93549', 'bca', '0', '0', '0', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tb_cart`
--
ALTER TABLE `tb_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_lawas`
--
ALTER TABLE `transaksi_lawas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_cart`
--
ALTER TABLE `tb_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi_lawas`
--
ALTER TABLE `transaksi_lawas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_product`
--
ALTER TABLE `tb_product`
  ADD CONSTRAINT `tb_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
