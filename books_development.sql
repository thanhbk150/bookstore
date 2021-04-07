-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 29, 2021 lúc 02:42 AM
-- Phiên bản máy phục vụ: 8.0.23
-- Phiên bản PHP: 7.3.24-(to be removed in future macOS)

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `books_development`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2021-03-28 04:06:46.887613', '2021-03-28 04:06:46.887613');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authors`
--

CREATE TABLE `authors` (
  `author_id` bigint NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint DEFAULT '0',
  `biography` text COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `authors`
--

INSERT INTO `authors` (`author_id`, `first_name`, `last_name`, `gender`, `biography`, `email`, `phone`, `address`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Florine', 'Morar', 1, 'Diy hammock before they sold out ugh. Chartreuse leggings hammock tattooed craft beer bicycle rights meggings ethical. Wes anderson mixtape blog cold-pressed pitchfork iphone xoxo.', 'shakia@yahoo.com', '(630) 884-4408 x820', 'North Hyefort 27759 Gutmann Extension', NULL, '2021-03-29 02:40:36.683255', '2021-03-29 02:40:36.683255'),
(2, 'Theron', 'Davis', 0, 'Cronut blog ugh ethical. Actually street small batch wes anderson brooklyn franzen. Umami celiac brooklyn fashion axe. Irony selfies shabby chic semiotics franzen kombucha meggings scenester. Locavore master synth beard trust fund.', 'lila.farrell@gmail.com', '920-977-9019 x4221', 'Lake Suannemouth 842 Kandy Via', NULL, '2021-03-29 02:40:36.694686', '2021-03-29 02:40:36.694686'),
(3, 'Sarina', 'Barrows', 1, 'Park ramps mlkshk. Artisan pickled gastropub bicycle rights food truck kogi. Asymmetrical craft beer small batch. Dreamcatcher beard fanny pack lomo truffaut before they sold out direct trade.', 'natosha_lind@gmail.com', '(164) 235-0781 x8561', 'Treyside 788 Rashida Trail', NULL, '2021-03-29 02:40:36.708669', '2021-03-29 02:40:36.708669'),
(4, 'Ray', 'O\'Reilly', 0, 'Selvage retro tumblr semiotics. Kombucha godard flannel etsy chillwave distillery chicharrones. Art party retro chia listicle pabst neutra flannel jean shorts. Sartorial bushwick meh.', 'marcelino@hotmail.com', '1-603-717-3989 x634', 'New Ezekiel 700 Casper Keys', NULL, '2021-03-29 02:40:36.721133', '2021-03-29 02:40:36.721133'),
(5, 'Valeri', 'Goodwin', 0, 'Organic disrupt mlkshk migas viral meggings. Put a bird on it aesthetic pour-over pork belly. Quinoa austin selfies offal fingerstache. Listicle chillwave kitsch try-hard you probably haven\'t heard of them.', 'denae.jacobs@hotmail.com', '906-739-7112 x5574', 'New Julio 85167 Lawerence Inlet', NULL, '2021-03-29 02:40:36.732719', '2021-03-29 02:40:36.732719'),
(6, 'Solange', 'Cummings', 1, 'Occupy roof kombucha blog five dollar toast flexitarian heirloom ethical. Cred selvage direct trade 90\'s before they sold out. Synth beard yolo health dreamcatcher. Shabby chic pbr&b freegan echo distillery quinoa. Ugh tousled blog carry iphone muggle magic loko.', 'nickole@yahoo.com', '1-788-714-2713', 'Marquardtberg 6761 Elvis Crescent', NULL, '2021-03-29 02:40:36.746263', '2021-03-29 02:40:36.746263'),
(7, 'Adrienne', 'Sanford', 1, 'Carry tote bag iphone cardigan food truck gastropub artisan typewriter. Shoreditch jean shorts pug farm-to-table butcher pickled distillery craft beer. Hashtag sustainable green juice mumblecore austin cronut chillwave. Vegan vinyl beard health yuccie. Synth blue bottle pabst brunch brooklyn readymade lumbersexual lomo.', 'dominique_volkman@yahoo.com', '(395) 816-1218 x2213', 'Lednershire 79169 Richard Radial', NULL, '2021-03-29 02:40:36.766986', '2021-03-29 02:40:36.766986'),
(8, 'Cris', 'Kutch', 1, 'Plaid godard venmo tattooed post-ironic franzen kitsch pickled. Kombucha asymmetrical swag. Hashtag deep v cardigan truffaut waistcoat hella blog. Retro swag 90\'s church-key.', 'jonathan_batz@gmail.com', '971.389.2440', 'Devonhaven 842 Ankunding Heights', NULL, '2021-03-29 02:40:36.781753', '2021-03-29 02:40:36.781753'),
(9, 'Cole', 'Lemke', 0, 'Slow-carb pour-over cleanse blue bottle. Skateboard yuccie aesthetic irony. Gluten-free chambray crucifix pabst 3 wolf moon gentrify hella. Muggle magic squid chartreuse. Kickstarter tofu literally everyday raw denim gentrify thundercats small batch.', 'leigh_spencer@gmail.com', '1-692-606-2300 x065', 'Armstrongfort 688 Greenholt Center', NULL, '2021-03-29 02:40:36.793375', '2021-03-29 02:40:36.793375'),
(10, 'Wan', 'Predovic', 0, 'Lumbersexual skateboard +1 chillwave. Chicharrones intelligentsia street offal. Tattooed next level locavore post-ironic flexitarian humblebrag literally scenester. Williamsburg post-ironic lo-fi kale chips.', 'man.hintz@gmail.com', '(747) 506-8622 x8173', 'Renatafurt 7471 Harber Lodge', NULL, '2021-03-29 02:40:36.806692', '2021-03-29 02:40:36.806692'),
(11, 'Scottie', 'Kovacek', 0, 'Small batch chartreuse hammock. Neutra marfa phlogiston. Normcore venmo artisan loko direct trade mumblecore cardigan bushwick. Twee ethical lo-fi sriracha 3 wolf moon. Freegan migas iphone semiotics stumptown five dollar toast muggle magic flannel.', 'merrill@hotmail.com', '249-403-5880 x86133', 'Mrazmouth 152 Tora Court', NULL, '2021-03-29 02:40:36.820285', '2021-03-29 02:40:36.820285'),
(12, 'Jeramy', 'Lehner', 1, 'Gastropub sustainable wolf ugh pork belly 90\'s butcher. Cleanse slow-carb gluten-free. Direct trade stumptown hella normcore. Small batch vice narwhal waistcoat hella sartorial umami. Muggle magic phlogiston thundercats venmo yuccie vinegar food truck.', 'shannon_hirthe@yahoo.com', '(837) 059-5999 x6787', 'Feeststad 461 Leena Plains', NULL, '2021-03-29 02:40:36.835137', '2021-03-29 02:40:36.835137'),
(13, 'Anastasia', 'Powlowski', 0, 'Deep v austin viral squid marfa mumblecore gastropub. Kale chips readymade yr. Mixtape kombucha cleanse pbr&b master sriracha. Umami freegan everyday put a bird on it. Mlkshk franzen lumbersexual photo booth shabby chic cred crucifix tofu.', 'ward_macejkovic@yahoo.com', '1-681-077-8369 x510', 'East Sean 646 Sanford Pike', NULL, '2021-03-29 02:40:36.846836', '2021-03-29 02:40:36.846836'),
(14, 'Cecilia', 'Bernhard', 0, 'Mixtape lomo cray pitchfork. Hella fingerstache fixie meggings tofu ethical umami. Iphone normcore cred.', 'conrad@gmail.com', '422-711-6769 x276', 'West Marlyn 8128 Nikita Common', NULL, '2021-03-29 02:40:36.859030', '2021-03-29 02:40:36.859030'),
(15, 'Obdulia', 'Howe', 0, 'Schlitz meggings lumbersexual post-ironic hashtag taxidermy mixtape health. Jean shorts chia humblebrag pinterest. Cliche distillery tote bag dreamcatcher drinking yolo meh. Keytar twee whatever kogi biodiesel pinterest selvage.', 'bernadette_boehm@gmail.com', '(608) 801-2895 x684', 'Napoleonland 7992 Johnson Viaduct', NULL, '2021-03-29 02:40:36.907876', '2021-03-29 02:40:36.907876'),
(16, 'Sharyl', 'Weissnat', 1, 'Squid deep v tumblr. Ugh drinking whatever shabby chic pug. Mlkshk meggings fingerstache portland chillwave sriracha kombucha tacos.', 'will@hotmail.com', '(919) 064-9473 x91400', 'Lake Gabriel 81453 Eleonora Springs', NULL, '2021-03-29 02:40:36.918821', '2021-03-29 02:40:36.918821'),
(17, 'Stacy', 'Veum', 0, 'Carry ethical xoxo 90\'s thundercats direct trade. Ethical pug tote bag scenester ramps. Retro poutine sriracha ennui.', 'jarrod@yahoo.com', '(874) 930-4802 x001', 'Erdmanhaven 8999 Roberts Shoal', NULL, '2021-03-29 02:40:36.929711', '2021-03-29 02:40:36.929711'),
(18, 'Keely', 'Marks', 0, 'Iphone brunch semiotics messenger bag everyday. Single-origin coffee cred you probably haven\'t heard of them vice blog before they sold out art party tote bag. Fashion axe vhs you probably haven\'t heard of them five dollar toast godard cornhole mumblecore deep v.', 'augustus@yahoo.com', '227.812.1788', 'Parkermouth 65813 Haag Prairie', NULL, '2021-03-29 02:40:36.941438', '2021-03-29 02:40:36.941438'),
(19, 'Chung', 'Heaney', 0, 'Humblebrag hashtag cred williamsburg. Pitchfork squid street kinfolk yr everyday. Paleo readymade lomo. Roof selvage craft beer pork belly flexitarian direct trade bespoke you probably haven\'t heard of them.', 'in@gmail.com', '875-707-6466 x78273', 'New Calebstad 459 Dorsey Plains', NULL, '2021-03-29 02:40:36.956858', '2021-03-29 02:40:36.956858'),
(20, 'Annamae', 'Collins', 0, 'Seitan waistcoat distillery. Paleo gastropub microdosing. Viral banh mi trust fund everyday 3 wolf moon goth fashion axe.', 'cary@gmail.com', '132.449.7788', 'Auerborough 88740 Ayako Drives', NULL, '2021-03-29 02:40:36.971223', '2021-03-29 02:40:36.971223'),
(21, 'Rosendo', 'Wolf', 1, 'Heirloom narwhal fingerstache listicle yr pop-up. Tofu tacos locavore lo-fi direct trade brunch. Street narwhal forage messenger bag banh mi taxidermy raw denim. Street typewriter narwhal brunch farm-to-table mixtape slow-carb +1.', 'german_kerluke@gmail.com', '1-860-647-3511 x3980', 'Port Porfirio 8618 Sporer Drive', NULL, '2021-03-29 02:40:36.981650', '2021-03-29 02:40:36.981650'),
(22, 'Sean', 'Borer', 1, 'Five dollar toast beard tattooed. Chillwave skateboard narwhal echo selvage pork belly. Hoodie vinegar chambray chillwave. Whatever chartreuse cred artisan mustache chambray selfies.', 'adrianna@yahoo.com', '(307) 523-4494', 'South Garretton 324 Modesto Key', NULL, '2021-03-29 02:40:36.992277', '2021-03-29 02:40:36.992277'),
(23, 'Marisha', 'Schamberger', 0, 'Phlogiston cardigan muggle magic. Selfies hoodie blue bottle jean shorts art party knausgaard. Organic butcher ramps cray chillwave next level cred. Pbr&b artisan banh mi selvage mustache.', 'jess@gmail.com', '362-840-7221 x3084', 'Tremblayhaven 17218 Ladonna Mount', NULL, '2021-03-29 02:40:37.004181', '2021-03-29 02:40:37.004181'),
(24, 'Sammy', 'Senger', 0, 'Vinyl selvage kitsch vice pop-up plaid kale chips. Taxidermy gentrify chambray loko bitters occupy neutra squid. Fanny pack locavore butcher aesthetic chartreuse thundercats umami. Pug shabby chic kogi.', 'kasandra@hotmail.com', '(978) 460-8000 x8716', 'Stammfort 366 Matilde Mount', NULL, '2021-03-29 02:40:37.015708', '2021-03-29 02:40:37.015708'),
(25, 'Moses', 'Kuvalis', 1, 'Vice lo-fi literally mixtape truffaut. Migas pbr&b meggings bitters cold-pressed fanny pack mumblecore squid. Wes anderson food truck cold-pressed jean shorts seitan.', 'chanel@yahoo.com', '1-467-411-9076 x3177', 'Port Ilenebury 36963 Kozey Parkway', NULL, '2021-03-29 02:40:37.027021', '2021-03-29 02:40:37.027021'),
(26, 'Mira', 'Mertz', 0, 'Fanny pack organic umami. Bitters brooklyn chia vinegar heirloom. Raw denim irony helvetica fashion axe.', 'cythia_conroy@yahoo.com', '219.663.9124 x27335', 'Port Christieside 947 Ann Parks', NULL, '2021-03-29 02:40:37.041444', '2021-03-29 02:40:37.041444'),
(27, 'Alysia', 'Hintz', 0, 'Slow-carb asymmetrical readymade master. Selfies church-key 3 wolf moon disrupt blue bottle fixie retro. Art party cred knausgaard xoxo.', 'cary_kutch@gmail.com', '(630) 434-5877 x483', 'West Deloresmouth 5673 Valentine Manors', NULL, '2021-03-29 02:40:37.052173', '2021-03-29 02:40:37.052173'),
(28, 'Ahmad', 'Littel', 0, 'Tattooed godard pork belly brunch kitsch mixtape. Neutra wes anderson hoodie. Listicle brooklyn craft beer locavore bicycle rights. Tofu offal pbr&b put a bird on it bicycle rights listicle blog tousled. Stumptown tote bag taxidermy organic ramps poutine bitters cornhole.', 'romelia_brown@yahoo.com', '435.796.8023', 'Lowetown 54404 Baumbach Mill', NULL, '2021-03-29 02:40:37.063426', '2021-03-29 02:40:37.063426'),
(29, 'Petronila', 'Douglas', 0, 'Fanny pack before they sold out kale chips church-key. Godard whatever selvage williamsburg. 90\'s authentic chicharrones health ethical wes anderson paleo. Asymmetrical austin schlitz next level bitters blue bottle.', 'lashaun@yahoo.com', '572.421.7010 x64118', 'Port Rochel 50872 Valentine Loop', NULL, '2021-03-29 02:40:37.075009', '2021-03-29 02:40:37.075009'),
(30, 'Patrick', 'Gusikowski', 0, 'Cred offal cardigan deep v. Kickstarter yolo listicle migas green juice keffiyeh. Before they sold out gastropub hashtag. Farm-to-table wes anderson trust fund banh mi literally forage pinterest. Food truck hashtag mlkshk.', 'kurtis@yahoo.com', '1-883-430-5115 x6974', 'Port Rimabury 575 Nicolas Islands', NULL, '2021-03-29 02:40:37.085731', '2021-03-29 02:40:37.085731'),
(31, 'Zoe', 'Hickle', 1, 'Neutra chia crucifix portland echo. Hoodie readymade shoreditch keytar twee. Offal waistcoat vice. Distillery whatever locavore kitsch intelligentsia pabst put a bird on it.', 'mac@yahoo.com', '(220) 828-0917 x87998', 'New Imogene 18788 Hayes Squares', NULL, '2021-03-29 02:40:37.100243', '2021-03-29 02:40:37.100243'),
(32, 'Curt', 'Dickinson', 0, 'Direct trade blue bottle semiotics kombucha knausgaard cleanse vegan green juice. Readymade authentic xoxo bicycle rights polaroid flannel goth. Before they sold out green juice five dollar toast asymmetrical bushwick hella. Fanny pack pop-up jean shorts humblebrag kale chips meggings. Etsy humblebrag synth hella kale chips pitchfork.', 'deon.friesen@yahoo.com', '(656) 396-6573 x098', 'Lukeshire 31604 Zboncak Isle', NULL, '2021-03-29 02:40:37.111187', '2021-03-29 02:40:37.111187'),
(33, 'Nicholle', 'Bins', 0, 'Cliche pbr&b banh mi venmo. Meggings taxidermy kale chips ennui actually everyday meh. Asymmetrical paleo umami. 90\'s before they sold out pug forage irony craft beer meggings actually.', 'horace@yahoo.com', '220.587.7536 x99905', 'West Stephentown 40536 Elisha Flats', NULL, '2021-03-29 02:40:37.123080', '2021-03-29 02:40:37.123080'),
(34, 'Willard', 'Reynolds', 0, 'Wayfarers fingerstache quinoa kombucha carry hella. Biodiesel occupy cred. Cred swag ennui iphone occupy mixtape.', 'vicente_grant@gmail.com', '295-348-1029 x2005', 'Port Ronald 8458 Penney Ford', NULL, '2021-03-29 02:40:37.135328', '2021-03-29 02:40:37.135328'),
(35, 'Clemmie', 'Grady', 1, '+1 church-key wayfarers occupy tofu. Ugh meh leggings blog. Deep v kickstarter twee brunch meditation mlkshk portland letterpress. Banh mi salvia portland taxidermy heirloom selvage.', 'malka_mills@gmail.com', '(503) 845-1366 x4451', 'Greenville 9915 Harris Oval', NULL, '2021-03-29 02:40:37.149225', '2021-03-29 02:40:37.149225'),
(36, 'Jordan', 'Leuschke', 1, 'Direct trade pork belly hammock heirloom semiotics tote bag mlkshk. Everyday fashion axe drinking wes anderson. Franzen slow-carb post-ironic. Brooklyn yuccie drinking ethical.', 'elidia_quitzon@gmail.com', '920-647-8594 x14794', 'Elvinaburgh 46573 Roger Terrace', NULL, '2021-03-29 02:40:37.160800', '2021-03-29 02:40:37.160800'),
(37, 'Mellisa', 'Grimes', 1, 'Leggings readymade vinegar. Church-key keffiyeh direct trade post-ironic narwhal williamsburg meggings pabst. Craft beer semiotics franzen direct trade. Direct trade pabst gastropub wolf ethical bespoke typewriter.', 'julissa.hansen@gmail.com', '1-417-365-4361 x612', 'Fabianshire 217 Vandervort Motorway', NULL, '2021-03-29 02:40:37.172266', '2021-03-29 02:40:37.172266'),
(38, 'Pablo', 'Pfannerstill', 1, 'Drinking marfa listicle shabby chic keffiyeh kombucha sriracha. Cleanse helvetica knausgaard taxidermy. Letterpress sustainable vegan occupy williamsburg. Polaroid diy listicle. Listicle godard flexitarian.', 'buck@hotmail.com', '230-373-1627 x78098', 'South Numbersstad 95170 Bins Tunnel', NULL, '2021-03-29 02:40:37.183710', '2021-03-29 02:40:37.183710'),
(39, 'Thora', 'Fritsch', 1, 'Kale chips microdosing polaroid. Locavore austin loko. Actually tumblr narwhal mixtape small batch cred.', 'edyth@hotmail.com', '(568) 605-0589 x71867', 'Lake Lupetown 873 Dietrich Plaza', NULL, '2021-03-29 02:40:37.194298', '2021-03-29 02:40:37.194298'),
(40, 'Long', 'Hyatt', 0, 'Keffiyeh blue bottle schlitz pop-up. Muggle magic yuccie actually knausgaard. Brunch church-key scenester banjo gentrify tumblr marfa.', 'clement@yahoo.com', '314-893-9792 x21161', 'Kilbackhaven 312 Lang Skyway', NULL, '2021-03-29 02:40:37.206277', '2021-03-29 02:40:37.206277'),
(41, 'Edward', 'Trantow', 1, 'Disrupt lo-fi ethical gastropub ramps pitchfork portland fixie. Tattooed semiotics vegan muggle magic lo-fi. Pop-up biodiesel phlogiston wolf bespoke tacos. Cornhole selfies synth cronut brooklyn venmo umami distillery.', 'rocco@yahoo.com', '1-689-371-1507 x8799', 'Alysestad 966 Funk Expressway', NULL, '2021-03-29 02:40:37.216341', '2021-03-29 02:40:37.216341'),
(42, 'Nelson', 'Langosh', 0, 'Post-ironic bespoke direct trade pork belly helvetica. Yr vice paleo post-ironic poutine bespoke hoodie blog. Health photo booth ramps.', 'jeffry@yahoo.com', '457-183-7011 x91584', 'South Mitsue 319 Antony Green', NULL, '2021-03-29 02:40:37.229150', '2021-03-29 02:40:37.229150'),
(43, 'Emile', 'Goldner', 0, 'Semiotics tumblr cleanse tilde scenester. Ugh leggings biodiesel taxidermy poutine trust fund messenger bag. Xoxo skateboard vhs. Bushwick meh keffiyeh wes anderson humblebrag.', 'noemi_ankunding@gmail.com', '691-465-5125 x928', 'Port Liliport 96205 Mraz Street', NULL, '2021-03-29 02:40:37.241667', '2021-03-29 02:40:37.241667'),
(44, 'Lenard', 'Stokes', 1, 'Vinyl everyday brunch wayfarers jean shorts health. Ramps tumblr twee. Migas pinterest kinfolk. Organic put a bird on it polaroid chia hammock before they sold out venmo twee. Beard umami chambray actually you probably haven\'t heard of them +1 meh.', 'juli@yahoo.com', '985.165.4765 x42455', 'Marylandmouth 75271 Schultz Underpass', NULL, '2021-03-29 02:40:37.252728', '2021-03-29 02:40:37.252728'),
(45, 'Kellye', 'Murray', 0, 'Five dollar toast occupy direct trade pug. Single-origin coffee church-key yuccie drinking tote bag. Humblebrag neutra thundercats xoxo irony leggings carry hella. Hoodie tacos carry health 3 wolf moon muggle magic.', 'ashley_hettinger@yahoo.com', '(521) 531-4873 x636', 'Port Chris 8375 Ray Crescent', NULL, '2021-03-29 02:40:37.265310', '2021-03-29 02:40:37.265310'),
(46, 'Delois', 'Block', 1, 'Keytar wolf synth. Single-origin coffee tofu authentic. Mlkshk pug flexitarian mumblecore. Cardigan cronut blog flexitarian.', 'dong_mertz@gmail.com', '805.237.3676', 'Port Madisonfurt 383 Chester Street', NULL, '2021-03-29 02:40:37.277759', '2021-03-29 02:40:37.277759'),
(47, 'Sonia', 'D\'Amore', 1, 'Mustache fanny pack pour-over forage. Neutra chicharrones sriracha bitters yr. Venmo mumblecore umami.', 'bennie@gmail.com', '(989) 962-7066', 'South Jeremiahbury 78128 O\'Kon Shoals', NULL, '2021-03-29 02:40:37.289601', '2021-03-29 02:40:37.289601'),
(48, 'Eugenia', 'Collins', 1, 'Ramps plaid literally yr scenester muggle magic jean shorts slow-carb. Austin occupy wes anderson humblebrag. Knausgaard umami cronut migas everyday lumbersexual.', 'irving_moen@yahoo.com', '379.313.5981 x917', 'East Janaeburgh 9450 Normand Knolls', NULL, '2021-03-29 02:40:37.301817', '2021-03-29 02:40:37.301817'),
(49, 'Darell', 'Haag', 1, 'Pickled viral poutine kombucha mlkshk. Skateboard godard diy biodiesel yuccie. Green juice wes anderson offal mixtape sustainable marfa chia.', 'darell_little@gmail.com', '650-565-5210 x1689', 'South Shirlbury 9937 Schroeder Pass', NULL, '2021-03-29 02:40:37.315053', '2021-03-29 02:40:37.315053'),
(50, 'Cordelia', 'Koch', 0, 'Street pour-over pabst ugh organic dreamcatcher. Portland next level brooklyn heirloom vinyl occupy salvia. Crucifix meditation semiotics marfa tilde occupy godard.', 'stacie.kreiger@hotmail.com', '535.523.5849 x54862', 'West Donny 4360 Ward Motorway', NULL, '2021-03-29 02:40:37.326825', '2021-03-29 02:40:37.326825');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `book_id` bigint NOT NULL,
  `author_id` bigint NOT NULL,
  `publisher_id` bigint DEFAULT NULL,
  `book_category_id` bigint NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `edition_number` int DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` float DEFAULT '0',
  `quantity` bigint DEFAULT '0',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`book_id`, `author_id`, `publisher_id`, `book_category_id`, `title`, `edition_number`, `copyright`, `description`, `price`, `quantity`, `image`, `created_at`, `updated_at`) VALUES
(1, 45, 10, 8, 'The Doors of Perception', 88281, 'Cliche selfies poutine irony loko 90\'s tote bag.', 'Intelligentsia jean shorts chia. Pbr&b muggle magic post-ironic banh mi. Roof literally kale chips. Phlogiston single-origin coffee keffiyeh keytar umami tacos bushwick next level. Shoreditch tofu migas slow-carb fixie hammock organic thundercats.', 95.57, 7871, NULL, '2021-03-29 02:40:37.506844', '2021-03-29 02:40:37.506844'),
(2, 1, 20, 5, 'Noli Me Tangere', 64847, 'Tilde tousled cred fingerstache biodiesel meditation.', 'Try-hard vhs schlitz chambray normcore. Distillery waistcoat art party. Listicle mlkshk retro bespoke tumblr keffiyeh keytar. Iphone put a bird on it authentic distillery.', 71.08, 8858, NULL, '2021-03-29 02:40:37.563613', '2021-03-29 02:40:37.563613'),
(3, 30, 15, 3, 'I Will Fear No Evil', 24379, 'Quinoa blog semiotics direct trade slow-carb knausgaard intelligentsia bicycle rights tote bag.', 'Organic street five dollar toast quinoa migas meditation kitsch. Banjo next level cardigan carry helvetica migas. Chambray roof umami.', 11.45, 4330, NULL, '2021-03-29 02:40:37.576305', '2021-03-29 02:40:37.576305'),
(4, 36, 29, 10, 'I Will Fear No Evil', 52610, 'Deep v polaroid ethical skateboard fashion axe.', 'Dreamcatcher selvage heirloom austin. Try-hard whatever biodiesel slow-carb authentic. Tattooed 8-bit kale chips neutra twee. Raw denim stumptown gluten-free blog tofu butcher. Put a bird on it vice leggings small batch meh blog gastropub selvage.', 20.43, 8301, NULL, '2021-03-29 02:40:37.633385', '2021-03-29 02:40:37.633385'),
(5, 26, 2, 2, 'Of Mice and Men', 15828, 'Beard tilde farm-to-table chia yuccie.', 'Ugh etsy locavore iphone plaid farm-to-table slow-carb disrupt. Polaroid asymmetrical occupy authentic normcore schlitz tattooed. Salvia cred freegan.', 64.26, 7625, NULL, '2021-03-29 02:40:37.644940', '2021-03-29 02:40:37.644940'),
(6, 19, 15, 1, 'Clouds of Witness', 55895, 'Mlkshk muggle magic cliche irony distillery tote bag quinoa.', 'Readymade goth 90\'s umami raw denim. Yolo leggings ethical. Cleanse wes anderson next level portland pug. Art party mumblecore mixtape chillwave viral microdosing.', 97.18, 6140, NULL, '2021-03-29 02:40:37.655417', '2021-03-29 02:40:37.655417'),
(7, 36, 9, 10, 'Frequent Hearses', 84413, 'Humblebrag blue bottle keffiyeh whatever viral.', 'Mustache organic portland fanny pack. Thundercats swag hammock tousled. Austin hella brunch knausgaard semiotics photo booth. Slow-carb cold-pressed church-key iphone narwhal pitchfork tattooed artisan.', 53.1, 1906, NULL, '2021-03-29 02:40:37.668439', '2021-03-29 02:40:37.668439'),
(8, 25, 29, 7, 'The Line of Beauty', 96167, 'Hella salvia bicycle rights chicharrones.', 'Single-origin coffee try-hard hoodie. Phlogiston iphone squid retro schlitz mustache farm-to-table. 8-bit diy kickstarter deep v. Typewriter williamsburg truffaut mustache normcore cold-pressed. Fingerstache mustache tattooed.', 12.46, 2572, NULL, '2021-03-29 02:40:37.680216', '2021-03-29 02:40:37.680216'),
(9, 44, 12, 10, 'The Moon by Night', 43488, 'Synth aesthetic etsy ugh.', 'Yuccie vice kickstarter chia truffaut. Chia williamsburg polaroid roof. Tattooed cleanse locavore tumblr blue bottle artisan.', 96.48, 9028, NULL, '2021-03-29 02:40:37.689810', '2021-03-29 02:40:37.689810'),
(10, 40, 17, 9, 'Jacob Have I Loved', 11920, '8-bit stumptown single-origin coffee semiotics.', 'Drinking chillwave taxidermy vinegar mlkshk blue bottle mumblecore fixie. Austin synth vice meditation butcher keffiyeh diy. Cliche flexitarian kinfolk small batch. Fashion axe gastropub twee chambray wolf.', 55.86, 8248, NULL, '2021-03-29 02:40:37.700097', '2021-03-29 02:40:37.700097'),
(11, 13, 2, 7, 'When the Green Woods Laugh', 15534, 'Ramps sustainable tousled schlitz pork belly trust fund lumbersexual.', 'Selfies small batch vinegar twee roof forage try-hard. Neutra banh mi before they sold out taxidermy next level leggings beard. Tattooed vice +1.', 33.16, 5780, NULL, '2021-03-29 02:40:37.710722', '2021-03-29 02:40:37.710722'),
(12, 23, 3, 6, 'Quo Vadis', 96422, 'Microdosing disrupt yr skateboard.', 'Drinking put a bird on it retro xoxo. Thundercats intelligentsia try-hard seitan actually whatever cardigan humblebrag. Kale chips thundercats synth humblebrag umami aesthetic semiotics truffaut. Sriracha schlitz gluten-free quinoa yolo kinfolk.', 3.72, 2792, NULL, '2021-03-29 02:40:37.721232', '2021-03-29 02:40:37.721232'),
(13, 49, 28, 5, 'The Moving Finger', 23122, 'Pbr&b fixie small batch squid aesthetic chicharrones.', 'Mlkshk cold-pressed squid semiotics kickstarter. 3 wolf moon meditation yolo umami. 8-bit master farm-to-table stumptown.', 63.76, 1158, NULL, '2021-03-29 02:40:37.776046', '2021-03-29 02:40:37.776046'),
(14, 33, 18, 4, 'The Needle\'s Eye', 83371, 'Ramps keytar xoxo phlogiston.', 'Ennui crucifix before they sold out seitan gastropub. Keytar forage salvia polaroid bushwick migas. Roof pickled pbr&b etsy microdosing direct trade celiac. Pour-over post-ironic bitters salvia. Iphone chicharrones pickled.', 19.13, 1814, NULL, '2021-03-29 02:40:37.789998', '2021-03-29 02:40:37.789998'),
(15, 4, 13, 7, 'Jesting Pilate', 39564, 'Vinyl locavore kickstarter lumbersexual heirloom.', 'Locavore shabby chic umami meh tacos bushwick. Hammock kitsch gentrify celiac. Loko tacos tousled heirloom stumptown bicycle rights.', 4.94, 5778, NULL, '2021-03-29 02:40:37.801652', '2021-03-29 02:40:37.801652'),
(16, 1, 22, 3, 'To a God Unknown', 72503, 'Neutra vice shoreditch skateboard austin farm-to-table.', 'Cray brunch pitchfork normcore meh. Park paleo hella tote bag pour-over meditation yolo. 8-bit portland photo booth gentrify.', 4.8, 6157, NULL, '2021-03-29 02:40:37.811233', '2021-03-29 02:40:37.811233'),
(17, 13, 25, 1, 'A Scanner Darkly', 52330, 'Cray pinterest whatever austin salvia fanny pack.', 'Tattooed +1 skateboard. Occupy forage godard semiotics lo-fi heirloom. Thundercats kogi chambray whatever pop-up. Mustache bespoke shabby chic bitters letterpress kale chips stumptown. Distillery ugh before they sold out plaid brunch tote bag meh selfies.', 70.9, 82, NULL, '2021-03-29 02:40:37.821747', '2021-03-29 02:40:37.821747'),
(18, 45, 12, 9, 'Quo Vadis', 80564, 'Microdosing sriracha chambray williamsburg.', 'Viral franzen umami ugh meh seitan. Squid fingerstache gastropub. Tilde iphone bicycle rights beard raw denim cred.', 32.3, 7870, NULL, '2021-03-29 02:40:37.831827', '2021-03-29 02:40:37.831827'),
(19, 5, 17, 9, 'Such, Such Were the Joys', 22472, 'Sartorial wolf pitchfork pork belly skateboard food truck fixie chambray.', 'Literally blue bottle plaid xoxo normcore bicycle rights pop-up park. Park lo-fi kickstarter meggings 3 wolf moon occupy. Poutine pickled ethical tilde. Mixtape wayfarers selvage seitan shabby chic farm-to-table truffaut direct trade.', 87.96, 8498, NULL, '2021-03-29 02:40:37.841564', '2021-03-29 02:40:37.841564'),
(20, 1, 18, 7, 'All the King\'s Men', 86101, 'Marfa organic poutine raw denim polaroid master pitchfork art party biodiesel.', 'Kinfolk organic wes anderson beard. Marfa celiac plaid everyday blog. Slow-carb 90\'s seitan wes anderson. Bitters cold-pressed franzen. Humblebrag meh brunch tilde.', 63.02, 6078, NULL, '2021-03-29 02:40:37.851261', '2021-03-29 02:40:37.851261'),
(21, 23, 25, 8, 'The Curious Incident of the Dog in the Night-Time', 67530, 'Craft beer flexitarian cray pitchfork bitters.', 'Cronut occupy keffiyeh dreamcatcher. Artisan polaroid etsy. Freegan organic celiac bushwick small batch green juice. Disrupt diy cliche post-ironic tattooed messenger bag helvetica. Celiac tousled tilde irony seitan.', 10.5, 4805, NULL, '2021-03-29 02:40:37.860586', '2021-03-29 02:40:37.860586'),
(22, 34, 26, 8, 'The Soldier\'s Art', 89672, 'Jean shorts muggle magic ennui cleanse knausgaard readymade.', 'Migas narwhal chartreuse 8-bit yr. Yolo blue bottle forage green juice. Farm-to-table cold-pressed swag lomo pork belly shoreditch. Chicharrones vice chillwave etsy single-origin coffee drinking whatever you probably haven\'t heard of them. Bitters flexitarian park.', 86.82, 8072, NULL, '2021-03-29 02:40:37.871151', '2021-03-29 02:40:37.871151'),
(23, 1, 17, 8, 'For Whom the Bell Tolls', 39098, 'Single-origin coffee gentrify dreamcatcher next level pop-up.', 'Disrupt 8-bit normcore letterpress. Mlkshk taxidermy cred kickstarter 3 wolf moon selfies poutine. Listicle vhs pop-up banjo master godard gastropub gentrify. Quinoa food truck occupy disrupt. Knausgaard ennui hashtag vhs sustainable forage whatever normcore.', 21.45, 2769, NULL, '2021-03-29 02:40:37.881667', '2021-03-29 02:40:37.881667'),
(24, 26, 25, 9, 'The Wings of the Dove', 61756, 'Locavore tumblr selfies distillery hella hoodie fashion axe thundercats diy.', 'Drinking try-hard yr tousled sustainable celiac semiotics migas. Pabst neutra lumbersexual bitters cray distillery. Try-hard meggings pop-up poutine. Kombucha direct trade trust fund deep v quinoa 8-bit pabst.', 25.98, 7962, NULL, '2021-03-29 02:40:37.892514', '2021-03-29 02:40:37.892514'),
(25, 43, 26, 8, 'The Proper Study', 11688, 'Cronut pork belly butcher dreamcatcher +1 squid skateboard brunch kogi.', 'Vegan heirloom 3 wolf moon jean shorts dreamcatcher bespoke chia venmo. Butcher yr chillwave intelligentsia goth single-origin coffee microdosing. 8-bit godard yolo gastropub hella phlogiston. Disrupt photo booth pug put a bird on it viral kale chips.', 19.56, 3941, NULL, '2021-03-29 02:40:37.903206', '2021-03-29 02:40:37.903206'),
(26, 15, 18, 2, 'Look to Windward', 82368, 'Dreamcatcher iphone selfies tumblr vinyl.', 'Mustache microdosing helvetica celiac. Tilde street you probably haven\'t heard of them franzen cardigan kogi cray deep v. Franzen kombucha church-key kale chips godard. Freegan iphone diy. Church-key neutra hashtag small batch etsy.', 28.59, 3692, NULL, '2021-03-29 02:40:37.913001', '2021-03-29 02:40:37.913001'),
(27, 35, 29, 5, 'A Monstrous Regiment of Women', 84165, 'Ethical slow-carb narwhal pitchfork franzen cray.', 'Messenger bag jean shorts cliche blue bottle intelligentsia fanny pack. Hoodie blue bottle listicle. Austin church-key diy aesthetic ethical deep v selvage.', 40.57, 2784, NULL, '2021-03-29 02:40:37.923063', '2021-03-29 02:40:37.923063'),
(28, 29, 4, 10, 'No Country for Old Men', 50763, 'Vhs chartreuse put a bird on it celiac vinegar tofu.', 'Seitan banjo wes anderson gastropub photo booth. Neutra disrupt plaid art party semiotics vinegar. Wolf neutra art party hashtag brooklyn flexitarian. Fashion axe keytar before they sold out ethical. Photo booth gastropub kinfolk kitsch kombucha.', 34.06, 7677, NULL, '2021-03-29 02:40:37.933746', '2021-03-29 02:40:37.933746'),
(29, 45, 1, 2, 'Ah, Wilderness!', 67966, 'Aesthetic celiac ramps loko wolf vice letterpress.', 'Letterpress pork belly carry. Actually master leggings pug yr phlogiston deep v. Heirloom taxidermy chartreuse lumbersexual everyday venmo slow-carb.', 15.64, 4218, NULL, '2021-03-29 02:40:37.943689', '2021-03-29 02:40:37.943689'),
(30, 49, 1, 1, 'The Stars\' Tennis Balls', 31127, 'Tumblr paleo hoodie neutra yr brunch.', 'Hashtag lomo chillwave drinking wolf carry gluten-free. Keytar offal godard artisan. Blog bicycle rights ugh fanny pack pork belly narwhal farm-to-table.', 4.15, 3662, NULL, '2021-03-29 02:40:37.953672', '2021-03-29 02:40:37.953672'),
(31, 43, 7, 8, 'The Waste Land', 21347, 'Viral artisan retro banh mi vinyl locavore try-hard roof.', 'Seitan banh mi tofu crucifix. Yr franzen whatever iphone. Hashtag selfies retro migas. Taxidermy tilde crucifix semiotics beard drinking distillery. Lumbersexual brooklyn yr street.', 6.65, 3754, NULL, '2021-03-29 02:40:37.964303', '2021-03-29 02:40:37.964303'),
(32, 32, 26, 5, 'The Waste Land', 21956, 'Thundercats crucifix cred seitan 3 wolf moon hella bitters truffaut.', 'Hoodie crucifix everyday chartreuse carry scenester small batch chicharrones. Hashtag migas butcher. Roof pinterest ugh crucifix plaid cleanse. Celiac organic meditation kale chips. Kale chips cornhole try-hard banh mi echo art party occupy wes anderson.', 50.23, 3143, NULL, '2021-03-29 02:40:37.975561', '2021-03-29 02:40:37.975561'),
(33, 7, 8, 1, 'No Country for Old Men', 86525, 'Hoodie heirloom cardigan chillwave.', 'Skateboard loko vegan. Loko phlogiston salvia ugh. Normcore tumblr put a bird on it banjo authentic. Semiotics lo-fi quinoa.', 15.96, 3535, NULL, '2021-03-29 02:40:37.986998', '2021-03-29 02:40:37.986998'),
(34, 13, 4, 1, 'Unweaving the Rainbow', 18200, 'Migas forage twee direct trade chillwave master chicharrones bitters etsy.', 'Leggings roof flannel artisan. Offal selvage freegan. Letterpress artisan ugh freegan asymmetrical lumbersexual. Normcore asymmetrical pour-over.', 33.02, 6918, NULL, '2021-03-29 02:40:37.998298', '2021-03-29 02:40:37.998298'),
(35, 34, 29, 1, 'Edna O\'Brien', 23562, 'Shoreditch quinoa bicycle rights fixie dreamcatcher.', 'Skateboard artisan polaroid semiotics vhs. Letterpress chartreuse austin pour-over. Pbr&b irony chia. Keytar irony mumblecore you probably haven\'t heard of them lo-fi. Pug before they sold out gluten-free.', 27.63, 9490, NULL, '2021-03-29 02:40:38.007807', '2021-03-29 02:40:38.007807'),
(36, 49, 18, 6, 'From Here to Eternity', 45162, 'Keytar skateboard vice roof irony cleanse street.', 'Beard thundercats food truck godard franzen poutine kogi. Tattooed actually yuccie franzen. Actually forage kogi truffaut meditation wolf organic vinyl.', 20.74, 9731, NULL, '2021-03-29 02:40:38.017684', '2021-03-29 02:40:38.017684'),
(37, 3, 15, 6, 'A Glass of Blessings', 19677, 'Vinegar migas asymmetrical godard portland chillwave street kinfolk vhs.', 'Messenger bag distillery hashtag biodiesel. Carry kinfolk blog flannel knausgaard. Banjo asymmetrical health keytar cronut poutine chia crucifix. Williamsburg yuccie deep v microdosing readymade cronut cred.', 93.04, 7709, NULL, '2021-03-29 02:40:38.027757', '2021-03-29 02:40:38.027757'),
(38, 32, 23, 6, 'O Jerusalem!', 69866, 'Forage austin quinoa organic pickled next level fanny pack everyday.', 'Diy ramps keffiyeh normcore hammock meditation. Deep v letterpress diy. Portland cray +1. Irony bitters art party thundercats gastropub. Ugh typewriter hoodie.', 55.04, 3200, NULL, '2021-03-29 02:40:38.038091', '2021-03-29 02:40:38.038091'),
(39, 20, 20, 8, 'Number the Stars', 24534, 'Selvage taxidermy sartorial distillery meggings mlkshk schlitz.', 'Pickled dreamcatcher mumblecore helvetica. Godard single-origin coffee pinterest hammock vhs park pork belly. Flannel before they sold out 8-bit tacos post-ironic.', 34.88, 7016, NULL, '2021-03-29 02:40:38.049667', '2021-03-29 02:40:38.049667'),
(40, 11, 6, 5, 'The Little Foxes', 81674, 'Pork belly vinegar sriracha flexitarian salvia normcore 90\'s keffiyeh.', 'Knausgaard kombucha normcore crucifix chillwave shabby chic venmo. Knausgaard retro meh cliche flexitarian sriracha. Vinegar pickled narwhal +1.', 35.37, 7221, NULL, '2021-03-29 02:40:38.062588', '2021-03-29 02:40:38.062588'),
(41, 21, 12, 10, 'Cabbages and Kings', 39560, 'Actually migas cronut art party small batch.', 'Schlitz humblebrag goth muggle magic flexitarian. Chambray meggings tumblr hoodie butcher irony sriracha. Farm-to-table artisan sartorial.', 8.98, 2295, NULL, '2021-03-29 02:40:38.080303', '2021-03-29 02:40:38.080303'),
(42, 14, 17, 10, 'Consider Phlebas', 30936, 'Flannel shabby chic waistcoat flexitarian kickstarter drinking blue bottle twee.', 'Sustainable skateboard offal cred pork belly kickstarter retro. Keffiyeh synth lumbersexual cliche. Phlogiston gluten-free polaroid you probably haven\'t heard of them.', 17.33, 6601, NULL, '2021-03-29 02:40:38.090104', '2021-03-29 02:40:38.090104'),
(43, 11, 6, 10, 'That Hideous Strength', 93771, 'Pork belly irony wayfarers bicycle rights shabby chic schlitz tote bag chia.', 'Banjo mixtape kogi semiotics photo booth tote bag tumblr gentrify. Meh portland organic retro swag photo booth. Tattooed twee single-origin coffee vice. Leggings vhs vinyl microdosing kale chips humblebrag cray cronut. Kogi aesthetic before they sold out tofu farm-to-table.', 86.97, 3775, NULL, '2021-03-29 02:40:38.101789', '2021-03-29 02:40:38.101789'),
(44, 44, 18, 4, 'Far From the Madding Crowd', 47375, 'Kombucha everyday occupy loko kale chips.', 'Pork belly letterpress messenger bag cleanse chillwave helvetica put a bird on it migas. Chambray kinfolk leggings yuccie park asymmetrical. Listicle beard fingerstache trust fund portland. Diy deep v 8-bit goth.', 97.02, 3809, NULL, '2021-03-29 02:40:38.111714', '2021-03-29 02:40:38.111714'),
(45, 43, 20, 3, 'When the Green Woods Laugh', 54748, 'Kitsch vhs vice dreamcatcher aesthetic.', 'Pabst lomo chicharrones mumblecore williamsburg everyday aesthetic xoxo. Post-ironic art party polaroid +1. Umami helvetica pork belly roof. Vegan bicycle rights synth +1.', 49.87, 5390, NULL, '2021-03-29 02:40:38.122129', '2021-03-29 02:40:38.122129'),
(46, 46, 15, 10, 'Dance Dance Dance', 49319, 'Mustache selfies mumblecore carry iphone.', 'Paleo health five dollar toast raw denim scenester microdosing everyday schlitz. Chambray sartorial brunch five dollar toast roof vinyl. Vhs street meh actually ramps.', 66.45, 1177, NULL, '2021-03-29 02:40:38.133438', '2021-03-29 02:40:38.133438'),
(47, 42, 22, 6, 'The Wings of the Dove', 79489, 'Green juice scenester master wes anderson art party single-origin coffee muggle magic chia you probably haven\'t heard of them.', 'Dreamcatcher actually intelligentsia whatever cardigan skateboard drinking trust fund. Irony taxidermy distillery. Gluten-free farm-to-table organic mlkshk twee chambray hammock. Small batch dreamcatcher sartorial farm-to-table quinoa blue bottle everyday irony.', 68.12, 3266, NULL, '2021-03-29 02:40:38.143139', '2021-03-29 02:40:38.143139'),
(48, 25, 4, 4, 'If I Forget Thee Jerusalem', 15349, 'Irony chia fixie chambray thundercats yr skateboard.', 'Art party butcher plaid before they sold out migas. Cornhole distillery vinyl hoodie flannel paleo. Austin squid cold-pressed beard narwhal.', 12.35, 4770, NULL, '2021-03-29 02:40:38.153472', '2021-03-29 02:40:38.153472'),
(49, 49, 3, 1, 'Oh! To be in England', 61416, 'Slow-carb wolf franzen migas hoodie try-hard microdosing fanny pack.', 'Stumptown craft beer taxidermy cronut tumblr salvia cardigan. Cold-pressed messenger bag fixie. Forage tofu fanny pack. Mixtape cronut brunch kale chips 3 wolf moon lomo diy.', 6.94, 5964, NULL, '2021-03-29 02:40:38.163954', '2021-03-29 02:40:38.163954'),
(50, 25, 19, 8, 'An Acceptable Time', 33222, 'Microdosing forage franzen poutine.', 'Meggings migas stumptown austin pitchfork whatever chicharrones. Kinfolk deep v neutra selvage. Vinyl locavore kombucha chia pork belly jean shorts. Hammock vegan tumblr lumbersexual plaid kitsch bushwick.', 26.54, 8394, NULL, '2021-03-29 02:40:38.174377', '2021-03-29 02:40:38.174377'),
(51, 46, 14, 10, 'The Widening Gyre', 13110, 'Portland mlkshk meh roof cold-pressed trust fund disrupt readymade chia.', 'Keytar bespoke tattooed mlkshk kitsch offal. Food truck intelligentsia williamsburg. Mlkshk occupy raw denim cred kale chips tofu dreamcatcher.', 97.91, 422, NULL, '2021-03-29 02:40:38.184901', '2021-03-29 02:40:38.184901'),
(52, 33, 1, 1, 'The Man Within', 40644, 'Whatever next level lumbersexual locavore irony.', 'Sartorial freegan tumblr cronut post-ironic. Kitsch before they sold out seitan. Chillwave cronut retro chicharrones whatever everyday tousled. Phlogiston brunch shabby chic. Disrupt bespoke cold-pressed godard retro sartorial blog hammock.', 75.32, 5742, NULL, '2021-03-29 02:40:38.195229', '2021-03-29 02:40:38.195229'),
(53, 43, 6, 7, 'Blithe Spirit', 27805, 'Plaid celiac pickled crucifix wolf.', 'Kale chips hella mumblecore street typewriter heirloom humblebrag 8-bit. Literally master slow-carb. Vice chia brunch hashtag park. Letterpress vegan semiotics green juice.', 13.42, 7182, NULL, '2021-03-29 02:40:38.205182', '2021-03-29 02:40:38.205182'),
(54, 19, 13, 3, 'An Acceptable Time', 35357, 'Tumblr 3 wolf moon church-key irony sriracha microdosing put a bird on it kinfolk.', 'Disrupt tousled microdosing chia bitters. Paleo wayfarers drinking. Brooklyn fingerstache freegan cred flannel cornhole loko. Cred single-origin coffee normcore tacos distillery. Selvage tilde yolo chillwave skateboard next level blog.', 11.91, 457, NULL, '2021-03-29 02:40:38.215292', '2021-03-29 02:40:38.215292'),
(55, 6, 29, 7, 'Of Human Bondage', 62154, 'Sriracha aesthetic kickstarter bushwick irony.', 'Small batch loko vice street thundercats food truck tacos 8-bit. Pinterest yolo celiac tofu disrupt kogi muggle magic art party. Whatever iphone actually church-key. Post-ironic asymmetrical kombucha. Swag thundercats yr typewriter.', 16.06, 6113, NULL, '2021-03-29 02:40:38.224595', '2021-03-29 02:40:38.224595'),
(56, 1, 13, 10, 'A Swiftly Tilting Planet', 12679, '8-bit selvage taxidermy poutine cronut hoodie master muggle magic.', 'Freegan put a bird on it church-key schlitz beard. Single-origin coffee muggle magic chia. Lumbersexual franzen plaid try-hard. Whatever banjo actually.', 80.6, 64, NULL, '2021-03-29 02:40:38.236372', '2021-03-29 02:40:38.236372'),
(57, 1, 18, 8, 'The Moving Toyshop', 37307, 'Schlitz microdosing goth umami.', 'Neutra selvage jean shorts pork belly 90\'s intelligentsia kogi lumbersexual. Waistcoat sustainable pug hella drinking. Bushwick vhs venmo park selvage kinfolk plaid. Chicharrones brooklyn fixie normcore jean shorts.', 24.93, 3120, NULL, '2021-03-29 02:40:38.246023', '2021-03-29 02:40:38.246023'),
(58, 31, 15, 3, 'This Lime Tree Bower', 62676, 'Photo booth knausgaard roof etsy poutine bitters kinfolk migas.', 'Phlogiston artisan vhs selvage trust fund locavore. Wayfarers park wes anderson crucifix tousled pickled. Swag leggings williamsburg whatever actually bushwick umami. Butcher iphone chia pop-up chillwave distillery church-key post-ironic. Hoodie cleanse art party truffaut pinterest farm-to-table mustache.', 34.58, 2155, NULL, '2021-03-29 02:40:38.255196', '2021-03-29 02:40:38.255196'),
(59, 12, 11, 2, 'An Evil Cradling', 86809, 'Flexitarian scenester salvia skateboard schlitz.', 'Yr put a bird on it seitan austin asymmetrical. Franzen raw denim fixie irony. Craft beer bitters hoodie tacos tattooed.', 62.53, 3857, NULL, '2021-03-29 02:40:38.265677', '2021-03-29 02:40:38.265677'),
(60, 21, 21, 3, 'Alone on a Wide, Wide Sea', 40049, 'Tote bag put a bird on it twee sriracha readymade typewriter.', 'Muggle magic meditation health chambray phlogiston brooklyn synth pour-over. Readymade five dollar toast poutine flannel trust fund. Vinyl keffiyeh jean shorts keytar. Direct trade 90\'s waistcoat readymade. Butcher distillery narwhal.', 24.45, 2473, NULL, '2021-03-29 02:40:38.275468', '2021-03-29 02:40:38.275468'),
(61, 14, 14, 7, 'The Lathe of Heaven', 36858, 'Pickled mixtape seitan cardigan.', 'Mlkshk irony green juice photo booth. Park chia tote bag yr literally. Pork belly pbr&b letterpress yuccie normcore synth flannel. Flexitarian distillery dreamcatcher knausgaard craft beer drinking.', 29.4, 6828, NULL, '2021-03-29 02:40:38.285096', '2021-03-29 02:40:38.285096'),
(62, 15, 9, 6, 'O Jerusalem!', 56073, 'Try-hard yr cronut blue bottle vegan.', 'Cold-pressed literally narwhal health echo shabby chic pug flexitarian. Cornhole goth narwhal synth pork belly. Salvia truffaut forage hoodie next level bushwick chicharrones tacos.', 56.6, 5363, NULL, '2021-03-29 02:40:38.294313', '2021-03-29 02:40:38.294313'),
(63, 23, 22, 7, 'As I Lay Dying', 94378, 'Pork belly semiotics diy brooklyn austin irony 3 wolf moon letterpress iphone.', '8-bit neutra viral ramps yr schlitz. Direct trade portland goth chambray. Green juice selvage lomo freegan salvia keffiyeh sriracha master.', 28.39, 8898, NULL, '2021-03-29 02:40:38.305287', '2021-03-29 02:40:38.305287'),
(64, 25, 20, 5, 'I Will Fear No Evil', 80770, 'Letterpress phlogiston aesthetic seitan keytar.', 'Sriracha pbr&b kale chips. Single-origin coffee butcher organic. Tattooed flexitarian typewriter lumbersexual echo literally. Tacos migas vinyl meditation chicharrones bicycle rights occupy. Knausgaard trust fund truffaut.', 58.09, 1022, NULL, '2021-03-29 02:40:38.315469', '2021-03-29 02:40:38.315469'),
(65, 33, 16, 6, 'The Mirror Crack\'d from Side to Side', 18125, 'Viral pork belly slow-carb sriracha ramps.', 'Vice loko leggings +1 photo booth 90\'s tumblr. Gentrify sustainable salvia wolf. Craft beer tousled microdosing intelligentsia. Echo chicharrones whatever venmo portland health waistcoat plaid.', 60.42, 9500, NULL, '2021-03-29 02:40:38.325928', '2021-03-29 02:40:38.325928'),
(66, 30, 7, 5, 'Françoise Sagan', 98478, 'Stumptown irony vinegar gluten-free.', 'Pbr&b roof brooklyn slow-carb heirloom yuccie. Squid gentrify biodiesel twee vinegar. Ennui single-origin coffee five dollar toast selvage synth pitchfork everyday. Pickled beard post-ironic. Listicle meh try-hard.', 10.83, 4709, NULL, '2021-03-29 02:40:38.335961', '2021-03-29 02:40:38.335961'),
(67, 46, 20, 8, 'The Golden Apples of the Sun', 69584, 'Leggings plaid kale chips try-hard master everyday.', 'Single-origin coffee xoxo polaroid farm-to-table selfies semiotics normcore. Drinking blue bottle keytar roof occupy heirloom tofu. Direct trade meditation asymmetrical phlogiston 8-bit scenester yolo. Pitchfork cleanse kale chips pickled yolo.', 5.08, 6995, NULL, '2021-03-29 02:40:38.347865', '2021-03-29 02:40:38.347865'),
(68, 39, 16, 6, 'For Whom the Bell Tolls', 63745, 'Chartreuse diy schlitz viral fanny pack.', 'Chia art party franzen locavore chillwave salvia marfa. Lumbersexual cornhole jean shorts forage. Portland squid skateboard green juice. Tattooed schlitz tousled vinyl food truck banh mi umami selvage.', 39.85, 2456, NULL, '2021-03-29 02:40:38.358061', '2021-03-29 02:40:38.358061'),
(69, 12, 15, 2, 'Wildfire at Midnight', 16501, '8-bit biodiesel hella quinoa banjo flannel.', 'Shoreditch aesthetic farm-to-table ugh helvetica readymade vhs. Iphone whatever ugh. Pabst jean shorts muggle magic sartorial five dollar toast swag. Plaid cliche marfa jean shorts farm-to-table pork belly iphone. Gastropub direct trade umami literally blog.', 20.16, 9389, NULL, '2021-03-29 02:40:38.368378', '2021-03-29 02:40:38.368378'),
(70, 44, 12, 3, 'I Sing the Body Electric', 34863, 'Stumptown chicharrones humblebrag paleo venmo letterpress echo.', 'Salvia leggings loko everyday pickled irony butcher. Trust fund loko biodiesel. Slow-carb tote bag thundercats. Actually tattooed yuccie mlkshk normcore sustainable whatever bespoke. Fingerstache cronut ethical pug jean shorts readymade cred narwhal.', 73.37, 718, NULL, '2021-03-29 02:40:38.377833', '2021-03-29 02:40:38.377833'),
(71, 10, 18, 5, 'The Cricket on the Hearth', 55504, 'Freegan bespoke raw denim loko cronut semiotics wes anderson tilde microdosing.', 'Selfies gluten-free green juice literally pour-over photo booth. Hoodie lomo typewriter venmo meditation kogi. Post-ironic offal etsy asymmetrical cold-pressed. Butcher vinyl skateboard portland. Plaid irony 8-bit heirloom pickled.', 63.98, 6928, NULL, '2021-03-29 02:40:38.387943', '2021-03-29 02:40:38.387943'),
(72, 9, 6, 1, 'Now Sleeps the Crimson Petal', 53566, 'Portland aesthetic stumptown farm-to-table freegan.', 'Gluten-free slow-carb typewriter banh mi direct trade pabst knausgaard. Austin knausgaard cronut. Try-hard locavore bushwick seitan.', 7.33, 8574, NULL, '2021-03-29 02:40:38.398199', '2021-03-29 02:40:38.398199'),
(73, 45, 8, 3, 'If I Forget Thee Jerusalem', 79186, 'Asymmetrical farm-to-table taxidermy chillwave disrupt +1 art party.', 'Fashion axe photo booth yolo kinfolk locavore pinterest migas mlkshk. Helvetica vhs poutine pour-over leggings everyday. Everyday hashtag ramps hoodie. Vinegar bushwick vhs butcher post-ironic leggings portland.', 61.74, 2139, NULL, '2021-03-29 02:40:38.407800', '2021-03-29 02:40:38.407800'),
(74, 11, 25, 3, 'Great Work of Time', 79498, 'Stumptown narwhal sriracha cleanse bitters ennui craft beer trust fund.', 'Mumblecore vinegar wes anderson. Keffiyeh normcore listicle gluten-free leggings cray. Xoxo intelligentsia semiotics vhs irony.', 43.83, 3097, NULL, '2021-03-29 02:40:38.417027', '2021-03-29 02:40:38.417027'),
(75, 21, 26, 6, 'Stranger in a Strange Land', 24533, 'Viral lo-fi lumbersexual chia.', 'Church-key authentic mlkshk humblebrag. Cliche leggings cold-pressed semiotics. Banh mi pour-over wolf fingerstache vinyl truffaut vegan cray. Distillery banjo blue bottle waistcoat. Cred everyday chicharrones roof biodiesel craft beer street wes anderson.', 59.69, 3620, NULL, '2021-03-29 02:40:38.426650', '2021-03-29 02:40:38.426650'),
(76, 23, 26, 2, 'Great Work of Time', 96540, 'Lumbersexual pinterest you probably haven\'t heard of them before they sold out photo booth direct trade.', 'Church-key pabst gastropub flannel. Swag heirloom blog mlkshk chambray. Neutra whatever trust fund vice austin pabst retro photo booth. Yolo pitchfork gluten-free chartreuse lumbersexual.', 87.57, 1426, NULL, '2021-03-29 02:40:38.437051', '2021-03-29 02:40:38.437051'),
(77, 18, 6, 2, 'An Acceptable Time', 59867, 'Trust fund lomo mixtape truffaut shoreditch.', 'Typewriter thundercats muggle magic gentrify. Put a bird on it cleanse shabby chic +1 xoxo normcore post-ironic wolf. Cardigan cliche swag. Brunch tattooed quinoa. Five dollar toast diy lomo cray.', 6.01, 6198, NULL, '2021-03-29 02:40:38.448326', '2021-03-29 02:40:38.448326'),
(78, 3, 5, 7, 'A Time of Gifts', 97188, 'Tattooed scenester fanny pack pabst next level kogi brooklyn bespoke distillery.', 'Pabst photo booth swag mustache vhs mixtape plaid. Viral synth jean shorts lo-fi you probably haven\'t heard of them health. Chicharrones kickstarter forage art party park.', 8.31, 8957, NULL, '2021-03-29 02:40:38.457247', '2021-03-29 02:40:38.457247'),
(79, 30, 3, 2, 'The Glory and the Dream', 28029, 'Small batch freegan goth yuccie migas green juice.', 'Squid jean shorts lo-fi poutine hella. Umami beard pabst pug. Swag meditation franzen bushwick health raw denim banh mi. Vice kombucha tumblr sriracha chillwave schlitz. Ethical street marfa 8-bit put a bird on it fashion axe farm-to-table.', 79.38, 6685, NULL, '2021-03-29 02:40:38.467336', '2021-03-29 02:40:38.467336'),
(80, 42, 2, 1, 'Consider Phlebas', 33889, 'Single-origin coffee letterpress neutra kombucha listicle 90\'s pickled bicycle rights.', 'Slow-carb 90\'s banjo. Intelligentsia goth literally plaid pork belly phlogiston. Sustainable 8-bit art party brunch wes anderson portland salvia. Selvage ennui yuccie celiac lomo paleo. Cardigan cray knausgaard normcore humblebrag.', 24.56, 2601, NULL, '2021-03-29 02:40:38.478002', '2021-03-29 02:40:38.478002'),
(81, 23, 22, 10, 'Nectar in a Sieve', 27390, 'Farm-to-table chia williamsburg lo-fi thundercats.', 'Waistcoat chillwave typewriter organic lo-fi synth chia. Normcore cred ennui heirloom lomo. Pug trust fund mumblecore tumblr yuccie brooklyn. Listicle cardigan church-key craft beer biodiesel next level austin. Readymade intelligentsia cardigan artisan heirloom cronut.', 20.6, 4479, NULL, '2021-03-29 02:40:38.488027', '2021-03-29 02:40:38.488027'),
(82, 3, 6, 5, 'Things Fall Apart', 43601, 'Craft beer tattooed microdosing bespoke.', 'Try-hard swag messenger bag migas narwhal roof. Sriracha tofu kombucha beard pop-up. Celiac chambray chillwave butcher. Occupy selfies tumblr mlkshk.', 78.23, 8269, NULL, '2021-03-29 02:40:38.500786', '2021-03-29 02:40:38.500786'),
(83, 30, 10, 1, 'O Jerusalem!', 60533, 'Kitsch lomo muggle magic cardigan put a bird on it.', 'Kitsch tofu beard. Try-hard vinegar paleo diy echo photo booth. Vegan chicharrones put a bird on it.', 94.38, 5128, NULL, '2021-03-29 02:40:38.510404', '2021-03-29 02:40:38.510404'),
(84, 10, 3, 9, 'Look Homeward, Angel', 47934, 'Etsy knausgaard hoodie retro pop-up tousled.', 'Mlkshk lo-fi pour-over vinegar xoxo. Polaroid austin synth cred master kitsch. Distillery yr viral. Mumblecore ethical selvage roof muggle magic. Synth actually vinegar diy tattooed craft beer direct trade.', 8.42, 8731, NULL, '2021-03-29 02:40:38.522165', '2021-03-29 02:40:38.522165'),
(85, 8, 3, 4, 'No Highway', 54650, 'Food truck quinoa shabby chic xoxo occupy.', 'Lo-fi mixtape slow-carb pabst hoodie. Mumblecore taxidermy butcher diy flannel meditation semiotics gluten-free. Pbr&b brunch whatever twee drinking. 8-bit letterpress fingerstache roof offal seitan distillery cornhole. Tilde irony kitsch goth.', 11.64, 6639, NULL, '2021-03-29 02:40:38.536249', '2021-03-29 02:40:38.536249'),
(86, 35, 19, 2, 'The House of Mirth', 15067, 'Williamsburg pop-up tousled ennui.', 'Umami yr roof scenester distillery drinking. Small batch paleo sartorial meditation ethical crucifix ennui cardigan. Put a bird on it salvia chicharrones microdosing muggle magic williamsburg plaid twee. Offal heirloom art party. Crucifix seitan typewriter.', 69.9, 3470, NULL, '2021-03-29 02:40:38.550440', '2021-03-29 02:40:38.550440'),
(87, 34, 12, 2, 'I Sing the Body Electric', 42692, 'Vice intelligentsia selfies polaroid whatever banjo actually.', 'Cliche vinyl bicycle rights tattooed bespoke ethical. Freegan cornhole small batch. Readymade 8-bit twee messenger bag vinyl migas chambray franzen. Hoodie fingerstache letterpress.', 61.23, 7565, NULL, '2021-03-29 02:40:38.561593', '2021-03-29 02:40:38.561593'),
(88, 31, 24, 4, 'What\'s Become of Waring', 65671, 'Pork belly +1 aesthetic humblebrag yolo vhs offal migas.', 'Deep v meh twee 8-bit ramps. Biodiesel microdosing salvia. Banh mi chicharrones cold-pressed. Try-hard beard selfies cleanse celiac literally bicycle rights occupy. 3 wolf moon mlkshk squid normcore mixtape gentrify +1 meh.', 17.81, 7549, NULL, '2021-03-29 02:40:38.574427', '2021-03-29 02:40:38.574427'),
(89, 47, 8, 6, 'That Hideous Strength', 53235, 'Vinyl swag vegan art party health.', 'Godard chambray tofu. Lo-fi loko tousled franzen master truffaut wes anderson. Mlkshk narwhal kombucha. Drinking franzen craft beer knausgaard tote bag. Distillery drinking single-origin coffee cardigan sriracha blog irony food truck.', 27.47, 3202, NULL, '2021-03-29 02:40:38.587422', '2021-03-29 02:40:38.587422'),
(90, 29, 20, 9, 'A Summer Bird-Cage', 18732, 'Kogi loko chia wolf jean shorts selfies hammock thundercats.', 'Crucifix bicycle rights chartreuse. Cardigan kitsch wes anderson vinegar single-origin coffee. Next level retro craft beer poutine locavore tacos. Asymmetrical pabst iphone literally kombucha stumptown.', 6.5, 5872, NULL, '2021-03-29 02:40:38.600409', '2021-03-29 02:40:38.600409'),
(91, 16, 23, 8, 'Ego Dominus Tuus', 79020, 'Street yr pabst everyday whatever thundercats vinegar forage selfies.', 'Xoxo typewriter loko sartorial chambray chartreuse vegan helvetica. Chia williamsburg meggings beard cliche gluten-free lumbersexual. Salvia typewriter butcher forage messenger bag tofu.', 86.1, 2507, NULL, '2021-03-29 02:40:38.610246', '2021-03-29 02:40:38.610246'),
(92, 22, 13, 7, 'A Time of Gifts', 88807, 'Wes anderson health waistcoat biodiesel thundercats.', 'Tofu literally pickled chicharrones roof ramps waistcoat freegan. Five dollar toast tattooed whatever kogi 3 wolf moon. Paleo cronut brooklyn pitchfork twee hammock chillwave.', 98.01, 5112, NULL, '2021-03-29 02:40:38.623123', '2021-03-29 02:40:38.623123'),
(93, 28, 16, 7, 'Precious Bane', 82070, 'Forage tousled bushwick readymade cred humblebrag.', 'Mumblecore blue bottle loko phlogiston pinterest. Hashtag semiotics crucifix kale chips. Tattooed art party chillwave letterpress hammock semiotics.', 75.01, 5392, NULL, '2021-03-29 02:40:38.634869', '2021-03-29 02:40:38.634869'),
(94, 4, 2, 2, 'The Violent Bear It Away', 44721, 'Messenger bag chillwave microdosing next level swag portland yuccie ramps wes anderson.', 'Tousled next level scenester biodiesel shabby chic kale chips church-key bicycle rights. Helvetica offal meggings cold-pressed. Disrupt humblebrag fixie kitsch.', 8.3, 1105, NULL, '2021-03-29 02:40:38.646106', '2021-03-29 02:40:38.646106'),
(95, 24, 21, 5, 'In Dubious Battle', 77215, 'Readymade keffiyeh 8-bit 3 wolf moon.', '90\'s godard everyday pickled cliche +1 mlkshk. Post-ironic yr listicle ennui shoreditch five dollar toast. Flannel keytar carry pabst scenester. Yuccie loko selfies ennui fingerstache xoxo. Mixtape portland 90\'s.', 15.4, 9600, NULL, '2021-03-29 02:40:38.658789', '2021-03-29 02:40:38.658789'),
(96, 24, 9, 7, 'The Wind\'s Twelve Quarters', 71492, 'Migas occupy small batch echo meh brunch selvage chicharrones trust fund.', 'Vegan listicle offal scenester craft beer cronut chartreuse narwhal. Blog vegan small batch master. Intelligentsia celiac polaroid.', 41.18, 8509, NULL, '2021-03-29 02:40:38.672323', '2021-03-29 02:40:38.672323'),
(97, 45, 29, 3, 'Ring of Bright Water', 13356, 'Williamsburg banh mi chia literally forage.', 'Sartorial pop-up bespoke vinyl literally authentic yolo occupy. Yolo post-ironic portland food truck. Viral keffiyeh vegan.', 39.58, 4221, NULL, '2021-03-29 02:40:38.685880', '2021-03-29 02:40:38.685880'),
(98, 1, 20, 1, 'Blood\'s a Rover', 56593, 'Pour-over sustainable distillery swag wolf xoxo keffiyeh twee thundercats.', '3 wolf moon godard squid pickled kitsch. Flannel cornhole pork belly tofu. Butcher synth jean shorts semiotics ramps.', 25.39, 2890, NULL, '2021-03-29 02:40:38.696694', '2021-03-29 02:40:38.696694'),
(99, 18, 10, 5, 'The Stars\' Tennis Balls', 40116, 'Put a bird on it 8-bit synth mumblecore bitters marfa cold-pressed.', 'Yuccie vhs forage goth diy cold-pressed single-origin coffee. Scenester hammock fixie kombucha hoodie carry. Biodiesel flexitarian cray hella venmo helvetica pbr&b hashtag.', 75.22, 8064, NULL, '2021-03-29 02:40:38.709629', '2021-03-29 02:40:38.709629'),
(100, 35, 13, 6, 'Beneath the Bleeding', 64231, 'Tattooed wes anderson cardigan authentic hammock everyday kickstarter keytar.', 'Etsy letterpress brooklyn asymmetrical cornhole synth. Health umami green juice five dollar toast. Artisan shoreditch blog franzen direct trade cleanse. Roof yolo wolf swag forage. Hashtag master banjo listicle intelligentsia chillwave vhs lumbersexual.', 14.31, 7178, NULL, '2021-03-29 02:40:38.720780', '2021-03-29 02:40:38.720780');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_categories`
--

CREATE TABLE `book_categories` (
  `book_category_id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `book_categories`
--

INSERT INTO `book_categories` (`book_category_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Fable', 'Sustainable put a bird on it wes anderson taxidermy yolo swag aesthetic. Wes anderson ugh leggings dreamcatcher. Actually tilde truffaut church-key brooklyn kinfolk irony. Marfa waistcoat cardigan loko.', '2021-03-29 02:40:37.344329', '2021-03-29 02:40:37.344329'),
(2, 'Science fiction', 'Gastropub single-origin coffee sartorial hoodie kombucha. Meh chambray kickstarter microdosing gastropub vegan. Pinterest brunch mlkshk kickstarter cronut pickled kale chips portland.', '2021-03-29 02:40:37.352978', '2021-03-29 02:40:37.352978'),
(3, 'Biography/Autobiography', 'Five dollar toast yolo mixtape flexitarian before they sold out chillwave. Fanny pack shoreditch pinterest everyday. Letterpress twee everyday cliche fanny pack cornhole echo mixtape. 3 wolf moon pabst poutine small batch leggings.', '2021-03-29 02:40:37.363114', '2021-03-29 02:40:37.363114'),
(4, 'Mythopoeia', 'Vegan meh pork belly semiotics. +1 loko craft beer dreamcatcher banjo. Salvia yolo cold-pressed kogi gentrify.', '2021-03-29 02:40:37.374034', '2021-03-29 02:40:37.374034'),
(5, 'Fanfiction', 'Austin narwhal chia. Taxidermy organic tumblr literally twee green juice gentrify everyday. Flannel stumptown direct trade cold-pressed tilde church-key. Jean shorts sartorial forage try-hard kombucha put a bird on it polaroid iphone. Occupy messenger bag single-origin coffee.', '2021-03-29 02:40:37.423379', '2021-03-29 02:40:37.423379'),
(6, 'Suspense/Thriller', 'Twee celiac semiotics. Celiac plaid migas kale chips etsy goth. Keytar everyday five dollar toast kale chips tacos pitchfork chartreuse lomo. Letterpress freegan pitchfork semiotics ennui. +1 messenger bag readymade chia ennui cray lumbersexual.', '2021-03-29 02:40:37.436663', '2021-03-29 02:40:37.436663'),
(7, 'Mythology', 'Lomo master pitchfork +1 blue bottle. Salvia cronut green juice cleanse single-origin coffee five dollar toast irony. Diy green juice cleanse.', '2021-03-29 02:40:37.447250', '2021-03-29 02:40:37.447250'),
(8, 'Fanfiction', 'Tacos pickled beard austin fanny pack. Lumbersexual seitan flannel lomo. Meggings retro direct trade xoxo polaroid cray waistcoat yuccie.', '2021-03-29 02:40:37.455738', '2021-03-29 02:40:37.455738'),
(9, 'Textbook', 'Banjo tattooed church-key tofu synth hella deep v ethical. Before they sold out cray kickstarter. Intelligentsia bushwick blue bottle +1. Health cold-pressed xoxo umami slow-carb loko stumptown poutine.', '2021-03-29 02:40:37.463510', '2021-03-29 02:40:37.463510'),
(10, 'Essay', 'Before they sold out synth leggings hella. Beard meggings quinoa. Cornhole five dollar toast forage normcore letterpress jean shorts. Helvetica lumbersexual shoreditch post-ironic direct trade blog occupy bushwick.', '2021-03-29 02:40:37.473372', '2021-03-29 02:40:37.473372');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `publishers`
--

CREATE TABLE `publishers` (
  `publisher_id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `publishers`
--

INSERT INTO `publishers` (`publisher_id`, `name`, `phone`, `address`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Paulist Press', '210-075-3475', 'North Willardfurt 90095 Gislason Springs', 'Single-origin coffee flannel squid photo booth keytar. Single-origin coffee actually chicharrones skateboard salvia pug organic. Irony blue bottle church-key keffiyeh. Chartreuse tacos food truck butcher.', '2021-03-29 02:40:36.268092', '2021-03-29 02:40:36.268092'),
(2, 'Bowes & Bowes', '(172) 736-3306', 'Willietown 5528 Phebe Mission', 'Sustainable street art party wolf cronut brunch tattooed swag. Shoreditch yolo freegan tilde ethical tote bag. Goth chillwave schlitz tilde beard. Dreamcatcher scenester yolo. Narwhal yuccie tofu.', '2021-03-29 02:40:36.308574', '2021-03-29 02:40:36.308574'),
(3, 'Chick Publications', '(526) 216-9746', 'Rippinborough 3107 Sindy Mountain', 'Carry everyday ramps tofu post-ironic bushwick. Fashion axe pug echo cred. Leggings neutra tofu etsy.', '2021-03-29 02:40:36.323512', '2021-03-29 02:40:36.323512'),
(4, 'Matthias Media', '979.925.2346', 'West Alline 52333 Lawanda Field', 'Pbr&b bushwick pitchfork skateboard literally celiac. Austin bitters cray wolf next level green juice fixie tote bag. Sustainable brooklyn pinterest. 3 wolf moon street cleanse tousled knausgaard. Intelligentsia wolf portland vhs cornhole freegan.', '2021-03-29 02:40:36.342627', '2021-03-29 02:40:36.342627'),
(5, 'Felony & Mayhem Press', '275-385-7101', 'North Patricktown 38575 Kuphal Unions', 'Vice migas mumblecore phlogiston. Small batch helvetica wolf before they sold out. Church-key hashtag normcore meditation paleo muggle magic bitters brooklyn. Shoreditch kinfolk godard bicycle rights. Franzen tacos mustache shoreditch lo-fi.', '2021-03-29 02:40:36.358448', '2021-03-29 02:40:36.358448'),
(6, 'George Routledge & Sons', '(723) 357-4072', 'Antoinetteberg 6173 Nelida Drive', 'Semiotics sartorial ugh chambray mixtape artisan typewriter kickstarter. Vinyl try-hard disrupt chia post-ironic keffiyeh yr vice. Post-ironic venmo muggle magic. Cleanse keffiyeh post-ironic organic. Goth intelligentsia swag.', '2021-03-29 02:40:36.372506', '2021-03-29 02:40:36.372506'),
(7, 'Atheneum Publishers', '671-760-3906', 'East Normandville 17555 Gleason Run', 'Freegan cred vhs umami. Diy 3 wolf moon hashtag keffiyeh literally chambray. Next level craft beer brunch chicharrones normcore chambray. Stumptown cred pinterest scenester.', '2021-03-29 02:40:36.386044', '2021-03-29 02:40:36.386044'),
(8, 'Carcanet Press', '815.760.5567', 'Karolineland 2258 Rashad Station', 'Small batch meditation mlkshk mixtape. Farm-to-table swag mustache ennui cred franzen tofu five dollar toast. Cornhole biodiesel mlkshk offal lumbersexual fanny pack everyday organic.', '2021-03-29 02:40:36.396000', '2021-03-29 02:40:36.396000'),
(9, 'FabJob', '1-741-616-9094', 'Terrybury 572 Bruen Circles', 'Forage vegan franzen squid banh mi bicycle rights. Tattooed pork belly shoreditch vhs wayfarers forage portland. Slow-carb fashion axe mlkshk cray banh mi. Heirloom gentrify 3 wolf moon flannel biodiesel. Before they sold out bushwick gluten-free.', '2021-03-29 02:40:36.408857', '2021-03-29 02:40:36.408857'),
(10, 'Earthscan', '820.139.6564', 'Lake Francisco 2447 Macie Island', 'Whatever twee swag. Messenger bag narwhal banh mi retro. Before they sold out photo booth pabst knausgaard kitsch. 90\'s try-hard vice truffaut pug trust fund. Migas listicle wes anderson meh flannel swag.', '2021-03-29 02:40:36.419914', '2021-03-29 02:40:36.419914'),
(11, 'Manchester University Press', '(125) 377-8043', 'New Leonora 30050 Sauer Ramp', 'Kogi kinfolk pug authentic selfies. Keytar gentrify brooklyn yuccie health organic tattooed vhs. Locavore hashtag green juice yuccie 90\'s fixie vinyl xoxo. Cronut yr marfa gentrify.', '2021-03-29 02:40:36.428891', '2021-03-29 02:40:36.428891'),
(12, 'Mainstream Publishing', '594.504.6651', 'Antwanstad 15871 Ernest Alley', 'Slow-carb +1 banjo cred trust fund flexitarian drinking paleo. Ethical tattooed phlogiston ramps pinterest forage. Chillwave narwhal celiac. Biodiesel hoodie scenester skateboard keffiyeh typewriter sartorial.', '2021-03-29 02:40:36.439740', '2021-03-29 02:40:36.439740'),
(13, 'Brimstone Press', '914.042.8619', 'North Rickeychester 153 Bednar Rapid', 'Actually cliche etsy migas dreamcatcher kale chips brunch vinyl. 3 wolf moon try-hard trust fund vice butcher freegan quinoa kitsch. Godard kitsch gastropub.', '2021-03-29 02:40:36.449286', '2021-03-29 02:40:36.449286'),
(14, 'Bloodaxe Books', '1-219-731-3708', 'Juanmouth 7936 Domitila Shore', 'Hashtag tofu church-key cliche stumptown dreamcatcher. Vegan vinyl gluten-free dreamcatcher bushwick biodiesel street. Fanny pack craft beer street.', '2021-03-29 02:40:36.458650', '2021-03-29 02:40:36.458650'),
(15, 'Happy House', '1-393-399-6390', 'New Franklinshire 46979 Burton Junction', 'Cliche butcher distillery put a bird on it raw denim sriracha. Pop-up art party 3 wolf moon. Retro twee schlitz neutra fanny pack.', '2021-03-29 02:40:36.468283', '2021-03-29 02:40:36.468283'),
(16, 'City Lights Publishers', '1-902-056-0502', 'South Lareestad 935 Branden Pass', 'Pitchfork fingerstache gentrify artisan vinegar drinking post-ironic chillwave. Wolf aesthetic yuccie. Seitan you probably haven\'t heard of them health whatever five dollar toast fixie cred leggings.', '2021-03-29 02:40:36.477219', '2021-03-29 02:40:36.477219'),
(17, 'Taylor & Francis', '(923) 088-3631', 'Harleyfort 5827 Brice Station', 'Irony twee keffiyeh. Goth blog paleo letterpress. Locavore everyday church-key paleo ugh yuccie.', '2021-03-29 02:40:36.487093', '2021-03-29 02:40:36.487093'),
(18, 'Applewood Books', '1-995-502-5969', 'South Santostown 26912 Donn Groves', 'Kale chips intelligentsia cornhole deep v meh pickled tousled narwhal. Poutine green juice migas humblebrag health seitan ugh. Dreamcatcher slow-carb literally fashion axe church-key. Readymade polaroid scenester.', '2021-03-29 02:40:36.497502', '2021-03-29 02:40:36.497502'),
(19, 'Hodder & Stoughton', '(354) 916-2342', 'Port Charlott 212 Stark Lock', 'Authentic tilde migas shoreditch xoxo. Squid swag aesthetic retro meditation irony bitters. Street raw denim pork belly normcore pbr&b before they sold out chicharrones. Brunch farm-to-table blog kombucha ugh disrupt. Cold-pressed cray franzen cronut locavore hashtag 3 wolf moon.', '2021-03-29 02:40:36.506604', '2021-03-29 02:40:36.506604'),
(20, 'Pavilion Books', '550.126.9593', 'Rueckerchester 7927 Esteban Ports', 'Farm-to-table fanny pack synth loko lomo. Literally swag butcher. Vegan flexitarian pinterest venmo organic banh mi twee.', '2021-03-29 02:40:36.515680', '2021-03-29 02:40:36.515680'),
(21, 'Ian Allan Publishing', '603-206-5743', 'Port Ofelia 3226 Bret Junctions', 'Asymmetrical keytar offal. Tote bag selvage waistcoat direct trade leggings kitsch pbr&b. Yr hella ramps dreamcatcher. Hashtag truffaut 8-bit cray. Shabby chic trust fund messenger bag readymade taxidermy blue bottle church-key.', '2021-03-29 02:40:36.524944', '2021-03-29 02:40:36.524944'),
(22, 'Edupedia Publications', '288.847.8430', 'Lake Otis 80901 Stokes Crescent', 'Kickstarter chicharrones truffaut pug. Ramps you probably haven\'t heard of them meditation polaroid butcher. Ramps kale chips photo booth health five dollar toast swag readymade. Wolf swag meditation. Kale chips franzen knausgaard chillwave street typewriter cornhole post-ironic.', '2021-03-29 02:40:36.534942', '2021-03-29 02:40:36.534942'),
(23, 'Mainstream Publishing', '(490) 296-8190', 'West Neilport 44706 Kovacek Way', 'Microdosing meh pitchfork. Squid microdosing 3 wolf moon cray lo-fi. Direct trade banh mi diy. Cronut 3 wolf moon twee authentic trust fund listicle intelligentsia.', '2021-03-29 02:40:36.545092', '2021-03-29 02:40:36.545092'),
(24, 'Atlas Press', '817.078.0317', 'Braunville 16476 Bernier Land', 'Flexitarian vegan lo-fi. Wolf chartreuse flexitarian cliche mumblecore green juice five dollar toast locavore. Cardigan ethical fingerstache.', '2021-03-29 02:40:36.588838', '2021-03-29 02:40:36.588838'),
(25, 'Da Capo Press', '(527) 025-1909', 'New Lajuana 72613 Karri Course', 'Umami crucifix tote bag wes anderson chambray. Vhs irony scenester actually distillery occupy. Pop-up sriracha slow-carb. Mlkshk offal quinoa. Readymade hella lomo poutine sriracha food truck ethical.', '2021-03-29 02:40:36.602799', '2021-03-29 02:40:36.602799'),
(26, 'Target Books', '569-000-8511', 'New Hye 2988 Koss Throughway', 'Loko hammock shoreditch wes anderson synth knausgaard hashtag. Semiotics 90\'s hoodie scenester. Cleanse paleo disrupt pickled post-ironic brunch schlitz.', '2021-03-29 02:40:36.611964', '2021-03-29 02:40:36.611964'),
(27, 'Peace Hill Press', '695-189-9641', 'Port Shonda 18278 Yasmin Greens', 'Ugh irony cronut five dollar toast meh. Church-key kale chips helvetica chillwave. Banh mi aesthetic ugh selvage paleo 90\'s.', '2021-03-29 02:40:36.622794', '2021-03-29 02:40:36.622794'),
(28, 'Target Books', '1-395-570-7899', 'Schultztown 3210 Zulma Lakes', 'Scenester ugh vinyl banjo franzen pug williamsburg letterpress. Cray deep v post-ironic chicharrones. Raw denim hammock irony chambray. Lumbersexual gluten-free heirloom squid lo-fi ramps biodiesel art party.', '2021-03-29 02:40:36.640289', '2021-03-29 02:40:36.640289'),
(29, 'Marshall Cavendish', '(795) 384-0201', 'North Bernardohaven 27937 Hahn Summit', 'Pickled sriracha fingerstache. Selvage selfies swag deep v heirloom post-ironic. Paleo iphone hella asymmetrical mlkshk yuccie.', '2021-03-29 02:40:36.650135', '2021-03-29 02:40:36.650135'),
(30, 'Black Library', '(928) 538-4070', 'Joshtown 255 Reynolds Knoll', 'Helvetica waistcoat polaroid mustache meditation blue bottle. Fingerstache irony disrupt gastropub meditation. Art party poutine cardigan park carry occupy. Fixie ramps farm-to-table pour-over whatever cardigan.', '2021-03-29 02:40:36.659137', '2021-03-29 02:40:36.659137');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20210324075428'),
('20210324075437'),
('20210324075444'),
('20210324075452'),
('20210324080606'),
('20210328034348');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` bigint NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `address`, `created_at`, `updated_at`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`) VALUES
(1, 'Demo', 'User', 'demo@example.com', '1-774-876-5591 x661', 'Schillerburgh 99773 Weissnat Tunnel', '2021-03-29 02:40:34.987967', '2021-03-29 02:40:34.987967', '$2a$12$/1rOyt96AgDGZRoyKGERs.yvBVZKhqDoUwJThxnTPCWHp5HFBLnfG', NULL, NULL, NULL),
(2, 'Louis', 'Johns', 'yolando.schmeler@yahoo.com', '676-623-7870 x87718', 'New Oda 652 Weston Corner', '2021-03-29 02:40:35.283385', '2021-03-29 02:40:35.283385', '$2a$12$SfYXz7kVQ.nxtE4XfM/3YujQptE0xM8CzeMHsTnhf93C3Uq0fx/Ra', NULL, NULL, NULL),
(3, 'Francisco', 'Hahn', 'wilburn.bailey@hotmail.com', '643-671-1337', 'Collierton 9333 Adolfo Street', '2021-03-29 02:40:35.509271', '2021-03-29 02:40:35.509271', '$2a$12$auM9xbAmJkT4Se3uj2GHn.Krr0MmjIPimC2k.J7FjWAuaoJjCkk.6', NULL, NULL, NULL),
(4, 'Arlen', 'Blick', 'brian.mraz@hotmail.com', '125-705-1137 x6288', 'Rippinmouth 72742 Eladia Curve', '2021-03-29 02:40:35.744142', '2021-03-29 02:40:35.744142', '$2a$12$mjNl2gHxzu3wl.G9FRDbh.qxgBiVG4VG0vf4LbQU2YJ5eDykbYL56', NULL, NULL, NULL),
(5, 'Robena', 'Hermiston', 'will.hills@gmail.com', '1-224-873-0561', 'New Stacyside 114 Kali Estates', '2021-03-29 02:40:35.969317', '2021-03-29 02:40:35.969317', '$2a$12$Aivrea02kP3JVqKwHCnCD.e5tMCtnrI.PiUtoe7WH.6V3Zxv6Xkma', NULL, NULL, NULL),
(6, 'Caren', 'Rath', 'josiah@yahoo.com', '205.941.6016 x43317', 'New Royal 716 Corkery Inlet', '2021-03-29 02:40:36.203100', '2021-03-29 02:40:36.203100', '$2a$12$xiqmf1w/oBWF7axDAahzAehSIfS9sPVYjEdynEnrMkRtFWkA8PkSu', NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Chỉ mục cho bảng `book_categories`
--
ALTER TABLE `book_categories`
  ADD PRIMARY KEY (`book_category_id`);

--
-- Chỉ mục cho bảng `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Chỉ mục cho bảng `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `index_users_on_email` (`email`),
  ADD UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `book_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `book_categories`
--
ALTER TABLE `book_categories`
  MODIFY `book_category_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `publishers`
--
ALTER TABLE `publishers`
  MODIFY `publisher_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
