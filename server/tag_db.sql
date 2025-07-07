--
-- Base de datos: `tag_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_cart`
--

CREATE TABLE `t_cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(1) NOT NULL,
  `is_staging` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_cart`
--

INSERT INTO `t_cart` (`cart_id`, `user_id`, `creation_date`, `is_active`, `is_staging`) VALUES
(1, 1, '2025-07-07 05:34:46', 0, 0),
(5, 1, '2025-07-07 05:42:42', 0, 1),
(6, 1, '2025-07-07 05:50:21', 0, 0),
(7, 1, '2025-07-07 05:54:13', 0, 0),
(8, 1, '2025-07-07 05:55:36', 0, 0),
(9, 1, '2025-07-07 06:28:15', 0, 0),
(10, 1, '2025-07-07 06:51:27', 0, 1),
(11, 1, '2025-07-07 07:01:50', 0, 1),
(12, 1, '2025-07-07 07:03:01', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_cart_details`
--

CREATE TABLE `t_cart_details` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` float NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_cart_details`
--

INSERT INTO `t_cart_details` (`cart_id`, `product_id`, `quantity`, `total_price`, `update_date`, `updated_by`) VALUES
(1, 2, 1, 3808.12, NULL, '177691@upslp.ed'),
(1, 7, 1, 3215.73, '2025-07-07 05:08:10', '177691@upslp.ed'),
(1, 24, 1, 4107.37, '2025-07-07 05:08:22', '177691@upslp.ed'),
(1, 38, 1, 3327.27, '2025-07-07 04:57:14', '177691@upslp.ed'),
(1, 44, 1, 2526.61, '2025-07-07 03:05:31', '177691@upslp.ed'),
(5, 4, 1, 3823.41, '2025-07-07 04:24:42', '177691@upslp.ed'),
(6, 1, 1, 742.29, '2025-07-07 05:50:01', '177691@upslp.ed'),
(6, 11, 1, 1227.56, '2025-07-07 05:49:57', '177691@upslp.ed'),
(6, 21, 1, 930.93, '2025-07-07 05:50:05', '177691@upslp.ed'),
(6, 31, 1, 701.86, '2025-07-07 05:50:07', '177691@upslp.ed'),
(6, 41, 1, 981.98, '2025-07-07 05:50:10', '177691@upslp.ed'),
(7, 2, 1, 3808.12, '2025-07-07 05:53:25', '177691@upslp.ed'),
(8, 2, 1, 3808.12, '2025-07-07 05:55:32', '177691@upslp.ed'),
(9, 4, 4, 15293.6, '2025-07-07 06:15:09', '177691@upslp.ed'),
(9, 7, 1, 3215.73, '2025-07-07 06:22:18', '177691@upslp.ed'),
(9, 9, 3, 4778.94, '2025-07-07 06:22:36', '177691@upslp.ed'),
(10, 48, 1, 1108.47, '2025-07-07 06:51:17', '177691@upslp.ed'),
(11, 1, 1, 742.29, '2025-07-07 06:52:07', '177691@upslp.ed'),
(12, 33, 1, 840.78, '2025-07-07 07:02:29', '177691@upslp.ed'),
(12, 37, 1, 284.72, '2025-07-07 07:02:27', '177691@upslp.ed');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_category_catalog`
--

CREATE TABLE `t_category_catalog` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `additional_details` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_category_catalog`
--

INSERT INTO `t_category_catalog` (`category_id`, `name`, `description`, `additional_details`) VALUES
(1, 'Audio y Accesorios', 'Some description', 'Some Details'),
(2, 'Wearables y Salud Digital', 'Some description', 'Some Details'),
(3, 'Accesorios para Celulares y Computadoras', 'Some description', 'Some Details'),
(4, 'Hogar Inteligente', 'Some description', 'Some Details'),
(5, 'Gaming y Entretenimiento', 'Some description', 'Some Details');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_order`
--

CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `order_total` float NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(20) NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_order`
--

INSERT INTO `t_order` (`order_id`, `user_id`, `status_id`, `shipping_id`, `payment_id`, `cart_id`, `warehouse_id`, `receiver_name`, `order_total`, `creation_date`, `created_by`, `update_date`, `updated_by`) VALUES
(1, 1, 1, 1, 1, 1, 1, 'Mauricio Rosales', 16985.1, '2025-07-07 05:26:59', '177691@upslp.edu.mx', NULL, ''),
(2, 1, 2, 1, 1, 1, 1, 'Mauricio Rosales', 16985.1, '2025-07-07 05:33:10', '177691@upslp.edu.mx', NULL, ''),
(3, 1, 2, 1, 1, 1, 1, 'Mauricio Rosales', 16985.1, '2025-07-07 05:34:46', '177691@upslp.edu.mx', NULL, ''),
(4, 1, 2, 3, 1, 6, 4, 'Mauricio Rosales', 4584.62, '2025-07-07 05:50:21', '177691@upslp.edu.mx', NULL, ''),
(5, 1, 2, 1, 1, 7, 2, 'Mauricio Rosales', 3808.12, '2025-07-07 05:54:13', '177691@upslp.edu.mx', NULL, ''),
(6, 1, 2, 1, 1, 8, 1, 'Mauricio Rosales', 3808.12, '2025-07-07 05:55:36', '177691@upslp.edu.mx', NULL, ''),
(7, 1, 2, 1, 1, 9, 2, 'Mauricio Rosales', 23288.3, '2025-07-07 06:28:15', '177691@upslp.edu.mx', NULL, ''),
(8, 1, 2, 2, 1, 10, 3, 'Mauricio Rosales', 1108.47, '2025-07-07 06:51:27', '177691@upslp.edu.mx', NULL, ''),
(9, 1, 2, 1, 1, 11, 1, 'Mauricio Rosales', 742.29, '2025-07-07 07:01:50', '177691@upslp.edu.mx', NULL, ''),
(10, 1, 2, 3, 1, 12, 4, 'Mauricio Rosales', 1125.5, '2025-07-07 07:03:01', '177691@upslp.edu.mx', NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_order_history`
--

CREATE TABLE `t_order_history` (
  `history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(15) NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_order_status_catalog`
--

CREATE TABLE `t_order_status_catalog` (
  `status_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_order_status_catalog`
--

INSERT INTO `t_order_status_catalog` (`status_id`, `name`, `description`) VALUES
(1, 'Pending Payment', 'Order created, waiting for payment confirmation'),
(2, 'Paid', 'The payment was received'),
(3, 'Processing', 'The order is being prepared'),
(4, 'Shipped', 'The order was dispatched to the customer'),
(5, 'In Transit', 'The order is on its way'),
(6, 'Delivered', 'The order was received by the customer'),
(7, 'Cancelled', 'The order was cancelled'),
(8, 'Refunded', 'The payment was returned'),
(9, 'Failed', 'The payment or delivery process failed'),
(10, 'Returned', 'The customer returned the product');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_payment_details`
--

CREATE TABLE `t_payment_details` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `card_type` varchar(50) NOT NULL,
  `cvv_number` varchar(3) NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_payment_details`
--

INSERT INTO `t_payment_details` (`payment_id`, `user_id`, `username`, `card_number`, `card_type`, `cvv_number`, `expiry_date`) VALUES
(1, 1, 'Beck Waller', '5366-4973-8869-5516', 'MASTERCARD', '563', '2029-09-08 06:00:00'),
(2, 2, 'Willow Wilkinson', '6882-9581-9666-8728', 'AMEX', '927', '2029-05-08 06:00:00'),
(3, 3, 'Rhonda Newman', '9394-6188-2241-8895', 'AMEX', '605', '2028-09-26 06:00:00'),
(4, 4, 'Dolan Neal', '6910-1198-4821-4622', 'AMEX', '982', '2026-01-19 06:00:00'),
(5, 5, 'Quin Rhodes', '9435-8193-8561-5187', 'VISA', '150', '2028-05-24 06:00:00'),
(6, 6, 'Iliana Beasley', '4563-3177-5801-7186', 'MASTERCARD', '271', '2026-03-05 06:00:00'),
(7, 7, 'Hasad Daugherty', '5929-2505-2784-7732', 'VISA', '161', '2027-06-15 06:00:00'),
(8, 8, 'Chase Wagner', '1228-1048-3084-8115', 'AMEX', '164', '2028-10-18 06:00:00'),
(9, 9, 'Mechelle Hammond', '3353-2063-0117-9553', 'AMEX', '418', '2030-01-04 06:00:00'),
(10, 10, 'Alfreda Buck', '2464-4011-3907-4135', 'AMEX', '377', '2027-05-26 06:00:00'),
(11, 11, 'Lila Atkins', '7654-4816-7425-4621', 'MASTERCARD', '888', '2028-02-06 06:00:00'),
(12, 12, 'Erica Vaughn', '3067-7621-1614-3625', 'MASTERCARD', '474', '2028-05-25 06:00:00'),
(13, 13, 'Michael Anthony', '5936-5552-6501-7180', 'VISA', '137', '2029-11-19 06:00:00'),
(14, 14, 'Tanek Knight', '9257-7444-4097-1537', 'VISA', '937', '2027-07-02 06:00:00'),
(15, 15, 'Zephr Dominguez', '8515-8249-8604-8466', 'MASTERCARD', '177', '2029-01-08 06:00:00'),
(16, 16, 'Jack Arnold', '8648-9031-0609-6236', 'VISA', '386', '2027-06-17 06:00:00'),
(17, 17, 'Ulysses Yates', '1511-6817-1678-2495', 'MASTERCARD', '471', '2028-07-30 06:00:00'),
(18, 18, 'Wyatt Duncan', '3741-1831-8561-8753', 'VISA', '446', '2027-11-18 06:00:00'),
(19, 19, 'Kirby Martin', '7201-6296-1850-2951', 'VISA', '374', '2028-07-26 06:00:00'),
(20, 20, 'Burton Barker', '5109-7604-5713-4914', 'VISA', '270', '2026-12-05 06:00:00'),
(21, 21, 'Jack Bennett', '3623-4768-1235-7638', 'MASTERCARD', '505', '2026-06-29 06:00:00'),
(22, 22, 'Holly Bright', '2231-0437-2891-5666', 'VISA', '742', '2028-06-04 06:00:00'),
(23, 23, 'Bert Vargas', '7470-5481-6025-6626', 'VISA', '925', '2029-10-25 06:00:00'),
(24, 24, 'Hamish Morton', '2378-4626-3416-2251', 'AMEX', '745', '2027-01-09 06:00:00'),
(25, 25, 'Zeph Clay', '7194-7515-3439-5223', 'AMEX', '591', '2026-12-01 06:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_product`
--

CREATE TABLE `t_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `stock` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `weight` float NOT NULL,
  `dimensions` float NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(15) NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(15) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_product`
--

INSERT INTO `t_product` (`product_id`, `category_id`, `name`, `description`, `price`, `stock`, `is_active`, `weight`, `dimensions`, `creation_date`, `created_by`, `update_date`, `updated_by`, `image_url`) VALUES
(1, 1, 'Auriculares inalámbricos Bluetooth', 'Some Description', 742.29, 123, 1, 2.747, 0.957496, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.stuffactory.mx/cdn/shop/products/ST-H16444_AurumOE_Gray-1_65734dda-f24a-49ef-af38-d79bedfa60e6_800x.png?v=1681494462'),
(2, 1, 'Bocina portáti (mini speaker)', 'Some Description', 3808.12, 96, 1, 1.512, 0.258025, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://acteck.com/cdn/shop/files/AC-934961-isometrica.webp?v=1690312883'),
(3, 1, 'Audífonos inalámbricos de oído abierto', 'Some Description', 2714.46, 155, 1, 1.6, 0.761793, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://cigalacycling.be/cdn/shop/files/BK-2_600x_4b8d5d41-d42d-461e-a7e1-43c0b0695363_600x.png?v=1688679287'),
(4, 1, 'Soundbar para TV', 'Some Description', 3823.41, 108, 1, 1.359, 0.397346, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://images.samsung.com/is/image/samsung/mx-soundbar-hw-t420-hw-t420-zx-setrperspectiveblack-238082303?$684_547_PNG$'),
(5, 1, 'Adaptador Bluetooth para autos', 'Some Description', 1039.67, 122, 1, 2.293, 0.276996, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.electrocapital.com.mx/cdn/shop/products/PJ068.png?v=1584664921'),
(6, 1, 'Micrófono USB para streaming y podcast', 'Some Description', 1849.8, 152, 1, 1.099, 0.271909, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.falymusic.com/images/detailed/36/68e659acab1d79636eb0872976a43049.png'),
(7, 1, 'Auriculares con cancelación activa de ruido', 'Some Description', 3215.73, 187, 1, 0.398, 0.0932427, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://perfectchoice.me/cdn/shop/products/AudifonosbluetoothconcancelacionderuidoactivaPerfectChoice_800x.png?v=1638312936'),
(8, 1, 'Cargador inalámbrico para dispositivos', 'Some Description', 4675.16, 136, 1, 2.707, 0.922825, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.battever.com/wp-content/uploads/2019/06/wireless-qi-carga-moviles.png'),
(9, 1, 'Estación de carga múltiple (multi-device)', 'Some Description', 1592.98, 178, 1, 2.302, 0.312025, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://eu-main.iniushop.com/cdn/shop/files/I220.png?v=1747879853&width=533'),
(10, 1, 'Soporte para auriculares con carga', 'Some Description', 1126.39, 138, 1, 2.573, 0.0955206, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://balamrush.com/cdn/shop/files/BR-931502_05_1000PX.webp?v=1705505841&width=1000'),
(11, 2, 'Smartwatch con monitor de frecuencia cardíaca', 'Some Description', 1227.56, 130, 1, 2.173, 0.0258114, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://consumer.huawei.com/dam/content/dam/huawei-cbg-site/common/mkt/pdp/wearables/watch-d/img/pc/huawei-watch-d-ecg-analysis.png'),
(12, 2, 'Pulsera de actividad física (fitness tracker)', 'Some Description', 4007.16, 137, 1, 2.288, 0.267998, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.lansitec.com/wp-content/uploads/2024/03/Lansitec-Bluetooth-Bracelet.png'),
(13, 2, 'Báscula inteligente con conexión a app', 'Some Description', 3749.33, 176, 1, 0.919, 0.640286, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://fitbarz.com.gt/wp-content/uploads/2025/06/ebfbfc3215cf910cf8de37e936765094_Bascula_con_App_FITBARZ_1422.webp'),
(14, 2, 'Monitore de presión arterial digitales', 'Some Description', 513.06, 137, 1, 0.645, 0.920689, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://delmaz.mx/pub/media/catalog/product/cache/5ad7dd18998ddc9a6c30b0a3120ae461/a/p/app_hem-6127_caja-producto.png'),
(15, 2, 'Termómetro infrarrojo digital', 'Some Description', 933.68, 145, 1, 2.719, 0.838891, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://rfidtecnologia.com/wp-content/uploads/2020/05/temperatura.png'),
(16, 2, 'Gafas inteligentes con realidad aumentada', 'Some Description', 4839.05, 199, 1, 1.06, 0.977794, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://gw.alicdn.com/imgextra/i2/1695308781/O1CN01Z44Amm2EjkkyPMWXS_!!1695308781.png_540x540.jpg'),
(17, 2, 'Auriculares deportivos resistentes al sudor', 'Some Description', 1013.3, 142, 1, 1.253, 0.807636, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.jbl.com.mx/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwe7787bd2/JBL_EnduranceRunBT_Product-Photo_Hero_Red-1605x1605px.png?sw=537&sfrm=png'),
(18, 2, 'Dispositivo para medir calidad de sueño', 'Some Description', 2718.19, 184, 1, 2.707, 0.261815, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://cdn.shopify.com/s/files/1/0754/6162/4090/files/6._Withings_Sleep_480x480.png?v=1726757088'),
(19, 2, 'Anillo inteligente para seguimiento de actividad', 'Some Description', 922.32, 69, 1, 0.668, 0.253249, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://cdn.shopify.com/s/files/1/2451/4399/files/STF_0823_BWH_ZEN_1800_X_1920_5_1.png?v=1730330075'),
(20, 2, 'Reloj GPS para corredores y ciclistas', 'Some Description', 3942.69, 151, 1, 1.487, 0.859868, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://res.garmin.com/subcategory/67256/2-SMARTWATCH-PAGE-FENIX8.png'),
(21, 3, 'Funda protectora para smartphone', 'Some Description', 930.93, 102, 1, 0.875, 0.902166, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://kinpal.com.mx/wp-content/uploads/2024/07/Case-Flores-iPhone-12-Morado.webp'),
(22, 3, 'Protector de pantalla de vidrio templado', 'Some Description', 2668.72, 125, 1, 1.206, 0.851382, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://aurastore.mx/cdn/shop/files/Disenosintitulo-2024-09-05T201924.714.png?v=1733454334'),
(23, 3, 'Cargador portátil (power bank)', 'Some Description', 2302.12, 86, 1, 0.571, 0.658835, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.fotomecanica.mx/media/catalog/product/cache/42278286db7a024dd142634a8b52937a/p/2/p20000qcdlaybl_300dpi.png'),
(24, 3, 'Adaptador USB-C multifunción (hub USB)', 'Some Description', 4107.37, 120, 1, 1.651, 0.705931, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.relematic.mx/wp-content/uploads/2022/07/60384-p.PNG'),
(25, 3, 'Soporte ajustable para móviles y tablets', 'Some Description', 1745.56, 133, 1, 2.881, 0.537009, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://store.hinag.com/cdn/shop/products/40393-h.png?v=1702423224'),
(26, 3, 'Teclado y mouse inalámbricos', 'Some Description', 4125.03, 100, 1, 2.271, 0.922169, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://acteck.com/cdn/shop/files/AC-935197-1.webp?v=1690902825'),
(27, 3, 'Cámara web HD para videollamadas', 'Some Description', 2856.42, 168, 1, 1.569, 0.834078, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://perfectchoice.me/cdn/shop/products/Camara_Web_Full_HD_1080P_1_1024x.png?v=1692311550'),
(28, 3, 'Lente de cámara para móviles', 'Some Description', 3838.69, 78, 1, 0.452, 0.807018, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://media2.gsm55.com/media/catalog/category/img-objectif-smartphone.png'),
(29, 3, 'Memoria USB y disco duros externo SSD', 'Some Description', 4576.12, 138, 1, 0.237, 0.934525, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://webapi3.adata.com/storage/product/sc730_pd_2000x2000_04.png'),
(30, 3, 'Estuche organizador para cables y gadgets', 'Some Description', 1429.52, 146, 1, 2.751, 0.525464, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://img2.miravia.es/g/fb/kf/Sadf20ea944964719bef0c83eb7dce137U.jpg_360x360q75.jpg_.webp'),
(31, 4, 'Bombillas inteligentes RGB controladas por app', 'Some Description', 701.86, 125, 1, 2.098, 0.89474, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://eu.aqara.com/cdn/shop/files/Aqara-Smart-Bulb-T2---E26_E27-rgb.webp?v=1736846823'),
(32, 4, 'Enchufe inteligente WiFi', 'Some Description', 4576.89, 66, 1, 2.782, 0.572258, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.tecnodepot.mx/wp-content/uploads/2024/03/T30_K4-h.png'),
(33, 4, 'Cámara de seguridad para el hogar con conexión móvil', 'Some Description', 840.78, 90, 1, 0.479, 0.551344, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://casaseguridad.com/wp-content/uploads/adt-security-cameras.png'),
(34, 4, 'Termostato inteligente programable', 'Some Description', 1288.26, 107, 1, 2.488, 0.208563, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.tecnodepot.mx/wp-content/uploads/2024/03/TH6320ZW2003-h.png'),
(35, 4, 'Sensor de movimiento y alarma para casa', 'Some Description', 1605.85, 186, 1, 1.15, 0.643537, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://i0.wp.com/cadball.com.mx/wp-content/uploads/2020/12/HUNTER6KT-h.png?fit=2000%2C2000&ssl=1'),
(36, 4, 'Cerradura electrónica inteligente', 'Some Description', 2527.2, 159, 1, 2.312, 0.989513, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://ceramicapisos.mx/wp-content/uploads/2024/10/KWIC-99390-004.png'),
(37, 4, 'Aspiradora robotizada con app', 'Some Description', 284.72, 75, 1, 2.149, 0.295638, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://owp.klarna.com/product/232x232/3206101573/iRobot-Roomba-Plus-405-Combo-AutoWash-dock-White.jpg?ph=true'),
(38, 4, 'Altavoz inteligente con asistente de voz', 'Some Description', 3327.27, 109, 1, 0.951, 0.214938, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://m.media-amazon.com/images/G/33/kindle/journeys/faCtqk8kTBgubDGMzB5EpzKQDxIk8M1VhNHsJNoqtyA3D/NTAxMTE2MjQt._CB566460404_.png'),
(39, 4, 'Detector de humo y monóxido de carbono inteligente', 'Some Description', 394.51, 193, 1, 1.107, 0.566768, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.orbitadigital.com/365747-large_default/x-sense-sbs50-hub-de-comunicacion-x-sense-permite-conectar-50.jpg'),
(40, 4, 'Sistema de riego automatizado para plantas', 'Some Description', 3635.68, 61, 1, 2.23, 0.543871, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.incremental.es/cdn/shop/products/gardena-gardena-riego-automatico-de-vacaciones-para-36-macetas-16247600742505.png?v=1628710031'),
(41, 5, 'Teclado mecánico para gaming', 'Some Description', 981.98, 129, 1, 0.557, 0.558799, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://mx-media.hptiendaenlinea.com/wysiwyg/teclado_optico.png'),
(42, 5, 'Mouse gamer con alta precisión', 'Some Description', 1996.7, 64, 1, 2.709, 0.354787, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://esemanal.mx/revista/wp-content/uploads/2022/02/1462Gu%C2%B0a-de-Compra-de-Mouse-para-Gaming-ADESSO-iMouse-X5.png'),
(43, 5, 'Silla ergonómica para gamers', 'Some Description', 1270.21, 153, 1, 1.377, 0.146806, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://balamrush.com/cdn/shop/files/BR-935920-1.webp?v=1704841082'),
(44, 5, 'Consola portátil', 'Some Description', 2526.61, 135, 1, 2.517, 0.119234, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.retronintendokopen.nl/assets/verkoop/img/tiles/consoles-nintendo-3ds.png'),
(45, 5, 'Controlador y joystick inalámbrico', 'Some Description', 3084.39, 107, 1, 2.017, 0.413378, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://gmedia.playstation.com/is/image/SIEPDC/dualsense-edge-listing-thumb-01-en-23aug22?$facebook$'),
(46, 5, 'Auriculares con micrófono para juegos', 'Some Description', 3841.02, 52, 1, 2.596, 0.659811, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g733/gallery/g733-blue-gallery-1.png?v=1'),
(47, 5, 'Monitor gaming', 'Some Description', 3288.52, 68, 1, 0.97, 0.809104, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.xtremepc.com.mx/cdn/shop/files/98283625-02fe-43cb-a3a6-fed8c2affd9c_800x.png?v=1740496637'),
(48, 5, 'Sistema de realidad virtual', 'Some Description', 1108.47, 138, 1, 2.827, 0.33668, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://www.padinthecity.com/img/blog/oculus-quest-pack.png'),
(49, 5, 'Lámpara LED RGB para setup', 'Some Description', 2550, 127, 1, 1.879, 0.224275, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://i0.wp.com/katisailuminacionled.com/wp-content/uploads/2023/11/Iluminacion-Inteligente-y-seguridad-1.png?fit=1200%2C1200&ssl=1'),
(50, 5, 'Alfombrilla de mouse gaming personalizada', 'Some Description', 1806.82, 187, 1, 2.838, 0.282725, '2025-07-05 19:55:03', 'INTERFACE', NULL, NULL, 'https://assets.corsair.com/image/upload/v1727805920/products/COD/M75_WIRELESS_COD_RENDER_12.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_shipping_type_catalog`
--

CREATE TABLE `t_shipping_type_catalog` (
  `shipping_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_shipping_type_catalog`
--

INSERT INTO `t_shipping_type_catalog` (`shipping_id`, `name`, `description`) VALUES
(1, 'Standard', 'Standard Shipping'),
(2, 'Express', 'Express Shipping'),
(3, 'Priority', 'Priority Shipping');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_user`
--

CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `state` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_user`
--

INSERT INTO `t_user` (`user_id`, `email`, `password`, `first_name`, `last_name`, `address`, `city`, `zip_code`, `state`, `phone_number`, `role`) VALUES
(1, '177691@upslp.edu.mx', 'adminpwd', 'Mauricio', 'Rosales', 'Ap #584-886 Est. Ave', 'Minatitlán', '27112-1885', 'San Luis Potosí', '(444) 574-1411', 'ADMIN'),
(2, 'r.suarez7762@outlook.com', 'QRD46JQU8GL', 'Russell', 'Suarez', '2232 Donec Avenue', 'Pachuca', '07566-1552', 'Chihuahua', '(871) 257-8721', 'USER'),
(3, 'tannercollins1400@google.edu', 'VQW19YEG0PF', 'Tanner', 'Collins', 'P.O. Box 210, 1486 Luctus Rd.', 'Morelia', '53861-5334', 'Chihuahua', '(770) 535-0176', 'USER'),
(4, 'm_travis8153@outlook.com', 'BQI49VZA3DP', 'Travis', 'Mcintyre', 'Ap #704-1742 Tincidunt Ave', 'Querétaro', '56114-5135', 'Chihuahua', '(772) 686-9718', 'USER'),
(5, 'barrett.mathews7047@icloud.edu', 'TUE47NSO2SQ', 'Barrett', 'Mathews', '155-7349 Cum St.', 'General Escobedo', '58184-9277', 'Coahuila', '(725) 954-9286', 'USER'),
(6, 'lee-howard1108@google.edu', 'COI72OEU2TL', 'Howard', 'Lee', '270-3969 Ridiculus Street', 'Tehuacán', '53537-6733', 'Oaxaca', '(299) 266-6152', 'USER'),
(7, 'phelansantiago@icloud.edu', 'JCS15SMY5LW', 'Phelan', 'Santiago', '206-3070 Vel St.', 'Pachuca', '52645-4136', 'Morelos', '(853) 783-5799', 'USER'),
(8, 't.amir8968@icloud.com', 'RTB45XHK0LB', 'Amir', 'Thornton', 'P.O. Box 221, 5931 Mollis Rd.', 'Tapachula', '97381-7833', 'Sinaloa', '(615) 443-0243', 'USER'),
(9, 'w.andrews221@hotmail.com', 'JSI17ULW6BS', 'Wang', 'Andrews', '6652 Suspendisse Rd.', 'Mérida', '23587-7232', 'Tamaulipas', '(833) 299-4281', 'USER'),
(10, 'miranda_mannix7878@icloud.edu', 'ODB47WSX8JW', 'Mannix', 'Miranda', '1848 Elit Av.', 'Pachuca', '13713-5886', 'Jalisco', '(780) 609-3161', 'USER'),
(11, 'cvictor871@hotmail.com', 'KKS52YRI8KY', 'Victor', 'Calderon', 'P.O. Box 349, 9555 Et, Rd.', 'San Luis Potosí', '38527-0647', 'Morelos', '(303) 161-1791', 'USER'),
(12, 'p-robert1309@protonmail.edu', 'TFY60SKC8TX', 'Robert', 'Peck', 'P.O. Box 594, 2488 Aliquam Street', 'Oaxaca', '18863-6214', 'Baja California', '(764) 554-4583', 'USER'),
(13, 'crane.reese@aol.com', 'BBB48BTY3MM', 'Reese', 'Crane', 'P.O. Box 945, 1020 Massa. Rd.', 'Mexico City', '61734-7273', 'Jalisco', '(244) 524-1854', 'USER'),
(14, 'lopez.daquan7043@icloud.com', 'IOB78LSP2II', 'Daquan', 'Lopez', '702-5844 A St.', 'Ciudad Apodaca', '61104-2033', 'Tabasco', '(317) 335-5247', 'USER'),
(15, 'i.lancaster@outlook.edu', 'ZCX89QYN8ME', 'Ignatius', 'Lancaster', 'Ap #660-2254 Ante St.', 'Mazatlán', '45178-6278', 'Hidalgo', '(387) 614-7836', 'USER'),
(16, 'rutledgedante7421@google.com', 'IRS93QLJ1HQ', 'Dante', 'Rutledge', 'P.O. Box 983, 7424 Dignissim St.', 'San Nicolás de los Garza', '17062-2863', 'Querétaro', '(356) 815-6407', 'USER'),
(17, 'day-jeremy@aol.edu', 'KBT25ZLG4WE', 'Jeremy', 'Day', 'P.O. Box 812, 3342 Odio. St.', 'Orizaba', '80463-9088', 'Chihuahua', '(683) 151-5687', 'USER'),
(18, 'gay-clark@outlook.com', 'UTA94CSB8IO', 'Clark', 'Gay', 'Ap #128-1280 Eu St.', 'Tehuacán', '24196-2886', 'Tamaulipas', '(219) 545-1368', 'USER'),
(19, 'cphillips@aol.edu', 'WYA90RNA9GI', 'Carter', 'Phillips', '3385 Sed Street', 'Cuautla', '83368-4381', 'Querétaro', '(295) 251-7412', 'USER'),
(20, 'briddle3294@yahoo.com', 'CWK66UZN6RE', 'Benedict', 'Riddle', 'Ap #778-2771 Arcu. St.', 'Juárez', '64452-1175', 'Tabasco', '(862) 107-1546', 'USER'),
(21, 'brewer.dennis@protonmail.edu', 'WGB61CZN0QC', 'Dennis', 'Brewer', '184-5412 Mauris St.', 'Pachuca', '78303-6763', 'Puebla', '(727) 791-6934', 'USER'),
(22, 'gary-melton@aol.com', 'GFX81BLQ4ZD', 'Gary', 'Melton', '879-6210 In, Ave', 'León', '33314-6813', 'Guanajuato', '(797) 334-1642', 'USER'),
(23, 'patelherrod@outlook.edu', 'ZSF42AGV9YE', 'Herrod', 'Patel', 'P.O. Box 710, 9088 Lorem Road', 'Navojoa', '89091-8057', 'Morelos', '(878) 238-6399', 'USER'),
(24, 'v-hamilton807@protonmail.edu', 'RHJ85ECE6JV', 'Vincent', 'Hamilton', 'Ap #433-8245 Diam. Street', 'Morelia', '83332-3737', 'Oaxaca', '(819) 791-6291', 'USER'),
(25, 'r.browning2376@protonmail.edu', 'DHB52CKM1SC', 'Rigel', 'Browning', '4375 Tempus, Rd.', 'Guadalajara', '10395-4878', 'Tabasco', '(231) 855-0172', 'USER'),
(26, 'correo@mail.com', 'password', 'Nehemias', 'Leija', 'Some Direction', 'San Luis Potosi', '12345', 'San Luis Potosí', '0123456789', 'USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_warehouse`
--

CREATE TABLE `t_warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_warehouse`
--

INSERT INTO `t_warehouse` (`warehouse_id`, `name`, `address`, `city`, `state`, `zip_code`, `country`) VALUES
(1, 'Lacinia At', '489-4687 Rhoncus. St.', 'Laken', 'Brussels Hoofdstedelijk Gewest', '4591', 'Belgium'),
(2, 'Bibendum Donec', '670-8149 Tortor Road', 'Burgos', 'Castilla y León', '52521', 'Spain'),
(3, 'Suspendisse Aliquet', '5675 Ut Ave', 'Szczecin', 'Zachodniopomorskie', '10-818', 'Poland'),
(4, 'Netus Et', '9110 Ac Ave', 'Tampines', 'East Region', '681143', 'Singapore'),
(5, 'Fusce Diam', 'Ap #617-1843 Vivamus St.', 'Juliaca', 'Puno', '17735', 'Peru');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_cart`
--
ALTER TABLE `t_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `t_cart_details`
--
ALTER TABLE `t_cart_details`
  ADD PRIMARY KEY (`cart_id`,`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indices de la tabla `t_category_catalog`
--
ALTER TABLE `t_category_catalog`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `t_order`
--
ALTER TABLE `t_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `shipping_id` (`shipping_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indices de la tabla `t_order_history`
--
ALTER TABLE `t_order_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indices de la tabla `t_order_status_catalog`
--
ALTER TABLE `t_order_status_catalog`
  ADD PRIMARY KEY (`status_id`);

--
-- Indices de la tabla `t_payment_details`
--
ALTER TABLE `t_payment_details`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `t_product`
--
ALTER TABLE `t_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `t_shipping_type_catalog`
--
ALTER TABLE `t_shipping_type_catalog`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indices de la tabla `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `t_warehouse`
--
ALTER TABLE `t_warehouse`
  ADD PRIMARY KEY (`warehouse_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_cart`
--
ALTER TABLE `t_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `t_category_catalog`
--
ALTER TABLE `t_category_catalog`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_order`
--
ALTER TABLE `t_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `t_order_history`
--
ALTER TABLE `t_order_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_order_status_catalog`
--
ALTER TABLE `t_order_status_catalog`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `t_payment_details`
--
ALTER TABLE `t_payment_details`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `t_product`
--
ALTER TABLE `t_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `t_shipping_type_catalog`
--
ALTER TABLE `t_shipping_type_catalog`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `t_user`
--
ALTER TABLE `t_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `t_warehouse`
--
ALTER TABLE `t_warehouse`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_cart`
--
ALTER TABLE `t_cart`
  ADD CONSTRAINT `t_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`);

--
-- Filtros para la tabla `t_cart_details`
--
ALTER TABLE `t_cart_details`
  ADD CONSTRAINT `t_cart_details_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `t_cart` (`cart_id`),
  ADD CONSTRAINT `t_cart_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `t_product` (`product_id`);

--
-- Filtros para la tabla `t_order`
--
ALTER TABLE `t_order`
  ADD CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `t_cart` (`cart_id`),
  ADD CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `t_payment_details` (`payment_id`),
  ADD CONSTRAINT `t_order_ibfk_3` FOREIGN KEY (`shipping_id`) REFERENCES `t_shipping_type_catalog` (`shipping_id`),
  ADD CONSTRAINT `t_order_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `t_order_status_catalog` (`status_id`),
  ADD CONSTRAINT `t_order_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`),
  ADD CONSTRAINT `t_order_ibfk_6` FOREIGN KEY (`warehouse_id`) REFERENCES `t_warehouse` (`warehouse_id`);

--
-- Filtros para la tabla `t_order_history`
--
ALTER TABLE `t_order_history`
  ADD CONSTRAINT `t_order_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`order_id`);

--
-- Filtros para la tabla `t_payment_details`
--
ALTER TABLE `t_payment_details`
  ADD CONSTRAINT `t_payment_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`);

--
-- Filtros para la tabla `t_product`
--
ALTER TABLE `t_product`
  ADD CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `t_category_catalog` (`category_id`);
COMMIT;