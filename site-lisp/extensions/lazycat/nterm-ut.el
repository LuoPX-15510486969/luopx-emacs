;; -*-coding: utf-8 -*-
;;; nterm-ut.el --- nterm unit testing

;;; Commentary:

;;; THANKS:

;;; BUGS:

;;; INSTALLATION:

;;; Code:
(require 'ert-ui)
(require 'nterm)

(defun nterm-ut-checksum ()
  "Display screen and memory checksum.
It places the result in the kill ring."
  (interactive)
  (let ((string (format "\"%s\" \"%s\""
                        (md5 (get-buffer nterm-buffer-name))
                        (nterm-mem-checksum))))
    (kill-new string)
    (message string)))

(defun nterm-ut-init ()
  "Init nterm for unit testing"
  (if (get-buffer nterm-buffer-name)
      (kill-buffer nterm-buffer-name))
  (setq nterm-unit-testing t)
  (nterm-mode))


(defun nterm-ut (md5-buf md5-mem record)
  "Emulate sequence RECORD then checksum screen and memory."
  (nterm-ut-init)
  (nterm-emulate nil record)
  (setq nterm-unit-testing nil)
  (and
   (string= (md5 (get-buffer nterm-buffer-name)) md5-buf)
   (string= (nterm-mem-checksum) md5-mem)))


;;; Test of cursor movements
(ert-deftest nterm-vttest-1-1 ()
  (should (nterm-ut 
"8752c42bb037e167ca4d0b5c1eaa3806" "2601cc448dbfd675b3a32619b3791995"
 (concat
"
"[18;60H[0J[1K[9;71H[0K[10;10H[1K[10;71H[0K[11;10H"
"[1K[11;71H[0K[12;10H[1K[12;71H[0K[13;10H[1K[13;71H"
"[0K[14;10H[1K[14;71H[0K[15;10H[1K[15;71H[0K[16;10H"
"[1K[16;71H[0K[17;30H[2K[24;1f*[1;1f*[24;2f*[1;2f*[2"
"4;3f*[1;3f*[24;4f*[1;4f*[24;5f*[1;5f*[24;6f*[1;6f*[2"
"4;7f*[1;7f*[24;8f*[1;8f*[24;9f*[1;9f*[24;10f*[1;10f*"
"[24;11f*[1;11f*[24;12f*[1;12f*[24;13f*[1;13f*[24;14f*"
"[1;14f*[24;15f*[1;15f*[24;16f*[1;16f*[24;17f*[1;17f*["
"24;18f*[1;18f*[24;19f*[1;19f*[24;20f*[1;20f*[24;21f*["
"1;21f*[24;22f*[1;22f*[24;23f*[1;23f*[24;24f*[1;24f*[2"
"4;25f*[1;25f*[24;26f*[1;26f*[24;27f*[1;27f*[24;28f*[1"
";28f*[24;29f*[1;29f*[24;30f*[1;30f*[24;31f*[1;31f*[24"
";32f*[1;32f*[24;33f*[1;33f*[24;34f*[1;34f*[24;35f*[1;"
"35f*[24;36f*[1;36f*[24;37f*[1;37f*[24;38f*[1;38f*[24;"
"39f*[1;39f*[24;40f*[1;40f*[24;41f*[1;41f*[24;42f*[1;4"
"2f*[24;43f*[1;43f*[24;44f*[1;44f*[24;45f*[1;45f*[24;4"
"6f*[1;46f*[24;47f*[1;47f*[24;48f*[1;48f*[24;49f*[1;49"
"f*[24;50f*[1;50f*[24;51f*[1;51f*[24;52f*[1;52f*[24;53"
"f*[1;53f*[24;54f*[1;54f*[24;55f*[1;55f*[24;56f*[1;56f"
"*[24;57f*[1;57f*[24;58f*[1;58f*[24;59f*[1;59f*[24;60f"
"*[1;60f*[24;61f*[1;61f*[24;62f*[1;62f*[24;63f*[1;63f*"
"[24;64f*[1;64f*[24;65f*[1;65f*[24;66f*[1;66f*[24;67f*"
"[1;67f*[24;68f*[1;68f*[24;69f*[1;69f*[24;70f*[1;70f*"
"[24;71f*[1;71f*[24;72f*[1;72f*[24;73f*[1;73f*[24;74f*"
"[1;74f*[24;75f*[1;75f*[24;76f*[1;76f*[24;77f*[1;77f*["
"24;78f*[1;78f*[24;79f*[1;79f*[24;80f*[1;80f*[2;2H+[1D"
"D+[1DD+[1DD+[1DD+[1DD+[1DD+[1DD+[1DD+[1DD+"
"[1DD+[1DD+[1DD+[1DD+[1DD+[1DD+[1DD+[1DD+[1D"
"D+[1DD+[1DD+[1DD+[1DD[23;79H+[1DM+[1DM+[1DM+"
"[1DM+[1DM+[1DM+[1DM+[1DM+[1DM+[1DM+[1DM+[1D"
"M+[1DM+[1DM+[1DM+[1DM+[1DM+[1DM+[1DM+[1DM+["
"1DM+[1DM[2;1H*[2;80H*[10DE*[3;80H*[10DE*[4;80H*["
"10DE*[5;80H*[10DE*[6;80H*[10DE*[7;80H*[10DE*[8;80"
"H*[10DE*[9;80H*[10DE*[10;80H*[10D
"[12;80H*[10D
"[10D
"[19;80H*[10D
"[10D
"D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+["
"0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D["
"1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C"
"[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+"
"[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D"
"[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0"
"C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1"
"C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C["
"2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+"
"[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D"
"[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C"
"[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C"
"+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2"
"D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+["
"0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D["
"1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C[2D[1C+[0C"
"[2D[1C[23;70H[42C[2D+[1D[1C[0D+[1D[1C[0D+[1D[1"
"C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0"
"D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+"
"[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D"
"[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C"
"[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D"
"+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1"
"D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1"
"C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0"
"D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+"
"[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D"
"[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C"
"[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D"
"+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1"
"D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1"
"C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0"
"D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+"
"[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D[1C[0D+[1D"
"[1C[0D[1;1H[10A[1A[0A[24;80H[10B[1B[0B[10;12H    "
"                                                      [1B["
"58D                                                         "
" [1B[58D                                                  "
"        [1B[58D                                           "
"               [1B[58D                                    "
"                      [1B[58D                             "
"                             [1B[58D[5A[1CThe screen sho"
"uld be cleared,  and have an unbroken bor-[12;13Hder of *'s"
" and +'s around the edge,   and exactly in the[13;13Hmiddle"
"  there should be a frame of E's around this  text[14;13Hwi"
"th  one (1) free position around it.    Push <RETURN>"))))

(ert-deftest nterm-vttest-1-3 ()
  (should (nterm-ut 
"3e98ebe35b09b63d405b209dbc53c8d4" "1ab768a2b495fa6e0afac3fb8457fc59"
 (concat
"[?7h[?3l[?"
"3lTest of autowrap, mixing control and print characters.
"he left/right margins should have letters in order:
"r[?6h[19;1HA[19;80Ha
"		c[19;2HC
"[18;80HeF[19;80HF f
"[18;1HH[18;80Hh[19;1HI[19;80Hi
"[19;80HK		k[19;2HK
"[19;80Hm
"[19;80H
"80HR r
"t[19;1HU[19;80Hu
"19;2HW
"80HyZ[19;80HZ z

(ert-deftest nterm-vttest-1-5 ()
  (should (nterm-ut 
"ef9d62ea5e6fda8be254102039b3255a" "a80541da236f0833e9c3ef725af7200d"
 (concat
"[?"
"3l[2J[1;1HTest of cursor-control characters inside ESC seq"
"uences.
" E F G H I
"CI[2C
"16CI
"AH [1AI [1A

(ert-deftest nterm-vttest-1-6 ()
  (should (nterm-ut 
"896bbb6c0159f94a75a1415ab62dedda" "ebe079c1fd8b81b5d61ea9188d17dc26"
 (concat
"[2J[1;1HTest of leading "
"zeros in ESC sequences.
" sentence \"This is a correct sentence\".[00000000004;0000000"
"01HT[00000000004;000000002Hh[00000000004;000000003Hi[0000"
"0000004;000000004Hs[00000000004;000000005H [00000000004;00"
"0000006Hi[00000000004;000000007Hs[00000000004;000000008H "
"[00000000004;000000009Ha[00000000004;0000000010H [00000000"
"004;0000000011Hc[00000000004;0000000012Ho[00000000004;0000"
"000013Hr[00000000004;0000000014Hr[00000000004;0000000015He"
"[00000000004;0000000016Hc[00000000004;0000000017Ht[000000"
"00004;0000000018H [00000000004;0000000019Hs[00000000004;00"
"00000020He[00000000004;0000000021Hn[00000000004;0000000022"
"Ht[00000000004;0000000023He[00000000004;0000000024Hn[0000"
"0000004;0000000025Hc[00000000004;0000000026He[20;1HPush <R"
"ETURN>"))))

;;; Test of screen features
(ert-deftest nterm-vttest-2-1 ()
  (should (nterm-ut 
"ad8d360cca3dd644390124a846e397cd" "33c2707fe415cd6bd36fbe99279982cb"
 (concat
"
"************************************************************"
"*********************************************************[?"
"7l[3;1H****************************************************"
"************************************************************"
"************************************************[?7h[5;1HT"
"his should be three identical lines of *'s completely fillin"
"g
"(Test of WRAP AROUND mode setting.)

(ert-deftest nterm-vttest-2-2 ()
  (should (nterm-ut 
"ec57a300b5c796408c7ae6d51ae2146a" "689c6d2d0443f7e27bf7f0d6ffacb1db"
 (concat
"[2J[3g"
"[1;1H[3CH[3CH[3CH[3CH[3CH[3CH[3CH[3CH[3CH"
"[3CH[3CH[3CH[3CH[3CH[3CH[3CH[3CH[3CH[3CH"
"[3CH[3CH[3CH[3CH[3CH[3CH[3CH[1;4H[0g[6C[0g"
"[6C[0g[6C[0g[6C[0g[6C[0g[6C[0g[6C[0g[6C[0g[6C"
"[0g[6C[0g[6C[0g[6C[0g[6C[1;7H[1g[2g[1;1H	*	*	*	*"
"	*	*	*	*	*	*	*	*	*[2;2H     *     *     *     *     *     *"
"     *     *     *     *     *     *     *[4;1HTest of TAB "
"setting/resetting. These two lines
"ush <RETURN>"))))

(ert-deftest nterm-vttest-2-3 ()
  (should (nterm-ut 
"0bd1cae765007548eae21bd37f206a02" "13255ee965350900167b32473909fe99"
 (concat
"[?5h[?3h[2J[1;1H[3g[8CH[8CH[8CH[8CH"
"[8CH[8CH[8CH[8CH[8CH[8CH[8CH[8CH[8CH[8CH"
"[8CH[8CH[8CH[1;1H123456789012345678901234567890123456"
"789012345678901234567890123456789012345678901234567890123456"
"78901234567890123456789012345678901[3;3HThis is 132 column "
"mode, light background.[4;4HThis is 132 column mode, light "
"background.[5;5HThis is 132 column mode, light background."
"[6;6HThis is 132 column mode, light background.[7;7HThis is"
" 132 column mode, light background.[8;8HThis is 132 column "
"mode, light background.[9;9HThis is 132 column mode, light "
"background.[10;10HThis is 132 column mode, light background"
".[11;11HThis is 132 column mode, light background.[12;12HT"
"his is 132 column mode, light background.[13;13HThis is 132"
" column mode, light background.[14;14HThis is 132 column mo"
"de, light background.[15;15HThis is 132 column mode, light "
"background.[16;16HThis is 132 column mode, light background"
".[17;17HThis is 132 column mode, light background.[18;18HT"
"his is 132 column mode, light background.[19;19HThis is 132"
" column mode, light background.[20;20HThis is 132 column mo"
"de, light background.Push <RETURN>"))))

(ert-deftest nterm-vttest-2-7 ()
  (should (nterm-ut 
"f70ca90ba5a60c526d2c66c0d9eac1c7" "d6f0b5ffd36573c384280a7e2ae7a63d"
 (concat
"[2J[?6h[?4h[12;13r[2J[24BSoft "
"scroll up region [12..13] size 2 Line 1
"on [12..13] size 2 Line 2
"ze 2 Line 3
"oft scroll up region [12..13] size 2 Line 5
"region [12..13] size 2 Line 6
"] size 2 Line 7
"8
" up region [12..13] size 2 Line 10
"2..13] size 2 Line 11
" Line 12
"t scroll up region [12..13] size 2 Line 14
"egion [12..13] size 2 Line 15
"] size 2 Line 16
" 17
"oll up region [12..13] size 2 Line 19
" [12..13] size 2 Line 20
"e 2 Line 21
"Soft scroll up region [12..13] size 2 Line 23
"p region [12..13] size 2 Line 24
".13] size 2 Line 25
"ine 26
"scroll up region [12..13] size 2 Line 28
"ion [12..13] size 2 Line 29
"2..13] size 2 Line 1
"ize 2 Line 2
"ne 3
"MSoft scroll down region [12..13] size 2 Line 5
"croll down region [12..13] size 2 Line 6
"wn region [12..13] size 2 Line 7
"n [12..13] size 2 Line 8
"3] size 2 Line 9
"2 Line 10
"11
"MSoft scroll down region [12..13] size 2 Line 13
"croll down region [12..13] size 2 Line 14
"own region [12..13] size 2 Line 15
"ion [12..13] size 2 Line 16
"..13] size 2 Line 17
"ize 2 Line 18
"ine 19
"MMSoft scroll down region [12..13] size 2 Line 21
"ft scroll down region [12..13] size 2 Line 22
"ll down region [12..13] size 2 Line 23
" region [12..13] size 2 Line 24
" [12..13] size 2 Line 25
"3] size 2 Line 26
" 2 Line 27
" 28
"MPush <RETURN>"))))

(ert-deftest nterm-vttest-2-8 ()
  (should (nterm-ut 
"57237d69771a6593eb105eb152bb0549" "fecd5cbe33f4903d12007abe3f80e063"
 (concat
"[1;24r[2J[24BSoft scroll up region [1..24] size 24 Line"
" 1
"l up region [1..24] size 24 Line 3
"..24] size 24 Line 4
"Line 5
"croll up region [1..24] size 24 Line 7
"n [1..24] size 24 Line 8
" 24 Line 9
"oft scroll up region [1..24] size 24 Line 11
" region [1..24] size 24 Line 12
"4] size 24 Line 13
"ne 14
"croll up region [1..24] size 24 Line 16
"on [1..24] size 24 Line 17
"ze 24 Line 18
"
" up region [1..24] size 24 Line 21
"..24] size 24 Line 22
" Line 23
"t scroll up region [1..24] size 24 Line 25
"egion [1..24] size 24 Line 26
" size 24 Line 27
" 28
"t scroll down region [1..24] size 24 Line 1
" down region [1..24] size 24 Line 2
"gion [1..24] size 24 Line 3
".24] size 24 Line 4
"e 24 Line 5
"e 6
"MSoft scroll down region [1..24] size 24 Line 8
"roll down region [1..24] size 24 Line 9
"n region [1..24] size 24 Line 10
"n [1..24] size 24 Line 11
"4] size 24 Line 12
" 24 Line 13
"e 14
"MMSoft scroll down region [1..24] size 24 Line 16
" scroll down region [1..24] size 24 Line 17
" down region [1..24] size 24 Line 18
"egion [1..24] size 24 Line 19
"1..24] size 24 Line 20
"size 24 Line 21
" Line 22
"3
"Soft scroll down region [1..24] size 24 Line 25
"roll down region [1..24] size 24 Line 26
"wn region [1..24] size 24 Line 27
"on [1..24] size 24 Line 28
"24] size 24 Line 29

(ert-deftest nterm-vttest-2-9 ()
  (should (nterm-ut 
"ce90d4034120133556b3570be638ebd8" "db7c7631cc5ccfdcd51deb3ac0243dda"
 (concat
"[?4l[12;13r[2J[24B"
"Jump scroll up region [12..13] size 2 Line 1
" region [12..13] size 2 Line 2
"3] size 2 Line 3
" 4
"l up region [12..13] size 2 Line 6
"2..13] size 2 Line 7
"Line 8
"croll up region [12..13] size 2 Line 10
"on [12..13] size 2 Line 11
"ize 2 Line 12
"
" up region [12..13] size 2 Line 15
"2..13] size 2 Line 16
" Line 17
"p scroll up region [12..13] size 2 Line 19
"egion [12..13] size 2 Line 20
"] size 2 Line 21
" 22
"oll up region [12..13] size 2 Line 24
" [12..13] size 2 Line 25
"e 2 Line 26
"Jump scroll up region [12..13] size 2 Line 28
"p region [12..13] size 2 Line 29
"on [12..13] size 2 Line 1
"13] size 2 Line 2
" 2 Line 3
"4
"ump scroll down region [12..13] size 2 Line 6
"ll down region [12..13] size 2 Line 7
"region [12..13] size 2 Line 8
"12..13] size 2 Line 9
"size 2 Line 10
"Line 11
"
"ump scroll down region [12..13] size 2 Line 14
"oll down region [12..13] size 2 Line 15
"n region [12..13] size 2 Line 16
"n [12..13] size 2 Line 17
"13] size 2 Line 18
"e 2 Line 19
"e 20
"MMJump scroll down region [12..13] size 2 Line 22
" scroll down region [12..13] size 2 Line 23
" down region [12..13] size 2 Line 24
"egion [12..13] size 2 Line 25
"12..13] size 2 Line 26
" size 2 Line 27
" Line 28
"9

(ert-deftest nterm-vttest-2-8 ()
  (should (nterm-ut 
"f6c6e5734a13c0d8a8443188d1467c7c" "2c7729fcec5c92cb915ba7456e41ed1e"
 (concat
"[1;24r[2J[24BJump scroll up region [1"
"..24] size 24 Line 1
"Line 2
"croll up region [1..24] size 24 Line 4
"n [1..24] size 24 Line 5
" 24 Line 6
"mp scroll up region [1..24] size 24 Line 8
"egion [1..24] size 24 Line 9
"size 24 Line 10
"11
"ll up region [1..24] size 24 Line 13
"[1..24] size 24 Line 14
"24 Line 15
"ump scroll up region [1..24] size 24 Line 17
" region [1..24] size 24 Line 18
"4] size 24 Line 19
"ne 20
"croll up region [1..24] size 24 Line 22
"on [1..24] size 24 Line 23
"ze 24 Line 24
"
" up region [1..24] size 24 Line 27
"..24] size 24 Line 28
" Line 29
"1
"ump scroll down region [1..24] size 24 Line 3
"ll down region [1..24] size 24 Line 4
"region [1..24] size 24 Line 5
"1..24] size 24 Line 6
"ize 24 Line 7
"ine 8
"MMJump scroll down region [1..24] size 24 Line 10
" scroll down region [1..24] size 24 Line 11
" down region [1..24] size 24 Line 12
"egion [1..24] size 24 Line 13
"1..24] size 24 Line 14
"size 24 Line 15
" Line 16
"7
"Jump scroll down region [1..24] size 24 Line 19
"roll down region [1..24] size 24 Line 20
"wn region [1..24] size 24 Line 21
"on [1..24] size 24 Line 22
"24] size 24 Line 23
"e 24 Line 24
"ne 25
"MMJump scroll down region [1..24] size 24 Line 27
"p scroll down region [1..24] size 24 Line 28
"l down region [1..24] size 24 Line 29

(ert-deftest nterm-vttest-2-9 ()
  (should (nterm-ut
"be9e1cda05e462b8741b1e170421d8eb" "4e73d78f3c4e0914862fcbb1f14d3bb8"
 (concat
"[?6h[2J"
"[23;24r
"m of the screen.[1;1HThis line should be the one above the "
"bottom of the screen. Push <RETURN>"))))

(ert-deftest nterm-vttest-2-11 ()
  (should (nterm-ut 
"717f7f37fdc1b05bdb2d89c1ff402bd6" "b82f146cded7b046ed104d3f79191d80"
 (concat
"[2J[?6l[24;1HOrigin mo"
"de test. This line should be at the bottom of the screen.[1"
";1HThis line should be at the top of the screen. Push <RETUR"
"N>"))))

(ert-deftest nterm-vttest-2-12 ()
  (should (nterm-ut
"417ec59bc343d9e5c81cc0b78b559290" "2f79b4f07884791de4d68411bb7b88c8"
 (concat
"[1;24r[2J[1;20HGraphic rendition test pattern:[4;1H[0"
"mvanilla[4;40H[0;1mbold[6;6H[;4munderline[6;45H[;1m[4"
"mbold underline[8;1H[0;5mblink[8;40H[0;5;1mbold blink[1"
"0;6H[0;4;5munderline blink[10;45H[0;1;4;5mbold underline "
"blink[12;1H[1;4;5;0;7mnegative[12;40H[0;1;7mbold negativ"
"e[14;6H[0;4;7munderline negative[14;45H[0;1;4;7mbold und"
"erline negative[16;1H[1;4;;5;7mblink negative[16;40H[0;1"
";5;7mbold blink negative[18;6H[0;4;5;7munderline blink neg"
"ative[18;45H[0;1;4;5;7mbold underline blink negative[m[?"
"5l[23;1H[0KDark background. Push <RETURN>"))))

(ert-deftest nterm-vttest-2-14 ()
  (should (nterm-ut
"def090a2fe1a7a51c953ce8dd4a10343" "2f37168f73de511effd3f6d40b7b0e63"
 (concat
"[?5l[2J[8;12Hnormal[8;24Hb"
"old[8;36Hunderscored[8;48Hblinking[8;60Hreversed[10;1Hst"
"ars:[12;1Hline:[14;1Hx'es:[16;1Hdiamonds:[10;12H[;0m(B"
")B*****7[1;1H[m(B)BA8*****[10;24H[;1m(B)B*****"
"7[1;2H[m(B)BA8*****[10;36H[;4m(B)B*****7[1;3H"
"[m(B)BA8*****[10;48H[;5m(B)B*****7[1;4H[m(B)B"
"A8*****[10;60H[;7m(B)B*****7[1;5H[m(B)BA8*****"
"[12;12H[;0m(0)Bqqqqq7[2;1H[m(B)BA8qqqqq[12;24H["
";1m(0)Bqqqqq7[2;2H[m(B)BA8qqqqq[12;36H[;4m(0)B"
"qqqqq7[2;3H[m(B)BA8qqqqq[12;48H[;5m(0)Bqqqqq7"
"[2;4H[m(B)BA8qqqqq[12;60H[;7m(0)Bqqqqq7[2;5H[m"
"(B)BA8qqqqq[14;12H[;0m(B)Bxxxxx7[3;1H[m(B)BA8"
"xxxxx[14;24H[;1m(B)Bxxxxx7[3;2H[m(B)BA8xxxxx[14"
";36H[;4m(B)Bxxxxx7[3;3H[m(B)BA8xxxxx[14;48H[;5m"
"(B)Bxxxxx7[3;4H[m(B)BA8xxxxx[14;60H[;7m(B)Bxx"
"xxx7[3;5H[m(B)BA8xxxxx[16;12H[;0m(0)B`````7[4;"
"1H[m(B)BA8`````[16;24H[;1m(0)B`````7[4;2H[m(B"
")BA8`````[16;36H[;4m(0)B`````7[4;3H[m(B)BA8```"
"``[16;48H[;5m(0)B`````7[4;4H[m(B)BA8`````[16;60"
"H[;7m(0)B`````7[4;5H[m(B)BA8`````[0m(B)B[21;"
"1HTest of the SAVE/RESTORE CURSOR feature. There should
" ten characters of each flavour, and a rectangle
"A's filling the top left of the screen.

(ert-deftest nterm-vt100-ed-1 ()
  "Test VT100 ED partial delete."
  (should (nterm-ut
"200e3d98bfff785a3ae3c34b3e51bf8e" "3a6c01ada23aca922212b949e7beee53"
  (concat
"#8"
"[10;20H1[1J"
"[20;30H1[0J"))))

(ert-deftest nterm-vt100-ed-2 ()
  "Test VT100 ED complete delete.
Make sure the double width line gets resetted."
  (nterm-ut
"16cc13d28218738d5d8688f7a4e0e4e5" "971a0e38dce04387a30cf29bfddfac4a"
"#8#6[2J"))

(ert-deftest nterm-vt100-ed-3 ()
  "Test VT100 ED partial delete on double width line"
  (nterm-ut
"9f535039ec87637af83c5812ce282af5" "3e4391164b1188c2ac007e49bf90d01d"
 (concat
"#8#6"
"[10;20H#61[1J"
"[20;30H1#6[0J")))

(ert-deftest nterm-vt100-el ()
  "Test VT100 EL.
Double line attribute should not be cleared. Test partial erase
with argument 0 and 1."
  (should (nterm-ut
"3cc5918951990ccfc54e74a837310b2a" "dda2b65811ffb887c48153cec7a2282c"
 (concat
"1234[0K
"1234[1K
"1234[2K
"1234[3K
"#61234[0K
"#61234[1K
"#61234[2K

;; blink dwl breakage
;; [5m
;; [1;1H
;; [2J
;; #3T

;; Copyright (C) 2010 Ivan Kanis
;; Author: Ivan Kanis
;;
;; This program is free software ; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation ; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY ; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program ; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA