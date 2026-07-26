//Maya ASCII 2012 scene
//Name: CharacterCreator4.ma
//Last modified: Tue, May 17, 2022 10:06:24 AM
//Codeset: 1252
requires maya "2012";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 x64";
fileInfo "cutIdentifier" "201201172029-821146";
fileInfo "osv" "Microsoft Home Premium Edition, 64-bit  (Build 9200)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -3.9125783881610077 10.27864960293674 8.0015828238579978 ;
	setAttr ".r" -type "double3" -48.938352729589859 -42.599999999998559 4.3208358477664928e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".ncp" 1;
	setAttr ".coi" 5.1876724506241576;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -7.6074421785860782 13.36326202335686 -0.43883993575919211 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.7264069420482282 100.1 1.2933990924994205 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-016 -1.4210854715202004e-014 ;
	setAttr ".rpt" -type "double3" 0 -1.3988810110276976e-014 1.4432899320127038e-014 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".coi" 91.268804728154876;
	setAttr ".ow" 7.1063257065948857;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".tp" -type "double3" -1.219239373601789 8.8311952718451181 1.4205816554809636 ;
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.6837553942394536 13.071873013749043 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".coi" 99.920509008715115;
	setAttr ".ow" 5.6983240223463678;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" -0.40419161676646675 12.619760479041922 0.17949099128487944 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 13.587020432098861 -3.2793991425229412 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 1;
	setAttr ".coi" 100.1;
	setAttr ".ow" 15.911612256371512;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "FitSkeleton";
	addAttr -ci true -sn "visCylinders" -ln "visCylinders" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "visBoxes" -ln "visBoxes" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "visBones" -ln "visBones" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "lockCenterJoints" -ln "lockCenterJoints" -dv 1 -min 0 -max 
		1 -at "bool";
	addAttr -ci true -sn "visGap" -ln "visGap" -dv 0.75 -min 0 -max 1 -at "double";
	addAttr -ci true -m -im false -sn "drivingSystem" -ln "drivingSystem" -at "message";
	addAttr -ci true -m -sn "drivingSystem_Fingers_R" -ln "drivingSystem_Fingers_R" 
		-dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -m -sn "drivingSystem_Fingers_L" -ln "drivingSystem_Fingers_L" 
		-dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "visGeo" -ln "visGeo" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "visGeoType" -ln "visGeoType" -min 0 -max 3 -en "cylinders:boxes:spheres:bones" 
		-at "enum";
	addAttr -ci true -sn "visSpheres" -ln "visSpheres" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "visPoleVector" -ln "visPoleVector" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "visJointOrient" -ln "visJointOrient" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "visJointAxis" -ln "visJointAxis" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "objectsSkin" -ln "objectsSkin" -dt "string";
	addAttr -ci true -sn "objectsAll" -ln "objectsAll" -dt "string";
	addAttr -ci true -sn "objectsRightEye" -ln "objectsRightEye" -dt "string";
	addAttr -ci true -sn "objectsLeftEye" -ln "objectsLeftEye" -dt "string";
	addAttr -ci true -sn "gameEngine" -ln "gameEngine" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "zUpAxis" -ln "zUpAxis" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mirTrans" -ln "mirTrans" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "primaryAxis" -ln "primaryAxis" -min 0 -max 5 -en "X:Y:Z:-X:-Y:-Z" 
		-at "enum";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dv 1 -min 0 -max 5 -en 
		"X:Y:Z:-X:-Y:-Z" -at "enum";
	addAttr -ci true -sn "worldmatch" -ln "worldmatch" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "preRebuildScript" -ln "preRebuildScript" -dt "string";
	addAttr -ci true -sn "postRebuildScript" -ln "postRebuildScript" -dt "string";
	setAttr -l on ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr ".visCylinders" yes;
	setAttr ".visGap" 1;
	setAttr -s 36 ".drivingSystem";
	setAttr -s 18 ".drivingSystem_Fingers_R";
	setAttr -s 18 ".drivingSystem_Fingers_R";
	setAttr -s 18 ".drivingSystem_Fingers_L";
	setAttr -s 18 ".drivingSystem_Fingers_L";
createNode nurbsCurve -n "FitSkeletonShape" -p "FitSkeleton";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 29;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.3508348746736751 1.4394712022965405e-016 -2.3508348746736716
		-3.7929511823487981e-016 2.035719696933274e-016 -3.3245825626631635
		-2.3508348746736729 1.4394712022965413e-016 -2.3508348746736729
		-3.3245825626631635 5.899006384856358e-032 -9.6338085217116898e-016
		-2.3508348746736734 -1.4394712022965408e-016 2.350834874673672
		-1.0017616090771558e-015 -2.0357196969332745e-016 3.3245825626631644
		2.3508348746736716 -1.4394712022965413e-016 2.3508348746736729
		3.3245825626631635 -1.0933890203714376e-031 1.7856397797841755e-015
		2.3508348746736751 1.4394712022965405e-016 -2.3508348746736716
		-3.7929511823487981e-016 2.035719696933274e-016 -3.3245825626631635
		-2.3508348746736729 1.4394712022965413e-016 -2.3508348746736729
		;
createNode joint -n "Root" -p "FitSkeleton";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "numMainExtras" -ln "numMainExtras" -min 0 -at "long";
	addAttr -ci true -k true -sn "centerBtwFeet" -ln "centerBtwFeet" -dv 1 -min 0 -max 
		1 -at "bool";
	setAttr ".t" -type "double3" 1.9709482123356974e-016 9.8285101990184387 -0.17717208138029261 ;
	setAttr -l on ".tx";
	setAttr ".r" -type "double3" 1.2722218725854051e-014 6.0430538947806815e-014 -2.8624992133171654e-014 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999972 8.0332256276735148 89.999999999999972 ;
	setAttr ".dl" yes;
	setAttr ".typ" 1;
	setAttr ".otp" -type "string" "Mid";
	setAttr -k on ".fat" 1.7000000000000002;
	setAttr -k on ".fatY" 0.64999999999999991;
	setAttr ".fatYabs" 1.1050000190734863;
	setAttr ".fatZabs" 1.7000000476837158;
	setAttr -k on ".centerBtwFeet" no;
createNode joint -n "Spine1" -p "Root";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1.477376426915626 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.92528905957719765 -4.4408920985006262e-016 -7.5302564402681694e-016 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 1.1698195932398265e-015 4.3145191267857631e-014 3.2998254820183988e-014 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 7.3577997504263697e-015 -1.3362880050978602e-015 3.1062237164616171 ;
	setAttr -k on ".fat" 1.7;
	setAttr -k on ".fatY" 0.65;
	setAttr ".fatYabs" 1.1050000190734863;
	setAttr ".fatZabs" 1.7000000476837158;
createNode joint -n "Spine2" -p "Spine1";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1.477376426915626 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1 3.3306690738754696e-016 -7.5302564402681773e-016 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 1.0578779712474204e-016 -5.9021629408422422e-015 2.3854160110976376e-015 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.8342966812510755e-015 -6.6431168152229127e-015 
		-2.0536692815051256 ;
	setAttr -k on ".fat" 1.7;
	setAttr -k on ".fatY" 0.65;
	setAttr ".fatYabs" 1.1050000190734863;
	setAttr ".fatZabs" 1.7000000476837158;
createNode joint -n "Chest" -p "Spine2";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.2563583173390818 -2.4424906541753444e-015 1.2942020449036312e-016 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -2.9420559701351968e-014 -2.2486456079175202e-013 2.0991660897659216e-013 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.0627727383470141e-014 -7.5499239624495499e-015 14.908110820408371 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Chest";
	setAttr -k on ".fat" 1.7000000000000002;
	setAttr -k on ".fatY" 0.64999999999999991;
	setAttr ".fatYabs" 1.1050000190734863;
	setAttr ".fatZabs" 1.7000000476837158;
createNode joint -n "Neck" -p "Chest";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "inbetweenJoints" -ln "inbetweenJoints" -dv 2 -min 
		0 -max 10 -at "long";
	addAttr -ci true -k true -sn "unTwister" -ln "unTwister" -dv 1 -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.1676556525613417 4.4408920985006262e-015 4.5826128503804085e-015 ;
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.1076232804412615e-014 -8.6752310281080064e-015 2.3956597842176208 ;
	setAttr ".pa" -type "double3" -1.7940447748746266e-016 6.8425179703803005e-015 0 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "37";
	setAttr -k on ".fat" 0.32;
	setAttr ".fatYabs" 1;
	setAttr ".fatZabs" 1;
createNode joint -n "Head" -p "Neck";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "global" -ln "global" -min 0 -max 10 -at "long";
	setAttr ".t" -type "double3" 1.5550714897106275 7.5495165674510645e-015 -1.8790908431251768e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.4171628879705053e-015 -1.0104162529466103e-014 -10.323099411908967 ;
	setAttr ".otp" -type "string" "36";
	setAttr -k on ".fat" 0.32;
	setAttr ".fatYabs" 1;
	setAttr ".fatZabs" 1;
createNode joint -n "HeadEnd" -p "Head";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.5016973184746245 -2.0816681711721685e-016 4.180685238204774e-016 ;
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "23";
	setAttr -k on ".fat" 0.35;
	setAttr ".fatYabs" 0.34999999403953552;
	setAttr ".fatZabs" 0.34999999403953552;
createNode joint -n "Eye" -p "Head";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "aim" -ln "aim" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "noFlip" -ln "noFlip" -dv 1 -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0.22353608309407669 1.0518800641046895 -0.34230120203334424 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.01041625294661e-014 -8.7782722508975471e-015 89.999999999999972 ;
	setAttr ".pa" -type "double3" 8.9959671327899885e-014 -89.999999999998849 0 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Eye";
	setAttr -k on ".fat" 0.19999999999999996;
createNode joint -n "EyeEnd" -p "Eye";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.19999999999999996 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.17087016112135622 -7.1054273576010019e-015 2.3314683517128287e-015 ;
	setAttr ".ro" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "24";
createNode joint -n "Jaw" -p "Head";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" -0.28087979879352432 0.40553446789889447 -6.4112579558896887e-016 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 1.9008584441034778e-016 1.1472998378343579e-016 -5.915831707522141e-013 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.3030536962539386e-014 -3.0589656095876041e-015 
		117.77221494634273 ;
	setAttr ".otp" -type "string" "31";
	setAttr ".radi" 0.5;
	setAttr -k on ".fat" 0.19999999999999996;
	setAttr ".fatYabs" 0.20000000298023224;
	setAttr ".fatZabs" 0.20000000298023224;
createNode joint -n "JawEnd" -p "Jaw";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.19999999999999996 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.0828940539241314 -1.0658141036401503e-014 -2.1684043449918151e-018 ;
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "25";
	setAttr ".fatYabs" 0.20000000298023224;
	setAttr ".fatZabs" 0.20000000298023224;
createNode joint -n "Scapula" -p "Chest";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.65 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.76420093764430241 0.27528914379522629 -0.43653594851735023 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 57.954651186694825 90.021230553568984 50.020358430376461 ;
	setAttr ".otp" -type "string" "PropA1";
	setAttr ".fatYabs" 0.64999997615814209;
	setAttr ".fatZabs" 0.64999997615814209;
createNode joint -n "Shoulder" -p "Scapula";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "twistJoints" -ln "twistJoints" -dv 2 -min 0 -max 10 
		-at "long";
	addAttr -ci true -k true -sn "bendyJoints" -ln "bendyJoints" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.0925408230395584 -4.7739590058881731e-015 -3.730349362740526e-014 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.0003023521614281286 -0.0116082645989247 -2.9840096586893461 ;
	setAttr ".pa" -type "double3" -4.1293130717023516e-007 0 0 ;
	setAttr ".dl" yes;
	setAttr ".typ" 10;
	setAttr -k on ".fat" 0.65;
	setAttr ".fatYabs" 0.64999997615814209;
	setAttr ".fatZabs" 0.64999997615814209;
createNode joint -n "Elbow" -p "Shoulder";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "twistJoints" -ln "twistJoints" -dv 2 -min 0 -max 10 
		-at "long";
	addAttr -ci true -k true -sn "bendyJoints" -ln "bendyJoints" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.614251904276836 -1.1102230246251565e-015 -1.0125233984581428e-013 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.3164048709680421e-014 -2.4785963240311399e-015 
		6.3821889474816311 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "22";
	setAttr -k on ".fat" 0.44999999999999984;
	setAttr ".fatYabs" 0.44999998807907104;
	setAttr ".fatZabs" 0.44999998807907104;
createNode joint -n "Wrist" -p "Elbow";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.2826034776256083 3.219646771412954e-015 6.0929039591428591e-013 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.9091093114858882e-014 -9.7411675835368777e-015 -3.1442979433177745 ;
	setAttr ".dl" yes;
	setAttr ".typ" 12;
	setAttr -k on ".fat" 0.16999999999999987;
	setAttr -k on ".fatY" 2.3100000000000005;
	setAttr ".fatYabs" 0.39269998669624329;
	setAttr ".fatZabs" 0.17000000178813934;
createNode joint -n "MiddleFinger1" -p "Wrist";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.96324969781290015 -7.4940054162198066e-016 8.5265128291212022e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.069474194567567649 4.7753179570062123 -1.0703664054077999 ;
	setAttr ".pa" -type "double3" -2.490303168013669e-017 3.8068719241856406 -4.0949047407001542 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "21";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "MiddleFinger2" -p "MiddleFinger1";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.31064094986493096 5.2589196886110301e-011 -9.1535667934294906e-012 ;
	setAttr ".r" -type "double3" 3.7130456519106208e-013 1.7565739219818359e-011 -2.4081956857245301e-013 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.036678948879729757 -2.5199985860300944 -0.0025734866816322578 ;
	setAttr ".pa" -type "double3" 0 0 2.5199999009299203 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "20";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "MiddleFinger3" -p "MiddleFinger2";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.17127015324651396 -8.4654505627668186e-016 -5.1514348342607263e-014 ;
	setAttr ".r" -type "double3" 1.1733426841682462e-012 -2.71109840226898e-011 1.1947327360958266e-013 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.053454832775716624 -3.6712936380785068 -0.0014021136048479931 ;
	setAttr ".pa" -type "double3" 0 0 3.6712939054552742 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "19";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "MiddleFinger4" -p "MiddleFinger3";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.11999999999999991 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.20934604463340989 5.6898930012039273e-016 9.9475983006414026e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "18";
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "ThumbFinger1" -p "Wrist";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.20461739209543683 0.14401466776458444 -0.10091871133417385 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -52.264000000000031 19.323320728472126 38.204070154936694 ;
	setAttr ".pa" -type "double3" -34.462082586865911 -8.7285733235282201 -1.7903981777634761 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "4";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "ThumbFinger2" -p "ThumbFinger1";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.35088249761039442 1.5418422094626294e-009 2.0206210038509198e-009 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.272221872585407e-014 0 0 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "3";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "ThumbFinger3" -p "ThumbFinger2";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.16868589271562484 -5.3290705182007514e-015 2.6645352591003757e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.272221872585407e-014 0 0 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "2";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "ThumbFinger4" -p "ThumbFinger3";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.11999999999999991 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.20328945754907446 -3.6920998347511613e-007 -2.3594029396889482e-007 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "1";
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "IndexFinger1" -p "Wrist";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.86185771241538056 0.23611421711558825 -0.017444365616482216 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.90355498164830272 3.1740263719529995 15.663230087321057 ;
	setAttr ".pa" -type "double3" 0.065532877363568762 20.527688987272207 -2.5422327562497964 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "8";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "IndexFinger2" -p "IndexFinger1";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.26385832488509031 2.14572803969304e-011 1.0186695931224676e-010 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.4503316291079759e-014 1.0289436055681902e-014 -3.1805546814635176e-015 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "7";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "IndexFinger3" -p "IndexFinger2";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.17551941301194063 -7.3274719625260332e-015 -4.2632564145606011e-014 ;
	setAttr ".r" -type "double3" -2.2601758467173082e-014 -1.3382319176368569e-011 -2.4100777339207023e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.6418340242699887 -5.7596206078048704 0.066225387225886653 ;
	setAttr ".pa" -type "double3" 0 0 5.7600000490223469 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "6";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "IndexFinger4" -p "IndexFinger3";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.11999999999999991 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.18547823185201295 -6.6613381477509392e-015 4.6185277824406512e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "5";
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "Cup" -p "Wrist";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.20323019781153562 -0.10161048216052657 -0.0011398720918069927 ;
	setAttr ".r" -type "double3" -6.8683208663283896e-013 -4.1667751135516989e-013 -6.6145598141059057e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.0059550925498066 1.7424892809816561 -1.2307561597939007 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "17";
	setAttr -k on ".fat" 0.12;
createNode joint -n "PinkyFinger1" -p "Cup";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.62754244723949615 -0.26617416474725852 -0.067754977505098068 ;
	setAttr ".r" -type "double3" -1.7632200015392385e-013 2.3948533131915418e-011 -1.3883121184588617e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.25514786318533678 7.9056585001255444 -19.118144524083082 ;
	setAttr ".pa" -type "double3" -0.21586850671656455 -15.856897343794616 -7.9762775885025459 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "12";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "PinkyFinger2" -p "PinkyFinger1";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.2327322463469077 -5.3290705182007514e-015 -9.5923269327613525e-014 ;
	setAttr ".r" -type "double3" 2.8649638811219456e-013 2.0305837997493721e-011 -2.1012564347860122e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.26683083078459929 -0.71917589712375041 -0.034439123916582923 ;
	setAttr ".pa" -type "double3" 0 0 0.71999997359174039 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "11";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "PinkyFinger3" -p "PinkyFinger2";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.14230168593650916 -4.4408920985006262e-015 -6.0396132539608516e-014 ;
	setAttr ".r" -type "double3" -2.8462858388645706e-013 -1.7607193137131149e-011 -1.4091348123889878e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.1588765498905742 -5.7546090601920978 -0.24956300887638949 ;
	setAttr ".pa" -type "double3" 0 0 5.7599997887354624 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "10";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "PinkyFinger4" -p "PinkyFinger3";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.11999999999999991 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.17792340227426173 -4.6629367034256575e-015 6.0396132539608516e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "9";
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "RingFinger1" -p "Cup";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.69154324538590117 -0.11648145124884446 -0.030327918943218179 ;
	setAttr ".r" -type "double3" -1.4623097109260214e-014 2.4107461473654808e-011 2.0785608165658896e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.9063998637325059 0.72009083270416618 -6.452421383137553 ;
	setAttr ".pa" -type "double3" -0.07133019936876682 -2.835223641928581 -1.4417652325251511 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "16";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "RingFinger2" -p "RingFinger1";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.28952412379076087 1.0436096431476471e-014 -1.2434497875801753e-013 ;
	setAttr ".r" -type "double3" 1.0336733800154619e-012 -4.3494555398877609e-011 -1.2197481558599055e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.28317914938274807 2.1599955702211808 0.0043909097713090307 ;
	setAttr ".pa" -type "double3" 0 0 -2.1600000310934706 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "15";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "RingFinger3" -p "RingFinger2";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.17506027476895891 -3.9968028886505635e-015 1.4033219031261979e-013 ;
	setAttr ".r" -type "double3" 1.8038228375818511e-013 5.9856630238224429e-012 -2.1622149955071499e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.56783371127766014 -4.3198948128062353 -0.030192099090902702 ;
	setAttr ".pa" -type "double3" 0 0 4.3200001190538568 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "14";
	setAttr -k on ".fat" 0.11999999999999991;
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "RingFinger4" -p "RingFinger3";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.11999999999999991 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.1936935482279738 -7.4384942649885488e-015 -2.8421709430404007e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "13";
	setAttr ".fatYabs" 0.11999999731779099;
	setAttr ".fatZabs" 0.11999999731779099;
createNode joint -n "Breast" -p "Chest";
	setAttr ".t" -type "double3" -0.29517515073380984 0.99839136656641458 -0.64831231391964472 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 6.8187328975173349 -8.4424333506913439e-015 82.072560372308644 ;
createNode joint -n "BreastEnd" -p "Breast";
	setAttr ".t" -type "double3" 0.3 1.7763568394002505e-015 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode joint -n "Hip" -p "Root";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "twistJoints" -ln "twistJoints" -dv 2 -min 0 -max 10 
		-at "long";
	addAttr -ci true -k true -sn "bendyJoints" -ln "bendyJoints" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -0.19968944689688328 -0.082240221781533229 -0.81968660714779051 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.57203838694880937 178.21077998921388 2.8717939465701359 ;
	setAttr ".dl" yes;
	setAttr ".typ" 2;
	setAttr -k on ".fat" 0.87;
	setAttr ".fatYabs" 0.87000000476837158;
	setAttr ".fatZabs" 0.87000000476837158;
createNode joint -n "Knee" -p "Hip";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "twistJoints" -ln "twistJoints" -dv 2 -min 0 -max 10 
		-at "long";
	addAttr -ci true -k true -sn "bendyJoints" -ln "bendyJoints" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.9741246355670938 2.6645352591003757e-015 2.2204460492503131e-014 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -5.8641476939483601e-015 -1.523808717505861e-014 -9.430085858930191 ;
	setAttr -k on ".fat" 0.6;
	setAttr ".fatYabs" 0.60000002384185791;
	setAttr ".fatZabs" 0.60000002384185791;
createNode joint -n "Ankle" -p "Knee";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "worldOrient" -ln "worldOrient" -min 0 -max 5 -en "xUp:yUp:zUp:xDown:yDown:zDown" 
		-at "enum";
	setAttr ".t" -type "double3" 3.8301794911694138 -6.4531713306337224e-015 7.3274719625260332e-015 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.4247604049611626 1.730388711462014 4.2486823290117384 ;
	setAttr ".pa" -type "double3" 3.1147589914174403 -1.2104724556304993 -11.405913270501992 ;
	setAttr ".dl" yes;
	setAttr ".typ" 4;
	setAttr -k on ".fat" 0.36999999999999988;
	setAttr ".fatYabs" 0.37000000476837158;
	setAttr ".fatZabs" 0.37000000476837158;
	setAttr -k on ".worldOrient" 3;
createNode joint -n "Heel" -p "Ankle";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.36999999999999988 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.83962328905675188 -0.6434838984068435 -0.0077920496462182687 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.6149386111953455e-013 89.306230132279367 90.000000000017394 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Heel";
createNode joint -n "Toes" -p "Ankle";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.66611707946596854 1.3424176194153714 -4.2188474935755949e-015 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -88.257054792157547 66.540781264469288 1.5989578876603037 ;
	setAttr ".pa" -type "double3" -0.00019030234564052423 0.00053514845282692043 25.864574245063647 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Toes";
	setAttr -k on ".fat" 0.29999999999999993;
	setAttr ".fatYabs" 0.30000001192092896;
	setAttr ".fatZabs" 0.30000001192092896;
createNode joint -n "FootSideInner" -p "Toes";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.29999999999999993 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.43600963840231427 -1.729759574659335e-016 5.4736119219619657e-017 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 23.449537443436409 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "BigToe";
createNode joint -n "FootSideOuter" -p "Toes";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.29999999999999993 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" -0.29791909125420257 -0.31835297996809431 -8.0528509990133864e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 23.449537443436409 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "PinkyToe";
createNode joint -n "ToesEnd" -p "Toes";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.29999999999999993 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.033553261170956521 -0.077355489145667825 0.6212046065008503 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000555571449723 -82.270216790480461 -66.551013079767813 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ToesEnd";
	setAttr ".fatYabs" 0.30000001192092896;
	setAttr ".fatZabs" 0.30000001192092896;
createNode joint -n "BigToe1" -p "Toes";
	setAttr ".t" -type "double3" 0.35003601329410239 0.1518335547110681 0.25966439942070746 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000555571449723 -82.270216790480461 -66.551013079767813 ;
createNode joint -n "BigToe2" -p "BigToe1";
	setAttr ".t" -type "double3" 0.15 0 2.2204460492503131e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.5976817952526805e-015 7.3118640090331606e-016 4.7708320221952767e-015 ;
createNode joint -n "IndexToe1" -p "Toes";
	setAttr ".t" -type "double3" 0.16043317275979208 0.06959037924257086 0.25966439942069897 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000555571449723 -82.270216790480461 -66.551013079767813 ;
createNode joint -n "IndexToe2" -p "IndexToe1";
	setAttr ".t" -type "double3" 0.15 0 1.1102230246251565e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.5976817952526805e-015 7.3118640090331606e-016 4.7708320221952767e-015 ;
createNode joint -n "MidToe1" -p "Toes";
	setAttr ".t" -type "double3" 0.0048616112957423135 0.0021087993709832738 0.25966439942069425 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000555571449723 -82.270216790480461 -66.551013079767813 ;
createNode joint -n "MidToe2" -p "MidToe1";
	setAttr ".t" -type "double3" 0.15 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.5976817952526805e-015 7.3118640090331606e-016 4.7708320221952767e-015 ;
createNode joint -n "RingToe1" -p "Toes";
	setAttr ".t" -type "double3" -0.17501800664706429 -0.075916777355539589 0.25966439942068692 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000555571449723 -82.270216790480461 -66.551013079767813 ;
createNode joint -n "RingToe2" -p "RingToe1";
	setAttr ".t" -type "double3" 0.15 0 2.2204460492503131e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.5976817952526805e-015 7.3118640090331606e-016 4.7708320221952767e-015 ;
createNode joint -n "PinkyToe1" -p "Toes";
	setAttr ".t" -type "double3" -0.33058956811111434 -0.14339835722712713 0.25966439942068104 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000555571449723 -82.270216790480461 -66.551013079767813 ;
createNode joint -n "PinkyToe2" -p "PinkyToe1";
	setAttr ".t" -type "double3" 0.15 0 2.2204460492503131e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.5976817952526805e-015 7.3118640090331606e-016 4.7708320221952767e-015 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr -s 2 ".dli[1]"  1;
createNode animCurveUA -n "SDK1FKIndexFinger3_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "indexCurl" -ln "indexCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKIndexFinger2_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "indexCurl" -ln "indexCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK2FKIndexFinger1_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "indexCurl" -ln "indexCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKIndexFinger2_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "indexCurl" -ln "indexCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKIndexFinger3_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "indexCurl" -ln "indexCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK2FKIndexFinger1_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "indexCurl" -ln "indexCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  0.98788672685623169 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0.15517689287662506 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 0.98788672685623169;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0.15517689287662506;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKMiddleFinger3_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "middleCurl" -ln "middleCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKMiddleFinger2_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "middleCurl" -ln "middleCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKMiddleFinger1_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "middleCurl" -ln "middleCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKMiddleFinger3_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "middleCurl" -ln "middleCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKMiddleFinger1_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "middleCurl" -ln "middleCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKMiddleFinger2_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "middleCurl" -ln "middleCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKRingFinger3_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "ringCurl" -ln "ringCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKRingFinger2_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "ringCurl" -ln "ringCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK2FKRingFinger1_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "ringCurl" -ln "ringCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKRingFinger2_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "ringCurl" -ln "ringCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKRingFinger3_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "ringCurl" -ln "ringCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK2FKRingFinger1_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "ringCurl" -ln "ringCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKPinkyFinger3_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "pinkyCurl" -ln "pinkyCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKPinkyFinger2_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "pinkyCurl" -ln "pinkyCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK2FKPinkyFinger1_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "pinkyCurl" -ln "pinkyCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKPinkyFinger2_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "pinkyCurl" -ln "pinkyCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK2FKPinkyFinger1_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "pinkyCurl" -ln "pinkyCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKPinkyFinger3_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "pinkyCurl" -ln "pinkyCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKThumbFinger3_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "thumbCurl" -ln "thumbCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKThumbFinger2_L_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "thumbCurl" -ln "thumbCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKThumbFinger3_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "thumbCurl" -ln "thumbCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKThumbFinger2_R_rotateY";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "thumbCurl" -ln "thumbCurl" -smn -2 -smx 10 -at "float";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -2 -18 0 0 10 90;
	setAttr -s 3 ".kit[0:2]"  2 1 1;
	setAttr -s 3 ".kot[0:2]"  2 1 1;
	setAttr -s 3 ".kix[1:2]"  1 0.98788672685623169;
	setAttr -s 3 ".kiy[1:2]"  0 0.15517690777778625;
	setAttr -s 3 ".kox[1:2]"  0.98788672685623169 1;
	setAttr -s 3 ".koy[1:2]"  0.15517690777778625 0;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKIndexFinger1_R_rotateZ";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "spread" -ln "spread" -smn -5 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -5 -20 0 0 10 40;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKPinkyFinger1_R_rotateZ";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "spread" -ln "spread" -smn -5 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -5 29.999999999999996 0 0 10 -59.999999999999993;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKRingFinger1_R_rotateZ";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "spread" -ln "spread" -smn -5 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -5 14.999999999999998 0 0 10 -29.999999999999996;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKIndexFinger1_L_rotateZ";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "spread" -ln "spread" -smn -5 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -5 -20 0 0 10 40;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKPinkyFinger1_L_rotateZ";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "spread" -ln "spread" -smn -5 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -5 29.999999999999996 0 0 10 -59.999999999999993;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKRingFinger1_L_rotateZ";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "spread" -ln "spread" -smn -5 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -5 14.999999999999998 0 0 10 -29.999999999999996;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKCup_R_rotateX";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "cup" -ln "cup" -smn 0 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 65;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode animCurveUA -n "SDK1FKCup_L_rotateX";
	addAttr -ci true -sn "drivingSystemOut" -ln "drivingSystemOut" -at "message";
	addAttr -ci true -sn "cup" -ln "cup" -smn 0 -smx 10 -at "float";
	setAttr ".tan" 2;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 65;
	setAttr ".pre" 4;
	setAttr ".pst" 4;
createNode displayLayer -n "defaultLayer";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer1";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n"
		+ "            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n"
		+ "            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n"
		+ "                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n"
		+ "                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n"
		+ "                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n"
		+ "            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n"
		+ "                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n"
		+ "            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n"
		+ "            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\toutlinerPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n"
		+ "                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n"
		+ "                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n"
		+ "                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n"
		+ "                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n"
		+ "                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n"
		+ "                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n"
		+ "                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n"
		+ "                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n"
		+ "\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Top View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Top View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera top` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Top View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera top` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr ".o" 0;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
	setAttr -s 2 ".r";
select -ne :renderGlobalsList1;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "SDK2FKIndexFinger1_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKIndexFinger2_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKIndexFinger3_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKMiddleFinger1_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKMiddleFinger3_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKMiddleFinger2_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKRingFinger3_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKRingFinger2_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK2FKRingFinger1_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK2FKPinkyFinger1_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKPinkyFinger2_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKPinkyFinger3_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKThumbFinger2_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKThumbFinger3_R_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKPinkyFinger1_R_rotateZ.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKIndexFinger1_R_rotateZ.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKRingFinger1_R_rotateZ.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKCup_R_rotateX.drivingSystemOut" "FitSkeleton.drivingSystem" -na
		;
connectAttr "SDK2FKIndexFinger1_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKIndexFinger2_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKIndexFinger3_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKMiddleFinger2_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKMiddleFinger3_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKMiddleFinger1_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKRingFinger2_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKRingFinger3_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK2FKRingFinger1_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKPinkyFinger2_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKPinkyFinger3_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK2FKPinkyFinger1_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKThumbFinger2_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKThumbFinger3_L_rotateY.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKPinkyFinger1_L_rotateZ.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKIndexFinger1_L_rotateZ.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKRingFinger1_L_rotateZ.drivingSystemOut" "FitSkeleton.drivingSystem"
		 -na;
connectAttr "SDK1FKCup_L_rotateX.drivingSystemOut" "FitSkeleton.drivingSystem" -na
		;
connectAttr "Root.s" "Spine1.is";
connectAttr "Spine1.s" "Spine2.is";
connectAttr "Spine2.s" "Chest.is";
connectAttr "Chest.s" "Neck.is";
connectAttr "Neck.s" "Head.is";
connectAttr "Head.s" "HeadEnd.is";
connectAttr "Head.s" "Eye.is";
connectAttr "Eye.s" "EyeEnd.is";
connectAttr "Head.s" "Jaw.is";
connectAttr "Jaw.s" "JawEnd.is";
connectAttr "Chest.s" "Scapula.is";
connectAttr "Scapula.s" "Shoulder.is";
connectAttr "Shoulder.s" "Elbow.is";
connectAttr "Elbow.s" "Wrist.is";
connectAttr "Wrist.s" "MiddleFinger1.is";
connectAttr "MiddleFinger1.s" "MiddleFinger2.is";
connectAttr "MiddleFinger2.s" "MiddleFinger3.is";
connectAttr "MiddleFinger3.s" "MiddleFinger4.is";
connectAttr "Wrist.s" "ThumbFinger1.is";
connectAttr "ThumbFinger1.s" "ThumbFinger2.is";
connectAttr "ThumbFinger2.s" "ThumbFinger3.is";
connectAttr "ThumbFinger3.s" "ThumbFinger4.is";
connectAttr "Wrist.s" "IndexFinger1.is";
connectAttr "IndexFinger1.s" "IndexFinger2.is";
connectAttr "IndexFinger2.s" "IndexFinger3.is";
connectAttr "IndexFinger3.s" "IndexFinger4.is";
connectAttr "Wrist.s" "Cup.is";
connectAttr "Cup.s" "PinkyFinger1.is";
connectAttr "PinkyFinger1.s" "PinkyFinger2.is";
connectAttr "PinkyFinger2.s" "PinkyFinger3.is";
connectAttr "PinkyFinger3.s" "PinkyFinger4.is";
connectAttr "Cup.s" "RingFinger1.is";
connectAttr "RingFinger1.s" "RingFinger2.is";
connectAttr "RingFinger2.s" "RingFinger3.is";
connectAttr "RingFinger3.s" "RingFinger4.is";
connectAttr "Chest.s" "Breast.is";
connectAttr "Breast.s" "BreastEnd.is";
connectAttr "Root.s" "Hip.is";
connectAttr "Hip.s" "Knee.is";
connectAttr "Knee.s" "Ankle.is";
connectAttr "Ankle.s" "Heel.is";
connectAttr "Ankle.s" "Toes.is";
connectAttr "Toes.s" "FootSideInner.is";
connectAttr "Toes.s" "FootSideOuter.is";
connectAttr "Toes.s" "ToesEnd.is";
connectAttr "Toes.s" "BigToe1.is";
connectAttr "Toes.s" "IndexToe1.is";
connectAttr "Toes.s" "MidToe1.is";
connectAttr "Toes.s" "RingToe1.is";
connectAttr "Toes.s" "PinkyToe1.is";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "FitSkeleton.drivingSystem_Fingers_L[6]" "SDK1FKIndexFinger3_L_rotateY.indexCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[5]" "SDK1FKIndexFinger2_L_rotateY.indexCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[4]" "SDK2FKIndexFinger1_L_rotateY.indexCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[5]" "SDK1FKIndexFinger2_R_rotateY.indexCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[6]" "SDK1FKIndexFinger3_R_rotateY.indexCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[4]" "SDK2FKIndexFinger1_R_rotateY.indexCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[8]" "SDK1FKMiddleFinger3_L_rotateY.middleCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[7]" "SDK1FKMiddleFinger2_L_rotateY.middleCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[9]" "SDK1FKMiddleFinger1_L_rotateY.middleCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[8]" "SDK1FKMiddleFinger3_R_rotateY.middleCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[9]" "SDK1FKMiddleFinger1_R_rotateY.middleCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[7]" "SDK1FKMiddleFinger2_R_rotateY.middleCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[11]" "SDK1FKRingFinger3_L_rotateY.ringCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[10]" "SDK1FKRingFinger2_L_rotateY.ringCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[12]" "SDK2FKRingFinger1_L_rotateY.ringCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[10]" "SDK1FKRingFinger2_R_rotateY.ringCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[11]" "SDK1FKRingFinger3_R_rotateY.ringCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[12]" "SDK2FKRingFinger1_R_rotateY.ringCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[14]" "SDK1FKPinkyFinger3_L_rotateY.pinkyCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[13]" "SDK1FKPinkyFinger2_L_rotateY.pinkyCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[15]" "SDK2FKPinkyFinger1_L_rotateY.pinkyCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[13]" "SDK1FKPinkyFinger2_R_rotateY.pinkyCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[15]" "SDK2FKPinkyFinger1_R_rotateY.pinkyCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[14]" "SDK1FKPinkyFinger3_R_rotateY.pinkyCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[17]" "SDK1FKThumbFinger3_L_rotateY.thumbCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[16]" "SDK1FKThumbFinger2_L_rotateY.thumbCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[17]" "SDK1FKThumbFinger3_R_rotateY.thumbCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[16]" "SDK1FKThumbFinger2_R_rotateY.thumbCurl"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[1]" "SDK1FKIndexFinger1_R_rotateZ.spread"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[0]" "SDK1FKPinkyFinger1_R_rotateZ.spread"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[2]" "SDK1FKRingFinger1_R_rotateZ.spread"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[1]" "SDK1FKIndexFinger1_L_rotateZ.spread"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[0]" "SDK1FKPinkyFinger1_L_rotateZ.spread"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_L[2]" "SDK1FKRingFinger1_L_rotateZ.spread"
		;
connectAttr "FitSkeleton.drivingSystem_Fingers_R[3]" "SDK1FKCup_R_rotateX.cup";
connectAttr "FitSkeleton.drivingSystem_Fingers_L[3]" "SDK1FKCup_L_rotateX.cup";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
// End of CharacterCreator4.ma
