//Maya ASCII 2016 scene
//Name: face.ma
//Last modified: Wed, Apr 26, 2023 09:14:23 AM
//Codeset: 1252
requires maya "2016";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t pal;
fileInfo "application" "maya";
fileInfo "product" "Maya 2016";
fileInfo "version" "2016";
fileInfo "cutIdentifier" "201502261600-953408";
fileInfo "osv" "Microsoft Windows 8 Home Premium Edition, 64-bit  (Build 9200)\n";
createNode transform -s -n "persp";
	rename -uid "B130CECA-4449-1147-85C2-9F871892BB6D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.23938069284803717 2.4928435598855851 1.6611852713502238 ;
	setAttr ".r" -type "double3" 0.26164727030800372 -8.1999999999384663 6.276187150438051e-018 ;
	setAttr ".rp" -type "double3" -4.4408920985006262e-016 2.7755575615628914e-017 -4.4408920985006262e-016 ;
	setAttr ".rpt" -type "double3" 6.4392273906675548e-017 -5.3849836276039159e-017 
		-5.6260818614062492e-017 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "14CC986B-455D-C047-DB17-DD865DC2FB95";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".ncp" 1;
	setAttr ".coi" 1.6783617758402358;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -2.384185791015625e-007 2.5005079507827759 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "0B520888-47C0-7148-1235-82BDE7D5E4B6";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.24760341644287109 100.10399354707498 -0.049999944865681795 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "5C57F06D-4B38-3FCA-703E-F58402866C66";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".coi" 100.1;
	setAttr ".ow" 5.7961052342465056;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "DB2A0D2A-485B-4794-4816-12AE32F6788D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.031477865289217102 1.3552575893818404 101.54728393535211 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "C87BFD64-4452-1308-5582-A3A733EF4717";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".coi" 101.54728393535211;
	setAttr ".ow" 6.9878681225033441;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" -0.19838070474952307 2.4586833265855503 0 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "A7880B91-4EEC-0A3F-0D6D-FCB06858A60E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 102.39132526668359 1.9660592526197433 -0.0499999448656809 ;
	setAttr ".r" -type "double3" -1.2676529855478182e-016 89.999999999999986 0 ;
	setAttr ".rp" -type "double3" 2.7755575615628914e-017 0 -1.4210854715202004e-014 ;
	setAttr ".rpt" -type "double3" -1.4238610290817636e-014 0 1.4183099139586397e-014 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "042DF6CC-4564-1504-AE50-26AEFE6AC943";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".coi" 100.36042095823363;
	setAttr ".ow" 9.4229253781293991;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" 2.0277654755965528 0.90414548348679857 0.19549626760205965 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "Group";
	rename -uid "69E0F610-4CA7-9494-BD91-45BE3C8FEE15";
	setAttr ".s" -type "double3" 1 1 0.1 ;
createNode transform -n "_M" -p "Group";
	rename -uid "41F2A321-44E6-7E88-A776-18A93414B8A5";
	setAttr ".s" -type "double3" 1 1 10 ;
createNode transform -n "face_M" -p "_M";
	rename -uid "08880835-4E8F-92BC-6E4C-04B45C317A91";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "face_MShape" -p "face_M";
	rename -uid "2555CC90-4617-55E8-A406-5C9386020800";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0]";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 50 ".uvst[0].uvsp[0:49]" -type "float2" 0 0 0.1 0 0.2 0 0.30000001
		 0 0.40000001 0 0.5 0 0.60000002 0 0.69999999 0 0.80000001 0 0.90000004 0 0 0.60000002
		 0 0.69999999 0 0.80000001 0 0.90000004 0 1 0.1 1 0.2 1 0.30000001 1 0.40000001 1
		 0.5 1 0.60000002 1 0.69999999 1 0.80000001 1 0.90000004 1 1 1 1 0 0.90000004 1 0.80000001
		 1 0.69999999 1 0.60000002 1 0.5 1 0.40000001 1 0.30000001 1 0.2 1 0.1 1 0 1 0 0.90000004
		 0 0.80000001 0 0.69999999 0 0.60000002 0 0 0.1 0 0.2 0 0.30000001 0 0.40000001 0
		 0.5 0 0.60000002 0 0.69999999 0 0.80000001 0 0.90000004 0;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 50 ".vt[0:49]"  -1.077519298 1.55473816 -0.099999972 -0.99975169 1.18844521 -0.099999972
		 -0.86459756 0.85325336 -0.099999972 -0.77116787 0.7251184 -0.099999972 -0.67773962 0.60026914 -0.099999972
		 -0.56788325 0.48856169 -0.099999972 -0.46788281 0.40313858 -0.099999972 -0.36788279 0.30785912 -0.099999972
		 -0.26131231 0.23229253 -0.099999972 -0.1317417 0.15344006 -0.099999972 0 0.1501548 -0.099999972
		 -1.12625587 1.82590592 -0.099999994 -1.15104246 2.03918004 -0.099999972 -1.1549964 2.25175428 -0.10000003
		 -1.14083266 2.39424539 -0.099999972 -1.1155324 2.59544778 -0.10000003 -1.040121198 2.85317111 -0.10000003
		 -0.94807339 2.99631 -0.10000003 -0.83216912 3.07980752 -0.10000003 -0.71626508 3.07185483 -0.10000003
		 -0.62819296 3.095712185 -0.10000003 -0.50433666 3.083783627 -0.10000003 -0.38048047 3.051975489 -0.10000003
		 -0.28445643 2.97245312 -0.10000003 -0.14867175 2.896909 -0.10000003 0 2.84919524 -0.10000003
		 1.077519298 1.55473816 -0.099999972 0.99975169 1.18844521 -0.099999972 0.86459756 0.85325336 -0.099999972
		 0.77116787 0.7251184 -0.099999972 0.67773962 0.60026914 -0.099999972 0.56788325 0.48856169 -0.099999972
		 0.46788281 0.40313858 -0.099999972 0.36788279 0.30785912 -0.099999972 0.26131231 0.23229253 -0.099999972
		 0.1317417 0.15344006 -0.099999972 1.12625587 1.82590592 -0.099999994 1.15104246 2.03918004 -0.099999972
		 1.1549964 2.25175428 -0.10000003 1.14083266 2.39424539 -0.099999972 1.1155324 2.59544778 -0.10000003
		 1.040121198 2.85317111 -0.10000003 0.94807339 2.99631 -0.10000003 0.83216912 3.07980752 -0.10000003
		 0.71626508 3.07185483 -0.10000003 0.62819296 3.095712185 -0.10000003 0.50433666 3.083783627 -0.10000003
		 0.38048047 3.051975489 -0.10000003 0.28445643 2.97245312 -0.10000003 0.14867175 2.896909 -0.10000003;
	setAttr -s 50 ".ed[0:49]"  0 1 0 0 11 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0
		 6 7 0 7 8 0 8 9 0 9 10 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 20 0 20 21 0 21 22 0 22 23 0 23 24 0 24 25 0 26 27 0 26 36 0 27 28 0 28 29 0
		 29 30 0 30 31 0 31 32 0 32 33 0 33 34 0 34 35 0 35 10 0 36 37 0 37 38 0 38 39 0 39 40 0
		 40 41 0 41 42 0 42 43 0 43 44 0 44 45 0 45 46 0 46 47 0 47 48 0 48 49 0 49 25 0;
	setAttr -ch 50 ".fc[0]" -type "polyFaces" 
		f 50 -25 -24 -23 -22 -21 -20 -19 -18 -17 -16 -15 -14 -13 -12 -2 0 2 3 4 5 6 7 8 9 10
		 -36 -35 -34 -33 -32 -31 -30 -29 -28 -26 26 36 37 38 39 40 41 42 43 44 45 46 47 48
		 49
		mu 0 50 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 0 1 2 3 4 5 6 7 8 9 25 49 48 47 46
		 45 44 43 42 41 40 39 38 37 36 35 34 33 32 31 30 29 28 27 26;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dsm" 2;
	setAttr ".vnm" 0;
createNode transform -n "nose_M" -p "_M";
	rename -uid "3BD5EA82-488B-D533-87C4-2DB84745FE8A";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "nose_MShape" -p "nose_M";
	rename -uid "4AC2573F-4A5B-8C79-D6D2-1A91AC415972";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:3]";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 80 ".uvst[0].uvsp[0:79]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.65625 0.84375 0.6486026 0.89203393 0.62640893
		 0.93559146 0.59184146 0.97015893 0.54828387 0.9923526 0.5 1 0.4517161 0.9923526 0.40815854
		 0.97015893 0.37359107 0.93559146 0.3513974 0.89203393 0.34374997 0.84375 0.3513974
		 0.79546607 0.37359107 0.75190854 0.40815851 0.71734107 0.45171607 0.69514734 0.5
		 0.68749994 0.54828393 0.69514734 0.59184152 0.71734101 0.62640899 0.75190848 0.64860266
		 0.79546607 0.65625 0.84375 0.6486026 0.89203393 0.62640893 0.93559146 0.59184146
		 0.97015893 0.54828387 0.9923526 0.5 1 0.4517161 0.9923526 0.40815854 0.97015893 0.37359107
		 0.93559146 0.3513974 0.89203393 0.34374997 0.84375 0.3513974 0.79546607 0.37359107
		 0.75190854 0.40815851 0.71734107 0.45171607 0.69514734 0.5 0.68749994 0.54828393
		 0.69514734 0.59184152 0.71734101 0.62640899 0.75190848 0.64860266 0.79546607 0.65625
		 0.84375 0.6486026 0.89203393 0.62640893 0.93559146 0.59184146 0.97015893 0.54828387
		 0.9923526 0.5 1 0.4517161 0.9923526 0.40815854 0.97015893 0.37359107 0.93559146 0.3513974
		 0.89203393 0.34374997 0.84375 0.3513974 0.79546607 0.37359107 0.75190854 0.40815851
		 0.71734107 0.45171607 0.69514734 0.5 0.68749994 0.54828393 0.69514734 0.59184152
		 0.71734101 0.62640899 0.75190848 0.64860266 0.79546607;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 80 ".pt[0:79]" -type "float3"  0 0 0.13 0 0 0.13 0 0 0.13 
		0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 
		0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 
		0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 
		0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 
		0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 
		0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 
		0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 
		0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 
		0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13 0 0 0.13;
	setAttr -s 80 ".vt[0:79]"  0.3029218 1.38910329 -0.079999998 0.28532901 1.40757871 -0.079999998
		 0.26342088 1.41809928 -0.080000006 0.22888739 1.45922256 -0.080000006 0.18874688 1.56997085 -0.079999998
		 0.16533841 1.64634323 -0.079999998 0.14816241 1.71343148 -0.079999998 0.13601184 1.78408587 -0.079999991
		 0.12555978 1.82995367 -0.079999998 0.1301468 1.83310652 -0.079999998 0.14326161 1.784513 -0.079999998
		 0.16051638 1.71769321 -0.080000006 0.17845753 1.64644802 -0.080000006 0.19931519 1.57378483 -0.080000006
		 0.24081634 1.46521282 -0.079999998 0.27501744 1.42274415 -0.080000006 0.28917107 1.41248679 -0.080000006
		 0.31116602 1.39114666 -0.079999991 0.31535414 1.36540258 -0.079999991 0.30885923 1.36792028 -0.079999998
		 0.31326851 1.35646868 -0.079999998 0.30939171 1.34618819 -0.079999998 0.28720504 1.33329368 -0.080000006
		 0.25894678 1.3272109 -0.080000006 0.20590672 1.32217264 -0.079999998 0.15977442 1.31812716 -0.079999998
		 0.11746944 1.29440475 -0.079999998 0.06889075 1.27813959 -0.079999991 0 1.26367605 -0.079999998
		 0 1.27017093 -0.079999998 0 1.2723242 -0.079999998 0.06546852 1.28767371 -0.080000006
		 0.096408695 1.34305894 -0.080000006 0.14324817 1.3647753 -0.080000006 0.1659565 1.35848331 -0.079999998
		 0.18486787 1.34423327 -0.080000006 0.20606476 1.33572447 -0.080000006 0.25801709 1.34296501 -0.079999991
		 0.28064886 1.34765887 -0.079999991 0.30226254 1.36323762 -0.079999998 -0.31326851 1.35646868 -0.079999998
		 -0.30939171 1.34618819 -0.079999998 -0.28720504 1.33329368 -0.080000006 -0.25894678 1.3272109 -0.080000006
		 -0.20590672 1.32217264 -0.079999998 -0.15977442 1.31812716 -0.079999998 -0.11746944 1.29440475 -0.079999998
		 -0.06889075 1.27813959 -0.079999991 0 1.26367605 -0.079999998 0 1.27017093 -0.079999998
		 0 1.2723242 -0.079999998 -0.06546852 1.28767371 -0.080000006 -0.096408695 1.34305894 -0.080000006
		 -0.14324817 1.3647753 -0.080000006 -0.1659565 1.35848331 -0.079999998 -0.18486787 1.34423327 -0.080000006
		 -0.20606476 1.33572447 -0.080000006 -0.25801709 1.34296501 -0.079999991 -0.28064886 1.34765887 -0.079999991
		 -0.30226254 1.36323762 -0.079999998 -0.3029218 1.38910329 -0.079999998 -0.28532901 1.40757871 -0.079999998
		 -0.26342088 1.41809928 -0.080000006 -0.22888739 1.45922256 -0.080000006 -0.18874688 1.56997085 -0.079999998
		 -0.16533841 1.64634323 -0.079999998 -0.14816241 1.71343148 -0.079999998 -0.13601184 1.78408587 -0.079999991
		 -0.12555978 1.82995367 -0.079999998 -0.1301468 1.83310652 -0.079999998 -0.14326161 1.784513 -0.079999998
		 -0.16051638 1.71769321 -0.080000006 -0.17845753 1.64644802 -0.080000006 -0.19931519 1.57378483 -0.080000006
		 -0.24081634 1.46521282 -0.079999998 -0.27501744 1.42274415 -0.080000006 -0.28917107 1.41248679 -0.080000006
		 -0.31116602 1.39114666 -0.079999991 -0.31535414 1.36540258 -0.079999991 -0.30885923 1.36792028 -0.079999998;
	setAttr -s 80 ".ed[0:79]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 20 21 0 21 22 0 22 23 0 23 24 0 24 25 0 25 26 0 26 27 0 27 28 0 28 29 0
		 29 30 0 30 31 0 31 32 0 32 33 0 33 34 0 34 35 0 35 36 0 36 37 0 37 38 0 38 39 0 39 20 0
		 40 41 0 41 42 0 42 43 0 43 44 0 44 45 0 45 46 0 46 47 0 47 48 0 48 49 0 49 50 0 50 51 0
		 51 52 0 52 53 0 53 54 0 54 55 0 55 56 0 56 57 0 57 58 0 58 59 0 59 40 0 60 61 0 61 62 0
		 62 63 0 63 64 0 64 65 0 65 66 0 66 67 0 67 68 0 68 69 0 69 70 0 70 71 0 71 72 0 72 73 0
		 73 74 0 74 75 0 75 76 0 76 77 0 77 78 0 78 79 0 79 60 0;
	setAttr -s 4 -ch 80 ".fc[0:3]" -type "polyFaces" 
		f 20 -19 -18 -17 -16 -15 -14 -13 -12 -11 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 -20
		mu 0 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		f 20 -39 -38 -37 -36 -35 -34 -33 -32 -31 -30 -29 -28 -27 -26 -25 -24 -23 -22 -21 -40
		mu 0 20 20 39 38 37 36 35 34 33 32 31 30 29 28 27 26 25 24 23 22 21
		f 20 59 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
		mu 0 20 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59
		f 20 79 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78
		mu 0 20 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dsm" 2;
	setAttr ".vnm" 0;
createNode transform -n "lip2_M" -p "_M";
	rename -uid "661F1719-4C9B-E371-5CCE-2E9038D154EE";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lip2_MShape" -p "lip2_M";
	rename -uid "04D20234-4A49-B2CD-85B9-A6872DE9A0EF";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 14 ".pt[0:13]" -type "float3"  0.050727837 0.9571628 -0.44999987 
		0.010488123 0.91226679 -0.44999987 0.0056309765 0.88278955 -0.44999987 0 0.86911386 
		-0.44999987 -0.0057071536 0.87741095 -0.44999999 -0.010486566 0.91226214 -0.44999999 
		-0.050727837 0.9571628 -0.44999987 0.051109307 0.966196 0.54999989 0.010674013 0.92157668 
		0.54999989 0.0054747886 0.89170784 0.54999989 0 0.87822086 0.54999989 -0.0055177477 
		0.88635147 0.54999989 -0.010674022 0.92157674 0.54999989 -0.051109307 0.966196 0.54999989;
	setAttr ".vnm" 0;
createNode transform -n "upperLip_M" -p "_M";
	rename -uid "4EAF3B14-472D-6C7F-6AA5-B4A94BE943B4";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLip_MShape" -p "upperLip_M";
	rename -uid "D73BCCBB-45AE-7672-820D-BCBEE5F24379";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.32942203 0.94196492 1.7763568e-015 
		-0.28022215 0.81626749 -1.003969e-007 -0.20359385 0.71808285 5.0198462e-008 -0.10703693 
		0.65571189 5.0198462e-008 -4.307671e-007 0.63433361 -7.5495166e-015 0.10703454 0.65571183 
		-4.4408921e-016 0.20359349 0.71808308 -1.0039697e-007 0.28022227 0.81626797 -5.0198452e-008 
		0.32942155 0.94196534 -1.0039687e-007 0.34637415 1.0841935 8.8817842e-016 0.32942149 
		1.229853 -7.1054274e-015 0.28022334 1.3645619 1.0039692e-007 0.20359333 1.4739431 
		5.0198469e-008 0.10703462 1.5454164 5.0198459e-008 -4.5213076e-007 1.5702826 -1.0039692e-007 
		-0.10703681 1.5454164 1.0039692e-007 -0.20359389 1.4739432 1.0039692e-007 -0.28022224 
		1.3645619 -5.0198466e-008 -0.32942167 1.2298533 -5.0198459e-008 -0.34637386 1.0841941 
		8.8817842e-016;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLip_M" -p "_M";
	rename -uid "44AB7ACB-4150-1691-9375-61B5D189AEEB";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLip_MShape" -p "lowerLip_M";
	rename -uid "095D00B6-4E79-3334-749B-F4AD024DAB0D";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.32942206 0.55852848 -8.8817842e-016 
		-0.28022236 0.42344916 -1.0039689e-007 -0.20359397 0.31372371 5.0198466e-008 -0.10703693 
		0.24200058 5.0198459e-008 -4.3439383e-007 0.21704443 3.5527137e-015 0.10703466 0.24200064 
		-1.2434498e-014 0.20359342 0.31372383 -1.0039692e-007 0.28022245 0.42344928 -5.0198459e-008 
		0.32942161 0.55852848 -1.0039692e-007 0.34637374 0.70451725 6.2172489e-015 0.32942152 
		0.84700185 1.7763568e-015 0.28022224 0.9728756 1.0039689e-007 0.20359366 1.0711689 
		5.0198462e-008 0.10703462 1.1335955 5.0198466e-008 -4.4850432e-007 1.1549884 -1.0039688e-007 
		-0.10703677 1.1335955 1.0039693e-007 -0.20359385 1.0711689 1.0039693e-007 -0.28022179 
		0.9728756 -5.0198452e-008 -0.32942167 0.84700185 -5.0198462e-008 -0.34637356 0.70451725 
		6.2172489e-015;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Jaw_M" -p "_M";
	rename -uid "1D5431E1-40F7-CD3E-7A5F-38BE8CFC710E";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Jaw_MShape" -p "Jaw_M";
	rename -uid "E54817E7-4327-8F25-0C07-4D9E7472B2E6";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 10 ".uvst[0].uvsp[0:9]" -type "float2" 0.59184152 0.71734101
		 0.54828393 0.69514734 0.5 0.68749994 0.45171607 0.69514734 0.40815851 0.71734107
		 0.37359107 0.93559146 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.62640893 0.93559146;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 10 ".pt[0:9]" -type "float3"  0.52274191 0.020959964 5.0074892e-008 
		0.22976637 0.02095986 -5.007491e-008 4.3625983e-013 -0.14509585 0 -0.22975613 0.02095986 
		0 -0.52274883 0.02095986 0 -0.52430534 -0.026461527 -5.007491e-008 -0.22975613 -0.026461527 
		-5.007491e-008 4.3418524e-013 -0.19438234 1.0014982e-007 0.22976108 -0.026460484 
		-1.0014982e-007 0.52430439 -0.026461527 -1.0014982e-007;
	setAttr -s 10 ".vt[0:9]"  0.11380723 0.29551077 2.1857232e-008 0.05002299 0.29551065 -2.1857236e-008
		 1.9778515e-006 0.2033225 0 -0.050020769 0.29551065 0 -0.1138086 0.29551065 0 -0.11225298 0.28145409 -2.1857236e-008
		 -0.050020769 0.28145409 -2.1857236e-008 1.9699894e-006 0.18950868 4.3714472e-008
		 0.050021805 0.28145468 -4.3714472e-008 0.11225268 0.28145409 -4.3714472e-008;
	setAttr -s 10 ".ed[0:9]"  9 0 0 0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0
		 6 7 0 7 8 0 8 9 0;
	setAttr -ch 10 ".fc[0]" -type "polyFaces" 
		f 10 0 1 2 3 4 5 6 7 8 9
		mu 0 10 0 9 8 7 6 5 4 3 2 1;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperFace_M" -p "_M";
	rename -uid "E7C0DEF7-4B0F-AF0A-41EE-9F8DC0BA22E3";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperFace_MShape" -p "upperFace_M";
	rename -uid "52CA46B1-48EB-CF07-597E-35AB0E3A734B";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:1]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 8 ".uvst[0].uvsp[0:7]" -type "float2" 0.45171607 0.69514734
		 0.40815851 0.71734107 0.37359107 0.93559146 0.4517161 0.9923526 0.45171607 0.69514734
		 0.4517161 0.9923526 0.37359107 0.93559146 0.40815851 0.71734107;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 8 ".vt[0:7]"  -1.085359216 1.59764981 -0.15000001 -1.58205986 1.59764981 -0.15000001
		 -1.58206081 1.53617191 -0.15000002 -1.073649406 1.53617191 -0.15000002 1.085359216 1.59764981 -0.15000001
		 1.58205986 1.59764981 -0.15000001 1.58206081 1.53617191 -0.15000002 1.073649406 1.53617191 -0.15000002;
	setAttr -s 8 ".ed[0:7]"  3 0 0 0 1 0 1 2 0 2 3 0 7 4 0 4 5 0 5 6 0
		 6 7 0;
	setAttr -s 2 -ch 8 ".fc[0:1]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 3 2 1
		f 4 -8 -7 -6 -5
		mu 0 4 4 7 6 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "middleFace_M" -p "_M";
	rename -uid "20F0FE1E-4EB1-0224-9279-8B85821B0BDD";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "middleFace_MShape" -p "middleFace_M";
	rename -uid "488FFBFD-4642-7AF9-4FB8-BDA580E5BDC3";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:1]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 8 ".uvst[0].uvsp[0:7]" -type "float2" 0.45171607 0.69514734
		 0.40815851 0.71734107 0.37359107 0.93559146 0.4517161 0.9923526 0.45171607 0.69514734
		 0.4517161 0.9923526 0.37359107 0.93559146 0.40815851 0.71734107;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0.04553742 -0.28797728 0 
		0.066377029 -0.28797728 0 0.066377066 -0.28797728 0 0.045046121 -0.28797728 0 -0.04553742 
		-0.28797728 0 -0.066377029 -0.28797728 0 -0.066377066 -0.28797728 0 -0.045046121 
		-0.28797728 0;
	setAttr -s 8 ".vt[0:7]"  -1.085359216 1.59764981 -0.15000001 -1.58205986 1.59764981 -0.15000001
		 -1.58206081 1.53617191 -0.15000002 -1.073649406 1.53617191 -0.15000002 1.085359216 1.59764981 -0.15000001
		 1.58205986 1.59764981 -0.15000001 1.58206081 1.53617191 -0.15000002 1.073649406 1.53617191 -0.15000002;
	setAttr -s 8 ".ed[0:7]"  3 0 0 0 1 0 1 2 0 2 3 0 7 4 0 4 5 0 5 6 0
		 6 7 0;
	setAttr -s 2 -ch 8 ".fc[0:1]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 3 2 1
		f 4 -8 -7 -6 -5
		mu 0 4 4 7 6 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerFace_M" -p "_M";
	rename -uid "1DCF448B-4D0B-45EA-FF3E-4B95538A7986";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerFace_MShape" -p "lowerFace_M";
	rename -uid "C759D9D6-48D6-2A03-E076-4FB30F788116";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:1]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 8 ".uvst[0].uvsp[0:7]" -type "float2" 0.45171607 0.69514734
		 0.40815851 0.71734107 0.37359107 0.93559146 0.4517161 0.9923526 0.45171607 0.69514734
		 0.4517161 0.9923526 0.37359107 0.93559146 0.40815851 0.71734107;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 8 ".vt[0:7]"  0.95215011 1.069989681 -0.15000001 1.46996427 1.069989681 -0.15000001
		 1.4699651 1.0085117817 -0.15000002 0.92790067 1.0080223083 -0.15000002 -0.95215011 1.069989681 -0.15000001
		 -1.46996427 1.069989681 -0.15000001 -1.4699651 1.0085117817 -0.15000002 -0.92790067 1.0080223083 -0.15000002;
	setAttr -s 8 ".ed[0:7]"  3 0 0 0 1 0 1 2 0 2 3 0 7 4 0 4 5 0 5 6 0
		 6 7 0;
	setAttr -s 2 -ch 8 ".fc[0:1]" -type "polyFaces" 
		f 4 -4 -3 -2 -1
		mu 0 4 0 1 2 3
		f 4 4 5 6 7
		mu 0 4 4 5 6 7;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperTeeth_M" -p "_M";
	rename -uid "7143751A-497A-3C1F-EE87-CD8841F6E5FA";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperTeeth_MShape" -p "upperTeeth_M";
	rename -uid "9C6B996F-4565-5DA5-24DE-F6B7CA9BD023";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  1.5170636 0.75726223 -0.5 
		0.99761194 0.75726223 -0.5 1.5170636 0.83174163 0.5 0.99761194 0.83174163 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerTeeth_M" -p "_M";
	rename -uid "1C53AB7A-4269-DA4F-CAD7-C1A619787363";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerTeeth_MShape" -p "lowerTeeth_M";
	rename -uid "7858B850-4867-6042-12CD-C587369223D5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  1.5170633 0.55767512 -0.5 
		0.99761176 0.55767512 -0.5 1.5170633 0.63215446 0.5 0.99761176 0.63215446 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Tongue" -p "_M";
	rename -uid "B46E112B-4B95-5EFE-6849-27843F2BD904";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "TongueShape" -p "Tongue";
	rename -uid "974C587D-4C3A-8553-8A5E-96B7A2502203";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -2.3895726 0.40010267 -0.050000001 
		-2.2990651 0.6887992 -0.050000075 -2.2094011 0.61444974 -0.049999963 -2.1982479 0.56511134 
		-0.049999963 -2.1270132 0.53350651 -0.050000001 -2.0557823 0.56511116 -0.050000001 
		-2.0446348 0.6144498 -0.050000075 -1.9549727 0.6887992 -0.050000038 -1.8644605 0.40010285 
		-0.050000075 -1.825417 0.44585967 -0.050000001 -1.8234177 0.46354496 -0.050000001 
		-1.8613105 0.50635743 -0.049999926 -1.935185 0.55531007 -0.049999963 -2.0431542 0.58994174 
		-0.049999963 -2.1270132 0.6064316 -0.050000075 -2.2108769 0.58994222 -0.049999926 
		-2.3188486 0.55531007 -0.049999926 -2.3927264 0.50635689 -0.050000038 -2.4306178 
		0.46354559 -0.050000038 -2.428616 0.44585985 -0.050000001;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Tongue0_M" -p "_M";
	rename -uid "CCF7C975-4DC0-71F5-67EA-47BEADA21F17";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Tongue0_MShape" -p "Tongue0_M";
	rename -uid "E1588413-48DD-59C4-0319-2194777FADA7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -1.9116888 0.91018564 -0.5 
		-2.3394585 0.91018564 -0.5 -1.9116888 0.99875402 0.5 -2.3394585 0.99875402 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Tongue1_M" -p "_M";
	rename -uid "13C40088-40BC-4654-975C-A586C48F1472";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Tongue1_MShape" -p "Tongue1_M";
	rename -uid "EB2B6CA5-4191-04A0-15BD-3DBC6A17D866";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -1.9003625 0.68758494 -0.5 
		-2.3507848 0.68758494 -0.5 -1.9003625 0.76303971 0.5 -2.3507848 0.76303971 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Tongue2_M" -p "_M";
	rename -uid "6550C062-4979-E879-65C9-F190B067FED4";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Tongue2_MShape" -p "Tongue2_M";
	rename -uid "BF863958-4A03-8900-501E-C498C536B186";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -1.878109 0.46429986 -0.5 
		-2.3730383 0.46429986 -0.5 -1.878109 0.54467463 0.5 -2.3730383 0.54467463 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Tongue3_M" -p "_M";
	rename -uid "8651CA45-4B0A-078A-F0CB-D6A3DAC48FBC";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Tongue3_MShape" -p "Tongue3_M";
	rename -uid "0941D408-4549-2CC5-70A4-FEB5D5543981";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -1.8463182 0.2530539 -0.5 
		-2.4048285 0.2530539 -0.5 -1.8463182 0.32260406 0.5 -2.4048285 0.32260406 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlBrow_R" -p "_M";
	rename -uid "9823ADD2-4EBB-C832-DEFB-859624E919AD";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlBrow_RShape" -p "ctrlBrow_R";
	rename -uid "F3157D46-4CBA-6825-F495-BDA79A88FAFC";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.5654478 2.3923688 -0.5 
		1.8329911 2.3923688 -0.5 2.5654478 2.6599102 0.5 1.8329911 2.6599102 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlEye_R" -p "_M";
	rename -uid "0096726E-4DBA-0494-87C9-73B7CAA3C622";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlEye_RShape" -p "ctrlEye_R";
	rename -uid "55705806-4FDD-14BF-0AAB-638E709BF3CA";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.5654478 1.9910653 -0.5 
		1.8329911 1.9910653 -0.5 2.5654478 2.2586019 0.5 1.8329911 2.2586019 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlCheek_R" -p "_M";
	rename -uid "71CA2CF6-41B0-5A1E-8F12-3089E68F2B33";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlCheek_RShape" -p "ctrlCheek_R";
	rename -uid "A19046D9-4A81-3B53-E066-998EA3AA7628";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.5654478 1.5823091 -0.5 
		1.8329911 1.5823091 -0.5 2.5654478 1.849842 0.5 1.8329911 1.849842 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlNose_R" -p "_M";
	rename -uid "F0ACAB2F-4EA1-DF37-0687-E6B37CDC8756";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlNose_RShape" -p "ctrlNose_R";
	rename -uid "31DC282B-4932-0944-E557-4994E8463263";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.5654478 1.1836587 -0.5 
		1.8329911 1.1836587 -0.5 2.5654478 1.4511948 0.5 1.8329911 1.4511948 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlMouthCorner_R" -p "_M";
	rename -uid "C3A3A584-4416-A7E1-6022-00BFA794DF74";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlMouthCorner_RShape" -p "ctrlMouthCorner_R";
	rename -uid "D5BF7A68-4297-1DC4-959B-53BF6A665B57";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.5654478 0.23964912 -0.5 
		1.8329911 0.23964912 -0.5 2.5654478 0.50718844 0.5 1.8329911 0.50718844 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlMouthCorner_L" -p "_M";
	rename -uid "562C22B0-4BEC-AEE4-28E5-C7ADE7254F1E";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1 -1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlMouthCorner_LShape" -p "ctrlMouthCorner_L";
	rename -uid "CCFD6802-43F7-5A1E-9DA1-888F35334E8C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -2.3251204 0.23964912 -0.5 
		-3.0575786 0.23964912 -0.5 -2.3251204 0.50718844 0.5 -3.0575786 0.50718844 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlNose_L" -p "_M";
	rename -uid "B5E9384B-416A-FCAF-17C5-90A0BC1B2AE1";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1 -1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlNose_LShape" -p "ctrlNose_L";
	rename -uid "9C1A008D-454C-77E6-40BD-7488013AE7A3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -2.3251204 1.1836587 -0.5 
		-3.0575786 1.1836587 -0.5 -2.3251204 1.4511948 0.5 -3.0575786 1.4511948 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlCheek_L" -p "_M";
	rename -uid "AD4EAB0A-44F2-FDAE-FEDC-1A9CF596FFE0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1 -1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlCheek_LShape" -p "ctrlCheek_L";
	rename -uid "1BFE2C74-4971-73F1-5FCA-F6A2E4A223BC";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -2.3251204 1.5823091 -0.5 
		-3.0575786 1.5823091 -0.5 -2.3251204 1.849842 0.5 -3.0575786 1.849842 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlEye_L" -p "_M";
	rename -uid "387E0B4D-4EDC-832E-43F2-A09D4A22A9FD";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1 -1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlEye_LShape" -p "ctrlEye_L";
	rename -uid "E1FC05EF-45F2-578A-CBB9-D4BEF0D2B131";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -2.3251204 1.9910653 -0.5 
		-3.0575786 1.9910653 -0.5 -2.3251204 2.2586019 0.5 -3.0575786 2.2586019 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlBrow_L" -p "_M";
	rename -uid "4BF4B39D-47F2-A9EE-65AE-D083565460FC";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1 -1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlBrow_LShape" -p "ctrlBrow_L";
	rename -uid "6014A457-491F-EC3E-634E-E99D914F810A";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -2.3251204 2.3923688 -0.5 
		-3.0575786 2.3923688 -0.5 -2.3251204 2.6599102 0.5 -3.0575786 2.6599102 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlBox" -p "_M";
	rename -uid "4DF55A57-42B3-4960-AE96-C3824B11FCA2";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlBoxShape" -p "ctrlBox";
	rename -uid "33F4B882-4849-63E4-ED92-A9A237291575";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.3898149 0.046339191 -0.5 
		2.5007534 0.046339191 -0.5 2.3898149 0.10658962 0.5 2.5007534 0.10658962 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "squashTop_M" -p "_M";
	rename -uid "FB5EC8E1-4092-2B1E-1989-74811D5039FF";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "squashTop_MShape" -p "squashTop_M";
	rename -uid "EACFBA46-4868-59F9-2E94-4198BB3D19D2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -1.9292008 2.8094277 -0.5 
		-2.3400841 2.8094277 -0.5 -1.9292008 2.8714459 0.5 -2.3400841 2.8714459 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "squashMiddle_M" -p "_M";
	rename -uid "586F1F21-4FD9-B64A-A8F0-9099719A752E";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "squashMiddle_MShape" -p "squashMiddle_M";
	rename -uid "7A32BE16-4256-076B-1252-9A816FFD180D";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -1.9292008 2.6225963 -0.5 
		-2.3400841 2.6225963 -0.5 -1.9292008 2.6846147 0.5 -2.3400841 2.6846147 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "squashBase_M" -p "_M";
	rename -uid "4034D08F-4AF2-B4E4-A4AA-C5AC3C42E19A";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "squashBase_MShape" -p "squashBase_M";
	rename -uid "DF91AEEB-4A60-6A98-60A2-8395528EEC7D";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  -1.9292008 2.4357662 -0.5 
		-2.3400841 2.4357662 -0.5 -1.9292008 2.4977844 0.5 -2.3400841 2.4977844 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "AimEye_M" -p "_M";
	rename -uid "B0D3DC9D-47E5-4230-2903-A2839F4810EF";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "AimEye_MShape" -p "AimEye_M";
	rename -uid "3B9165C9-4CCC-AD96-CF6D-0E91E38B152F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 14 ".pt";
	setAttr ".pt[0]" -type "float3" -2.094285 2.4483089 0 ;
	setAttr ".pt[1]" -type "float3" -2.1425664 2.4483089 0 ;
	setAttr ".pt[2]" -type "float3" -2.2435949 2.5896947 0 ;
	setAttr ".pt[3]" -type "float3" -2.2435949 2.5439866 0 ;
	setAttr ".pt[4]" -type "float3" -1.9932532 2.5896947 0 ;
	setAttr ".pt[5]" -type "float3" -1.9932532 2.5439866 0 ;
	setAttr ".pt[6]" -type "float3" -2.094285 2.6853709 0 ;
	setAttr ".pt[7]" -type "float3" -2.1425664 2.6853709 0 ;
	setAttr ".pt[8]" -type "float3" -2.1425664 2.5896947 0 ;
	setAttr ".pt[9]" -type "float3" -2.1425664 2.5439866 0 ;
	setAttr ".pt[10]" -type "float3" -2.094285 2.5439866 0 ;
	setAttr ".pt[11]" -type "float3" -2.094285 2.5896947 0 ;
	setAttr ".vnm" 0;
createNode mesh -n "polySurfaceShape1" -p "AimEye_M";
	rename -uid "C8ACBC19-402B-1433-CD95-E880000776C5";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.734612 0.64386219 -0.5 
		2.1559563 0.64386219 -0.5 2.734612 1.0428617 0.5 2.1559563 1.0428617 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "AimEye_R" -p "_M";
	rename -uid "736CC725-4CC0-DF62-5F46-C0B3B87C012C";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "AimEye_RShape" -p "AimEye_R";
	rename -uid "8D9BFF4A-4463-5322-B7E8-308D4BA844E1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 12 ".uvst[0].uvsp[0:11]" -type "float2" 0.625 0.375 0.625
		 0.625 0.375 0.625 0.375 0.375 1 0.375 0.625 0 0.625 1 1 0.625 0 0.625 0.375 1 0.375
		 0 0 0.375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 14 ".pt";
	setAttr ".pt[0]" -type "float3" -2.3922682 2.8411381 0 ;
	setAttr ".pt[1]" -type "float3" -2.4863541 2.8411381 0 ;
	setAttr ".pt[2]" -type "float3" -2.2948744 2.7489078 0 ;
	setAttr ".pt[3]" -type "float3" -2.2948744 2.6598179 0 ;
	setAttr ".pt[4]" -type "float3" -2.5837476 2.7489078 0 ;
	setAttr ".pt[5]" -type "float3" -2.5837476 2.6598179 0 ;
	setAttr ".pt[6]" -type "float3" -2.3922682 2.5675876 0 ;
	setAttr ".pt[7]" -type "float3" -2.4863541 2.5675876 0 ;
	setAttr ".pt[8]" -type "float3" -2.4863541 2.7489078 0 ;
	setAttr ".pt[9]" -type "float3" -2.4863541 2.6598179 0 ;
	setAttr ".pt[10]" -type "float3" -2.3922682 2.6598179 0 ;
	setAttr ".pt[11]" -type "float3" -2.3922682 2.7489078 0 ;
	setAttr -s 12 ".vt[0:11]"  -0.052667975 -1.19949985 0 0.052667975 -1.19949985 0
		 -0.21067214 -1.049875021 0 -0.21067214 -0.9501251 0 0.21067214 -1.049875021 0 0.21067214 -0.9501251 0
		 -0.052667975 -0.80050027 0 0.052667975 -0.80050027 0 0.052667975 -1.049875021 0 0.052667975 -0.9501251 0
		 -0.052667975 -0.9501251 0 -0.052668035 -1.049875021 0;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 8 4 0 8 1 0 9 7 0
		 9 5 0 10 3 0 10 6 0 11 0 0 11 2 0;
	setAttr -ch 12 ".fc[0]" -type "polyFaces" 
		f 12 10 0 -6 4 2 -8 6 -4 -10 8 -2 -12
		mu 0 12 3 10 5 0 4 7 1 6 9 2 8 11;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode mesh -n "polySurfaceShape1" -p "AimEye_R";
	rename -uid "BFFEED49-4082-D936-3AA9-3B8DCD15B0DC";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.734612 0.64386219 -0.5 
		2.1559563 0.64386219 -0.5 2.734612 1.0428617 0.5 2.1559563 1.0428617 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "AimEye_L" -p "_M";
	rename -uid "52ABAFE7-486E-DBDA-3E12-169CD4C52B1B";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "AimEye_LShape" -p "AimEye_L";
	rename -uid "BB3717C7-4940-B6D3-FA54-8D9C4FA4E4A2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 12 ".uvst[0].uvsp[0:11]" -type "float2" 0.625 0.375 0.625
		 0.625 0.375 0.625 0.375 0.375 1 0.375 0.625 0 0.625 1 1 0.625 0 0.625 0.375 1 0.375
		 0 0 0.375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 14 ".pt";
	setAttr ".pt[0]" -type "float3" -1.7505016 2.8411381 0 ;
	setAttr ".pt[1]" -type "float3" -1.8445876 2.8411381 0 ;
	setAttr ".pt[2]" -type "float3" -1.6531081 2.7489078 0 ;
	setAttr ".pt[3]" -type "float3" -1.6531081 2.6598179 0 ;
	setAttr ".pt[4]" -type "float3" -1.9419811 2.7489078 0 ;
	setAttr ".pt[5]" -type "float3" -1.9419811 2.6598179 0 ;
	setAttr ".pt[6]" -type "float3" -1.7505016 2.5675876 0 ;
	setAttr ".pt[7]" -type "float3" -1.8445876 2.5675876 0 ;
	setAttr ".pt[8]" -type "float3" -1.8445876 2.7489078 0 ;
	setAttr ".pt[9]" -type "float3" -1.8445876 2.6598179 0 ;
	setAttr ".pt[10]" -type "float3" -1.7505016 2.6598179 0 ;
	setAttr ".pt[11]" -type "float3" -1.7505016 2.7489078 0 ;
	setAttr -s 12 ".vt[0:11]"  -0.052667975 -1.19949985 0 0.052667975 -1.19949985 0
		 -0.21067214 -1.049875021 0 -0.21067214 -0.9501251 0 0.21067214 -1.049875021 0 0.21067214 -0.9501251 0
		 -0.052667975 -0.80050027 0 0.052667975 -0.80050027 0 0.052667975 -1.049875021 0 0.052667975 -0.9501251 0
		 -0.052667975 -0.9501251 0 -0.052668035 -1.049875021 0;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 8 4 0 8 1 0 9 7 0
		 9 5 0 10 3 0 10 6 0 11 0 0 11 2 0;
	setAttr -ch 12 ".fc[0]" -type "polyFaces" 
		f 12 10 0 -6 4 2 -8 6 -4 -10 8 -2 -12
		mu 0 12 3 10 5 0 4 7 1 6 9 2 8 11;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode mesh -n "polySurfaceShape1" -p "AimEye_L";
	rename -uid "A19E2E8A-4BD4-A21A-7EFF-D3A69B0DAC58";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.734612 0.64386219 -0.5 
		2.1559563 0.64386219 -0.5 2.734612 1.0428617 0.5 2.1559563 1.0428617 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowCenter_M" -p "_M";
	rename -uid "90A2B886-4A25-C780-0006-06A302BDB058";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowCenter_MShape" -p "EyeBrowCenter_M";
	rename -uid "30931201-4E4F-3FBC-2234-F09CF27F7DD1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.42084691 2.340771 0 -0.35799357 
		2.2174141 -1.055012e-007 -0.26009765 2.119518 5.27506e-008 -0.13674179 2.0566645 
		5.27506e-008 -2.294062e-007 2.0350072 0 0.13674101 2.0566645 0 0.2600975 2.119518 
		-1.055012e-007 0.35799357 2.2174144 -5.27506e-008 0.42084649 2.340771 -1.055012e-007 
		0.44250423 2.4775124 0 0.42084649 2.6142545 0 0.35799351 2.7376099 1.055012e-007 
		0.26009738 2.8355076 5.27506e-008 0.13674101 2.8983595 5.27506e-008 -2.3079218e-007 
		2.9200168 -1.055012e-007 -0.13674167 2.8983595 1.055012e-007 -0.26009753 2.8355076 
		1.055012e-007 -0.35799333 2.7376099 -5.27506e-008 -0.4208464 2.6142545 -5.27506e-008 
		-0.44250408 2.4775124 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "LipRegion_M" -p "_M";
	rename -uid "CBD75DD0-4FE0-90F1-5E87-B99E418B675A";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "LipRegion_MShape" -p "LipRegion_M";
	rename -uid "1F69A0C7-41F1-8729-0504-89A32EF5E41D";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.4838141 0.55986673 0 -1.4633698 
		0.42929497 -7.5494818e-008 -1.4315085 0.32567379 3.7747409e-008 -1.3913667 0.25914446 
		3.7747409e-008 -1.3468723 0.23621972 0 -1.3023815 0.25914451 0 -1.2622441 0.32567388 
		-7.5494818e-008 -1.2303894 0.42929497 -3.7747409e-008 -1.209938 0.55986696 -7.5494818e-008 
		-1.2028846 0.70460618 0 -1.2099359 0.84934533 0 -1.2303864 0.97991627 7.5494818e-008 
		-1.2622427 1.0835395 3.7747409e-008 -1.3023814 1.1500655 3.7747409e-008 -1.3468723 
		1.1729909 -7.5494818e-008 -1.3913689 1.1500661 7.5494818e-008 -1.4315103 1.0835395 
		7.5494818e-008 -1.46337 0.9799158 -3.7747409e-008 -1.4838176 0.84934533 -3.7747409e-008 
		-1.4908675 0.70460629 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Nose_M" -p "_M";
	rename -uid "D9F06C32-4150-4715-DD5C-96B1BC0EC81C";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Nose_MShape" -p "Nose_M";
	rename -uid "B3855B58-405C-B2D5-360D-8D906AAF5441";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.40048587 1.2282424 0 -0.34067339 
		1.110854 -1.0039692e-007 -0.24751389 1.0176939 5.0198462e-008 -0.1301263 0.95788103 
		5.0198462e-008 -2.0861626e-007 0.93727112 0 0.13012518 0.95788115 0 0.24751368 1.017694 
		-1.0039692e-007 0.34067345 1.1108541 -5.0198462e-008 0.40048558 1.2282424 -1.0039692e-007 
		0.42109537 1.3583676 0 0.40048558 1.4884933 0 0.34067339 1.6058797 1.0039692e-007 
		0.24751356 1.699041 5.0198462e-008 0.13012519 1.7588514 5.0198462e-008 -2.0861626e-007 
		1.779461 -1.0039692e-007 -0.13012618 1.7588514 1.0039692e-007 -0.24751377 1.699041 
		1.0039692e-007 -0.34067315 1.6058797 -5.0198462e-008 -0.40048549 1.4884933 -5.0198462e-008 
		-0.42109522 1.3583676 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "NoseBridge_M" -p "_M";
	rename -uid "B8A36189-4D9C-D1ED-90D5-3DB604DE1ED7";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "NoseBridge_MShape" -p "NoseBridge_M";
	rename -uid "8E14522E-4EEC-C41D-26DA-D282A541C3AE";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.42084691 1.5205704 0 -0.35799357 
		1.3972137 -1.055012e-007 -0.26009765 1.2993175 5.27506e-008 -0.13674179 1.236464 
		5.27506e-008 -2.294062e-007 1.214807 0 0.13674101 1.236464 0 0.2600975 1.2993175 
		-1.055012e-007 0.35799357 1.3972139 -5.27506e-008 0.42084649 1.5205704 -1.055012e-007 
		0.44250423 1.6573124 0 0.42084649 1.7940551 0 0.35799351 1.9174109 1.055012e-007 
		0.26009738 2.0153098 5.27506e-008 0.13674101 2.0781624 5.27506e-008 -2.3079218e-007 
		2.0998197 -1.055012e-007 -0.13674167 2.0781624 1.055012e-007 -0.26009753 2.0153098 
		1.055012e-007 -0.35799333 1.9174109 -5.27506e-008 -0.4208464 1.7940551 -5.27506e-008 
		-0.44250408 1.6573124 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlLips_M" -p "_M";
	rename -uid "E8F55F99-4E95-0C2E-DC97-CFA9BC04C71D";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlLips_MShape" -p "ctrlLips_M";
	rename -uid "6B9996BE-4660-4C33-59E2-23AEC7A970C1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.8123178 0.83431828 -0.5 
		2.07986 0.83431828 -0.5 2.8123178 1.1018546 0.5 2.07986 1.1018546 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ctrlMouth_M" -p "_M";
	rename -uid "D7B4A12B-4005-5F42-DAFE-47847269FBB6";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ctrlMouth_MShape" -p "ctrlMouth_M";
	rename -uid "D33092F5-4B5F-6981-F941-BFA97E27889D";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 4 ".pt[0:3]" -type "float3"  2.8123178 0.59676683 -0.5 
		2.07986 0.59676683 -0.5 2.8123178 0.71990913 0.5 2.07986 0.71990913 0.5;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "NoseCrease_M" -p "_M";
	rename -uid "90AA6932-4D72-1417-CA06-CEA089CB50F4";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "NoseCrease_MShape" -p "NoseCrease_M";
	rename -uid "7AE89736-48A2-45C1-6F86-FAB0526576A2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.42084691 1.8035202 0 -0.35799357 
		1.6801635 -1.055012e-007 -0.26009765 1.5822673 5.27506e-008 -0.13674179 1.5194138 
		5.27506e-008 -2.294062e-007 1.4977568 0 0.13674101 1.5194138 0 0.2600975 1.5822673 
		-1.055012e-007 0.35799357 1.6801637 -5.27506e-008 0.42084649 1.8035202 -1.055012e-007 
		0.44250423 1.9402622 0 0.42084649 2.0770082 0 0.35799351 2.2003646 1.055012e-007 
		0.26009738 2.2982631 5.27506e-008 0.13674101 2.3611157 5.27506e-008 -2.3079218e-007 
		2.3827729 -1.055012e-007 -0.13674167 2.3611157 1.055012e-007 -0.26009753 2.2982631 
		1.055012e-007 -0.35799333 2.2003646 -5.27506e-008 -0.4208464 2.0770082 -5.27506e-008 
		-0.44250408 1.9402622 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ChinCrease_M" -p "_M";
	rename -uid "C51B9E7C-4929-C06B-47CE-0DB0C8B87E87";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ChinCrease_MShape" -p "ChinCrease_M";
	rename -uid "15BCB825-43C7-5F1A-276D-0486194761E5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.42084691 0.33026403 0 
		-0.35799357 0.20690706 -1.055012e-007 -0.26009765 0.10901079 5.27506e-008 -0.13674179 
		0.046157151 5.27506e-008 -2.294062e-007 0.024500141 0 0.13674101 0.046157151 0 0.2600975 
		0.10901079 -1.055012e-007 0.35799357 0.2069073 -5.27506e-008 0.42084649 0.33026403 
		-1.055012e-007 0.44250423 0.46700653 0 0.42084649 0.60375273 0 0.35799351 0.72710919 
		1.055012e-007 0.26009738 0.82500756 5.27506e-008 0.13674101 0.88786024 5.27506e-008 
		-2.3079218e-007 0.90951759 -1.055012e-007 -0.13674167 0.88786024 1.055012e-007 -0.26009753 
		0.82500756 1.055012e-007 -0.35799333 0.72710919 -5.27506e-008 -0.4208464 0.60375273 
		-5.27506e-008 -0.44250408 0.46700653 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "cam" -p "Group";
	rename -uid "70926F5F-491F-C4FA-98A1-BF8FACA6A84C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.3849950652414527 1.4870805131836751 14.350749866588373 ;
createNode camera -n "camShape" -p "cam";
	rename -uid "D4367149-4C08-5B61-D0D7-A293D8FB8771";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 13.850749896390692;
	setAttr ".ow" 6.1013672246968014;
	setAttr ".imn" -type "string" "front1";
	setAttr ".den" -type "string" "front1_depth";
	setAttr ".man" -type "string" "front1_mask";
	setAttr ".tp" -type "double3" 1.0966866630101688 0.71163755102025084 0.049999997019768205 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -n "_R" -p "Group";
	rename -uid "7C93A181-48DF-DC5C-7482-61BFD7CC1B07";
createNode transform -n "Cheek_R" -p "_R";
	rename -uid "5E0AE3B0-4B69-27FA-EB73-20BD6F2AEC8C";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Cheek_RShape" -p "Cheek_R";
	rename -uid "873CF830-45D2-C588-1DAC-41B1F8311A39";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.2562479 0.98751581 0 -1.1925969 
		0.8625949 -1.0683976e-007 -1.093459 0.76345724 5.3419882e-008 -0.96853846 0.69980711 
		5.3419882e-008 -0.83006215 0.67787462 0 -0.69158602 0.69980717 0 -0.56666493 0.76345736 
		-1.0683976e-007 -0.46752638 0.86259502 -5.3419882e-008 -0.40387571 0.98751581 -1.0683976e-007 
		-0.38194335 1.1259919 0 -0.40387571 1.2644687 0 -0.46752644 1.3893888 1.0683976e-007 
		-0.56666505 1.4885279 5.3419882e-008 -0.69158608 1.5521774 5.3419882e-008 -0.83006215 
		1.5741098 -1.0683976e-007 -0.96853834 1.5521774 1.0683976e-007 -1.0934589 1.4885279 
		1.0683976e-007 -1.1925967 1.3893888 -5.3419882e-008 -1.2562475 1.2644687 -5.3419882e-008 
		-1.2781799 1.1259919 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ear_R" -p "_R";
	rename -uid "FC1969E9-448A-5360-5D60-ECB083F67E76";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -0.80102289838751872 -0.1308862528745125 0 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1 10 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ear_RShape" -p "ear_R";
	rename -uid "5B829A52-4F4B-403A-AF3E-BFB30A6306A4";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0 0 0.1 0 0.2 0 0.30000001
		 0 0.40000001 0 0.5 0 0.60000002 0 0.69999999 0 0.80000001 0 0.90000004 0 1 0 0 0.60000002
		 0 0.69999999 0 0.80000001 0 0.90000004 0 1 0.1 1 0.2 1 0.30000001 1 0.40000001 1
		 0.5 1 0.60000002 1 0.69999999 1 0.80000001 1 0.90000004 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 26 ".pt[0:25]" -type "float3"  0.46396169 0.59669316 -0.10000002 
		0.42972052 0.77835977 -0.10000003 0.36758459 0.94223851 -0.10000002 0.30316079 1.0121889 
		-0.10000002 0.23692718 1.0865636 -0.10000002 0.14823981 1.1520576 -0.10000002 0.06742125 
		1.1932172 -0.10000002 0.036334835 1.1773473 -0.10000002 -0.030289918 1.2331332 -0.10000003 
		-0.11349593 1.2961111 -0.10000002 -0.30413923 1.5325005 -0.10000002 0.53589189 0.02324287 
		-0.10000001 0.51810765 -0.073901117 -0.10000002 0.51184934 -0.19416024 -0.099999979 
		0.50577319 -0.24346745 -0.10000002 0.48056981 -0.37154731 -0.099999979 0.40471005 
		-0.56845629 -0.099999972 0.31038976 -0.6620186 -0.099999972 0.23029864 -0.73036885 
		-0.099999972 0.15150148 -0.71524054 -0.099999972 0.093873911 -0.72944695 -0.1 -0.0020561768 
		-0.73394066 -0.099999972 -0.10993834 -0.71507227 -0.099999972 -0.17622428 -0.68847555 
		-0.099999972 -0.29129496 -0.65255481 -0.099999972 -0.39655063 -0.65378845 -0.1;
	setAttr -s 26 ".vt[0:25]"  -1.035027981 1.3493638 2.9802322e-008 -0.96788323 1.09638083 2.9802322e-008
		 -0.86459756 0.85325336 2.9802322e-008 -0.77116787 0.7251184 2.9802322e-008 -0.67773962 0.60026914 2.9802322e-008
		 -0.56788325 0.48856169 2.9802322e-008 -0.46788281 0.40313858 2.9802322e-008 -0.36788279 0.30785912 2.9802322e-008
		 -0.26131231 0.23229253 2.9802322e-008 -0.1317417 0.15344006 2.9802322e-008 0 0.1501548 2.9802322e-008
		 -1.13687873 1.98878908 7.4505806e-009 -1.13687873 2.13478541 2.9802322e-008 -1.14083266 2.29424548 -2.9802322e-008
		 -1.14083266 2.39424539 2.9802322e-008 -1.1155324 2.59544778 -2.9802322e-008 -1.040121198 2.85317111 -2.9802322e-008
		 -0.94807339 2.99631 -2.9802322e-008 -0.83216912 3.07980752 -2.9802322e-008 -0.71626508 3.07185483 -2.9802322e-008
		 -0.62819296 3.095712185 -2.9802322e-008 -0.50433666 3.083783627 -2.9802322e-008 -0.38048047 3.051975489 -2.9802322e-008
		 -0.28445643 2.97245312 -2.9802322e-008 -0.14867175 2.896909 -2.9802322e-008 0 2.84919524 -2.9802322e-008;
	setAttr -s 26 ".ed[0:25]"  0 1 0 0 11 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0
		 6 7 0 7 8 0 8 9 0 9 10 0 11 12 0 12 13 0 13 14 0 14 15 0 10 25 0 15 16 0 16 17 0
		 17 18 0 18 19 0 19 20 0 20 21 0 21 22 0 22 23 0 23 24 0 24 25 0;
	setAttr -ch 26 ".fc[0]" -type "polyFaces" 
		f 26 15 -26 -25 -24 -23 -22 -21 -20 -19 -18 -17 -15 -14 -13 -12 -2 0 2 3 4 5 6 7 8 9
		 10
		mu 0 26 10 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 0 1 2 3 4 5 6 7 8 9;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "eyeBall_R" -p "_R";
	rename -uid "87A9B4FB-4F41-E9C3-CFED-0BB53F739AE0";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "eyeBall_RShape" -p "eyeBall_R";
	rename -uid "E58CC919-4298-333F-A3B7-F193DB009263";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.69657117 1.9353905 -0.89999998 
		-0.67113298 1.8638299 -0.9000001 -0.63223588 1.8102716 -0.89999998 -0.58419973 1.7767906 
		-0.89999998 -0.53183532 1.7637235 -0.89999998 -0.4799262 1.7718661 -0.89999998 -0.43289623 
		1.8028991 -0.9000001 -0.39486134 1.857365 -0.89999998 -0.3696813 1.9322543 -0.9000001 
		-0.36037338 2.0207016 -0.89999998 -0.3682425 2.1134861 -0.89999998 -0.39244911 2.2005782 
		-0.89999998 -0.43021062 2.2720435 -0.89999998 -0.47748309 2.3186858 -0.89999998 -0.52980775 
		2.3336804 -0.9000001 -0.5826993 2.3149452 -0.89999998 -0.6314109 2.2659624 -0.89999998 
		-0.67090201 2.194289 -0.89999998 -0.69660127 2.1090693 -0.89999998 -0.70543599 2.0197456 
		-0.89999998;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "iris_R" -p "_R";
	rename -uid "F76D8D19-4C2F-69D0-0A37-CF87061EE231";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "iris_RShape" -p "iris_R";
	rename -uid "5C94A78A-49FC-BBBC-5ABC-75B4FE8F990A";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.82188785 1.912306 -0.8238135 
		-0.76800436 1.8065537 -0.82381362 -0.68408 1.7226292 -0.8238135 -0.57832944 1.6687499 
		-0.8238135 -0.46110278 1.6501802 -0.8238135 -0.34387645 1.6687499 -0.8238135 -0.23812544 
		1.7226293 -0.82381362 -0.1542007 1.8065538 -0.82381356 -0.10031775 1.912306 -0.82381362 
		-0.081751011 2.0295327 -0.8238135 -0.10031775 2.1467619 -0.8238135 -0.15420076 2.2525098 
		-0.82381344 -0.23812556 2.3364344 -0.8238135 -0.34387648 2.3903146 -0.8238135 -0.46110275 
		2.408885 -0.82381362 -0.57832932 2.3903146 -0.82381344 -0.68407983 2.3364344 -0.82381344 
		-0.76800412 2.2525098 -0.82381356 -0.82188755 2.1467619 -0.82381356 -0.84045488 2.0295327 
		-0.8238135;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "pupil_R" -p "_R";
	rename -uid "4D76CC27-4E26-FF45-9C9E-56BF897A68D7";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "pupil_RShape" -p "pupil_R";
	rename -uid "6CFBF705-43AF-DED1-DB13-18BAD9D3A1AF";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.8798582 1.8934698 -0.67618638 
		-0.81731808 1.7707243 -0.67618638 -0.71990758 1.6733167 -0.67618638 -0.59716469 1.6107776 
		-0.67618638 -0.46110293 1.5892255 -0.67618638 -0.32503989 1.6107777 -0.67618638 -0.20229682 
		1.6733168 -0.67618638 -0.10488718 1.7707244 -0.67618638 -0.042346213 1.8934698 -0.67618638 
		-0.020796174 2.0295329 -0.67618638 -0.042346213 2.1655996 -0.67618638 -0.10488724 
		2.2883394 -0.67618638 -0.20229694 2.3857489 -0.67618638 -0.32503989 2.4482884 -0.67618638 
		-0.46110293 2.4698379 -0.67618638 -0.59716457 2.4482884 -0.67618638 -0.71990728 2.3857489 
		-0.67618638 -0.81731784 2.2883394 -0.67618638 -0.87985784 2.1655996 -0.67618638 -0.90140909 
		2.0295329 -0.67618638;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "eyeBrow_R" -p "_R";
	rename -uid "AD07A6D8-4E60-C1C5-23A6-E38555BAD4E6";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "eyeBrow_RShape" -p "eyeBrow_R";
	rename -uid "AE2BED5A-4771-B38A-68D8-18AD79D0D834";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.71043336 2.378298 0.5 
		-0.73196888 2.257021 0.49999988 -0.7021845 2.1546276 0.5 -0.67801106 2.0948305 0.5 
		-0.61390686 2.0700459 0.5 -0.57271343 2.0773251 0.5 -0.54544646 2.1140506 0.49999988 
		-0.52737385 2.1775839 0.5 -0.49087274 2.2744153 0.49999988 -0.45604634 2.4135571 
		0.5 -0.45173144 2.568656 0.5 -0.47918081 2.7444985 0.5 -0.52637893 2.8811913 0.5 
		-0.57118106 2.9823804 0.5 -0.58691227 3.020694 0.49999988 -0.66211706 2.9985597 0.5 
		-0.6982609 2.9161794 0.5 -0.74110895 2.8005743 0.5 -0.73091143 2.6463771 0.5 -0.72638547 
		2.5051775 0.5;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "hair_R" -p "_R";
	rename -uid "F5BB4C21-471A-F36A-C1FB-3C807721B830";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1 10 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "hair_RShape" -p "hair_R";
	rename -uid "E5FAFB15-4319-2025-E39E-F1B5ABC833DF";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0 0 0.1 0 0.2 0 0.30000001
		 0 0.40000001 0 0.5 0 0.60000002 0 0.69999999 0 0.80000001 0 0.90000004 0 1 0 0 0.60000002
		 0 0.69999999 0 0.80000001 0 0.90000004 0 1 0.1 1 0.2 1 0.30000001 1 0.40000001 1
		 0.5 1 0.60000002 1 0.69999999 1 0.80000001 1 0.90000004 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 26 ".pt[0:25]" -type "float3"  -0.094134204 1.2508366 -0.1 
		-0.085865915 1.766566 -0.1 -0.1015723 2.1511874 -0.1 -0.068276882 2.3699322 -0.1 
		-0.045819454 2.4896126 -0.1 -0.063303784 2.6236048 -0.1 -0.036205571 2.6961389 -0.1 
		-0.0048661316 2.7611957 -0.1 -0.013867149 2.7538452 -0.1 -0.011604209 2.7628911 -0.1 
		0 2.7181671 -0.1 -0.030676087 0.26235357 -0.1 -0.023150545 -0.1052907 -0.1 -0.065752931 
		-0.19385248 -0.1 -0.14408118 -0.15459195 -0.1 -0.22531068 -0.13197565 -0.1 -0.32847992 
		-0.022796039 -0.1 -0.35789278 0.21808667 -0.1 -0.28960097 0.40019867 -0.1 -0.20434219 
		0.56604803 -0.1 -0.11783411 0.63672036 -0.1 -0.10459045 0.69589055 -0.1 -0.074898735 
		0.7849651 -0.1 -0.040965967 0.86979789 -0.1 -0.079140671 1.0012887 -0.1 0 1.087797 
		-0.1;
	setAttr -s 26 ".vt[0:25]"  -1.035027981 1.3493638 2.9802322e-008 -0.96788323 1.09638083 2.9802322e-008
		 -0.86459756 0.85325336 2.9802322e-008 -0.77116787 0.7251184 2.9802322e-008 -0.67773962 0.60026914 2.9802322e-008
		 -0.56788325 0.48856169 2.9802322e-008 -0.46788281 0.40313858 2.9802322e-008 -0.36788279 0.30785912 2.9802322e-008
		 -0.26131231 0.23229253 2.9802322e-008 -0.1317417 0.15344006 2.9802322e-008 0 0.1501548 2.9802322e-008
		 -1.13687873 1.98878908 7.4505806e-009 -1.13687873 2.13478541 2.9802322e-008 -1.14083266 2.29424548 -2.9802322e-008
		 -1.14083266 2.39424539 2.9802322e-008 -1.1155324 2.59544778 -2.9802322e-008 -1.040121198 2.85317111 -2.9802322e-008
		 -0.94807339 2.99631 -2.9802322e-008 -0.83216912 3.07980752 -2.9802322e-008 -0.71626508 3.07185483 -2.9802322e-008
		 -0.62819296 3.095712185 -2.9802322e-008 -0.50433666 3.083783627 -2.9802322e-008 -0.38048047 3.051975489 -2.9802322e-008
		 -0.28445643 2.97245312 -2.9802322e-008 -0.14867175 2.896909 -2.9802322e-008 0 2.84919524 -2.9802322e-008;
	setAttr -s 26 ".ed[0:25]"  0 1 0 0 11 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0
		 6 7 0 7 8 0 8 9 0 9 10 0 11 12 0 12 13 0 13 14 0 14 15 0 10 25 0 15 16 0 16 17 0
		 17 18 0 18 19 0 19 20 0 20 21 0 21 22 0 22 23 0 23 24 0 24 25 0;
	setAttr -ch 26 ".fc[0]" -type "polyFaces" 
		f 26 15 -26 -25 -24 -23 -22 -21 -20 -19 -18 -17 -15 -14 -13 -12 -2 0 2 3 4 5 6 7 8 9
		 10
		mu 0 26 10 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 0 1 2 3 4 5 6 7 8 9;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Lip_R" -p "_R";
	rename -uid "F35885B9-434E-A6D1-7070-8BB32E398381";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Lip_RShape" -p "Lip_R";
	rename -uid "0FFC7A3B-4456-9660-9181-FB952C6DD80A";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.96910584 0.84985411 0 
		-0.88076597 0.75149405 -9.6631155e-008 -0.75133401 0.67343444 4.8315581e-008 -0.60162854 
		0.62331712 4.8315581e-008 -0.45010671 0.606049 0 -0.31040317 0.623317 0 -0.19245823 
		0.67343456 -9.6631155e-008 -0.10452029 0.75149417 -4.8315581e-008 -0.051016741 0.84985411 
		-9.6631155e-008 -0.033028781 0.95888782 0 -0.051016741 1.0679232 0 -0.10452035 1.1662843 
		9.6631155e-008 -0.19245835 1.2443433 4.8315581e-008 -0.31040317 1.2944585 4.8315581e-008 
		-0.45010671 1.3117273 -9.6631155e-008 -0.60162842 1.2944587 9.6631155e-008 -0.75133389 
		1.2443436 9.6631155e-008 -0.88076574 1.1662848 -4.8315581e-008 -0.96910548 1.0679243 
		-4.8315581e-008 -1.0005225 0.95888782 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLipA_R" -p "_R";
	rename -uid "585B5055-4A74-A092-9733-5BA702068F64";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLipA_RShape" -p "upperLipA_R";
	rename -uid "2DF4AB6D-4F72-0F9A-79FC-B8A1EA28051C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.51239997 0.82380611 0.038265921 
		-0.44695088 0.69535333 0.038265802 -0.3450107 0.59341401 0.03826597 -0.21655938 0.5279637 
		0.03826597 -0.074170336 0.50541139 0.038265921 0.068219379 0.52796376 0.038265921 
		0.19667105 0.59341413 0.038265802 0.29861116 0.69535345 0.038265862 0.36406064 0.82380611 
		0.038265802 0.38661283 0.96619469 0.038265921 0.36406064 1.1085871 0.038265921 0.2986111 
		1.2370366 0.038266029 0.19667093 1.3389765 0.03826597 0.068219334 1.4043648 0.03826597 
		-0.074170396 1.426736 0.038265802 -0.21655926 1.4043648 0.038266029 -0.34501058 1.3389765 
		0.038266029 -0.44695064 1.2370366 0.038265862 -0.51239961 1.1085871 0.038265862 -0.53495288 
		0.96619469 0.038265921;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLipA_R" -p "_R";
	rename -uid "41A47DFD-4184-6697-5B87-028E5DEFE1BA";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLipA_RShape" -p "lowerLipA_R";
	rename -uid "E6A10487-4A1D-A65A-79AF-1AAEB6D4CB30";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.51971167 0.65785462 0.080578595 
		-0.45426333 0.5294019 0.080578491 -0.35232303 0.4274627 0.080578655 -0.22387095 0.36201388 
		0.080578655 -0.081481427 0.33946177 0.080578595 0.06090802 0.36201394 0.080578595 
		0.1893598 0.42746282 0.080578491 0.29129961 0.52940202 0.080578536 0.35674879 0.65785462 
		0.080578491 0.37930104 0.80024421 0.080578595 0.35674879 0.94263327 0.080578595 0.29129955 
		1.0710868 0.0805787 0.18935968 1.173028 0.080578655 0.06090796 1.2384766 0.080578655 
		-0.081481412 1.2610284 0.080578491 -0.22387083 1.2384766 0.0805787 -0.35232291 1.173028 
		0.0805787 -0.45426309 1.0710868 0.080578536 -0.51971132 0.94263327 0.080578536 -0.54226458 
		0.80024421 0.080578595;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "NoseCorner_R" -p "_R";
	rename -uid "47254C78-400A-D79A-E029-1EACF0FFEFA1";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "NoseCorner_RShape" -p "NoseCorner_R";
	rename -uid "ADAFA9CB-4B23-55BB-7168-22AB9FBA6CAF";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.7158953 1.2298993 0 -0.65319109 
		1.1068348 -1.0525153e-007 -0.55552655 1.0091708 5.2625765e-008 -0.43246236 0.94646597 
		5.2625765e-008 -0.29604453 0.92485934 0 -0.15962659 0.94646609 0 -0.036562555 1.0091709 
		-1.0525153e-007 0.061101772 1.1068349 -5.2625765e-008 0.12380613 1.2298993 -1.0525153e-007 
		0.14541256 1.3663164 0 0.12380613 1.5027343 0 0.061101712 1.6257976 1.0525153e-007 
		-0.036562674 1.7234628 5.2625765e-008 -0.1596266 1.7861665 5.2625765e-008 -0.29604453 
		1.807773 -1.0525153e-007 -0.43246225 1.7861665 1.0525153e-007 -0.55552644 1.7234628 
		1.0525153e-007 -0.65319085 1.6257976 -5.2625765e-008 -0.71589494 1.5027343 -5.2625765e-008 
		-0.73750126 1.3663164 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLidOuter_R" -p "_R";
	rename -uid "705AD4F5-4EC6-178F-A4AB-AC941DC86BC9";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLidOuter_RShape" -p "lowerLidOuter_R";
	rename -uid "0213AD01-4D36-3E2E-03D0-008C3B9A39D6";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.92291009 1.5138894 0 -0.86539459 
		1.3855665 -9.6543474e-008 -0.77581018 1.2769181 4.8271737e-008 -0.66292727 1.20382 
		4.8271737e-008 -0.53779691 1.1780852 0 -0.4126662 1.2038198 0 -0.29978469 1.2769182 
		-9.6543474e-008 -0.21020047 1.3855666 -4.8271737e-008 -0.15268405 1.5138894 -9.6543474e-008 
		-0.13286513 1.6581242 0 -0.15268405 1.8041767 0 -0.21020053 1.9365445 9.6543474e-008 
		-0.29978481 2.0404491 4.8271737e-008 -0.4126662 2.1058481 4.8271737e-008 -0.53779691 
		2.1280951 -9.6543474e-008 -0.66292715 2.1058481 9.6543474e-008 -0.77581006 2.0404491 
		9.6543474e-008 -0.86539435 1.9365445 -4.8271737e-008 -0.92290974 1.8041767 -4.8271737e-008 
		-0.94272912 1.6581242 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "innerLid_R" -p "_R";
	rename -uid "96EA6024-487E-078D-CC3F-9EB2AC20B579";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "innerLid_RShape" -p "innerLid_R";
	rename -uid "7D486A6E-46A1-75BC-C0C8-6EA3AA51E2BF";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.61660451 1.8767396 0 -0.55377674 
		1.760933 -1.0666771e-007 -0.45470983 1.6690301 5.3333856e-008 -0.32811397 1.6100221 
		5.3333856e-008 -0.18558192 1.5896902 0 -0.040236767 1.6100221 0 0.094372213 1.6690302 
		-1.0666771e-007 0.20471351 1.7609332 -5.3333856e-008 0.27784026 1.8767396 -1.0666771e-007 
		0.3035495 2.0051165 0 0.27784026 2.1334853 0 0.20471345 2.2492943 1.0666771e-007 
		0.094372094 2.3411951 5.3333856e-008 -0.040236745 2.4002011 5.3333856e-008 -0.18558189 
		2.4205337 -1.0666771e-007 -0.32811385 2.4002011 1.0666771e-007 -0.45470965 2.3411951 
		1.0666771e-007 -0.5537765 2.2492943 -5.3333856e-008 -0.61660421 2.1334853 -5.3333856e-008 
		-0.63808769 2.0051165 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "outerLid_R" -p "_R";
	rename -uid "589A81FB-47F7-92DE-2011-A1839CEAF1BC";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "outerLid_RShape" -p "outerLid_R";
	rename -uid "4C9B3830-4914-115E-AEC0-81B027DAA747";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.3337502 1.8795278 0 -1.2614589 
		1.7637213 -1.0666771e-007 -1.1520674 1.6718141 5.3333856e-008 -1.0182085 1.6128099 
		5.3333856e-008 -0.87331021 1.5924779 0 -0.73094326 1.6128099 0 -0.60429859 1.6718142 
		-1.0666771e-007 -0.50505048 1.7637215 -5.3333856e-008 -0.44203058 1.8795278 -1.0666771e-007 
		-0.42046487 2.0078971 0 -0.44203058 2.1362739 0 -0.50505054 2.2520747 1.0666771e-007 
		-0.60429871 2.3439827 5.3333856e-008 -0.7309432 2.4029903 5.3333856e-008 -0.87331021 
		2.4233222 -1.0666771e-007 -1.0182084 2.4029903 1.0666771e-007 -1.1520673 2.3439827 
		1.0666771e-007 -1.2614586 2.2520747 -5.3333856e-008 -1.3337499 2.1362739 -5.3333856e-008 
		-1.3591219 2.0078971 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLid_R" -p "_R";
	rename -uid "33E516D4-4C1D-0F1E-FD30-BAB57C9760A9";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLid_RShape" -p "upperLid_R";
	rename -uid "B5E9CF57-4087-31CB-855E-0B81F021F229";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.68749994039535522 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.83684027 2.1910455 0 -0.79061788 
		2.0643437 -9.6839507e-008 -0.71863139 1.9658012 4.8419754e-008 -0.62792677 1.9085573 
		4.8419754e-008 -0.52737385 1.890972 0 -0.4268162 1.9085574 0 -0.33610693 1.9658014 
		-9.6839507e-008 -0.26411915 2.0643442 -4.8419754e-008 -0.21790075 2.1910455 -9.6839507e-008 
		-0.20197508 2.3314943 0 -0.21790075 2.4719365 0 -0.26411921 2.5991759 9.6839507e-008 
		-0.33610705 2.7088125 4.8419754e-008 -0.42681623 2.7920067 4.8419754e-008 -0.52737385 
		2.8248987 -9.6839507e-008 -0.62792665 2.7920067 9.6839507e-008 -0.71863127 2.7088125 
		9.6839507e-008 -0.79061764 2.5991759 -4.8419754e-008 -0.83683991 2.4719365 -4.8419754e-008 
		-0.85276395 2.3314943 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLid_R" -p "_R";
	rename -uid "DAAE6098-4EF1-2208-2D05-2680DDFE45D8";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLid_RShape" -p "lowerLid_R";
	rename -uid "352C4882-4471-113C-54D8-43BEFC6AAABD";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.86500275 1.624239 0 -0.81613094 
		1.4962287 -1.0290524e-007 -0.74000895 1.3870571 5.145262e-008 -0.64409286 1.308455 
		5.145262e-008 -0.53776586 1.2788012 0 -0.43144113 1.308455 0 -0.33552298 1.3870573 
		-1.0290524e-007 -0.25940114 1.4962287 -5.145262e-008 -0.21052887 1.624239 -1.0290524e-007 
		-0.19368902 1.7634971 0 -0.21052887 1.9027553 0 -0.2594012 2.0282686 1.0290524e-007 
		-0.3355231 2.125725 5.145262e-008 -0.43144113 2.1850276 5.145262e-008 -0.53776586 
		2.2044055 -1.0290524e-007 -0.64409274 2.1850276 1.0290524e-007 -0.74000883 2.125725 
		1.0290524e-007 -0.8161307 2.0282686 -5.145262e-008 -0.86500239 1.9027553 -5.145262e-008 
		-0.88184267 1.7634971 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLid1_R" -p "_R";
	rename -uid "BDB789D9-43A2-7861-4FD4-E39F2B6FC0E8";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLid1_RShape" -p "upperLid1_R";
	rename -uid "3606E671-4E33-7B3D-78AA-9F80E66A045F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.70470828 2.0057213 0 -0.64037406 
		1.8794571 -1.0798893e-007 -0.54016906 1.7792532 5.3994462e-008 -0.41390324 1.7149166 
		5.3994462e-008 -0.27393726 1.6927481 0 -0.13397156 1.7149165 0 -0.0077065444 1.7792532 
		-1.0798893e-007 0.092498198 1.8794571 -5.3994462e-008 0.15683329 2.0057213 -1.0798893e-007 
		0.17900145 2.1456861 0 0.15683329 2.2856529 0 0.092498139 2.4119155 1.0798893e-007 
		-0.0077066636 2.5121198 5.3994462e-008 -0.13397162 2.5763822 5.3994462e-008 -0.27393728 
		2.5983334 -1.0798893e-007 -0.41390312 2.5763822 1.0798893e-007 -0.54016894 2.5121198 
		1.0798893e-007 -0.64037383 2.4119155 -5.3994462e-008 -0.7047078 2.2856529 -5.3994462e-008 
		-0.72687751 2.1456861 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLid2_R" -p "_R";
	rename -uid "83D521ED-461F-6BD6-2672-F6819E9064CC";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLid2_RShape" -p "upperLid2_R";
	rename -uid "5ED8BFE0-4442-2E07-6F5A-2AB60B471BD4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.82773298 2.0923586 0 -0.76339877 
		1.9660944 -1.0798893e-007 -0.66319376 1.8658905 5.3994462e-008 -0.53692794 1.8015538 
		5.3994462e-008 -0.39696184 1.7793853 0 -0.2569961 1.8015537 0 -0.1307312 1.8658905 
		-1.0798893e-007 -0.030526416 1.9660944 -5.3994462e-008 0.03380863 2.0923586 -1.0798893e-007 
		0.055976793 2.2323234 0 0.03380863 2.3722901 0 -0.030526476 2.4985528 1.0798893e-007 
		-0.13073131 2.598757 5.3994462e-008 -0.25699615 2.6630194 5.3994462e-008 -0.39696187 
		2.6849706 -1.0798893e-007 -0.53692782 2.6630194 1.0798893e-007 -0.66319364 2.598757 
		1.0798893e-007 -0.76339853 2.4985528 -5.3994462e-008 -0.8277325 2.3722901 -5.3994462e-008 
		-0.84990221 2.2323234 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLid3_R" -p "_R";
	rename -uid "EA283FF4-4537-4274-F1AE-DF8CBAC5B43E";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLid3_RShape" -p "upperLid3_R";
	rename -uid "C1A8D550-4E7F-4782-AC29-D2B833B46662";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.0859104 2.0871596 0 -1.0215768 
		1.9608965 -1.0798893e-007 -0.92137289 1.8606926 5.3994462e-008 -0.79510707 1.796356 
		5.3994462e-008 -0.65514112 1.7741874 0 -0.51517481 1.7963558 0 -0.38890943 1.8606926 
		-1.0798893e-007 -0.28870472 1.9608965 -5.3994462e-008 -0.22436976 2.0871596 -1.0798893e-007 
		-0.20220153 2.2271245 0 -0.22436976 2.3670912 0 -0.28870478 2.4933538 1.0798893e-007 
		-0.38890955 2.5935581 5.3994462e-008 -0.51517487 2.6578205 5.3994462e-008 -0.65514112 
		2.6797717 -1.0798893e-007 -0.79510695 2.6578205 1.0798893e-007 -0.92137277 2.5935581 
		1.0798893e-007 -1.0215765 2.4933538 -5.3994462e-008 -1.08591 2.3670912 -5.3994462e-008 
		-1.1080796 2.2271245 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLid4_R" -p "_R";
	rename -uid "2519F365-4ABA-8088-2EC4-CE9557B8768B";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLid4_RShape" -p "upperLid4_R";
	rename -uid "EDEADB30-4D05-ABCC-7222-7FA9DD02B232";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.2141333 2.0074537 0 -1.1497996 
		1.8811896 -1.0798893e-007 -1.0495961 1.7809857 5.3994462e-008 -0.92333007 1.7166491 
		5.3994462e-008 -0.78336412 1.6944805 0 -0.64339781 1.7166489 0 -0.51713222 1.7809857 
		-1.0798893e-007 -0.41692749 1.8811896 -5.3994462e-008 -0.35259256 2.0074537 -1.0798893e-007 
		-0.3304244 2.1474192 0 -0.35259256 2.2873859 0 -0.41692755 2.4136486 1.0798893e-007 
		-0.51713234 2.5138528 5.3994462e-008 -0.64339787 2.5781152 5.3994462e-008 -0.78336412 
		2.6000664 -1.0798893e-007 -0.92332995 2.5781152 1.0798893e-007 -1.049596 2.5138528 
		1.0798893e-007 -1.1497993 2.4136486 -5.3994462e-008 -1.2141328 2.2873859 -5.3994462e-008 
		-1.2363024 2.1474192 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLid1_R" -p "_R";
	rename -uid "0E4727AB-48D2-43F6-0F05-2DAF1E6EFEE6";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLid1_RShape" -p "lowerLid1_R";
	rename -uid "ED82FB22-4D1A-E950-65C5-98A025F32C43";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.70470828 1.7527412 0 -0.64037406 
		1.6264774 -1.0798893e-007 -0.54016906 1.5262735 5.3994462e-008 -0.41390324 1.4619368 
		5.3994462e-008 -0.27393726 1.4397683 0 -0.13397156 1.4619367 0 -0.0077065444 1.5262735 
		-1.0798893e-007 0.092498198 1.6264774 -5.3994462e-008 0.15683329 1.7527412 -1.0798893e-007 
		0.17900145 1.8927047 0 0.15683329 2.0326698 0 0.092498139 2.1589324 1.0798893e-007 
		-0.0077066636 2.2591367 5.3994462e-008 -0.13397162 2.3233991 5.3994462e-008 -0.27393728 
		2.3453503 -1.0798893e-007 -0.41390312 2.3233991 1.0798893e-007 -0.54016894 2.2591367 
		1.0798893e-007 -0.64037383 2.1589324 -5.3994462e-008 -0.7047078 2.0326698 -5.3994462e-008 
		-0.72687751 1.8927047 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLid2_R" -p "_R";
	rename -uid "C37A3466-4DF3-C301-880A-0DBA5688E412";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLid2_RShape" -p "lowerLid2_R";
	rename -uid "DFBA57D7-421A-112B-78D6-1D8892A77E6D";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.82773298 1.7094226 0 -0.76339877 
		1.583159 -1.0798893e-007 -0.66319376 1.4829551 5.3994462e-008 -0.53692794 1.4186184 
		5.3994462e-008 -0.39696184 1.3964499 0 -0.2569961 1.4186183 0 -0.1307312 1.4829551 
		-1.0798893e-007 -0.030526416 1.583159 -5.3994462e-008 0.03380863 1.7094226 -1.0798893e-007 
		0.055976793 1.8493875 0 0.03380863 1.9893532 0 -0.030526476 2.1156154 1.0798893e-007 
		-0.13073131 2.2158196 5.3994462e-008 -0.25699615 2.280082 5.3994462e-008 -0.39696187 
		2.3020332 -1.0798893e-007 -0.53692782 2.280082 1.0798893e-007 -0.66319364 2.2158196 
		1.0798893e-007 -0.76339853 2.1156154 -5.3994462e-008 -0.8277325 1.9893532 -5.3994462e-008 
		-0.84990221 1.8493875 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLid3_R" -p "_R";
	rename -uid "D4D9A3DB-47C7-F4AE-60B8-FD93C0C54DC6";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLid3_RShape" -p "lowerLid3_R";
	rename -uid "D108D5BC-4A0C-BF20-800A-09B4AB273D89";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.0859104 1.7146204 0 -1.0215768 
		1.5883572 -1.0798893e-007 -0.92137289 1.4881533 5.3994462e-008 -0.79510707 1.4238167 
		5.3994462e-008 -0.65514112 1.4016482 0 -0.51517481 1.4238166 0 -0.38890943 1.4881533 
		-1.0798893e-007 -0.28870472 1.5883572 -5.3994462e-008 -0.22436976 1.7146204 -1.0798893e-007 
		-0.20220153 1.8545855 0 -0.22436976 1.9945509 0 -0.28870478 2.1208131 1.0798893e-007 
		-0.38890955 2.2210174 5.3994462e-008 -0.51517487 2.2852798 5.3994462e-008 -0.65514112 
		2.3072309 -1.0798893e-007 -0.79510695 2.2852798 1.0798893e-007 -0.92137277 2.2210174 
		1.0798893e-007 -1.0215765 2.1208131 -5.3994462e-008 -1.08591 1.9945509 -5.3994462e-008 
		-1.1080796 1.8545855 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLid4_R" -p "_R";
	rename -uid "F72695BE-4AB3-E5C5-B999-25BFAE480AA5";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLid4_RShape" -p "lowerLid4_R";
	rename -uid "F39A323D-40E9-2CBD-4CE1-53A9E69BD778";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.2141333 1.7631369 0 -1.1497996 
		1.6368732 -1.0798893e-007 -1.0495961 1.5366694 5.3994462e-008 -0.92333007 1.4723327 
		5.3994462e-008 -0.78336412 1.4501642 0 -0.64339781 1.4723326 0 -0.51713222 1.5366694 
		-1.0798893e-007 -0.41692749 1.6368732 -5.3994462e-008 -0.35259256 1.7631369 -1.0798893e-007 
		-0.3304244 1.9031025 0 -0.35259256 2.0430696 0 -0.41692755 2.169332 1.0798893e-007 
		-0.51713234 2.2695363 5.3994462e-008 -0.64339787 2.3337986 5.3994462e-008 -0.78336412 
		2.3557498 -1.0798893e-007 -0.92332995 2.3337986 1.0798893e-007 -1.049596 2.2695363 
		1.0798893e-007 -1.1497993 2.169332 -5.3994462e-008 -1.2141328 2.0430696 -5.3994462e-008 
		-1.2363024 1.9031025 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeRegion_R" -p "_R";
	rename -uid "65DC4DD4-46B2-7A6A-5A7E-D98C8DAF7437";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeRegion_RShape" -p "EyeRegion_R";
	rename -uid "92DF2B25-4FEF-D14A-7FDC-9390E80DEACD";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.9515764 1.9037715 0 -1.9024537 
		1.8063235 -8.3342641e-008 -1.8259363 1.7289885 4.1671321e-008 -1.7295244 1.6793371 
		4.1671321e-008 -1.6226488 1.6622267 0 -1.5157741 1.6793373 0 -1.4193631 1.7289886 
		-8.3342641e-008 -1.3428469 1.8063236 -4.1671321e-008 -1.2937229 1.9037715 -8.3342641e-008 
		-1.2767962 2.0117903 0 -1.2937229 2.1198137 0 -1.3428468 2.217258 8.3342641e-008 
		-1.4193633 2.2945936 4.1671321e-008 -1.5157748 2.3442421 4.1671321e-008 -1.6226488 
		2.3613513 -8.3342641e-008 -1.7295243 2.3442421 8.3342641e-008 -1.8259361 2.2945936 
		8.3342641e-008 -1.9024534 2.217258 -4.1671321e-008 -1.9515761 2.1198137 -4.1671321e-008 
		-1.9685028 2.0117903 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowRegion_R" -p "_R";
	rename -uid "EDA39952-40EB-D466-5121-B382CC001AD9";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowRegion_RShape" -p "EyeBrowRegion_R";
	rename -uid "DCB5E1C6-49E7-EDE8-FD20-9198DFA2AC4C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.9227914 2.2725704 0 -1.8779678 
		2.1508064 -8.3342641e-008 -1.8081465 2.0541749 4.1671321e-008 -1.7201715 1.9921335 
		4.1671321e-008 -1.6226488 1.9707552 0 -1.5251266 1.9921337 0 -1.4371531 2.0541749 
		-8.3342641e-008 -1.3673328 2.1508067 -4.1671321e-008 -1.3225079 2.2725704 -8.3342641e-008 
		-1.3070625 2.4075458 0 -1.3225079 2.5425224 0 -1.3673329 2.6642821 8.3342641e-008 
		-1.4371532 2.7609167 4.1671321e-008 -1.5251276 2.8229563 4.1671321e-008 -1.6226488 
		2.8443341 -8.3342641e-008 -1.7201713 2.8229563 8.3342641e-008 -1.8081462 2.7609167 
		8.3342641e-008 -1.8779676 2.6642821 -4.1671321e-008 -1.9227911 2.5425224 -4.1671321e-008 
		-1.9382365 2.4075458 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowInner_R" -p "_R";
	rename -uid "580B56BC-4FBF-33C0-9C62-C69885C8EBB5";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowInner_RShape" -p "EyeBrowInner_R";
	rename -uid "9DF1611D-4BEF-BB93-0ED0-AE98DD9DDD2E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.6607033 2.386487 0 -0.60048747 
		2.2683063 -1.0107505e-007 -0.50669819 2.1745172 5.0537523e-008 -0.3885166 2.114301 
		5.0537523e-008 -0.25751138 2.0935514 0 -0.12650689 2.114301 0 -0.0083261579 2.1745174 
		-1.0107505e-007 0.085462645 2.2683063 -5.0537523e-008 0.14567861 2.386487 -1.0107505e-007 
		0.16642785 2.5174911 0 0.14567861 2.6484962 0 0.085462585 2.7666762 1.0107505e-007 
		-0.0083262771 2.8604658 5.0537523e-008 -0.12650695 2.9206812 5.0537523e-008 -0.25751138 
		2.9414308 -1.0107505e-007 -0.38851649 2.9206812 1.0107505e-007 -0.50669807 2.8604658 
		1.0107505e-007 -0.60048723 2.7666762 -5.0537523e-008 -0.66070306 2.6484962 -5.0537523e-008 
		-0.68145216 2.5174911 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowMid1_R" -p "_R";
	rename -uid "8D0B60FF-4D73-8EF7-46A0-E1951AA0C69D";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowMid1_RShape" -p "EyeBrowMid1_R";
	rename -uid "F5E4D894-4FDC-458D-6E2D-BC891DC746AF";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.88801086 2.4280729 0 -0.82779503 
		2.3098922 -1.0107505e-007 -0.73400575 2.2161031 5.0537523e-008 -0.61582416 2.1558869 
		5.0537523e-008 -0.48481917 2.1351373 0 -0.3538146 2.1558869 0 -0.23563388 2.2161033 
		-1.0107505e-007 -0.14184508 2.3098922 -5.0537523e-008 -0.081629097 2.4280729 -1.0107505e-007 
		-0.060879856 2.559077 0 -0.081629097 2.6900821 0 -0.14184514 2.8082621 1.0107505e-007 
		-0.235634 2.9020517 5.0537523e-008 -0.35381466 2.9622672 5.0537523e-008 -0.48481917 
		2.9830167 -1.0107505e-007 -0.61582404 2.9622672 1.0107505e-007 -0.73400563 2.9020517 
		1.0107505e-007 -0.82779479 2.8082621 -5.0537523e-008 -0.88801062 2.6900821 -5.0537523e-008 
		-0.90875971 2.559077 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowMid2_R" -p "_R";
	rename -uid "5C46AF9C-453F-D5D6-C469-B79595B5CC50";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowMid2_RShape" -p "EyeBrowMid2_R";
	rename -uid "286FADD9-4190-0FBB-40F8-A1A8AC711F47";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.0585699 2.4188538 0 -0.99835408 
		2.300673 -1.0107505e-007 -0.9045648 2.2068839 5.0537523e-008 -0.78638321 2.1466677 
		5.0537523e-008 -0.65537822 2.1259181 0 -0.52437365 2.1466677 0 -0.40619293 2.2068841 
		-1.0107505e-007 -0.31240413 2.300673 -5.0537523e-008 -0.25218815 2.4188538 -1.0107505e-007 
		-0.23143891 2.5498579 0 -0.25218815 2.6808629 0 -0.31240419 2.7990429 1.0107505e-007 
		-0.40619305 2.8928325 5.0537523e-008 -0.52437371 2.953048 5.0537523e-008 -0.65537822 
		2.9737976 -1.0107505e-007 -0.78638309 2.953048 1.0107505e-007 -0.90456468 2.8928325 
		1.0107505e-007 -0.99835384 2.7990429 -5.0537523e-008 -1.0585697 2.6808629 -5.0537523e-008 
		-1.0793188 2.5498579 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowMid3_R" -p "_R";
	rename -uid "FD38133B-4AF6-3C08-DCBA-0FB6550CC13F";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowMid3_RShape" -p "EyeBrowMid3_R";
	rename -uid "CCCB59C5-48C1-FF4F-1184-419D7FF66607";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.229129 2.3773675 0 -1.1689131 
		2.2591867 -1.0107505e-007 -1.0751238 2.1653976 5.0537523e-008 -0.9569422 2.1051815 
		5.0537523e-008 -0.82593727 2.0844319 0 -0.6949327 2.1051815 0 -0.57675195 2.1653979 
		-1.0107505e-007 -0.48296314 2.2591867 -5.0537523e-008 -0.42274719 2.3773675 -1.0107505e-007 
		-0.40199795 2.5083716 0 -0.42274719 2.6393766 0 -0.4829632 2.7575567 1.0107505e-007 
		-0.57675207 2.8513463 5.0537523e-008 -0.69493276 2.9115617 5.0537523e-008 -0.82593727 
		2.9323113 -1.0107505e-007 -0.95694208 2.9115617 1.0107505e-007 -1.0751237 2.8513463 
		1.0107505e-007 -1.1689129 2.7575567 -5.0537523e-008 -1.2291287 2.6393766 -5.0537523e-008 
		-1.2498778 2.5083716 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowOuter_R" -p "_R";
	rename -uid "51CF3B80-4151-CFBA-CE79-AFB3F35D5026";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowOuter_RShape" -p "EyeBrowOuter_R";
	rename -uid "493816B9-4A85-6B95-08AD-15A21AEAA158";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.3582007 2.2713468 0 -1.2979848 
		2.1531661 -1.0107505e-007 -1.2041955 2.059377 5.0537523e-008 -1.0860139 1.9991602 
		5.0537523e-008 -0.95500898 1.9784104 0 -0.82400441 1.9991602 0 -0.70582366 2.0593772 
		-1.0107505e-007 -0.61203486 2.1531661 -5.0537523e-008 -0.55181891 2.2713468 -1.0107505e-007 
		-0.53106964 2.4023509 0 -0.55181891 2.533356 0 -0.61203492 2.651536 1.0107505e-007 
		-0.70582378 2.7453256 5.0537523e-008 -0.82400447 2.805541 5.0537523e-008 -0.95500898 
		2.8262906 -1.0107505e-007 -1.0860138 2.805541 1.0107505e-007 -1.2041954 2.7453256 
		1.0107505e-007 -1.2979846 2.651536 -5.0537523e-008 -1.3582004 2.533356 -5.0537523e-008 
		-1.3789495 2.4023509 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Nostril_R" -p "_R";
	rename -uid "ACA1B86B-467E-862B-A636-16BA8F9623A7";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Nostril_RShape" -p "Nostril_R";
	rename -uid "B3C1AB2E-4E72-7553-EB0D-B7A75AAC3628";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.57432669 1.3218632 0 -0.51077837 
		1.1971425 -1.0666771e-007 -0.41180015 1.0981641 5.3333856e-008 -0.28708041 1.034616 
		5.3333856e-008 -0.14882688 1.012719 0 -0.010573717 1.034616 0 0.11414663 1.0981642 
		-1.0666771e-007 0.2131252 1.1971426 -5.3333856e-008 0.2766732 1.3218632 -1.0666771e-007 
		0.29857031 1.4601164 0 0.2766732 1.5983698 0 0.21312514 1.7230889 1.0666771e-007 
		0.11414651 1.822069 5.3333856e-008 -0.010573717 1.8856162 5.3333856e-008 -0.14882688 
		1.9075135 -1.0666771e-007 -0.28708029 1.8856162 1.0666771e-007 -0.41180003 1.822069 
		1.0666771e-007 -0.51077813 1.7230889 -5.3333856e-008 -0.57432634 1.5983698 -5.3333856e-008 
		-0.59622335 1.4601164 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "NoseSide_R" -p "_R";
	rename -uid "32E07385-40C1-7115-BDDD-58B91DCAD7FE";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "NoseSide_RShape" -p "NoseSide_R";
	rename -uid "9E285882-40B2-388D-37D4-2CAF5F89E05B";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.61048591 1.5198743 0 -0.54693758 
		1.3951536 -1.0666771e-007 -0.44795889 1.2961752 5.3333856e-008 -0.32323915 1.2326272 
		5.3333856e-008 -0.18498594 1.2107302 0 -0.046732813 1.2326272 0 0.077987559 1.2961754 
		-1.0666771e-007 0.17696612 1.3951538 -5.3333856e-008 0.24051411 1.5198743 -1.0666771e-007 
		0.2624113 1.6581275 0 0.24051411 1.796381 0 0.17696606 1.9211 1.0666771e-007 0.07798744 
		2.0200813 5.3333856e-008 -0.046732813 2.0836294 5.3333856e-008 -0.18498594 2.1055269 
		-1.0666771e-007 -0.32323903 2.0836294 1.0666771e-007 -0.44795877 2.0200813 1.0666771e-007 
		-0.54693735 1.9211 -5.3333856e-008 -0.61048555 1.796381 -5.3333856e-008 -0.63238257 
		1.6581275 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "cornerLip_R" -p "_R";
	rename -uid "441F5C12-46C6-3772-394E-BAB123B069B7";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "cornerLip_RShape" -p "cornerLip_R";
	rename -uid "6E1801ED-4263-9A90-7A3B-3791B5CBF024";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.88812298 0.81333417 -0.1193822 
		-0.82140392 0.68238801 -0.11938232 -0.71748519 0.57846981 -0.11938216 -0.58653992 
		0.51174974 -0.11938216 -0.44138578 0.48875982 -0.1193822 -0.29623199 0.5117498 -0.1193822 
		-0.16528678 0.57846993 -0.11938232 -0.06136813 0.68238813 -0.11938226 0.0053515863 
		0.81333417 -0.11938232 0.028341468 0.95848709 -0.1193822 0.0053515863 1.1036435 -0.1193822 
		-0.06136819 1.234587 -0.1193821 -0.1652869 1.3385059 -0.11938216 -0.29623201 1.4051785 
		-0.11938216 -0.44138584 1.4280286 -0.11938232 -0.5865398 1.4051785 -0.1193821 -0.71748507 
		1.3385059 -0.1193821 -0.82140368 1.234587 -0.11938226 -0.88812262 1.1036435 -0.11938226 
		-0.91111356 0.95848709 -0.1193822;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLipB_R" -p "_R";
	rename -uid "5A7291B1-41DA-1ABF-9325-C38A4764EC1D";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLipB_RShape" -p "upperLipB_R";
	rename -uid "82DDACDF-45F8-221A-34BC-6AB6C7DD965F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.6602096 0.84914482 0.038265921 
		-0.59476119 0.72069204 0.038265802 -0.49282116 0.61875266 0.03826597 -0.3643696 0.55330247 
		0.03826597 -0.22198018 0.5307501 0.038265921 -0.079590559 0.55330253 0.038265921 
		0.048861168 0.61875278 0.038265802 0.15080097 0.72069216 0.038265862 0.21625027 0.84914482 
		0.038265802 0.23880237 0.9915334 0.038265921 0.21625027 1.1339258 0.038265921 0.15080091 
		1.2623752 0.038266029 0.048861049 1.3643152 0.03826597 -0.079590604 1.4297035 0.03826597 
		-0.22198024 1.4520746 0.038265802 -0.36436948 1.4297035 0.038266029 -0.49282104 1.3643152 
		0.038266029 -0.59476095 1.2623752 0.038265862 -0.66020924 1.1339258 0.038265862 -0.6827625 
		0.9915334 0.038265921;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLipC_R" -p "_R";
	rename -uid "2A8141A9-4654-B006-EA58-E2BB75EB30A6";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLipC_RShape" -p "upperLipC_R";
	rename -uid "43B3B422-4396-9FAE-CE59-7E8EBE943A74";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.80455083 0.8489297 0.038265921 
		-0.73804355 0.71839905 0.038265802 -0.63445455 0.61481053 0.03826597 -0.50392556 
		0.54830182 0.03826597 -0.35923254 0.52538478 0.038265921 -0.21453913 0.54830188 0.038265921 
		-0.084009513 0.61481065 0.038265802 0.01957937 0.71839917 0.038265862 0.086087495 
		0.8489297 0.038265802 0.10900445 0.99362183 0.038265921 0.086087495 1.1383173 0.038265921 
		0.01957931 1.2688451 0.038266029 -0.084009632 1.3724343 0.03826597 -0.21453917 1.4388928 
		0.03826597 -0.3592326 1.461663 0.038265802 -0.50392544 1.4388928 0.038266029 -0.63445443 
		1.3724343 0.038266029 -0.73804331 1.2688451 0.038265862 -0.80455047 1.1383173 0.038265862 
		-0.82746851 0.99362183 0.038265921;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLipB_R" -p "_R";
	rename -uid "7BB4AAE7-44BE-6B69-15C6-07A6F958D193";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLipB_RShape" -p "lowerLipB_R";
	rename -uid "AC4CFE90-43BA-CEEA-08C6-DAB3323ABD00";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.66963279 0.68530488 0.080578595 
		-0.60418439 0.55685222 0.080578491 -0.50224501 0.45491326 0.080578655 -0.37379292 
		0.38946444 0.080578655 -0.23140289 0.36691231 0.080578595 -0.08901348 0.3894645 0.080578595 
		0.039438367 0.45491338 0.080578491 0.14137812 0.55685234 0.080578536 0.20682706 0.68530488 
		0.080578491 0.22937915 0.82769448 0.080578595 0.20682706 0.97008353 0.080578595 0.14137806 
		1.0985372 0.0805787 0.039438248 1.2004782 0.080578655 -0.089013539 1.2659268 0.080578655 
		-0.23140286 1.2884786 0.080578491 -0.3737928 1.2659268 0.0805787 -0.50224489 1.2004782 
		0.0805787 -0.60418415 1.0985372 0.080578536 -0.66963243 0.97008353 0.080578536 -0.6921857 
		0.82769448 0.080578595;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLipC_R" -p "_R";
	rename -uid "64EE5E48-45EB-440B-2DC7-7086B9B6BEF0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLipC_RShape" -p "lowerLipC_R";
	rename -uid "A498EA11-48BC-4B30-E5E3-CCB8610417F9";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.81820828 0.73578709 0.080578595 
		-0.75169921 0.60525328 0.080578491 -0.64810789 0.50166303 0.080578655 -0.51757514 
		0.43515375 0.080578655 -0.37287849 0.41223624 0.080578595 -0.22818178 0.43515381 
		0.080578595 -0.097648807 0.50166315 0.080578491 0.0059425607 0.6052534 0.080578536 
		0.072451986 0.73578709 0.080578491 0.095369495 0.88048369 0.080578595 0.072451986 
		1.0251803 0.080578595 0.0059425011 1.1557144 0.0805787 -0.097648926 1.2593068 0.080578655 
		-0.22818182 1.3258158 0.080578655 -0.37287846 1.3487329 0.080578491 -0.51757503 1.3258158 
		0.0805787 -0.64810777 1.2593068 0.0805787 -0.75169897 1.1557144 0.080578536 -0.81820792 
		1.0251803 0.080578536 -0.84112626 0.88048369 0.080578595;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "SmilePull_R" -p "_R";
	rename -uid "B1A93176-48F0-16AC-61AE-F89F29E088D9";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "SmilePull_RShape" -p "SmilePull_R";
	rename -uid "0C3A9F2F-40AA-BAFA-34C6-BF91E147DF5C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.0528486 0.886024 0 -0.95716769 
		0.80505335 -8.7060315e-008 -0.81975925 0.74079424 4.3530161e-008 -0.66567898 0.69953752 
		4.3530161e-008 -0.51542377 0.68532318 0 -0.38199589 0.6995374 0 -0.27313876 0.74079436 
		-8.7060315e-008 -0.19481386 0.80505347 -4.3530161e-008 -0.1487353 0.886024 -8.7060315e-008 
		-0.13349582 0.97578025 0 -0.1487353 1.0655397 0 -0.19481392 1.14651 8.7060315e-008 
		-0.27313888 1.2107675 4.3530161e-008 -0.3819955 1.2520212 4.3530161e-008 -0.51542377 
		1.266238 -8.7060315e-008 -0.66567886 1.2520248 8.7060315e-008 -0.81975937 1.2107679 
		8.7060315e-008 -0.95716745 1.1465106 -4.3530161e-008 -1.0528481 1.0655409 -4.3530161e-008 
		-1.0872103 0.97578025 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "SmileBulge_R" -p "_R";
	rename -uid "565709ED-4E70-764D-CCF5-428C63322CDE";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "SmileBulge_RShape" -p "SmileBulge_R";
	rename -uid "DEEF0423-45CC-3804-CE2C-F287EFD24063";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.95745897 1.1478119 0 -0.85993218 
		1.0299532 -1.01658e-007 -0.7280637 0.93624806 5.0829001e-008 -0.57736844 0.87797976 
		5.0829001e-008 -0.42425048 0.86217743 0 -0.28381962 0.89050508 0 -0.16867323 0.95924008 
		-1.01658e-007 -0.088248521 1.0601829 -5.0829001e-008 -0.048628561 1.1820033 -1.01658e-007 
		-0.052448623 1.3117545 0 -0.098879546 1.4363899 0 -0.18382961 1.5440568 1.01658e-007 
		-0.30022934 1.6252369 5.0829001e-008 -0.43847269 1.6734308 5.0829001e-008 -0.58686125 
		1.6853957 -1.01658e-007 -0.73202163 1.6609057 1.01658e-007 -0.8596189 1.6022455 1.01658e-007 
		-0.95551306 1.5138274 -5.0829001e-008 -1.0077084 1.4021995 -5.0829001e-008 -1.0087205 
		1.276348 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "FrownBulge_R" -p "_R";
	rename -uid "0F496E9F-4F6E-C969-99DF-EA8F42785738";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "FrownBulge_RShape" -p "FrownBulge_R";
	rename -uid "BE7DFCCA-4FEC-EBD3-A58E-E19E57873F94";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.0114456 0.49593407 0 -0.96708673 
		0.3741973 -1.01658e-007 -0.87750775 0.27780461 5.0829001e-008 -0.7529704 0.21356551 
		5.0829001e-008 -0.60660046 0.18610729 0 -0.45281225 0.19799036 0 -0.30598336 0.24921329 
		-1.01658e-007 -0.17944939 0.33660561 -5.0829001e-008 -0.084571183 0.45341563 -1.01658e-007 
		-0.029909385 0.58946246 0 -0.020576112 0.73188376 0 -0.057725418 0.86628431 1.01658e-007 
		-0.13844503 0.97825426 5.0829001e-008 -0.25585955 1.0550293 5.0829001e-008 -0.39951345 
		1.0872514 -1.01658e-007 -0.55601788 1.0706044 1.01658e-007 -0.70996928 1.0068461 
		1.01658e-007 -0.84536254 0.90387607 -5.0829001e-008 -0.94745094 0.77440351 -5.0829001e-008 
		-1.0048677 0.63349295 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "CheekBone_R" -p "_R";
	rename -uid "D988A5D6-46B2-BD18-E967-2CB6174AF2CB";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "CheekBone_RShape" -p "CheekBone_R";
	rename -uid "F8D9919B-4001-03F5-339A-34B03F79DEFA";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.3166271 1.4341868 0 -1.252702 
		1.3087273 -1.0729978e-007 -1.1531376 1.2091625 5.3649892e-008 -1.027679 1.1452377 
		5.3649892e-008 -0.88860542 1.1232108 0 -0.74953258 1.1452378 0 -0.62407351 1.2091626 
		-1.0729978e-007 -0.52450794 1.3087274 -5.3649892e-008 -0.46058327 1.4341868 -1.0729978e-007 
		-0.43855646 1.5732591 0 -0.46058327 1.712332 0 -0.52450806 1.8377898 1.0729978e-007 
		-0.62407362 1.9373558 5.3649892e-008 -0.74953258 2.0012805 5.3649892e-008 -0.88860542 
		2.0233076 -1.0729978e-007 -1.0276788 2.0012805 1.0729978e-007 -1.1531374 1.9373558 
		1.0729978e-007 -1.2527018 1.8377898 -5.3649892e-008 -1.3166268 1.712332 -5.3649892e-008 
		-1.3386536 1.5732591 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "FaceControlSet" -p "Group";
	rename -uid "6BCA7233-4290-947A-56E4-BD8D0D42429F";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "FaceControlSetShape" -p "FaceControlSet";
	rename -uid "2C6FE153-4132-13F5-53FF-6FB291472CCA";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 24 ".uvst[0].uvsp[0:23]" -type "float2" 0 0 1 0 0 1 1 1 0.5
		 0 1 0.5 0.5 1 0 0.5 0.75 0.25 0.75 0.75 0.25 0.75 0.25 0.25 0.75 0 1 0.25 0.75 0.5
		 0.5 0.25 1 0.75 0.75 1 0.5 0.75 0.25 1 0 0.75 0.25 0.5 0 0.25 0.25 0;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 24 ".pt[0:23]" -type "float3"  -8.347209 -12.849133 0 -9.3701382 
		-12.849133 0 -8.347209 -13.399166 0 -9.3701382 -13.399166 0 -8.8586731 -12.849133 
		0 -8.347209 -13.124149 0 -9.3701382 -13.124149 0 -8.8586731 -13.399166 0 -8.6029367 
		-12.849133 0 -9.1144094 -12.849133 0 -8.347209 -12.986645 0 -8.347209 -13.261654 
		0 -9.3701382 -12.986645 0 -9.3701382 -13.261654 0 -8.6029367 -13.399166 0 -9.1144094 
		-13.399166 0 -8.8586731 -13.047514 0 -9.0011873 -13.124149 0 -8.8586731 -13.200785 
		0 -8.7161579 -13.124149 0 -9.0011873 -13.047514 0 -9.0011873 -13.200785 0 -8.7161579 
		-13.200785 0 -8.7161579 -13.047514 0;
	setAttr -s 24 ".vt[0:23]"  6.24173403 16.023008347 0 7.78043699 16.023008347 0
		 6.24173403 16.85037613 0 7.78043699 16.85037613 0 7.01108551 16.023008347 0 6.24173403 16.43669128 0
		 7.78043699 16.43669128 0 7.01108551 16.85037613 0 6.62640953 16.023008347 0 7.39576149 16.023008347 0
		 6.24173403 16.22985077 0 6.24173403 16.64353371 0 7.78043699 16.22985077 0 7.78043699 16.64353371 0
		 6.62640953 16.85037613 0 7.39576149 16.85037613 0 7.01108551 16.22985077 0 7.39576149 16.43669128 0
		 7.01108551 16.64353371 0 6.62640953 16.43669128 0 7.39576149 16.22985077 0 7.39576149 16.64353371 0
		 6.62640953 16.64353371 0 6.62640953 16.22985077 0;
	setAttr -s 24 ".ed[0:23]"  0 8 0 8 4 0 4 9 0 9 1 0 0 10 0 10 5 0 5 11 0
		 11 2 0 1 12 0 12 6 0 6 13 0 13 3 0 2 14 0 14 7 0 7 15 0 15 3 0 20 17 0 20 16 0 21 18 0
		 21 17 0 22 19 0 22 18 0 23 16 0 23 19 0;
	setAttr -ch 24 ".fc[0]" -type "polyFaces" 
		f 16 -5 0 1 2 3 8 9 10 11 -16 -15 -14 -13 -8 -7 -6
		mu 0 16 22 0 23 4 12 1 13 5 16 3 17 6 19 2 20 7
		h 8 23 -21 21 -19 19 -17 17 -23
		mu 0 8 11 21 10 18 9 14 8 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode mesh -n "FaceControlSetShape1" -p "FaceControlSet";
	rename -uid "E9B078FE-453E-8AB1-639D-6984AFFCEAFC";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 71 ".uvst[0].uvsp[0:70]" -type "float2" 0.33462143 0.34615386
		 0.72335684 0.34615386 0.71010482 0.03846154 0.81558239 0.09655986 0.71010482 1.7388937e-016
		 1 0 1 0.03846154 0.52346754 1 0.48757574 1 0 0.03846154 4.7932387e-016 1.7388937e-016
		 0.33572578 0 0.33572578 0.03846154 0.2429505 0.094040036 0.35008273 0.38461539 0.52788502
		 0.82151461 0.70734388 0.38461539 0.5 0.34615386 0.5 1 0.5 0.75299501 0.5 0.38461539
		 0.24260014 0.40000001 0.35634372 0.40000001 0.16666667 0.21402195 0.16666667 1.7388937e-016
		 0.16094162 0.2 0.11206216 0.1 0.083333336 0.066434026 0.083333336 1.7388937e-016
		 0.27555373 0.2 0.29263273 0 0.29263273 0.04355292 0.24322329 0.1 0.22964969 0 0.27261174
		 0.050000001 0.26114121 0 0.26114121 0.057119831 0.2469359 0.075000003 0.24539545
		 0.078833051 0.29263273 0.24225935 0.32425869 0.60000002 0.43773651 0.60000002 0.29263273
		 0.52254099 0.4059172 0.80000001 0.7710489 0.40000001 0.70102459 0.40000001 0.66666669
		 0.34615386 0.66666669 0.38461539 0.78314751 0.2 0.85342836 0.2 0.83333331 1.7388937e-016
		 0.81547934 0.1 0.75 0.043046046 0.75 1.7388937e-016 0.7782504 0.050000001 0.79166669
		 1.7388937e-016 0.79166669 0.056183636 0.80989784 0.075000003 0.8125 0.080301881 0.9012714
		 0.1 0.91666669 0 0.91666669 0.077522434 0.83333331 0.24905701 0.68852174 0.60000002
		 0.61887342 0.60000002 0.66666669 0.60000002 0.66666669 0.48364562 0.66666669 0.65296465
		 0.60599464 0.80000001 0.51912934 0.80000001 0.5367223 0.80000001;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 71 ".pt[0:70]" -type "float3"  -3.8013997 2.3706679 0 -2.7980347 
		2.3706679 0 -2.8322406 3.1003888 0 -2.5600231 2.9625998 0 -2.8322406 3.1916051 0 
		-2.0839946 3.1916051 0 -2.0839946 3.1003888 0 -3.3139703 0.8200174 0 -3.4066081 0.8200174 
		0 -4.6650863 3.1003888 0 -4.6650863 3.1916051 0 -3.7985492 3.1916051 0 -3.7985492 
		3.1003888 0 -4.0380106 2.9685826 0 -3.7614923 2.2794583 0 -3.3025696 1.2433113 0 
		-2.8393672 2.2794583 0 -3.3745413 2.3706679 0 -3.3745413 0.8200174 0 -3.3745413 1.4058115 
		0 -3.3745413 2.2794583 0 -4.0389147 2.2429717 0 -3.7453303 2.2429717 0 -4.2348776 
		2.6840446 0 -4.2349081 3.1916051 0 -4.2496414 2.7173004 0 -4.375844 2.9544437 0 -4.449966 
		3.0340943 0 -4.4499969 3.1916051 0 -3.9538569 2.7172859 0 -3.9097738 3.1916051 0 
		-3.9097748 3.0883172 0 -4.0373049 2.9544437 0 -4.0723405 3.1916051 0 -3.9614592 3.0730357 
		0 -3.9910579 3.1916051 0 -3.9910612 3.0561414 0 -4.0277276 3.013737 0 -4.0317049 
		3.0046504 0 -3.9097738 2.6170659 0 -3.8281446 1.7686508 0 -3.5352488 1.7686508 0 
		-3.9097738 1.9523575 0 -3.6173782 1.2943373 0 -2.6749351 2.2429717 0 -2.8556767 2.2429717 
		0 -2.9443576 2.3706679 0 -2.9443576 2.2794583 0 -2.6437125 2.7172852 0 -2.4623075 
		2.7172842 0 -2.5141757 3.1916051 0 -2.5602491 2.9544432 0 -2.7292662 3.0895157 0 
		-2.7292662 3.1916051 0 -2.6563494 3.0730226 0 -2.6217227 3.1916051 0 -2.6217289 3.0583479 
		0 -2.5746646 3.0137351 0 -2.567945 3.0011604 0 -2.3388216 2.9544442 0 -2.2990854 
		3.1916051 0 -2.2990808 3.0077431 0 -2.5141757 2.6009462 0 -2.8879492 1.7686508 0 
		-3.0677185 1.7686508 0 -2.9443576 1.7686508 0 -2.9443576 2.0445948 0 -2.9443576 1.6430464 
		0 -3.1009598 1.2943373 0 -3.3251655 1.2943373 0 -3.2797582 1.2943373 0;
	setAttr -s 71 ".vt[0:70]"  1.89687645 0.89999998 0 0.79687649 0.89999998 0
		 0.8343755 0.1 0 0.53593755 0.25105575 0 0.8343755 2.3006773e-016 0 0.014062715 -2.220446e-016 0
		 0.014062715 0.1 0 1.36250091 2.5999999 0 1.46406353 2.5999999 0 2.84375072 0.1 0
		 2.84375072 2.3006773e-016 0 1.89375138 -2.220446e-016 0 1.89375138 0.1 0 2.15627623 0.24450409 0
		 1.85312581 1 0 1.35000074 2.13593817 0 0.84218812 1 0 1.42890668 0.89999998 0 1.42890668 2.5999999 0
		 1.42890668 1.95778704 0 1.42890668 1 0 2.15726805 1.039999962 0 1.83540916 1.039999962 0
		 2.37210536 0.55644351 0 2.37213612 1.1339582e-016 0 2.38829112 0.51997995 0 2.52664971 0.26000002 0
		 2.6079092 0.17268196 0 2.6079433 2.787425e-016 0 2.064018488 0.51999956 0 2.01569128 -1.3654105e-016 0
		 2.015692234 0.11323308 0 2.15550542 0.26000008 0 2.1939137 -1.1572617e-017 0 2.072351456 0.12998366 0
		 2.10480261 -7.4056832e-017 0 2.10480618 0.14850663 0 2.1450038 0.19499768 0 2.1493628 0.20496418 0
		 2.01569128 0.62987429 0 1.92619979 1.55999994 0 1.60509288 1.55999994 0 2.01569128 1.35860658 0
		 1.69513166 2.079999924 0 0.66192293 1.039999962 0 0.86006987 1.039999962 0 0.95729202 0.89999998 0
		 0.95729202 1 0 0.62768883 0.51999944 0 0.42881462 0.52000004 0 0.48567736 -9.4386608e-017 0
		 0.53619075 0.26000047 0 0.72148472 0.11191971 0 0.72148472 -3.055761e-017 0 0.64154387 0.12999681 0
		 0.60358101 -6.2472108e-017 0 0.60358721 0.14608827 0 0.5519923 0.19499981 0 0.54462612 0.20878351 0
		 0.29343459 0.25999945 0 0.24987005 -1.582156e-016 0 0.24986552 0.2015622 0 0.48567736 0.6475482 0
		 0.89544892 1.55999994 0 1.092531919 1.55999994 0 0.95729202 1.55999994 0 0.95729202 1.25747859 0
		 0.95729202 1.69770801 0 1.12897491 2.079999924 0 1.3747766 2.079999924 0 1.32499409 2.079999924 0;
	setAttr -s 72 ".ed[0:71]"  63 67 0 18 8 0 8 43 0 0 17 0 20 14 0 14 22 0
		 39 0 0 23 25 0 25 26 0 26 27 0 28 24 0 27 9 0 9 10 0 10 28 0 30 11 0 11 12 0 12 31 0
		 32 29 0 34 36 0 24 33 0 35 30 0 31 34 0 33 35 0 37 38 0 36 37 0 38 13 0 13 32 0 21 23 0
		 29 39 0 40 42 0 22 41 0 42 21 0 43 40 0 41 19 0 49 62 0 17 46 0 47 20 0 59 49 0 48 51 0
		 51 3 0 3 58 0 52 2 0 2 4 0 4 53 0 55 50 0 54 52 0 53 55 0 56 54 0 57 56 0 58 57 0
		 60 5 0 5 6 0 6 61 0 50 60 0 61 59 0 46 1 0 1 48 0 62 44 0 45 16 0 16 47 0 44 63 0
		 65 66 1 66 45 0 65 64 1 64 66 0 68 7 0 7 18 0 69 15 0 15 70 0 67 68 0 70 64 0 19 69 0;
	setAttr -s 2 -ch 74 ".fc[0:1]" -type "polyFaces" 
		f 57 65 66 1 2 32 29 31 27 7 8 9 11 12 13 10 19 22 20 14 15 16 21 18 24 23 25 26 17
		 28 6 3 35 55 56 38 39 40 49 48 47 45 41 42 43 46 44 53 50 51 52 54 37 34 57 60 0
		 69
		mu 0 57 68 7 18 8 43 40 42 21 23 25 26 27 9 10 28 24 33 35 30 11 12 31 34 36 37 38 13 32
		 29 39 0 17 46 1 48 51 3 58 57 56 54 52 2 4 53 55 50 60 5 6 61 59 49 62 44 63 67
		h 14 58 59 36 4 5 30 33 71 67 68 70 -64 61 62
		mu 0 14 45 16 47 20 14 22 41 19 69 15 70 64 65 66
		f 3 63 64 -62
		mu 0 3 65 64 66;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode mesh -n "FaceControlSetShape2" -p "FaceControlSet";
	rename -uid "9E8A4542-4478-3609-0D21-FB881DCA7B36";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 38 ".uvst[0].uvsp[0:37]" -type "float2" 0.57291692 1 0 0.92592591
		 0.036458891 0.8888889 3.3306691e-016 0.037037037 0.33333334 0.72916669 0.18230793
		 0.89988434 0.33333334 0.18171297 0.33343887 0.15794964 3.3306691e-016 0 1 0 1 0.037037037
		 0.66666669 1 0.66659522 0.1656045 0.33333334 0.5 0.66666669 0.5 0.33333334 0.25 0.66666669
		 0.25 0.3316811 0.125 0.66803724 0.125 0.5 0 0.27925631 0.0625 0.25 0.052893657 0.25
		 0 0.71783233 0.0625 0.75 0 0.75 0.052744735 0.33333334 0.375 0.66666669 0.375 0.3332682
		 0.75 0.66666669 0.75 0.33333334 0.625 0.66666669 0.625 0.30348349 0.875 0.66666669
		 0.875 0.5 0.99057233 0.089518271 0.9375 0.25 0.89505881 0.25 0.95824915;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 38 ".pt[0:37]" -type "float3"  -5.1867218 0.72880328 0 -4.7164006 
		0.91123736 0 -4.7463222 1.0024513 0 -4.7164006 3.1003888 0 -4.9900451 1.395811 0 
		-4.8660583 0.97537667 0 -4.9900408 2.7440801 0 -4.9901271 2.8026066 0 -4.7164006 
		3.1916051 0 -5.5373302 3.1916051 0 -5.5373302 3.1003888 0 -5.2636833 0.72880328 0 
		-5.2636228 2.7837517 0 -4.9900408 1.9602047 0 -5.2636833 1.9602047 0 -4.9900408 2.5759082 
		0 -5.2636833 2.5759082 0 -4.9886556 2.8837492 0 -5.2648201 2.8837492 0 -5.1268635 
		3.1916051 0 -4.9456439 3.037679 0 -4.9216399 3.0613482 0 -4.921629 3.1916051 0 -5.3056908 
		3.0376773 0 -5.3320961 3.1916051 0 -5.3321052 3.0616872 0 -4.9900408 2.2680502 0 
		-5.2636833 2.2680502 0 -4.9899955 1.3445014 0 -5.2636833 1.3445014 0 -4.9900408 1.6523585 
		0 -5.2636833 1.6523585 0 -4.9655523 1.036648 0 -5.2636833 1.0366569 0 -5.1268635 
		0.75202715 0 -4.7898841 0.88272887 0 -4.9216475 0.98721743 0 -4.921629 0.83163053 
		0;
	setAttr -s 38 ".vt[0:37]"  3.41562533 2.70000005 0 2.9000001 2.5 0 2.93281293 2.4000001 0
		 2.9000001 0.1 0 3.20000434 1.96875 0 3.064077139 2.42968416 0 3.20000005 0.49062499 0
		 3.2000947 0.42646405 0 2.9000001 0 0 3.79999995 0 0 3.79999995 0.1 0 3.5 2.70000005 0
		 3.49992967 0.44713214 0 3.20000005 1.35000002 0 3.5 1.35000002 0 3.20000005 0.67500001 0
		 3.5 0.67500001 0 3.19848204 0.33750156 0 3.50124693 0.33750057 0 3.3499999 0 0 3.15132999 0.1687506 0
		 3.12501121 0.14279857 0 3.125 0 0 3.5460515 0.16875204 0 3.57500005 0 0 3.57501173 0.14242697 0
		 3.20000005 1.012500048 0 3.5 1.012500048 0 3.19995165 2.025000095 0 3.5 2.025000095 0
		 3.20000005 1.6875 0 3.5 1.6875 0 3.17315412 2.3625083 0 3.5 2.36249995 0 3.3499999 2.67454529 0
		 2.9805665 2.53125 0 3.12502098 2.4167006 0 3.125 2.58727264 0;
	setAttr -s 38 ".ed[0:37]"  0 34 0 33 11 0 11 0 0 27 14 0 18 12 0 12 16 0
		 23 18 0 17 20 0 20 21 0 22 19 0 21 3 0 3 8 0 8 22 0 24 9 0 9 10 0 10 25 0 19 24 0
		 25 23 0 15 6 0 6 7 0 7 17 0 16 27 0 26 15 0 13 26 0 31 29 0 14 31 0 30 13 0 28 4 0
		 4 30 0 29 33 0 32 28 0 34 37 0 36 32 0 35 1 0 1 2 0 2 5 0 5 36 0 37 35 0;
	setAttr -ch 38 ".fc[0]" -type "polyFaces" 
		f 38 32 30 27 28 26 23 22 18 19 20 7 8 10 11 12 9 16 13 14 15 17 6 4 5 21 3 25 24 29
		 1 2 0 31 37 33 34 35 36
		mu 0 38 36 32 28 4 30 13 26 15 6 7 17 20 21 3 8 22 19 24 9 10 25 23 18 12 16 27 14 31 29
		 33 11 0 34 37 35 1 2 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode mesh -n "FaceControlSetShape3" -p "FaceControlSet";
	rename -uid "37740CF2-4164-172C-1FEC-D3B0E65BA8B7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 38 ".uvst[0].uvsp[0:37]" -type "float2" 0.57291692 1 0 0.92592591
		 0.036458891 0.8888889 3.3306691e-016 0.037037037 0.33333334 0.72916669 0.18230793
		 0.89988434 0.33333334 0.18171297 0.33343887 0.15794964 3.3306691e-016 0 1 0 1 0.037037037
		 0.66666669 1 0.66659522 0.1656045 0.33333334 0.5 0.66666669 0.5 0.33333334 0.25 0.66666669
		 0.25 0.3316811 0.125 0.66803724 0.125 0.5 0 0.27925631 0.0625 0.25 0.052893657 0.25
		 0 0.71783233 0.0625 0.75 0 0.75 0.052744735 0.33333334 0.375 0.66666669 0.375 0.3332682
		 0.75 0.66666669 0.75 0.33333334 0.625 0.66666669 0.625 0.30348349 0.875 0.66666669
		 0.875 0.5 0.99057233 0.089518271 0.9375 0.25 0.89505881 0.25 0.95824915;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 38 ".pt[0:37]" -type "float3"  -6.1900883 0.72880328 0 -5.7197585 
		0.91123736 0 -5.7496901 1.0024513 0 -5.7197585 3.1003888 0 -5.9934063 1.395811 0 
		-5.8694224 0.97537667 0 -5.9934025 2.7440801 0 -5.9934893 2.8026066 0 -5.7197585 
		3.1916051 0 -6.5406923 3.1916051 0 -6.5406923 3.1003888 0 -6.2670503 0.72880328 0 
		-6.2669821 2.7837517 0 -5.9934025 1.9602047 0 -6.2670503 1.9602047 0 -5.9934025 2.5759082 
		0 -6.2670503 2.5759082 0 -5.9920163 2.8837492 0 -6.268187 2.8837492 0 -6.1302252 
		3.1916051 0 -5.9490113 3.037679 0 -5.9250011 3.0613482 0 -5.9249926 3.1916051 0 -6.3090529 
		3.0376773 0 -6.3354592 3.1916051 0 -6.3354692 3.0616872 0 -5.9934025 2.2680502 0 
		-6.2670503 2.2680502 0 -5.993361 1.3445014 0 -6.2670503 1.3445014 0 -5.9934025 1.6523585 
		0 -6.2670503 1.6523585 0 -5.9689169 1.036648 0 -6.2670503 1.0366569 0 -6.1302252 
		0.75202715 0 -5.7932453 0.88272887 0 -5.9250093 0.98721743 0 -5.9249926 0.83163053 
		0;
	setAttr -s 38 ".vt[0:37]"  4.51562548 2.70000005 0 4 2.5 0 4.032813072 2.4000001 0
		 4 0.1 0 4.30000401 1.96875 0 4.16407728 2.42968416 0 4.30000019 0.49062499 0 4.3000946 0.42646405 0
		 4 0 0 4.9000001 0 0 4.9000001 0.1 0 4.5999999 2.70000005 0 4.59992981 0.44713214 0
		 4.30000019 1.35000002 0 4.5999999 1.35000002 0 4.30000019 0.67500001 0 4.5999999 0.67500001 0
		 4.29848194 0.33750156 0 4.60124683 0.33750057 0 4.44999981 0 0 4.2513299 0.1687506 0
		 4.22501135 0.14279857 0 4.2249999 0 0 4.64605141 0.16875204 0 4.67500019 0 0 4.67501163 0.14242697 0
		 4.30000019 1.012500048 0 4.5999999 1.012500048 0 4.29995155 2.025000095 0 4.5999999 2.025000095 0
		 4.30000019 1.6875 0 4.5999999 1.6875 0 4.27315426 2.3625083 0 4.5999999 2.36249995 0
		 4.44999981 2.67454529 0 4.080566406 2.53125 0 4.22502089 2.4167006 0 4.2249999 2.58727264 0;
	setAttr -s 38 ".ed[0:37]"  0 34 0 33 11 0 11 0 0 27 14 0 18 12 0 12 16 0
		 23 18 0 17 20 0 20 21 0 22 19 0 21 3 0 3 8 0 8 22 0 24 9 0 9 10 0 10 25 0 19 24 0
		 25 23 0 15 6 0 6 7 0 7 17 0 16 27 0 26 15 0 13 26 0 31 29 0 14 31 0 30 13 0 28 4 0
		 4 30 0 29 33 0 32 28 0 34 37 0 36 32 0 35 1 0 1 2 0 2 5 0 5 36 0 37 35 0;
	setAttr -ch 38 ".fc[0]" -type "polyFaces" 
		f 38 32 30 27 28 26 23 22 18 19 20 7 8 10 11 12 9 16 13 14 15 17 6 4 5 21 3 25 24 29
		 1 2 0 31 37 33 34 35 36
		mu 0 38 36 32 28 4 30 13 26 15 6 7 17 20 21 3 8 22 19 24 9 10 25 23 18 12 16 27 14 31 29
		 33 11 0 34 37 35 1 2 5;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "_L" -p "Group";
	rename -uid "C4F4109B-4446-AD25-F7CD-00975C8F6C20";
	setAttr ".s" -type "double3" -1 1 1 ;
createNode transform -n "Cheek_L" -p "_L";
	rename -uid "36AE9013-4CAD-730A-D72A-3B832BBAB83E";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Cheek_LShape" -p "Cheek_L";
	rename -uid "0BCA5B1B-4843-7EAE-567C-5AA16B05B088";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.2562479 0.98751581 0 -1.1925969 
		0.8625949 -1.0683976e-007 -1.093459 0.76345724 5.3419882e-008 -0.96853846 0.69980711 
		5.3419882e-008 -0.83006215 0.67787462 0 -0.69158602 0.69980717 0 -0.56666493 0.76345736 
		-1.0683976e-007 -0.46752638 0.86259502 -5.3419882e-008 -0.40387571 0.98751581 -1.0683976e-007 
		-0.38194335 1.1259919 0 -0.40387571 1.2644687 0 -0.46752644 1.3893888 1.0683976e-007 
		-0.56666505 1.4885279 5.3419882e-008 -0.69158608 1.5521774 5.3419882e-008 -0.83006215 
		1.5741098 -1.0683976e-007 -0.96853834 1.5521774 1.0683976e-007 -1.0934589 1.4885279 
		1.0683976e-007 -1.1925967 1.3893888 -5.3419882e-008 -1.2562475 1.2644687 -5.3419882e-008 
		-1.2781799 1.1259919 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "ear_L" -p "_L";
	rename -uid "BD0AE8CB-42C1-DF83-FCB2-C3B6CFBFD5D6";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -0.80102289838751872 -0.1308862528745125 0 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1 10 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "ear_LShape" -p "ear_L";
	rename -uid "0E8F4B89-45F9-9184-9F04-B7B24B4FC453";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0 0 0.1 0 0.2 0 0.30000001
		 0 0.40000001 0 0.5 0 0.60000002 0 0.69999999 0 0.80000001 0 0.90000004 0 1 0 0 0.60000002
		 0 0.69999999 0 0.80000001 0 0.90000004 0 1 0.1 1 0.2 1 0.30000001 1 0.40000001 1
		 0.5 1 0.60000002 1 0.69999999 1 0.80000001 1 0.90000004 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 26 ".pt[0:25]" -type "float3"  0.46396169 0.59669316 -0.10000002 
		0.42972052 0.77835977 -0.10000003 0.36758459 0.94223851 -0.10000002 0.30316079 1.0121889 
		-0.10000002 0.23692718 1.0865636 -0.10000002 0.14823981 1.1520576 -0.10000002 0.06742125 
		1.1932172 -0.10000002 0.036334835 1.1773473 -0.10000002 -0.030289918 1.2331332 -0.10000003 
		-0.11349593 1.2961111 -0.10000002 -0.30413923 1.5325005 -0.10000002 0.53589189 0.02324287 
		-0.10000001 0.51810765 -0.073901117 -0.10000002 0.51184934 -0.19416024 -0.099999979 
		0.50577319 -0.24346745 -0.10000002 0.48056981 -0.37154731 -0.099999979 0.40471005 
		-0.56845629 -0.099999972 0.31038976 -0.6620186 -0.099999972 0.23029864 -0.73036885 
		-0.099999972 0.15150148 -0.71524054 -0.099999972 0.093873911 -0.72944695 -0.1 -0.0020561768 
		-0.73394066 -0.099999972 -0.10993834 -0.71507227 -0.099999972 -0.17622428 -0.68847555 
		-0.099999972 -0.29129496 -0.65255481 -0.099999972 -0.39655063 -0.65378845 -0.1;
	setAttr -s 26 ".vt[0:25]"  -1.035027981 1.3493638 2.9802322e-008 -0.96788323 1.09638083 2.9802322e-008
		 -0.86459756 0.85325336 2.9802322e-008 -0.77116787 0.7251184 2.9802322e-008 -0.67773962 0.60026914 2.9802322e-008
		 -0.56788325 0.48856169 2.9802322e-008 -0.46788281 0.40313858 2.9802322e-008 -0.36788279 0.30785912 2.9802322e-008
		 -0.26131231 0.23229253 2.9802322e-008 -0.1317417 0.15344006 2.9802322e-008 0 0.1501548 2.9802322e-008
		 -1.13687873 1.98878908 7.4505806e-009 -1.13687873 2.13478541 2.9802322e-008 -1.14083266 2.29424548 -2.9802322e-008
		 -1.14083266 2.39424539 2.9802322e-008 -1.1155324 2.59544778 -2.9802322e-008 -1.040121198 2.85317111 -2.9802322e-008
		 -0.94807339 2.99631 -2.9802322e-008 -0.83216912 3.07980752 -2.9802322e-008 -0.71626508 3.07185483 -2.9802322e-008
		 -0.62819296 3.095712185 -2.9802322e-008 -0.50433666 3.083783627 -2.9802322e-008 -0.38048047 3.051975489 -2.9802322e-008
		 -0.28445643 2.97245312 -2.9802322e-008 -0.14867175 2.896909 -2.9802322e-008 0 2.84919524 -2.9802322e-008;
	setAttr -s 26 ".ed[0:25]"  0 1 0 0 11 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0
		 6 7 0 7 8 0 8 9 0 9 10 0 11 12 0 12 13 0 13 14 0 14 15 0 10 25 0 15 16 0 16 17 0
		 17 18 0 18 19 0 19 20 0 20 21 0 21 22 0 22 23 0 23 24 0 24 25 0;
	setAttr -ch 26 ".fc[0]" -type "polyFaces" 
		f 26 15 -26 -25 -24 -23 -22 -21 -20 -19 -18 -17 -15 -14 -13 -12 -2 0 2 3 4 5 6 7 8 9
		 10
		mu 0 26 10 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 0 1 2 3 4 5 6 7 8 9;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "eyeBall_L" -p "_L";
	rename -uid "11892A55-414E-93B7-B470-A98AE2BBD159";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "eyeBall_LShape" -p "eyeBall_L";
	rename -uid "DDA9170C-4D90-82F4-DCD1-518802B7D953";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.69657117 1.9353905 -0.89999998 
		-0.67113298 1.8638299 -0.9000001 -0.63223588 1.8102716 -0.89999998 -0.58419973 1.7767906 
		-0.89999998 -0.53183532 1.7637235 -0.89999998 -0.4799262 1.7718661 -0.89999998 -0.43289623 
		1.8028991 -0.9000001 -0.39486134 1.857365 -0.89999998 -0.3696813 1.9322543 -0.9000001 
		-0.36037338 2.0207016 -0.89999998 -0.3682425 2.1134861 -0.89999998 -0.39244911 2.2005782 
		-0.89999998 -0.43021062 2.2720435 -0.89999998 -0.47748309 2.3186858 -0.89999998 -0.52980775 
		2.3336804 -0.9000001 -0.5826993 2.3149452 -0.89999998 -0.6314109 2.2659624 -0.89999998 
		-0.67090201 2.194289 -0.89999998 -0.69660127 2.1090693 -0.89999998 -0.70543599 2.0197456 
		-0.89999998;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "iris_L" -p "_L";
	rename -uid "2034E3AE-47C1-CB81-84DB-37B7A2A9DBA4";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "iris_LShape" -p "iris_L";
	rename -uid "9612317E-40E3-02CB-C643-B7A18AC6A883";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.82188785 1.912306 -0.8238135 
		-0.76800436 1.8065537 -0.82381362 -0.68408 1.7226292 -0.8238135 -0.57832944 1.6687499 
		-0.8238135 -0.46110278 1.6501802 -0.8238135 -0.34387645 1.6687499 -0.8238135 -0.23812544 
		1.7226293 -0.82381362 -0.1542007 1.8065538 -0.82381356 -0.10031775 1.912306 -0.82381362 
		-0.081751011 2.0295327 -0.8238135 -0.10031775 2.1467619 -0.8238135 -0.15420076 2.2525098 
		-0.82381344 -0.23812556 2.3364344 -0.8238135 -0.34387648 2.3903146 -0.8238135 -0.46110275 
		2.408885 -0.82381362 -0.57832932 2.3903146 -0.82381344 -0.68407983 2.3364344 -0.82381344 
		-0.76800412 2.2525098 -0.82381356 -0.82188755 2.1467619 -0.82381356 -0.84045488 2.0295327 
		-0.8238135;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "pupil_L" -p "_L";
	rename -uid "871EA218-429C-2D6F-E879-88AD90DAC656";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "pupil_LShape" -p "pupil_L";
	rename -uid "9B483065-4BCC-AAED-4EFA-F4B9423D0876";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.8798582 1.8934698 -0.67618638 
		-0.81731808 1.7707243 -0.67618638 -0.71990758 1.6733167 -0.67618638 -0.59716469 1.6107776 
		-0.67618638 -0.46110293 1.5892255 -0.67618638 -0.32503989 1.6107777 -0.67618638 -0.20229682 
		1.6733168 -0.67618638 -0.10488718 1.7707244 -0.67618638 -0.042346213 1.8934698 -0.67618638 
		-0.020796174 2.0295329 -0.67618638 -0.042346213 2.1655996 -0.67618638 -0.10488724 
		2.2883394 -0.67618638 -0.20229694 2.3857489 -0.67618638 -0.32503989 2.4482884 -0.67618638 
		-0.46110293 2.4698379 -0.67618638 -0.59716457 2.4482884 -0.67618638 -0.71990728 2.3857489 
		-0.67618638 -0.81731784 2.2883394 -0.67618638 -0.87985784 2.1655996 -0.67618638 -0.90140909 
		2.0295329 -0.67618638;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "eyeBrow_L" -p "_L";
	rename -uid "24A80590-4CB2-B245-F0E3-E28807EE50DD";
	setAttr -l on -k off ".v";
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "eyeBrow_LShape" -p "eyeBrow_L";
	rename -uid "8B445B46-4739-549A-DDFA-FA85B41F4321";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.71043336 2.378298 0.5 
		-0.73196888 2.257021 0.49999988 -0.7021845 2.1546276 0.5 -0.67801106 2.0948305 0.5 
		-0.61390686 2.0700459 0.5 -0.57271343 2.0773251 0.5 -0.54544646 2.1140506 0.49999988 
		-0.52737385 2.1775839 0.5 -0.49087274 2.2744153 0.49999988 -0.45604634 2.4135571 
		0.5 -0.45173144 2.568656 0.5 -0.47918081 2.7444985 0.5 -0.52637893 2.8811913 0.5 
		-0.57118106 2.9823804 0.5 -0.58691227 3.020694 0.49999988 -0.66211706 2.9985597 0.5 
		-0.6982609 2.9161794 0.5 -0.74110895 2.8005743 0.5 -0.73091143 2.6463771 0.5 -0.72638547 
		2.5051775 0.5;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "hair_L" -p "_L";
	rename -uid "F8BFEFDD-47FA-DBF9-AB5E-7AAB0CCB2309";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".s" -type "double3" 1 1 10 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "hair_LShape" -p "hair_L";
	rename -uid "EE18BC57-496C-3301-4F1D-098149C49196";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 26 ".uvst[0].uvsp[0:25]" -type "float2" 0 0 0.1 0 0.2 0 0.30000001
		 0 0.40000001 0 0.5 0 0.60000002 0 0.69999999 0 0.80000001 0 0.90000004 0 1 0 0 0.60000002
		 0 0.69999999 0 0.80000001 0 0.90000004 0 1 0.1 1 0.2 1 0.30000001 1 0.40000001 1
		 0.5 1 0.60000002 1 0.69999999 1 0.80000001 1 0.90000004 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 26 ".pt[0:25]" -type "float3"  -0.094134204 1.2508366 -0.1 
		-0.085865915 1.766566 -0.1 -0.1015723 2.1511874 -0.1 -0.068276882 2.3699322 -0.1 
		-0.045819454 2.4896126 -0.1 -0.063303784 2.6236048 -0.1 -0.036205571 2.6961389 -0.1 
		-0.0048661316 2.7611957 -0.1 -0.013867149 2.7538452 -0.1 -0.011604209 2.7628911 -0.1 
		0 2.7181671 -0.1 -0.030676087 0.26235357 -0.1 -0.023150545 -0.1052907 -0.1 -0.065752931 
		-0.19385248 -0.1 -0.14408118 -0.15459195 -0.1 -0.22531068 -0.13197565 -0.1 -0.32847992 
		-0.022796039 -0.1 -0.35789278 0.21808667 -0.1 -0.28960097 0.40019867 -0.1 -0.20434219 
		0.56604803 -0.1 -0.11783411 0.63672036 -0.1 -0.10459045 0.69589055 -0.1 -0.074898735 
		0.7849651 -0.1 -0.040965967 0.86979789 -0.1 -0.079140671 1.0012887 -0.1 0 1.087797 
		-0.1;
	setAttr -s 26 ".vt[0:25]"  -1.035027981 1.3493638 2.9802322e-008 -0.96788323 1.09638083 2.9802322e-008
		 -0.86459756 0.85325336 2.9802322e-008 -0.77116787 0.7251184 2.9802322e-008 -0.67773962 0.60026914 2.9802322e-008
		 -0.56788325 0.48856169 2.9802322e-008 -0.46788281 0.40313858 2.9802322e-008 -0.36788279 0.30785912 2.9802322e-008
		 -0.26131231 0.23229253 2.9802322e-008 -0.1317417 0.15344006 2.9802322e-008 0 0.1501548 2.9802322e-008
		 -1.13687873 1.98878908 7.4505806e-009 -1.13687873 2.13478541 2.9802322e-008 -1.14083266 2.29424548 -2.9802322e-008
		 -1.14083266 2.39424539 2.9802322e-008 -1.1155324 2.59544778 -2.9802322e-008 -1.040121198 2.85317111 -2.9802322e-008
		 -0.94807339 2.99631 -2.9802322e-008 -0.83216912 3.07980752 -2.9802322e-008 -0.71626508 3.07185483 -2.9802322e-008
		 -0.62819296 3.095712185 -2.9802322e-008 -0.50433666 3.083783627 -2.9802322e-008 -0.38048047 3.051975489 -2.9802322e-008
		 -0.28445643 2.97245312 -2.9802322e-008 -0.14867175 2.896909 -2.9802322e-008 0 2.84919524 -2.9802322e-008;
	setAttr -s 26 ".ed[0:25]"  0 1 0 0 11 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0
		 6 7 0 7 8 0 8 9 0 9 10 0 11 12 0 12 13 0 13 14 0 14 15 0 10 25 0 15 16 0 16 17 0
		 17 18 0 18 19 0 19 20 0 20 21 0 21 22 0 22 23 0 23 24 0 24 25 0;
	setAttr -ch 26 ".fc[0]" -type "polyFaces" 
		f 26 15 -26 -25 -24 -23 -22 -21 -20 -19 -18 -17 -15 -14 -13 -12 -2 0 2 3 4 5 6 7 8 9
		 10
		mu 0 26 10 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 0 1 2 3 4 5 6 7 8 9;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Lip_L" -p "_L";
	rename -uid "BFFCBDF5-4F26-E42D-FA80-8485411A2F31";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Lip_LShape" -p "Lip_L";
	rename -uid "EE294CE1-4C04-4801-ACBD-AAB5DE025E70";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.96910584 0.84985411 0 
		-0.88076597 0.75149405 -9.6631155e-008 -0.75133401 0.67343444 4.8315581e-008 -0.60162854 
		0.62331712 4.8315581e-008 -0.45010671 0.606049 0 -0.31040317 0.623317 0 -0.19245823 
		0.67343456 -9.6631155e-008 -0.10452029 0.75149417 -4.8315581e-008 -0.051016741 0.84985411 
		-9.6631155e-008 -0.033028781 0.95888782 0 -0.051016741 1.0679232 0 -0.10452035 1.1662843 
		9.6631155e-008 -0.19245835 1.2443433 4.8315581e-008 -0.31040317 1.2944585 4.8315581e-008 
		-0.45010671 1.3117273 -9.6631155e-008 -0.60162842 1.2944587 9.6631155e-008 -0.75133389 
		1.2443436 9.6631155e-008 -0.88076574 1.1662848 -4.8315581e-008 -0.96910548 1.0679243 
		-4.8315581e-008 -1.0005225 0.95888782 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLipA_L" -p "_L";
	rename -uid "855CBBBA-4CE7-5FF7-D1DC-CBAD0A97BBDE";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLipA_LShape" -p "upperLipA_L";
	rename -uid "9D6DAF8A-4501-575D-E61A-90AFA9DCDBE4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.51239997 0.82380611 0.038265921 
		-0.44695088 0.69535333 0.038265802 -0.3450107 0.59341401 0.03826597 -0.21655938 0.5279637 
		0.03826597 -0.074170336 0.50541139 0.038265921 0.068219379 0.52796376 0.038265921 
		0.19667105 0.59341413 0.038265802 0.29861116 0.69535345 0.038265862 0.36406064 0.82380611 
		0.038265802 0.38661283 0.96619469 0.038265921 0.36406064 1.1085871 0.038265921 0.2986111 
		1.2370366 0.038266029 0.19667093 1.3389765 0.03826597 0.068219334 1.4043648 0.03826597 
		-0.074170396 1.426736 0.038265802 -0.21655926 1.4043648 0.038266029 -0.34501058 1.3389765 
		0.038266029 -0.44695064 1.2370366 0.038265862 -0.51239961 1.1085871 0.038265862 -0.53495288 
		0.96619469 0.038265921;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLipA_L" -p "_L";
	rename -uid "7F6A2E26-4AC5-10C1-BCF9-EE8C00D7897C";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLipA_LShape" -p "lowerLipA_L";
	rename -uid "17ECD778-493A-BD4D-B042-E98002651F2C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.51971167 0.65785462 0.080578595 
		-0.45426333 0.5294019 0.080578491 -0.35232303 0.4274627 0.080578655 -0.22387095 0.36201388 
		0.080578655 -0.081481427 0.33946177 0.080578595 0.06090802 0.36201394 0.080578595 
		0.1893598 0.42746282 0.080578491 0.29129961 0.52940202 0.080578536 0.35674879 0.65785462 
		0.080578491 0.37930104 0.80024421 0.080578595 0.35674879 0.94263327 0.080578595 0.29129955 
		1.0710868 0.0805787 0.18935968 1.173028 0.080578655 0.06090796 1.2384766 0.080578655 
		-0.081481412 1.2610284 0.080578491 -0.22387083 1.2384766 0.0805787 -0.35232291 1.173028 
		0.0805787 -0.45426309 1.0710868 0.080578536 -0.51971132 0.94263327 0.080578536 -0.54226458 
		0.80024421 0.080578595;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "NoseCorner_L" -p "_L";
	rename -uid "851044AC-4534-FF5A-9D4C-08B5AAB10169";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "NoseCorner_LShape" -p "NoseCorner_L";
	rename -uid "D472D9D1-4F95-187A-310C-EBB0D1F7742C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.7158953 1.2298993 0 -0.65319109 
		1.1068348 -1.0525153e-007 -0.55552655 1.0091708 5.2625765e-008 -0.43246236 0.94646597 
		5.2625765e-008 -0.29604453 0.92485934 0 -0.15962659 0.94646609 0 -0.036562555 1.0091709 
		-1.0525153e-007 0.061101772 1.1068349 -5.2625765e-008 0.12380613 1.2298993 -1.0525153e-007 
		0.14541256 1.3663164 0 0.12380613 1.5027343 0 0.061101712 1.6257976 1.0525153e-007 
		-0.036562674 1.7234628 5.2625765e-008 -0.1596266 1.7861665 5.2625765e-008 -0.29604453 
		1.807773 -1.0525153e-007 -0.43246225 1.7861665 1.0525153e-007 -0.55552644 1.7234628 
		1.0525153e-007 -0.65319085 1.6257976 -5.2625765e-008 -0.71589494 1.5027343 -5.2625765e-008 
		-0.73750126 1.3663164 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLidOuter_L" -p "_L";
	rename -uid "FD0579E7-4D96-3FD6-E794-A28D1DE7D9D4";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLidOuter_LShape" -p "lowerLidOuter_L";
	rename -uid "7C4EC0F2-45EF-A7B6-6B0F-3DB3AEED69D1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.92291009 1.5138894 0 -0.86539459 
		1.3855665 -9.6543474e-008 -0.77581018 1.2769181 4.8271737e-008 -0.66292727 1.20382 
		4.8271737e-008 -0.53779691 1.1780852 0 -0.4126662 1.2038198 0 -0.29978469 1.2769182 
		-9.6543474e-008 -0.21020047 1.3855666 -4.8271737e-008 -0.15268405 1.5138894 -9.6543474e-008 
		-0.13286513 1.6581242 0 -0.15268405 1.8041767 0 -0.21020053 1.9365445 9.6543474e-008 
		-0.29978481 2.0404491 4.8271737e-008 -0.4126662 2.1058481 4.8271737e-008 -0.53779691 
		2.1280951 -9.6543474e-008 -0.66292715 2.1058481 9.6543474e-008 -0.77581006 2.0404491 
		9.6543474e-008 -0.86539435 1.9365445 -4.8271737e-008 -0.92290974 1.8041767 -4.8271737e-008 
		-0.94272912 1.6581242 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "innerLid_L" -p "_L";
	rename -uid "761CB88D-4443-9C84-D72E-8C918C1C4E8D";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "innerLid_LShape" -p "innerLid_L";
	rename -uid "DCAE0FE3-4F48-4F9B-A574-919871F7D562";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.61660451 1.8767396 0 -0.55377674 
		1.760933 -1.0666771e-007 -0.45470983 1.6690301 5.3333856e-008 -0.32811397 1.6100221 
		5.3333856e-008 -0.18558192 1.5896902 0 -0.040236767 1.6100221 0 0.094372213 1.6690302 
		-1.0666771e-007 0.20471351 1.7609332 -5.3333856e-008 0.27784026 1.8767396 -1.0666771e-007 
		0.3035495 2.0051165 0 0.27784026 2.1334853 0 0.20471345 2.2492943 1.0666771e-007 
		0.094372094 2.3411951 5.3333856e-008 -0.040236745 2.4002011 5.3333856e-008 -0.18558189 
		2.4205337 -1.0666771e-007 -0.32811385 2.4002011 1.0666771e-007 -0.45470965 2.3411951 
		1.0666771e-007 -0.5537765 2.2492943 -5.3333856e-008 -0.61660421 2.1334853 -5.3333856e-008 
		-0.63808769 2.0051165 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "outerLid_L" -p "_L";
	rename -uid "44F8C49B-4625-47E8-30F1-489842F9076A";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "outerLid_LShape" -p "outerLid_L";
	rename -uid "E36B4339-45C6-01DB-A7FF-7AA5EA08244E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.3337502 1.8795278 0 -1.2614589 
		1.7637213 -1.0666771e-007 -1.1520674 1.6718141 5.3333856e-008 -1.0182085 1.6128099 
		5.3333856e-008 -0.87331021 1.5924779 0 -0.73094326 1.6128099 0 -0.60429859 1.6718142 
		-1.0666771e-007 -0.50505048 1.7637215 -5.3333856e-008 -0.44203058 1.8795278 -1.0666771e-007 
		-0.42046487 2.0078971 0 -0.44203058 2.1362739 0 -0.50505054 2.2520747 1.0666771e-007 
		-0.60429871 2.3439827 5.3333856e-008 -0.7309432 2.4029903 5.3333856e-008 -0.87331021 
		2.4233222 -1.0666771e-007 -1.0182084 2.4029903 1.0666771e-007 -1.1520673 2.3439827 
		1.0666771e-007 -1.2614586 2.2520747 -5.3333856e-008 -1.3337499 2.1362739 -5.3333856e-008 
		-1.3591219 2.0078971 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLid_L" -p "_L";
	rename -uid "D531B2A7-4113-FE95-0439-4B884EC75A40";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLid_LShape" -p "upperLid_L";
	rename -uid "2377631B-4AB5-A313-3103-99ACC8E391B0";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.68749994039535522 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.83684027 2.1910455 0 -0.79061788 
		2.0643437 -9.6839507e-008 -0.71863139 1.9658012 4.8419754e-008 -0.62792677 1.9085573 
		4.8419754e-008 -0.52737385 1.890972 0 -0.4268162 1.9085574 0 -0.33610693 1.9658014 
		-9.6839507e-008 -0.26411915 2.0643442 -4.8419754e-008 -0.21790075 2.1910455 -9.6839507e-008 
		-0.20197508 2.3314943 0 -0.21790075 2.4719365 0 -0.26411921 2.5991759 9.6839507e-008 
		-0.33610705 2.7088125 4.8419754e-008 -0.42681623 2.7920067 4.8419754e-008 -0.52737385 
		2.8248987 -9.6839507e-008 -0.62792665 2.7920067 9.6839507e-008 -0.71863127 2.7088125 
		9.6839507e-008 -0.79061764 2.5991759 -4.8419754e-008 -0.83683991 2.4719365 -4.8419754e-008 
		-0.85276395 2.3314943 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLid_L" -p "_L";
	rename -uid "B8D251DE-46A4-8472-E497-DC9F932F2763";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLid_LShape" -p "lowerLid_L";
	rename -uid "34428857-4388-1024-A2F0-D6A28815074E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.86500275 1.624239 0 -0.81613094 
		1.4962287 -1.0290524e-007 -0.74000895 1.3870571 5.145262e-008 -0.64409286 1.308455 
		5.145262e-008 -0.53776586 1.2788012 0 -0.43144113 1.308455 0 -0.33552298 1.3870573 
		-1.0290524e-007 -0.25940114 1.4962287 -5.145262e-008 -0.21052887 1.624239 -1.0290524e-007 
		-0.19368902 1.7634971 0 -0.21052887 1.9027553 0 -0.2594012 2.0282686 1.0290524e-007 
		-0.3355231 2.125725 5.145262e-008 -0.43144113 2.1850276 5.145262e-008 -0.53776586 
		2.2044055 -1.0290524e-007 -0.64409274 2.1850276 1.0290524e-007 -0.74000883 2.125725 
		1.0290524e-007 -0.8161307 2.0282686 -5.145262e-008 -0.86500239 1.9027553 -5.145262e-008 
		-0.88184267 1.7634971 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLid1_L" -p "_L";
	rename -uid "4F26C605-4FEB-B5AA-3BC1-349936CCF09B";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLid1_LShape" -p "upperLid1_L";
	rename -uid "33094B19-4344-55C3-4429-468E9AFC8D63";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.70470828 2.0057213 0 -0.64037406 
		1.8794571 -1.0798893e-007 -0.54016906 1.7792532 5.3994462e-008 -0.41390324 1.7149166 
		5.3994462e-008 -0.27393726 1.6927481 0 -0.13397156 1.7149165 0 -0.0077065444 1.7792532 
		-1.0798893e-007 0.092498198 1.8794571 -5.3994462e-008 0.15683329 2.0057213 -1.0798893e-007 
		0.17900145 2.1456861 0 0.15683329 2.2856529 0 0.092498139 2.4119155 1.0798893e-007 
		-0.0077066636 2.5121198 5.3994462e-008 -0.13397162 2.5763822 5.3994462e-008 -0.27393728 
		2.5983334 -1.0798893e-007 -0.41390312 2.5763822 1.0798893e-007 -0.54016894 2.5121198 
		1.0798893e-007 -0.64037383 2.4119155 -5.3994462e-008 -0.7047078 2.2856529 -5.3994462e-008 
		-0.72687751 2.1456861 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLid2_L" -p "_L";
	rename -uid "2873CBD8-4F6C-7233-C375-51A4163FADF9";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLid2_LShape" -p "upperLid2_L";
	rename -uid "22F87299-4DAE-6EBE-8373-3DB0EA2331A7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.82773298 2.0923586 0 -0.76339877 
		1.9660944 -1.0798893e-007 -0.66319376 1.8658905 5.3994462e-008 -0.53692794 1.8015538 
		5.3994462e-008 -0.39696184 1.7793853 0 -0.2569961 1.8015537 0 -0.1307312 1.8658905 
		-1.0798893e-007 -0.030526416 1.9660944 -5.3994462e-008 0.03380863 2.0923586 -1.0798893e-007 
		0.055976793 2.2323234 0 0.03380863 2.3722901 0 -0.030526476 2.4985528 1.0798893e-007 
		-0.13073131 2.598757 5.3994462e-008 -0.25699615 2.6630194 5.3994462e-008 -0.39696187 
		2.6849706 -1.0798893e-007 -0.53692782 2.6630194 1.0798893e-007 -0.66319364 2.598757 
		1.0798893e-007 -0.76339853 2.4985528 -5.3994462e-008 -0.8277325 2.3722901 -5.3994462e-008 
		-0.84990221 2.2323234 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLid3_L" -p "_L";
	rename -uid "D74F13AF-4785-2B7F-8944-A2B63D2AAA66";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLid3_LShape" -p "upperLid3_L";
	rename -uid "78AF0E8E-49AC-E7A3-B45B-168E1E2021D2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.0859104 2.0871596 0 -1.0215768 
		1.9608965 -1.0798893e-007 -0.92137289 1.8606926 5.3994462e-008 -0.79510707 1.796356 
		5.3994462e-008 -0.65514112 1.7741874 0 -0.51517481 1.7963558 0 -0.38890943 1.8606926 
		-1.0798893e-007 -0.28870472 1.9608965 -5.3994462e-008 -0.22436976 2.0871596 -1.0798893e-007 
		-0.20220153 2.2271245 0 -0.22436976 2.3670912 0 -0.28870478 2.4933538 1.0798893e-007 
		-0.38890955 2.5935581 5.3994462e-008 -0.51517487 2.6578205 5.3994462e-008 -0.65514112 
		2.6797717 -1.0798893e-007 -0.79510695 2.6578205 1.0798893e-007 -0.92137277 2.5935581 
		1.0798893e-007 -1.0215765 2.4933538 -5.3994462e-008 -1.08591 2.3670912 -5.3994462e-008 
		-1.1080796 2.2271245 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLid4_L" -p "_L";
	rename -uid "F93C470C-4098-AAFB-03E0-2D88277C0E7C";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLid4_LShape" -p "upperLid4_L";
	rename -uid "B3E55F8E-4606-DC02-67E3-2AA3F53FADA5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.2141333 2.0074537 0 -1.1497996 
		1.8811896 -1.0798893e-007 -1.0495961 1.7809857 5.3994462e-008 -0.92333007 1.7166491 
		5.3994462e-008 -0.78336412 1.6944805 0 -0.64339781 1.7166489 0 -0.51713222 1.7809857 
		-1.0798893e-007 -0.41692749 1.8811896 -5.3994462e-008 -0.35259256 2.0074537 -1.0798893e-007 
		-0.3304244 2.1474192 0 -0.35259256 2.2873859 0 -0.41692755 2.4136486 1.0798893e-007 
		-0.51713234 2.5138528 5.3994462e-008 -0.64339787 2.5781152 5.3994462e-008 -0.78336412 
		2.6000664 -1.0798893e-007 -0.92332995 2.5781152 1.0798893e-007 -1.049596 2.5138528 
		1.0798893e-007 -1.1497993 2.4136486 -5.3994462e-008 -1.2141328 2.2873859 -5.3994462e-008 
		-1.2363024 2.1474192 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLid1_L" -p "_L";
	rename -uid "A077789C-4383-436F-CA6C-9FB5073B7D7D";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLid1_LShape" -p "lowerLid1_L";
	rename -uid "37BF93EA-497D-B87D-4D45-FFBF9054E581";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.70470828 1.7527412 0 -0.64037406 
		1.6264774 -1.0798893e-007 -0.54016906 1.5262735 5.3994462e-008 -0.41390324 1.4619368 
		5.3994462e-008 -0.27393726 1.4397683 0 -0.13397156 1.4619367 0 -0.0077065444 1.5262735 
		-1.0798893e-007 0.092498198 1.6264774 -5.3994462e-008 0.15683329 1.7527412 -1.0798893e-007 
		0.17900145 1.8927047 0 0.15683329 2.0326698 0 0.092498139 2.1589324 1.0798893e-007 
		-0.0077066636 2.2591367 5.3994462e-008 -0.13397162 2.3233991 5.3994462e-008 -0.27393728 
		2.3453503 -1.0798893e-007 -0.41390312 2.3233991 1.0798893e-007 -0.54016894 2.2591367 
		1.0798893e-007 -0.64037383 2.1589324 -5.3994462e-008 -0.7047078 2.0326698 -5.3994462e-008 
		-0.72687751 1.8927047 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLid2_L" -p "_L";
	rename -uid "07783277-40C9-30FA-AB91-11B23AABC360";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLid2_LShape" -p "lowerLid2_L";
	rename -uid "EBD9286B-4CA1-36BF-107A-27978B2C7788";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.82773298 1.7094226 0 -0.76339877 
		1.583159 -1.0798893e-007 -0.66319376 1.4829551 5.3994462e-008 -0.53692794 1.4186184 
		5.3994462e-008 -0.39696184 1.3964499 0 -0.2569961 1.4186183 0 -0.1307312 1.4829551 
		-1.0798893e-007 -0.030526416 1.583159 -5.3994462e-008 0.03380863 1.7094226 -1.0798893e-007 
		0.055976793 1.8493875 0 0.03380863 1.9893532 0 -0.030526476 2.1156154 1.0798893e-007 
		-0.13073131 2.2158196 5.3994462e-008 -0.25699615 2.280082 5.3994462e-008 -0.39696187 
		2.3020332 -1.0798893e-007 -0.53692782 2.280082 1.0798893e-007 -0.66319364 2.2158196 
		1.0798893e-007 -0.76339853 2.1156154 -5.3994462e-008 -0.8277325 1.9893532 -5.3994462e-008 
		-0.84990221 1.8493875 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLid3_L" -p "_L";
	rename -uid "2D8D2545-40B2-A6D1-46E7-E2907433C010";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLid3_LShape" -p "lowerLid3_L";
	rename -uid "B7712EA4-4C91-C825-7A3C-B4A3304C82FB";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.0859104 1.7146204 0 -1.0215768 
		1.5883572 -1.0798893e-007 -0.92137289 1.4881533 5.3994462e-008 -0.79510707 1.4238167 
		5.3994462e-008 -0.65514112 1.4016482 0 -0.51517481 1.4238166 0 -0.38890943 1.4881533 
		-1.0798893e-007 -0.28870472 1.5883572 -5.3994462e-008 -0.22436976 1.7146204 -1.0798893e-007 
		-0.20220153 1.8545855 0 -0.22436976 1.9945509 0 -0.28870478 2.1208131 1.0798893e-007 
		-0.38890955 2.2210174 5.3994462e-008 -0.51517487 2.2852798 5.3994462e-008 -0.65514112 
		2.3072309 -1.0798893e-007 -0.79510695 2.2852798 1.0798893e-007 -0.92137277 2.2210174 
		1.0798893e-007 -1.0215765 2.1208131 -5.3994462e-008 -1.08591 1.9945509 -5.3994462e-008 
		-1.1080796 1.8545855 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLid4_L" -p "_L";
	rename -uid "F6710049-4BB3-4892-2098-9F9B11732831";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLid4_LShape" -p "lowerLid4_L";
	rename -uid "3F3200A5-48EE-56A4-F4F1-20BE9C2A710C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.2141333 1.7631369 0 -1.1497996 
		1.6368732 -1.0798893e-007 -1.0495961 1.5366694 5.3994462e-008 -0.92333007 1.4723327 
		5.3994462e-008 -0.78336412 1.4501642 0 -0.64339781 1.4723326 0 -0.51713222 1.5366694 
		-1.0798893e-007 -0.41692749 1.6368732 -5.3994462e-008 -0.35259256 1.7631369 -1.0798893e-007 
		-0.3304244 1.9031025 0 -0.35259256 2.0430696 0 -0.41692755 2.169332 1.0798893e-007 
		-0.51713234 2.2695363 5.3994462e-008 -0.64339787 2.3337986 5.3994462e-008 -0.78336412 
		2.3557498 -1.0798893e-007 -0.92332995 2.3337986 1.0798893e-007 -1.049596 2.2695363 
		1.0798893e-007 -1.1497993 2.169332 -5.3994462e-008 -1.2141328 2.0430696 -5.3994462e-008 
		-1.2363024 1.9031025 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeRegion_L" -p "_L";
	rename -uid "3C1383C3-4EFF-846E-3820-418E410F01B9";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeRegion_LShape" -p "EyeRegion_L";
	rename -uid "AFDB1F70-4704-AC3D-E8C1-BCB897BB69C7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.9515764 1.9037715 0 -1.9024537 
		1.8063235 -8.3342641e-008 -1.8259363 1.7289885 4.1671321e-008 -1.7295244 1.6793371 
		4.1671321e-008 -1.6226488 1.6622267 0 -1.5157741 1.6793373 0 -1.4193631 1.7289886 
		-8.3342641e-008 -1.3428469 1.8063236 -4.1671321e-008 -1.2937229 1.9037715 -8.3342641e-008 
		-1.2767962 2.0117903 0 -1.2937229 2.1198137 0 -1.3428468 2.217258 8.3342641e-008 
		-1.4193633 2.2945936 4.1671321e-008 -1.5157748 2.3442421 4.1671321e-008 -1.6226488 
		2.3613513 -8.3342641e-008 -1.7295243 2.3442421 8.3342641e-008 -1.8259361 2.2945936 
		8.3342641e-008 -1.9024534 2.217258 -4.1671321e-008 -1.9515761 2.1198137 -4.1671321e-008 
		-1.9685028 2.0117903 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowRegion_L" -p "_L";
	rename -uid "738998CB-4BF6-ABB2-062B-098C856A5631";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowRegion_LShape" -p "EyeBrowRegion_L";
	rename -uid "B90F607F-438D-7196-EEA2-C591CC07E495";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.9227914 2.2725704 0 -1.8779678 
		2.1508064 -8.3342641e-008 -1.8081465 2.0541749 4.1671321e-008 -1.7201715 1.9921335 
		4.1671321e-008 -1.6226488 1.9707552 0 -1.5251266 1.9921337 0 -1.4371531 2.0541749 
		-8.3342641e-008 -1.3673328 2.1508067 -4.1671321e-008 -1.3225079 2.2725704 -8.3342641e-008 
		-1.3070625 2.4075458 0 -1.3225079 2.5425224 0 -1.3673329 2.6642821 8.3342641e-008 
		-1.4371532 2.7609167 4.1671321e-008 -1.5251276 2.8229563 4.1671321e-008 -1.6226488 
		2.8443341 -8.3342641e-008 -1.7201713 2.8229563 8.3342641e-008 -1.8081462 2.7609167 
		8.3342641e-008 -1.8779676 2.6642821 -4.1671321e-008 -1.9227911 2.5425224 -4.1671321e-008 
		-1.9382365 2.4075458 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowInner_L" -p "_L";
	rename -uid "98CFA526-4668-CF72-BCF4-18B3BDB9C8A0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowInner_LShape" -p "EyeBrowInner_L";
	rename -uid "4FD4B554-4B36-F4CC-9603-BF9A206EDBCD";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.6607033 2.386487 0 -0.60048747 
		2.2683063 -1.0107505e-007 -0.50669819 2.1745172 5.0537523e-008 -0.3885166 2.114301 
		5.0537523e-008 -0.25751138 2.0935514 0 -0.12650689 2.114301 0 -0.0083261579 2.1745174 
		-1.0107505e-007 0.085462645 2.2683063 -5.0537523e-008 0.14567861 2.386487 -1.0107505e-007 
		0.16642785 2.5174911 0 0.14567861 2.6484962 0 0.085462585 2.7666762 1.0107505e-007 
		-0.0083262771 2.8604658 5.0537523e-008 -0.12650695 2.9206812 5.0537523e-008 -0.25751138 
		2.9414308 -1.0107505e-007 -0.38851649 2.9206812 1.0107505e-007 -0.50669807 2.8604658 
		1.0107505e-007 -0.60048723 2.7666762 -5.0537523e-008 -0.66070306 2.6484962 -5.0537523e-008 
		-0.68145216 2.5174911 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowMid1_L" -p "_L";
	rename -uid "DF122681-4487-69E4-EF19-9FAA8E96FF6E";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowMid1_LShape" -p "EyeBrowMid1_L";
	rename -uid "B2C13412-4F41-AD6D-A2FB-3EA15BAE1592";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.88801086 2.4280729 0 -0.82779503 
		2.3098922 -1.0107505e-007 -0.73400575 2.2161031 5.0537523e-008 -0.61582416 2.1558869 
		5.0537523e-008 -0.48481917 2.1351373 0 -0.3538146 2.1558869 0 -0.23563388 2.2161033 
		-1.0107505e-007 -0.14184508 2.3098922 -5.0537523e-008 -0.081629097 2.4280729 -1.0107505e-007 
		-0.060879856 2.559077 0 -0.081629097 2.6900821 0 -0.14184514 2.8082621 1.0107505e-007 
		-0.235634 2.9020517 5.0537523e-008 -0.35381466 2.9622672 5.0537523e-008 -0.48481917 
		2.9830167 -1.0107505e-007 -0.61582404 2.9622672 1.0107505e-007 -0.73400563 2.9020517 
		1.0107505e-007 -0.82779479 2.8082621 -5.0537523e-008 -0.88801062 2.6900821 -5.0537523e-008 
		-0.90875971 2.559077 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowMid2_L" -p "_L";
	rename -uid "54406FD4-4F18-B8E4-1C21-EFA8AACA291C";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowMid2_LShape" -p "EyeBrowMid2_L";
	rename -uid "55415BF4-4C9E-30D6-6C20-83965D7B36DC";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.0585699 2.4188538 0 -0.99835408 
		2.300673 -1.0107505e-007 -0.9045648 2.2068839 5.0537523e-008 -0.78638321 2.1466677 
		5.0537523e-008 -0.65537822 2.1259181 0 -0.52437365 2.1466677 0 -0.40619293 2.2068841 
		-1.0107505e-007 -0.31240413 2.300673 -5.0537523e-008 -0.25218815 2.4188538 -1.0107505e-007 
		-0.23143891 2.5498579 0 -0.25218815 2.6808629 0 -0.31240419 2.7990429 1.0107505e-007 
		-0.40619305 2.8928325 5.0537523e-008 -0.52437371 2.953048 5.0537523e-008 -0.65537822 
		2.9737976 -1.0107505e-007 -0.78638309 2.953048 1.0107505e-007 -0.90456468 2.8928325 
		1.0107505e-007 -0.99835384 2.7990429 -5.0537523e-008 -1.0585697 2.6808629 -5.0537523e-008 
		-1.0793188 2.5498579 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowMid3_L" -p "_L";
	rename -uid "8C764C3D-4E91-96FC-7CBD-EE811AC893D9";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowMid3_LShape" -p "EyeBrowMid3_L";
	rename -uid "037A4A9A-4143-CDBE-0B9E-E2A6711D9C85";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.229129 2.3773675 0 -1.1689131 
		2.2591867 -1.0107505e-007 -1.0751238 2.1653976 5.0537523e-008 -0.9569422 2.1051815 
		5.0537523e-008 -0.82593727 2.0844319 0 -0.6949327 2.1051815 0 -0.57675195 2.1653979 
		-1.0107505e-007 -0.48296314 2.2591867 -5.0537523e-008 -0.42274719 2.3773675 -1.0107505e-007 
		-0.40199795 2.5083716 0 -0.42274719 2.6393766 0 -0.4829632 2.7575567 1.0107505e-007 
		-0.57675207 2.8513463 5.0537523e-008 -0.69493276 2.9115617 5.0537523e-008 -0.82593727 
		2.9323113 -1.0107505e-007 -0.95694208 2.9115617 1.0107505e-007 -1.0751237 2.8513463 
		1.0107505e-007 -1.1689129 2.7575567 -5.0537523e-008 -1.2291287 2.6393766 -5.0537523e-008 
		-1.2498778 2.5083716 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "EyeBrowOuter_L" -p "_L";
	rename -uid "A05308B3-4700-D5BC-26DF-BCA5B47839C9";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "EyeBrowOuter_LShape" -p "EyeBrowOuter_L";
	rename -uid "DE20BC1A-4E5D-5428-26E5-E89F7EB7A397";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.3582007 2.2713468 0 -1.2979848 
		2.1531661 -1.0107505e-007 -1.2041955 2.059377 5.0537523e-008 -1.0860139 1.9991602 
		5.0537523e-008 -0.95500898 1.9784104 0 -0.82400441 1.9991602 0 -0.70582366 2.0593772 
		-1.0107505e-007 -0.61203486 2.1531661 -5.0537523e-008 -0.55181891 2.2713468 -1.0107505e-007 
		-0.53106964 2.4023509 0 -0.55181891 2.533356 0 -0.61203492 2.651536 1.0107505e-007 
		-0.70582378 2.7453256 5.0537523e-008 -0.82400447 2.805541 5.0537523e-008 -0.95500898 
		2.8262906 -1.0107505e-007 -1.0860138 2.805541 1.0107505e-007 -1.2041954 2.7453256 
		1.0107505e-007 -1.2979846 2.651536 -5.0537523e-008 -1.3582004 2.533356 -5.0537523e-008 
		-1.3789495 2.4023509 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "Nostril_L" -p "_L";
	rename -uid "21E051DB-4633-9239-2461-369445E6903C";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "Nostril_LShape" -p "Nostril_L";
	rename -uid "15EE4FF0-40B6-0AE3-6840-E8B997BCF362";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.57432669 1.3218632 0 -0.51077837 
		1.1971425 -1.0666771e-007 -0.41180015 1.0981641 5.3333856e-008 -0.28708041 1.034616 
		5.3333856e-008 -0.14882688 1.012719 0 -0.010573717 1.034616 0 0.11414663 1.0981642 
		-1.0666771e-007 0.2131252 1.1971426 -5.3333856e-008 0.2766732 1.3218632 -1.0666771e-007 
		0.29857031 1.4601164 0 0.2766732 1.5983698 0 0.21312514 1.7230889 1.0666771e-007 
		0.11414651 1.822069 5.3333856e-008 -0.010573717 1.8856162 5.3333856e-008 -0.14882688 
		1.9075135 -1.0666771e-007 -0.28708029 1.8856162 1.0666771e-007 -0.41180003 1.822069 
		1.0666771e-007 -0.51077813 1.7230889 -5.3333856e-008 -0.57432634 1.5983698 -5.3333856e-008 
		-0.59622335 1.4601164 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "NoseSide_L" -p "_L";
	rename -uid "EEBDD80C-4027-73AF-B3E6-158733585A43";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "NoseSide_LShape" -p "NoseSide_L";
	rename -uid "CC01A902-49A5-6287-5598-48A9F98ED887";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.61048591 1.5198743 0 -0.54693758 
		1.3951536 -1.0666771e-007 -0.44795889 1.2961752 5.3333856e-008 -0.32323915 1.2326272 
		5.3333856e-008 -0.18498594 1.2107302 0 -0.046732813 1.2326272 0 0.077987559 1.2961754 
		-1.0666771e-007 0.17696612 1.3951538 -5.3333856e-008 0.24051411 1.5198743 -1.0666771e-007 
		0.2624113 1.6581275 0 0.24051411 1.796381 0 0.17696606 1.9211 1.0666771e-007 0.07798744 
		2.0200813 5.3333856e-008 -0.046732813 2.0836294 5.3333856e-008 -0.18498594 2.1055269 
		-1.0666771e-007 -0.32323903 2.0836294 1.0666771e-007 -0.44795877 2.0200813 1.0666771e-007 
		-0.54693735 1.9211 -5.3333856e-008 -0.61048555 1.796381 -5.3333856e-008 -0.63238257 
		1.6581275 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "cornerLip_L" -p "_L";
	rename -uid "FBEF619B-4EF3-9A4E-B2AD-1F88C732BD65";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "cornerLip_LShape" -p "cornerLip_L";
	rename -uid "11683FCE-4F2E-D43C-DCA3-4D8EAFFA474C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.88812298 0.81333417 -0.1193822 
		-0.82140392 0.68238801 -0.11938232 -0.71748519 0.57846981 -0.11938216 -0.58653992 
		0.51174974 -0.11938216 -0.44138578 0.48875982 -0.1193822 -0.29623199 0.5117498 -0.1193822 
		-0.16528678 0.57846993 -0.11938232 -0.06136813 0.68238813 -0.11938226 0.0053515863 
		0.81333417 -0.11938232 0.028341468 0.95848709 -0.1193822 0.0053515863 1.1036435 -0.1193822 
		-0.06136819 1.234587 -0.1193821 -0.1652869 1.3385059 -0.11938216 -0.29623201 1.4051785 
		-0.11938216 -0.44138584 1.4280286 -0.11938232 -0.5865398 1.4051785 -0.1193821 -0.71748507 
		1.3385059 -0.1193821 -0.82140368 1.234587 -0.11938226 -0.88812262 1.1036435 -0.11938226 
		-0.91111356 0.95848709 -0.1193822;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLipB_L" -p "_L";
	rename -uid "F0D83112-454A-B3CC-DF06-C1B9DEAC9548";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLipB_LShape" -p "upperLipB_L";
	rename -uid "18BB34A5-457A-0F4C-A5D0-338A777811D3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.6602096 0.84914482 0.038265921 
		-0.59476119 0.72069204 0.038265802 -0.49282116 0.61875266 0.03826597 -0.3643696 0.55330247 
		0.03826597 -0.22198018 0.5307501 0.038265921 -0.079590559 0.55330253 0.038265921 
		0.048861168 0.61875278 0.038265802 0.15080097 0.72069216 0.038265862 0.21625027 0.84914482 
		0.038265802 0.23880237 0.9915334 0.038265921 0.21625027 1.1339258 0.038265921 0.15080091 
		1.2623752 0.038266029 0.048861049 1.3643152 0.03826597 -0.079590604 1.4297035 0.03826597 
		-0.22198024 1.4520746 0.038265802 -0.36436948 1.4297035 0.038266029 -0.49282104 1.3643152 
		0.038266029 -0.59476095 1.2623752 0.038265862 -0.66020924 1.1339258 0.038265862 -0.6827625 
		0.9915334 0.038265921;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "upperLipC_L" -p "_L";
	rename -uid "23CD86E0-41F4-3492-39D4-29A7C2240E4E";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "upperLipC_LShape" -p "upperLipC_L";
	rename -uid "48CD359C-4AEE-871E-579E-7A9B12A3D5E7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.80455083 0.8489297 0.038265921 
		-0.73804355 0.71839905 0.038265802 -0.63445455 0.61481053 0.03826597 -0.50392556 
		0.54830182 0.03826597 -0.35923254 0.52538478 0.038265921 -0.21453913 0.54830188 0.038265921 
		-0.084009513 0.61481065 0.038265802 0.01957937 0.71839917 0.038265862 0.086087495 
		0.8489297 0.038265802 0.10900445 0.99362183 0.038265921 0.086087495 1.1383173 0.038265921 
		0.01957931 1.2688451 0.038266029 -0.084009632 1.3724343 0.03826597 -0.21453917 1.4388928 
		0.03826597 -0.3592326 1.461663 0.038265802 -0.50392544 1.4388928 0.038266029 -0.63445443 
		1.3724343 0.038266029 -0.73804331 1.2688451 0.038265862 -0.80455047 1.1383173 0.038265862 
		-0.82746851 0.99362183 0.038265921;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLipB_L" -p "_L";
	rename -uid "E6536FED-4E2B-252C-138D-32900C1B1695";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLipB_LShape" -p "lowerLipB_L";
	rename -uid "BA081732-4DB7-79A0-8393-E9A91A41C482";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.66963279 0.68530488 0.080578595 
		-0.60418439 0.55685222 0.080578491 -0.50224501 0.45491326 0.080578655 -0.37379292 
		0.38946444 0.080578655 -0.23140289 0.36691231 0.080578595 -0.08901348 0.3894645 0.080578595 
		0.039438367 0.45491338 0.080578491 0.14137812 0.55685234 0.080578536 0.20682706 0.68530488 
		0.080578491 0.22937915 0.82769448 0.080578595 0.20682706 0.97008353 0.080578595 0.14137806 
		1.0985372 0.0805787 0.039438248 1.2004782 0.080578655 -0.089013539 1.2659268 0.080578655 
		-0.23140286 1.2884786 0.080578491 -0.3737928 1.2659268 0.0805787 -0.50224489 1.2004782 
		0.0805787 -0.60418415 1.0985372 0.080578536 -0.66963243 0.97008353 0.080578536 -0.6921857 
		0.82769448 0.080578595;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "lowerLipC_L" -p "_L";
	rename -uid "36908355-4DC3-9115-E229-C082AF86F222";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "lowerLipC_LShape" -p "lowerLipC_L";
	rename -uid "3B6516F0-4A34-57B7-1E4D-2F8571632F7F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.81820828 0.73578709 0.080578595 
		-0.75169921 0.60525328 0.080578491 -0.64810789 0.50166303 0.080578655 -0.51757514 
		0.43515375 0.080578655 -0.37287849 0.41223624 0.080578595 -0.22818178 0.43515381 
		0.080578595 -0.097648807 0.50166315 0.080578491 0.0059425607 0.6052534 0.080578536 
		0.072451986 0.73578709 0.080578491 0.095369495 0.88048369 0.080578595 0.072451986 
		1.0251803 0.080578595 0.0059425011 1.1557144 0.0805787 -0.097648926 1.2593068 0.080578655 
		-0.22818182 1.3258158 0.080578655 -0.37287846 1.3487329 0.080578491 -0.51757503 1.3258158 
		0.0805787 -0.64810777 1.2593068 0.0805787 -0.75169897 1.1557144 0.080578536 -0.81820792 
		1.0251803 0.080578536 -0.84112626 0.88048369 0.080578595;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "SmilePull_L" -p "_L";
	rename -uid "D2560A24-4A74-6D39-15C7-FEB44EAB3907";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "SmilePull_LShape" -p "SmilePull_L";
	rename -uid "6205569A-43B3-5E89-1A8B-A39DB130A509";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.0528486 0.886024 0 -0.95716769 
		0.80505335 -8.7060315e-008 -0.81975925 0.74079424 4.3530161e-008 -0.66567898 0.69953752 
		4.3530161e-008 -0.51542377 0.68532318 0 -0.38199589 0.6995374 0 -0.27313876 0.74079436 
		-8.7060315e-008 -0.19481386 0.80505347 -4.3530161e-008 -0.1487353 0.886024 -8.7060315e-008 
		-0.13349582 0.97578025 0 -0.1487353 1.0655397 0 -0.19481392 1.14651 8.7060315e-008 
		-0.27313888 1.2107675 4.3530161e-008 -0.3819955 1.2520212 4.3530161e-008 -0.51542377 
		1.266238 -8.7060315e-008 -0.66567886 1.2520248 8.7060315e-008 -0.81975937 1.2107679 
		8.7060315e-008 -0.95716745 1.1465106 -4.3530161e-008 -1.0528481 1.0655409 -4.3530161e-008 
		-1.0872103 0.97578025 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "SmileBulge_L" -p "_L";
	rename -uid "07DC5116-431A-E52D-8D8A-CBAAE36B71E8";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "SmileBulge_LShape" -p "SmileBulge_L";
	rename -uid "7653B723-4006-4C38-E9D1-F6BC7D089067";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -0.95745897 1.1478119 0 -0.85993218 
		1.0299532 -1.01658e-007 -0.7280637 0.93624806 5.0829001e-008 -0.57736844 0.87797976 
		5.0829001e-008 -0.42425048 0.86217743 0 -0.28381962 0.89050508 0 -0.16867323 0.95924008 
		-1.01658e-007 -0.088248521 1.0601829 -5.0829001e-008 -0.048628561 1.1820033 -1.01658e-007 
		-0.052448623 1.3117545 0 -0.098879546 1.4363899 0 -0.18382961 1.5440568 1.01658e-007 
		-0.30022934 1.6252369 5.0829001e-008 -0.43847269 1.6734308 5.0829001e-008 -0.58686125 
		1.6853957 -1.01658e-007 -0.73202163 1.6609057 1.01658e-007 -0.8596189 1.6022455 1.01658e-007 
		-0.95551306 1.5138274 -5.0829001e-008 -1.0077084 1.4021995 -5.0829001e-008 -1.0087205 
		1.276348 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "FrownBulge_L" -p "_L";
	rename -uid "F8614A16-470D-6000-87B3-6D83B1C09118";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "FrownBulge_LShape" -p "FrownBulge_L";
	rename -uid "3BA64344-4ACE-A2FB-79DE-FA9E918EFE55";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.0114456 0.49593407 0 -0.96708673 
		0.3741973 -1.01658e-007 -0.87750775 0.27780461 5.0829001e-008 -0.7529704 0.21356551 
		5.0829001e-008 -0.60660046 0.18610729 0 -0.45281225 0.19799036 0 -0.30598336 0.24921329 
		-1.01658e-007 -0.17944939 0.33660561 -5.0829001e-008 -0.084571183 0.45341563 -1.01658e-007 
		-0.029909385 0.58946246 0 -0.020576112 0.73188376 0 -0.057725418 0.86628431 1.01658e-007 
		-0.13844503 0.97825426 5.0829001e-008 -0.25585955 1.0550293 5.0829001e-008 -0.39951345 
		1.0872514 -1.01658e-007 -0.55601788 1.0706044 1.01658e-007 -0.70996928 1.0068461 
		1.01658e-007 -0.84536254 0.90387607 -5.0829001e-008 -0.94745094 0.77440351 -5.0829001e-008 
		-1.0048677 0.63349295 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "CheekBone_L" -p "_L";
	rename -uid "30E63191-412A-E1F4-D143-3A9CB7221CB4";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode mesh -n "CheekBone_LShape" -p "CheekBone_L";
	rename -uid "6E6A1897-42B2-DA90-B9AB-4F9FC1FECE9B";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999998509883881 0.84374997019767761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 20 ".pt[0:19]" -type "float3"  -1.3166271 1.4341868 0 -1.252702 
		1.3087273 -1.0729978e-007 -1.1531376 1.2091625 5.3649892e-008 -1.027679 1.1452377 
		5.3649892e-008 -0.88860542 1.1232108 0 -0.74953258 1.1452378 0 -0.62407351 1.2091626 
		-1.0729978e-007 -0.52450794 1.3087274 -5.3649892e-008 -0.46058327 1.4341868 -1.0729978e-007 
		-0.43855646 1.5732591 0 -0.46058327 1.712332 0 -0.52450806 1.8377898 1.0729978e-007 
		-0.62407362 1.9373558 5.3649892e-008 -0.74953258 2.0012805 5.3649892e-008 -0.88860542 
		2.0233076 -1.0729978e-007 -1.0276788 2.0012805 1.0729978e-007 -1.1531374 1.9373558 
		1.0729978e-007 -1.2527018 1.8377898 -5.3649892e-008 -1.3166268 1.712332 -5.3649892e-008 
		-1.3386536 1.5732591 0;
	setAttr -s 20 ".vt[0:19]"  0.47552863 0.15450823 0 0.4045088 0.29389298 1.1920929e-007
		 0.2938928 0.40450871 -5.9604645e-008 0.15450858 0.47552848 -5.9604645e-008 -3.5527137e-015 0.50000006 0
		 -0.15450858 0.47552842 0 -0.29389277 0.40450859 1.1920929e-007 -0.40450868 0.29389286 5.9604645e-008
		 -0.47552845 0.15450823 1.1920929e-007 -0.50000006 -2.3841858e-007 0 -0.47552845 -0.15450907 0
		 -0.40450862 -0.29389226 -1.1920929e-007 -0.29389265 -0.40450919 -5.9604645e-008 -0.15450853 -0.47552824 -5.9604645e-008
		 -1.4901165e-008 -0.49999988 1.1920929e-007 0.15450846 -0.47552824 -1.1920929e-007
		 0.29389265 -0.40450919 -1.1920929e-007 0.40450856 -0.29389226 5.9604645e-008 0.47552833 -0.15450907 5.9604645e-008
		 0.49999994 -2.3841858e-007 0;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0;
	setAttr -ch 20 ".fc[0]" -type "polyFaces" 
		f 20 19 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
		mu 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "B7A1C8A9-4D1B-36E1-FA59-3D834206D458";
	setAttr -s 12 ".lnk";
	setAttr -s 12 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "86EEDA70-4E58-AE11-0259-E697F7A1D115";
	setAttr ".cdl" 2;
	setAttr -s 4 ".dli[1:3]"  4 2 3;
createNode displayLayer -n "defaultLayer";
	rename -uid "EF9ECE25-47CE-AAAF-00EF-CBBEACABE009";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "14EBA17F-4302-1A65-9227-389A467A4193";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "8BBE17E7-403C-72CD-25C2-299FCFEC9D22";
	setAttr ".g" yes;
createNode surfaceShader -n "surfaceShaderBlue1";
	rename -uid "A1025614-483B-3B63-05AF-2CA4AE09A09C";
	setAttr ".oc" -type "float3" 0 0.86666656 1 ;
createNode shadingEngine -n "surfaceShaderBlue1SG";
	rename -uid "96D4FEC5-4833-BB60-A293-DBA9B9E20A67";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "208AB029-4196-52C1-311F-0890E65955FB";
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "510D9A73-480B-0B6F-9BE3-B8B81C4C06FD";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode surfaceShader -n "surfaceShaderSkin";
	rename -uid "48ACF156-412B-4613-F238-039623000034";
	setAttr ".oc" -type "float3" 0.86000001 0.64999998 0.55000001 ;
createNode shadingEngine -n "surfaceShaderSkinSG";
	rename -uid "7940CCB2-4A08-C4DE-580B-7584A5355E3C";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
	rename -uid "3CEA8BC7-456B-F764-C0D1-FF964A0A8F96";
createNode surfaceShader -n "surfaceShaderBlack";
	rename -uid "09B41682-456A-F15C-B23E-28BBD62D3F12";
createNode shadingEngine -n "surfaceShaderBlackSG";
	rename -uid "27097D4C-4BF2-8072-8A10-49A743CF74AD";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
	rename -uid "B5C42F21-448C-F2DF-84F5-8C87BA5936C6";
createNode surfaceShader -n "surfaceShaderWhite";
	rename -uid "D6E3C808-437B-CEF1-496C-28AAE91A4732";
	setAttr ".oc" -type "float3" 1 1 1 ;
createNode shadingEngine -n "surfaceShaderWhiteSG";
	rename -uid "81B05696-4B22-8C7E-CAE1-76B0E4DCBF8F";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo6";
	rename -uid "33D57D27-4C99-FFFB-5F26-1C89F2D488B1";
createNode surfaceShader -n "surfaceShaderRed";
	rename -uid "9A9BA37B-4506-3AE8-B0AE-52901F9A3010";
	setAttr ".oc" -type "float3" 0.90196079 0.070742019 0.070742019 ;
createNode shadingEngine -n "surfaceShaderRedSG";
	rename -uid "65A40CC6-41FD-BC51-EE95-948AC665439C";
	setAttr ".ihi" 0;
	setAttr -s 44 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo7";
	rename -uid "FD8D3517-4FBD-FCEB-FD49-F182FA2A69F9";
createNode groupId -n "groupId1";
	rename -uid "25141939-4C81-406A-455B-B098F9498F90";
	setAttr ".ihi" 0;
createNode groupId -n "groupId2";
	rename -uid "243D47BB-4A01-CC2D-BCD0-74B34BD2BF1B";
	setAttr ".ihi" 0;
createNode polyPlane -n "polyPlane1";
	rename -uid "4DC3A8B6-4626-DC21-0746-6BB16DD117A0";
	setAttr ".sw" 6;
	setAttr ".sh" 1;
	setAttr ".cuv" 2;
createNode surfaceShader -n "surfaceShaderGreen";
	rename -uid "19FB0793-4EFF-171F-FDAA-E385A1CDFEB7";
	setAttr ".oc" -type "float3" 0.40962312 0.7647059 0.32987311 ;
createNode shadingEngine -n "surfaceShaderGreenSG";
	rename -uid "EF6A9DE4-48C1-38BA-95A6-E4ACB71966BE";
	setAttr ".ihi" 0;
	setAttr -s 12 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo8";
	rename -uid "5FD26541-4FE1-7830-1D6D-8084DFD3396A";
createNode surfaceShader -n "surfaceShaderBrown";
	rename -uid "89604D92-46E7-5DBA-E701-C3888F254EB0";
	setAttr ".oc" -type "float3" 1 0.41666663 0 ;
createNode shadingEngine -n "surfaceShaderBrownSG";
	rename -uid "21FCA5B4-4DA1-1F61-3E6D-079CA4A1BC98";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo9";
	rename -uid "C2073FB0-47C6-3097-32B4-68A3A9FCF8D7";
createNode surfaceShader -n "surfaceShaderBlue2";
	rename -uid "83B98B3A-45EB-58FD-CA7B-E5A6D072CBD6";
	setAttr ".oc" -type "float3" 0.17301036 0.17301036 0.98039216 ;
createNode shadingEngine -n "surfaceShaderBlue2SG";
	rename -uid "423D40E4-40D0-098D-818D-99BBCB700EA2";
	setAttr ".ihi" 0;
	setAttr -s 25 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo10";
	rename -uid "CDA264F6-4D0B-13E6-A6FE-13AC9FFB678A";
createNode surfaceShader -n "surfaceShaderYellow";
	rename -uid "E433B8A6-4035-7B62-AE5A-55BE5709F5B5";
	setAttr ".oc" -type "float3" 0.89208817 0.77358663 0 ;
createNode shadingEngine -n "surfaceShaderYellowSG";
	rename -uid "FDC02A70-4860-D882-D357-338FDF728EFB";
	setAttr ".ihi" 0;
	setAttr -s 31 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 3 ".gn";
createNode materialInfo -n "materialInfo11";
	rename -uid "A2A39EA5-4237-0F90-D45C-6AA904335D10";
createNode groupId -n "groupId8";
	rename -uid "7476E3BC-4133-CD7C-C2E7-0FA3DBB4AAB3";
	setAttr ".ihi" 0;
createNode groupId -n "groupId9";
	rename -uid "08993D50-4E34-311E-BB57-6DB6410C76DD";
	setAttr ".ihi" 0;
createNode polySmoothFace -n "polySmoothFace1";
	rename -uid "67C4C502-4EDA-04FD-1917-8886514DA147";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".suv" yes;
	setAttr ".bnr" 0;
	setAttr ".ps" 0.10000000149011612;
	setAttr ".ro" 1;
	setAttr ".ma" yes;
	setAttr ".m08" yes;
createNode polySmoothFace -n "polySmoothFace2";
	rename -uid "17BA5252-4235-4012-3147-538409C3E5AB";
	setAttr ".ics" -type "componentList" 1 "f[0:3]";
	setAttr ".suv" yes;
	setAttr ".bnr" 0;
	setAttr ".ps" 0.10000000149011612;
	setAttr ".ro" 1;
	setAttr ".ma" yes;
	setAttr ".m08" yes;
createNode polySmoothFace -n "polySmoothFace3";
	rename -uid "E1FE4F61-47F1-8223-392D-74A74BBFEEEA";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".suv" yes;
	setAttr ".bnr" 0;
	setAttr ".ps" 0.10000000149011612;
	setAttr ".ro" 1;
	setAttr ".ma" yes;
	setAttr ".m08" yes;
createNode polyTweak -n "polyTweak1";
	rename -uid "759530CC-4648-4154-0832-53BA12DED765";
	setAttr ".uopa" yes;
	setAttr -s 25 ".tk[0:24]" -type "float3"  -2.44528413 -1.84336197 0
		 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413
		 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197
		 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413
		 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197
		 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413
		 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197
		 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0 -2.44528413 -1.84336197 0;
createNode deleteComponent -n "deleteComponent1";
	rename -uid "F0629078-4758-4556-0795-E79C63B74C4C";
	setAttr ".dc" -type "componentList" 16 "f[0:3]" "f[6:7]" "f[10]" "f[13:14]" "f[16:19]" "f[22:23]" "f[26]" "f[29:30]" "f[32:35]" "f[38:39]" "f[42]" "f[45:46]" "f[48:51]" "f[54:55]" "f[58]" "f[61:62]";
createNode deleteComponent -n "deleteComponent2";
	rename -uid "518F66E6-4BDE-F9AA-ADBD-3B98D3119474";
	setAttr ".dc" -type "componentList" 12 "e[8:12]" "e[16:20]" "e[25:26]" "e[29:30]" "e[36]" "e[39]" "e[43]" "e[45]" "e[56]" "e[59]" "e[63]" "e[65]";
createNode deleteComponent -n "deleteComponent3";
	rename -uid "6F387B6C-4567-0B39-E804-6896AC5CDE00";
	setAttr ".dc" -type "componentList" 9 "e[8:17]" "e[19]" "e[21]" "e[28]" "e[31]" "e[35]" "e[37]" "e[44]" "e[47]";
createNode deleteComponent -n "deleteComponent4";
	rename -uid "CC016D0D-4425-FA6D-B0EF-96BD2BF46055";
	setAttr ".dc" -type "componentList" 2 "vtx[16]" "vtx[26]";
createNode deleteComponent -n "deleteComponent5";
	rename -uid "DA6E286D-484F-A562-08AD-B4B92964BAB9";
	setAttr ".dc" -type "componentList" 2 "vtx[16]" "vtx[26]";
createNode deleteComponent -n "deleteComponent6";
	rename -uid "23D00100-44B8-271E-0718-119147E9CD2D";
	setAttr ".dc" -type "componentList" 1 "vtx[3]";
createNode deleteComponent -n "deleteComponent7";
	rename -uid "BE5F1CD9-4150-CB96-6379-63ADA93F44FC";
	setAttr ".dc" -type "componentList" 1 "vtx[0]";
createNode deleteComponent -n "deleteComponent8";
	rename -uid "C3E5861D-4669-152C-EA34-BD8BC1F2431D";
	setAttr ".dc" -type "componentList" 2 "vtx[15]" "vtx[25]";
createNode deleteComponent -n "deleteComponent9";
	rename -uid "89FA3547-4F13-5C0E-A9C3-FD9AFBC0D09A";
	setAttr ".dc" -type "componentList" 1 "vtx[0:1]";
createNode deleteComponent -n "deleteComponent10";
	rename -uid "3975DFEC-4D8D-717E-A46A-65AC40251509";
	setAttr ".dc" -type "componentList" 4 "vtx[8]" "vtx[11]" "vtx[13]" "vtx[18]";
createNode deleteComponent -n "deleteComponent11";
	rename -uid "3D003858-4673-A51A-C3A3-2487635BDACF";
	setAttr ".dc" -type "componentList" 4 "vtx[8]" "vtx[10]" "vtx[12]" "vtx[16]";
createNode deleteComponent -n "deleteComponent12";
	rename -uid "C7181652-46F5-408C-9787-7F9A5ED2F97B";
	setAttr ".dc" -type "componentList" 2 "vtx[8]" "vtx[10]";
createNode groupId -n "groupId10";
	rename -uid "61730AC8-4C4B-1075-04D2-28A62573ED88";
	setAttr ".ihi" 0;
createNode displayLayer -n "defaultLayer1";
	rename -uid "A2A79002-4621-9ECD-EBD3-979C0314A794";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "7D0CC85F-4660-665D-114C-2C9072E1270A";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "AF719BF0-4B1B-5439-F36B-9CB48B81F7B6";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n"
		+ "                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 765\n                -height 361\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n"
		+ "            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 765\n            -height 361\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n"
		+ "                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n"
		+ "                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 764\n                -height 361\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n"
		+ "            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n"
		+ "            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 764\n            -height 361\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n"
		+ "                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n"
		+ "                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1535\n                -height 748\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n"
		+ "            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n"
		+ "            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1535\n            -height 748\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n"
		+ "                -width 764\n                -height 361\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 764\n            -height 361\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n"
		+ "                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n"
		+ "            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n"
		+ "            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\toutlinerPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n"
		+ "                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.041667\n"
		+ "                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n"
		+ "                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.041667\n                -resultScreenSamples 0\n"
		+ "                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n"
		+ "                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n"
		+ "                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n"
		+ "                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n"
		+ "                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"profilerPanel\" -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n"
		+ "                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n"
		+ "                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n"
		+ "                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n"
		+ "                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Front View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Front View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera front` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1535\\n    -height 748\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Front View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera front` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1535\\n    -height 748\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode surfaceShader -n "surfaceShaderGreen2";
	rename -uid "97E81277-4305-6E4C-BAD7-019F6134B750";
	setAttr ".oc" -type "float3" 0.39210001 0.66659999 0.46419999 ;
createNode shadingEngine -n "surfaceShader1SG";
	rename -uid "E939A756-4D29-9C19-8507-D1B8CD9663C7";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo12";
	rename -uid "F336B86C-4931-C808-45AB-AB8C0FBC5787";
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 0;
	setAttr -av ".unw";
	setAttr -k on ".etw";
	setAttr -k on ".tps";
	setAttr -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr ".vac" 2;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 12 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 14 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
	setAttr -s 2 ".r";
select -ne :defaultRenderGlobals;
	setAttr ".ep" 1;
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".w" 640;
	setAttr -av -k on ".h" 480;
	setAttr -av -k on ".pa";
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar" 1.3333332538604736;
	setAttr -av -k on ".ldar";
	setAttr -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -k on ".isu";
	setAttr -k on ".pdu";
select -ne :defaultColorMgtGlobals;
	setAttr ".cme" no;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "groupId1.id" "face_MShape.iog.og[0].gid";
connectAttr "surfaceShaderSkinSG.mwc" "face_MShape.iog.og[0].gco";
connectAttr "groupId2.id" "nose_MShape.iog.og[0].gid";
connectAttr "surfaceShaderBlackSG.mwc" "nose_MShape.iog.og[0].gco";
connectAttr "polyPlane1.out" "lip2_MShape.i";
connectAttr "groupId9.id" "upperFace_MShape.iog.og[0].gid";
connectAttr "surfaceShaderYellowSG.mwc" "upperFace_MShape.iog.og[0].gco";
connectAttr "groupId10.id" "middleFace_MShape.iog.og[0].gid";
connectAttr "surfaceShaderYellowSG.mwc" "middleFace_MShape.iog.og[0].gco";
connectAttr "groupId8.id" "lowerFace_MShape.iog.og[0].gid";
connectAttr "surfaceShaderYellowSG.mwc" "lowerFace_MShape.iog.og[0].gco";
connectAttr "deleteComponent12.og" "AimEye_MShape.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShaderBlue1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShaderSkinSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShaderBlackSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShaderWhiteSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShaderRedSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShaderGreenSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShaderBrownSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShaderBlue2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShaderYellowSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShaderBlue1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShaderSkinSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShaderBlackSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShaderWhiteSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShaderRedSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShaderGreenSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShaderBrownSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShaderBlue2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShaderYellowSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShader1SG.message" ":defaultLightSet.message";
connectAttr "surfaceShaderBlue1.oc" "surfaceShaderBlue1SG.ss";
connectAttr "surfaceShaderBlue1SG.msg" "materialInfo1.sg";
connectAttr "surfaceShaderBlue1.msg" "materialInfo1.m";
connectAttr "surfaceShaderBlue1.msg" "materialInfo1.t" -na;
connectAttr "surfaceShaderSkin.oc" "surfaceShaderSkinSG.ss";
connectAttr "ear_RShape.iog" "surfaceShaderSkinSG.dsm" -na;
connectAttr "face_MShape.iog.og[0]" "surfaceShaderSkinSG.dsm" -na;
connectAttr "ear_LShape.iog" "surfaceShaderSkinSG.dsm" -na;
connectAttr "groupId1.msg" "surfaceShaderSkinSG.gn" -na;
connectAttr "surfaceShaderSkinSG.msg" "materialInfo3.sg";
connectAttr "surfaceShaderSkin.msg" "materialInfo3.m";
connectAttr "surfaceShaderSkin.msg" "materialInfo3.t" -na;
connectAttr "surfaceShaderBlack.oc" "surfaceShaderBlackSG.ss";
connectAttr "pupil_RShape.iog" "surfaceShaderBlackSG.dsm" -na;
connectAttr "eyeBrow_RShape.iog" "surfaceShaderBlackSG.dsm" -na;
connectAttr "hair_RShape.iog" "surfaceShaderBlackSG.dsm" -na;
connectAttr "nose_MShape.iog.og[0]" "surfaceShaderBlackSG.dsm" -na;
connectAttr "lip2_MShape.iog" "surfaceShaderBlackSG.dsm" -na;
connectAttr "pupil_LShape.iog" "surfaceShaderBlackSG.dsm" -na;
connectAttr "eyeBrow_LShape.iog" "surfaceShaderBlackSG.dsm" -na;
connectAttr "hair_LShape.iog" "surfaceShaderBlackSG.dsm" -na;
connectAttr "groupId2.msg" "surfaceShaderBlackSG.gn" -na;
connectAttr "surfaceShaderBlackSG.msg" "materialInfo5.sg";
connectAttr "surfaceShaderBlack.msg" "materialInfo5.m";
connectAttr "surfaceShaderBlack.msg" "materialInfo5.t" -na;
connectAttr "surfaceShaderWhite.oc" "surfaceShaderWhiteSG.ss";
connectAttr "eyeBall_RShape.iog" "surfaceShaderWhiteSG.dsm" -na;
connectAttr "upperTeeth_MShape.iog" "surfaceShaderWhiteSG.dsm" -na;
connectAttr "lowerTeeth_MShape.iog" "surfaceShaderWhiteSG.dsm" -na;
connectAttr "eyeBall_LShape.iog" "surfaceShaderWhiteSG.dsm" -na;
connectAttr "surfaceShaderWhiteSG.msg" "materialInfo6.sg";
connectAttr "surfaceShaderWhite.msg" "materialInfo6.m";
connectAttr "surfaceShaderWhite.msg" "materialInfo6.t" -na;
connectAttr "surfaceShaderRed.oc" "surfaceShaderRedSG.ss";
connectAttr "TongueShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "squashTop_MShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "squashMiddle_MShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "squashBase_MShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "EyeBrowMid1_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "EyeBrowMid2_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "EyeBrowMid3_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "EyeBrowOuter_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLid1_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLipA_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLipA_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "cornerLip_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "EyeBrowInner_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLid2_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLid3_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLid4_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLid1_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLid2_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLid3_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLid4_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLipB_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLipC_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLipB_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLipC_RShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLipA_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLipA_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLid1_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLid2_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLid3_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLid4_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLid1_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLid2_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLid3_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLid4_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "EyeBrowInner_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "EyeBrowMid1_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "EyeBrowMid2_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "EyeBrowMid3_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "EyeBrowOuter_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "cornerLip_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLipB_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "upperLipC_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLipB_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "lowerLipC_LShape.iog" "surfaceShaderRedSG.dsm" -na;
connectAttr "surfaceShaderRedSG.msg" "materialInfo7.sg";
connectAttr "surfaceShaderRed.msg" "materialInfo7.m";
connectAttr "surfaceShaderRed.msg" "materialInfo7.t" -na;
connectAttr "surfaceShaderGreen.oc" "surfaceShaderGreenSG.ss";
connectAttr "Lip_RShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "upperLip_MShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "lowerLip_MShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "upperLid_RShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "lowerLid_RShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "innerLid_RShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "outerLid_RShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "Lip_LShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "innerLid_LShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "outerLid_LShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "upperLid_LShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "lowerLid_LShape.iog" "surfaceShaderGreenSG.dsm" -na;
connectAttr "surfaceShaderGreenSG.msg" "materialInfo8.sg";
connectAttr "surfaceShaderGreen.msg" "materialInfo8.m";
connectAttr "surfaceShaderGreen.msg" "materialInfo8.t" -na;
connectAttr "surfaceShaderBrown.oc" "surfaceShaderBrownSG.ss";
connectAttr "surfaceShaderBrownSG.msg" "materialInfo9.sg";
connectAttr "surfaceShaderBrown.msg" "materialInfo9.m";
connectAttr "surfaceShaderBrown.msg" "materialInfo9.t" -na;
connectAttr "surfaceShaderBlue2.oc" "surfaceShaderBlue2SG.ss";
connectAttr "FaceControlSetShape1.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "FaceControlSetShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "FaceControlSetShape2.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "FaceControlSetShape3.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "iris_RShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "EyeBrowCenter_MShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "Nostril_RShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "NoseBridge_MShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "NoseSide_RShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "NoseCorner_RShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "Nose_MShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "NoseCrease_MShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "SmileBulge_RShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "FrownBulge_RShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "Cheek_RShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "CheekBone_RShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "ChinCrease_MShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "Cheek_LShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "iris_LShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "NoseCorner_LShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "Nostril_LShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "NoseSide_LShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "SmileBulge_LShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "FrownBulge_LShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "CheekBone_LShape.iog" "surfaceShaderBlue2SG.dsm" -na;
connectAttr "surfaceShaderBlue2SG.msg" "materialInfo10.sg";
connectAttr "surfaceShaderBlue2.msg" "materialInfo10.m";
connectAttr "surfaceShaderBlue2.msg" "materialInfo10.t" -na;
connectAttr "surfaceShaderYellow.oc" "surfaceShaderYellowSG.ss";
connectAttr "Jaw_MShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "lowerFace_MShape.iog.og[0]" "surfaceShaderYellowSG.dsm" -na;
connectAttr "upperFace_MShape.iog.og[0]" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlBrow_RShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "Tongue0_MShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "Tongue1_MShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "Tongue2_MShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "Tongue3_MShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlEye_RShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlCheek_RShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlNose_RShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlMouthCorner_RShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlBrow_LShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlEye_LShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlCheek_LShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlNose_LShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlMouthCorner_LShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlBoxShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "AimEye_MShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "AimEye_RShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "AimEye_LShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "EyeRegion_RShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "EyeBrowRegion_RShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "middleFace_MShape.iog.og[0]" "surfaceShaderYellowSG.dsm" -na;
connectAttr "LipRegion_MShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlMouth_MShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "ctrlLips_MShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "SmilePull_RShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "EyeRegion_LShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "EyeBrowRegion_LShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "SmilePull_LShape.iog" "surfaceShaderYellowSG.dsm" -na;
connectAttr "groupId8.msg" "surfaceShaderYellowSG.gn" -na;
connectAttr "groupId9.msg" "surfaceShaderYellowSG.gn" -na;
connectAttr "groupId10.msg" "surfaceShaderYellowSG.gn" -na;
connectAttr "surfaceShaderYellowSG.msg" "materialInfo11.sg";
connectAttr "surfaceShaderYellow.msg" "materialInfo11.m";
connectAttr "surfaceShaderYellow.msg" "materialInfo11.t" -na;
connectAttr "|Group|_M|AimEye_M|polySurfaceShape1.o" "polySmoothFace1.ip";
connectAttr "polySmoothFace1.out" "polySmoothFace2.ip";
connectAttr "polyTweak1.out" "polySmoothFace3.ip";
connectAttr "polySmoothFace2.out" "polyTweak1.ip";
connectAttr "polySmoothFace3.out" "deleteComponent1.ig";
connectAttr "deleteComponent1.og" "deleteComponent2.ig";
connectAttr "deleteComponent2.og" "deleteComponent3.ig";
connectAttr "deleteComponent3.og" "deleteComponent4.ig";
connectAttr "deleteComponent4.og" "deleteComponent5.ig";
connectAttr "deleteComponent5.og" "deleteComponent6.ig";
connectAttr "deleteComponent6.og" "deleteComponent7.ig";
connectAttr "deleteComponent7.og" "deleteComponent8.ig";
connectAttr "deleteComponent8.og" "deleteComponent9.ig";
connectAttr "deleteComponent9.og" "deleteComponent10.ig";
connectAttr "deleteComponent10.og" "deleteComponent11.ig";
connectAttr "deleteComponent11.og" "deleteComponent12.ig";
connectAttr "layerManager.dli[0]" "defaultLayer1.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "surfaceShaderGreen2.oc" "surfaceShader1SG.ss";
connectAttr "lowerLidOuter_RShape.iog" "surfaceShader1SG.dsm" -na;
connectAttr "lowerLidOuter_LShape.iog" "surfaceShader1SG.dsm" -na;
connectAttr "surfaceShader1SG.msg" "materialInfo12.sg";
connectAttr "surfaceShaderGreen2.msg" "materialInfo12.m";
connectAttr "surfaceShaderGreen2.msg" "materialInfo12.t" -na;
connectAttr "surfaceShaderBlue1SG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShaderSkinSG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShaderBlackSG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShaderWhiteSG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShaderRedSG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShaderGreenSG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShaderBrownSG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShaderBlue2SG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShaderYellowSG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShaderBlue1.msg" ":defaultShaderList1.s" -na;
connectAttr "surfaceShaderSkin.msg" ":defaultShaderList1.s" -na;
connectAttr "surfaceShaderBlack.msg" ":defaultShaderList1.s" -na;
connectAttr "surfaceShaderWhite.msg" ":defaultShaderList1.s" -na;
connectAttr "surfaceShaderRed.msg" ":defaultShaderList1.s" -na;
connectAttr "surfaceShaderGreen.msg" ":defaultShaderList1.s" -na;
connectAttr "surfaceShaderBrown.msg" ":defaultShaderList1.s" -na;
connectAttr "surfaceShaderBlue2.msg" ":defaultShaderList1.s" -na;
connectAttr "surfaceShaderYellow.msg" ":defaultShaderList1.s" -na;
connectAttr "surfaceShaderGreen2.msg" ":defaultShaderList1.s" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
// End of face.ma
