//Maya ASCII 2012 scene
//Name: asUnreal.ma
//Last modified: Wed, Apr 13, 2022 09:30:00 AM
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
	setAttr ".t" -type "double3" -14.567199347560525 267.73253400856117 474.42825372850507 ;
	setAttr ".r" -type "double3" -20.138352729602701 -1.7999999999999958 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 493.95948685363021;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.00012119175463709553 97.668096696694676 10.896310871810655 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.00012119175463709553 200 10.896310871810657 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 398.35622444666797;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.00012119175463709553 97.668096696694676 143.17009990973094 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 508.36440337490723;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 140.27753549516757 97.668096696694676 10.896310871810687 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 507.74064337076629;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "Mannequin";
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode joint -n "root" -p "Mannequin";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr ".fbxID" 2;
createNode joint -n "pelvis" -p "|Mannequin|root";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.3536841578012896e-028 1.0561532974243164 96.750602722167969 ;
	setAttr ".r" -type "double3" 89.998386598061543 -89.790112938596948 -89.998386598059795 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.03153e-007 0.99999300000000002 0.0036632100000000001 0
		 1.88937e-010 0.0036632100000000001 -0.99999300000000002 0 -1 1.03153e-007 1.8893599999999999e-010 0
		 0 96.750602999999998 -1.0561529999999999 1;
	setAttr ".fbxID" 5;
createNode joint -n "spine_01" -p "|Mannequin|root|pelvis";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.808877944946289 -0.85141515731811523 -6.0910938836158945e-013 ;
	setAttr ".r" -type "double3" 0 0 -7.1538485846206612 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.02326e-007 0.99175199999999997 0.128168 0 1.3033500000000001e-008 0.128168 -0.99175199999999997 0
		 -1 1.03153e-007 1.8893599999999999e-010 0 1.11481e-006 107.55628900000001 -0.16514899999999999 1;
	setAttr ".fbxID" 5;
createNode joint -n "spine_02" -p "|Mannequin|root|pelvis|spine_01";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 18.875349044799805 3.8011586666107178 5.966093397091754e-008 ;
	setAttr ".r" -type "double3" 0 0 14.063533521833028 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0242699999999999e-007 0.99317100000000003 -0.11666700000000001 0
		 -1.2222199999999999e-008 -0.11666700000000001 -0.99317100000000003 0 -1 1.03153e-007 1.88937e-010 0
		 3.0361399999999999e-006 126.76315 -1.5157430000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "spine_03" -p "|Mannequin|root|pelvis|spine_01|spine_02";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 13.407328605651855 0.42047739028930664 -5.5752391635646714e-013 ;
	setAttr ".r" -type "double3" 0 0 2.7794166939751275 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.0171300000000001e-007 0.98634500000000003 -0.16469 0
		 -1.7174600000000001e-008 -0.16469 -0.98634500000000003 0 -1 1.03153e-007 1.8893599999999999e-010 0
		 4.4042699999999999e-006 140.029865 -3.4975450000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 11.883687973022461 -2.7320878505706787 -3.7819831371307373 ;
	setAttr ".r" -type "double3" 108.71915573266831 61.853576172074227 101.5409112493697 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.881745 -0.169206 -0.44033499999999998 0 -0.446774 2.5174e-005 -0.89464699999999997 0
		 0.151391 0.98558100000000004 -0.075574799999999998 0 3.7819889999999998 152.201233 -2.7598850000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 15.784872055053711 1.4317954599718519e-009 6.3591301113774534e-009 ;
	setAttr ".r" -type "double3" 7.6738926595293826 40.300540655703898 -17.020992934253695 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.64483999999999997 -0.76087099999999996 -0.072507199999999994 0
		 -0.068049499999999999 0.037335500000000001 -0.99698299999999995 0 0.76128300000000004 0.64782799999999996 -0.0277015 0
		 17.700220000000002 149.53033099999999 -9.7105200000000007 1;
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 30.339929580688477 8.4074702755287944e-009 3.197527576048742e-009 ;
	setAttr ".r" -type "double3" -3.613278937806625 -10.3973427584011 -30.360854373363736 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.71849099999999999 -0.54739000000000004 0.42910900000000002 0
		 0.226212 -0.399501 -0.88838399999999995 0 0.65772200000000003 0.73536599999999996 -0.163212 0
		 37.264606999999998 126.44556 -11.910384000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "hand_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 26.975143432617188 1.5729675340026006e-009 -9.6207486421917565e-009 ;
	setAttr ".r" -type "double3" -76.356201188888392 2.4998079061090888 -0.4125709669948413 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.68747400000000003 -0.57605399999999995 0.44219999999999998 0
		 -0.61435799999999996 -0.78602000000000005 -0.068825800000000006 0 0.38722499999999999 -0.224353 -0.89427199999999996 0
		 56.646013000000004 111.679648 -0.335094 1;
	setAttr ".fbxID" 5;
createNode joint -n "index_01_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 12.068114280700684 1.7634615898132324 -2.1093976497650146 ;
	setAttr ".r" -type "double3" 14.86695126728991 -3.7637880114312035 25.536937526971315 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999978 0.99999999999999967 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.38012000000000001 -0.87150099999999997 0.30982999999999999 0
		 -0.72907599999999995 -0.48844799999999999 -0.47944399999999998 0 0.56917200000000001 -0.043643300000000003 -0.82105899999999998 0
		 63.042324000000001 103.814892 6.7664239999999998 1;
	setAttr ".fbxID" 5;
createNode joint -n "index_02_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_01_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.2874979972839355 -2.9850326654923265e-008 5.0484132430028694e-009 ;
	setAttr ".r" -type "double3" 1.3378194276401854 -0.47529026828726623 11.986129877033241 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.225136 -0.95426800000000001 0.196689 0 -0.77866100000000005 -0.29756300000000002 -0.55239799999999994 0
		 0.58566300000000004 -0.028789200000000001 -0.81004299999999996 0 64.672088000000002 100.078333 8.0948200000000003 1;
	setAttr ".fbxID" 5;
createNode joint -n "index_03_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_01_l|index_02_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.3937902450561523 1.1695448165482958e-008 -2.3492283673931524e-009 ;
	setAttr ".r" -type "double3" 1.1373671084257291 0.99727080684674818 -9.4963194797640718 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.34027099999999999 -0.89146199999999998 0.29918600000000001 0
		 -0.71895799999999999 -0.45171499999999998 -0.52825500000000003 0 0.60606599999999999 -0.0353522 -0.79462900000000003 0
		 65.436150999999995 96.839748 8.76234 1;
	setAttr ".fbxID" 5;
createNode joint -n "middle_01_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 12.244280815124512 1.293643593788147 0.57116198539733887 ;
	setAttr ".r" -type "double3" 1.9178512756595907 -7.0405641935384962 22.825872789057357 ;
	setAttr ".s" -type "double3" 0.99999999999999967 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.43979000000000001 -0.85706099999999996 0.26838600000000001 0
		 -0.82123299999999999 -0.50473800000000002 -0.26611200000000002 0 0.363539 -0.10337399999999999 -0.92582600000000004 0
		 64.490050999999994 103.481306 4.4795100000000003 1;
	setAttr ".fbxID" 5;
createNode joint -n "middle_02_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_01_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.6403741836547852 -3.648182200777228e-009 1.8308625726604077e-009 ;
	setAttr ".r" -type "double3" -2.024952382364499 1.1368393821927114 12.280693812302134 ;
	setAttr ".s" -type "double3" 1 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.24778600000000001 -0.94257100000000005 0.22397 0
		 -0.908447 -0.30638199999999999 -0.28434799999999999 0 0.33663799999999999 -0.13300699999999999 -0.93219300000000005 0
		 66.530840999999995 99.504221000000001 5.72492 1;
	setAttr ".fbxID" 5;
createNode joint -n "middle_03_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_01_l|middle_02_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.64884352684021 -1.9989442989754025e-008 1.6076349140803359e-009 ;
	setAttr ".r" -type "double3" 0.78144757657680752 -4.3899530552767496 -15.399739817787625 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50448899999999997 -0.83512299999999995 0.21922900000000001 0
		 -0.80587900000000001 -0.54657699999999998 -0.22762399999999999 0 0.309919 -0.061838299999999999 -0.94874999999999998 0
		 67.434974999999994 96.064929000000006 6.5421509999999996 1;
	setAttr ".fbxID" 5;
createNode joint -n "pinky_01_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.140665054321289 2.2631511688232422 4.6431479454040527 ;
	setAttr ".r" -type "double3" -18.724591751325903 -18.933966610967872 20.185867297574816 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.53545799999999999 -0.84076899999999999 0.079946000000000003 0
		 -0.84322399999999997 -0.52688400000000002 0.106612 0 -0.047514199999999999 -0.124499 -0.99108099999999999 0
		 64.025019 103.017489 -0.15889800000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "pinky_02_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_01_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.5709807872772217 1.8669879864319228e-008 3.9181813349387085e-010 ;
	setAttr ".r" -type "double3" 1.0638335726499644 -1.315685296782005 11.208043567831963 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.36015999999999998 -0.92976000000000003 0.076361399999999996 0
		 -0.93209600000000004 -0.35526799999999997 0.070586399999999994 0 -0.038499600000000002 -0.096598600000000007 -0.99457899999999999 0
		 65.937128999999999 100.015117 0.12658700000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "pinky_03_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_01_l|pinky_02_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.9856307506561279 -3.0058785682740563e-008 -4.0375418564053689e-009 ;
	setAttr ".r" -type "double3" 0.44569904335905253 3.8696645395505862 1.0389989692171537 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.34501500000000002 -0.927396 0.14457300000000001 0
		 -0.93856300000000004 -0.33958100000000002 0.0615097 0 -0.0079496500000000008 -0.156913 -0.98758000000000001 0
		 67.012433999999999 97.239197000000004 0.354574 1;
	setAttr ".fbxID" 5;
createNode joint -n "ring_01_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 11.497884750366211 1.7535265684127808 2.8469123840332031 ;
	setAttr ".r" -type "double3" -13.510254538727057 -10.989254787408468 23.292106891939422 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.45520699999999997 -0.86727900000000002 0.20152600000000001 0
		 -0.884494 -0.46645500000000001 -0.0095185800000000004 0 0.102258 -0.17391599999999999 -0.979437 0
		 64.575616999999994 103.039222 2.082662 1;
	setAttr ".fbxID" 5;
createNode joint -n "ring_02_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_01_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.4301772117614746 4.6665036279591732e-009 -9.4033403286175599e-010 ;
	setAttr ".r" -type "double3" 0.30135603450269732 -1.6697463961501005 13.315434502671529 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999967 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.24213899999999999 -0.95605799999999996 0.165295 0
		 -0.96504100000000004 -0.25493500000000002 -0.060854800000000001 0 0.10032000000000001 -0.14478099999999999 -0.98436500000000005 0
		 66.592267000000007 99.197022000000004 2.97546 1;
	setAttr ".fbxID" 5;
createNode joint -n "ring_03_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_01_l|ring_02_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.4766523838043213 -1.6786358969511639e-008 2.7686510861713032e-009 ;
	setAttr ".r" -type "double3" -0.36076424860897444 2.987667134511248 -12.899654771071239 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.44562499999999999 -0.86628099999999997 0.22577700000000001 0
		 -0.88739100000000004 -0.460729 -0.0162852 0 0.11813 -0.19309599999999999 -0.97404299999999999 0
		 67.434099000000003 95.873141000000004 3.5501320000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "thumb_01_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.7620363235473633 2.3749806880950928 -2.5378196239471436 ;
	setAttr ".r" -type "double3" 95.069136669622807 36.918976974649922 27.056190822001927 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.033459299999999997 -0.561222 0.82698899999999997 0
		 0.58346200000000004 -0.66084399999999999 -0.47207700000000002 0 0.81145100000000003 0.49831199999999998 0.30534 0
		 57.477995999999997 107.63904100000001 3.8767170000000002 1;
	setAttr ".fbxID" 5;
createNode joint -n "thumb_02_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.8696718215942383 5.0118700301027275e-009 9.9849728485423839e-009 ;
	setAttr ".r" -type "double3" 1.6131403736636543 9.8332438889360532 15.151305229440101 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.043499599999999999 -0.78904399999999997 0.61279499999999998 0
		 0.57761099999999999 -0.480605 -0.65983599999999998 0 0.81515199999999999 0.38266 0.43485400000000002 0
		 57.607472000000001 105.467297 7.076892 1;
	setAttr ".fbxID" 5;
createNode joint -n "thumb_03_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.062171459197998 1.0721912246935972e-009 -5.1272763812448829e-010 ;
	setAttr ".r" -type "double3" 2.414763834380544 0.47919316436838849 -12.385634891494403 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.088219500000000006 -0.67077200000000003 0.73639900000000003 0
		 0.60730399999999995 -0.62220799999999998 -0.49400300000000003 0 0.78955600000000004 0.40363700000000002 0.46225300000000002 0
		 57.784174999999998 102.26206500000001 9.5661699999999996 1;
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_01_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 14 3.5527136788005009e-015 1.4210854715202004e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.71849099999999999 -0.54739000000000004 0.42910900000000002 0
		 0.226212 -0.399501 -0.88838399999999995 0 0.65772200000000003 0.73536599999999996 -0.163212 0
		 47.323484999999998 118.782106 -5.9028510000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twist_01_l" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0.5 -3.5527136788005009e-015 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.64483999999999997 -0.76087099999999996 -0.072507199999999994 0
		 -0.068049499999999999 0.037335500000000001 -0.99698299999999995 0 0.76128300000000004 0.64782799999999996 -0.0277015 0
		 18.022639000000002 149.14989499999999 -9.7467729999999992 1;
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 11.8837890625 -2.7321023941040039 3.7820026874542236 ;
	setAttr ".r" -type "double3" 108.71915573266828 61.853576172074277 -78.459052302848136 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999956 0.99999999999999967 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.881745 0.169207 0.44033499999999998 0 -0.446774 -2.45127e-005 0.89464699999999997 0
		 0.151391 -0.98558100000000004 0.075575400000000001 0 -3.7819970000000001 152.201336 -2.759887 1;
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -15.784797668457031 -7.0139599301910494e-006 -1.1171471669513267e-005 ;
	setAttr ".r" -type "double3" 7.6738926595293826 40.300540655703898 -17.020992934253695 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.64483999999999997 0.76087099999999996 0.072506699999999993 0
		 -0.068049499999999999 -0.037334800000000001 0.99698299999999995 0 0.76128200000000001 -0.64782799999999996 0.027701900000000002 0
		 -17.700161000000001 149.53045599999999 -9.7104940000000006 1;
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -30.340049743652344 -4.0850213736121077e-006 1.7513536931801355e-006 ;
	setAttr ".r" -type "double3" -3.613278937806625 -10.3973427584011 -30.360854373363736 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.71849099999999999 0.54738900000000001 -0.42910999999999999 0
		 0.226212 0.399501 0.88838399999999995 0 0.65772200000000003 -0.73536599999999996 0.163212 0
		 -37.264629999999997 126.445595 -11.910356999999999 1;
	setAttr ".fbxID" 5;
createNode joint -n "hand_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -26.975244522094727 2.5634119083406404e-005 -1.1905384553756448e-006 ;
	setAttr ".r" -type "double3" -76.356201188888392 2.4998079061090888 -0.4125709669948413 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.68747499999999995 0.57605399999999995 -0.44219999999999998 0
		 -0.61435799999999996 0.78602000000000005 0.068825300000000006 0 0.38722499999999999 0.224353 0.89427199999999996 0
		 -56.646106000000003 111.67965 -0.33499200000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "index_01_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -12.067941665649414 -1.7637253999710083 2.1094281673431396 ;
	setAttr ".r" -type "double3" 14.86695126728991 -3.7637880114312035 25.536937526971315 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999978 0.99999999999999967 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.38012000000000001 0.87150099999999997 -0.30983100000000002 0
		 -0.72907599999999995 0.48844799999999999 0.47944399999999998 0 0.56917200000000001 0.043643700000000001 0.82105899999999998 0
		 -63.042127000000001 103.81479899999999 6.766464 1;
	setAttr ".fbxID" 5;
createNode joint -n "index_02_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_01_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -4.2876882553100586 9.2459835286717862e-005 -7.4262097768951207e-005 ;
	setAttr ".r" -type "double3" 1.3378194276401854 -0.47529026828726623 11.986129877033241 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.225136 0.95426800000000001 -0.196689 0 -0.77866100000000005 0.29756300000000002 0.55239799999999994 0
		 0.58566300000000004 0.028789599999999999 0.81004299999999996 0 -64.672072999999997 100.078118 8.0949039999999997 1;
	setAttr ".fbxID" 5;
createNode joint -n "index_03_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_01_r|index_02_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.3937981128692627 0.00012069699005223811 -1.2407956091919914e-005 ;
	setAttr ".r" -type "double3" 1.1373671084257291 0.99727080684674818 -9.4963194797640718 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.34027099999999999 0.89146099999999995 -0.29918600000000001 0
		 -0.71895799999999999 0.45171600000000001 0.52825500000000003 0 0.60606599999999999 0.035352599999999998 0.79462900000000003 0
		 -65.436239999999998 96.839561000000003 8.7624849999999999 1;
	setAttr ".fbxID" 5;
createNode joint -n "middle_01_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -12.244112968444824 -1.2937241792678833 -0.57113021612167358 ;
	setAttr ".r" -type "double3" 1.9178512756595907 -7.0405641935384962 22.825872789057357 ;
	setAttr ".s" -type "double3" 0.99999999999999967 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.43979000000000001 0.85706099999999996 -0.26838600000000001 0
		 -0.82123299999999999 0.50473800000000002 0.26611200000000002 0 0.363539 0.10337399999999999 0.92582600000000004 0
		 -64.489968000000005 103.481353 4.4795660000000002 1;
	setAttr ".fbxID" 5;
createNode joint -n "middle_02_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_01_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -4.640568733215332 -0.00014491056208498776 7.6369551607058384e-006 ;
	setAttr ".r" -type "double3" -2.024952382364499 1.1368393821927114 12.280693812302134 ;
	setAttr ".s" -type "double3" 1 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.24778700000000001 0.94257000000000002 -0.223971 0
		 -0.908447 0.30638199999999999 0.28434799999999999 0 0.33663799999999999 0.13300799999999999 0.93219300000000005 0
		 -66.530722999999995 99.504030999999998 5.7249990000000004 1;
	setAttr ".fbxID" 5;
createNode joint -n "middle_03_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_01_r|middle_02_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.6489090919494629 3.2996809750329703e-005 -2.2666431505058426e-006 ;
	setAttr ".r" -type "double3" 0.78144757657680752 -4.3899530552767496 -15.399739817787625 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50448899999999997 0.83512200000000003 -0.21922900000000001 0
		 -0.80587900000000001 0.54657699999999998 0.22762299999999999 0 0.309919 0.061838799999999999 0.94874999999999998 0
		 -67.434905000000001 96.064687000000006 6.5422549999999999 1;
	setAttr ".fbxID" 5;
createNode joint -n "pinky_01_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -10.140592575073242 -2.2633547782897949 -4.643094539642334 ;
	setAttr ".r" -type "double3" -18.724591751325903 -18.933966610967872 20.185867297574816 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.53545799999999999 0.84076899999999999 -0.079946600000000007 0
		 -0.84322399999999997 0.52688400000000002 -0.106613 0 -0.047514199999999999 0.1245 0.99108099999999999 0
		 -64.024918 103.017387 -0.15878900000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "pinky_02_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_01_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.5710570812225342 -7.8019678767304868e-005 -8.1079842857434414e-006 ;
	setAttr ".r" -type "double3" 1.0638335726499644 -1.315685296782005 11.208043567831963 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.36015999999999998 0.92976000000000003 -0.076361999999999999 0
		 -0.93209600000000004 0.35526799999999997 -0.070586599999999999 0 -0.038499600000000002 0.096599199999999996 0.99457799999999996 0
		 -65.937004000000002 100.014909 0.12670500000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "pinky_03_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_01_r|pinky_02_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -2.9854192733764648 0.00031727668829262257 -3.5056928027188405e-005 ;
	setAttr ".r" -type "double3" 0.44570049419982749 3.8696649538698802 1.0389991269851804 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.34501500000000002 0.927396 -0.14457400000000001 0
		 -0.93856300000000004 0.33958100000000002 -0.061509899999999999 0 -0.0079495899999999994 0.156913 0.98758000000000001 0
		 -67.012528000000003 97.239295999999996 0.35462100000000002 1;
	setAttr ".fbxID" 5;
createNode joint -n "ring_01_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -11.497973442077637 -1.7537660598754883 -2.8469147682189941 ;
	setAttr ".r" -type "double3" -13.510254538727057 -10.989254787408468 23.292106891939422 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.455208 0.86727900000000002 -0.20152700000000001 0
		 -0.884494 0.46645500000000001 0.0095182900000000004 0 0.102258 0.17391599999999999 0.979437 0
		 -64.575626999999997 103.038988 2.0827909999999998 1;
	setAttr ".fbxID" 5;
createNode joint -n "ring_02_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_01_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -4.4298644065856934 8.4479885117616504e-005 -1.837869785958901e-005 ;
	setAttr ".r" -type "double3" 0.30135603450269732 -1.6697463961501005 13.315434502671529 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999967 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.24213899999999999 0.95605799999999996 -0.165295 0
		 -0.96504100000000004 0.25493500000000002 0.060854699999999998 0 0.10032000000000001 0.14478199999999999 0.98436500000000005 0
		 -66.592211000000006 99.197096000000002 2.9755099999999999 1;
	setAttr ".fbxID" 5;
createNode joint -n "ring_03_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_01_r|ring_02_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.476658821105957 7.1941642090678215e-005 -2.8431277314666659e-006 ;
	setAttr ".r" -type "double3" -0.36076424860897444 2.987667134511248 -12.899654771071239 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.44562499999999999 0.86628099999999997 -0.22577800000000001 0
		 -0.88739100000000004 0.460729 0.016284900000000001 0 0.11813 0.19309599999999999 0.97404299999999999 0
		 -67.434115000000006 95.873227 3.5501879999999999 1;
	setAttr ".fbxID" 5;
createNode joint -n "thumb_01_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -4.7621245384216309 -2.3751199245452881 2.5378017425537109 ;
	setAttr ".r" -type "double3" 95.069136669622807 36.918976974649922 27.056190822001927 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0334594 0.56122099999999997 -0.82698899999999997 0
		 0.58346200000000004 0.66084500000000002 0.47207700000000002 0 0.81145100000000003 -0.49831199999999998 -0.30534 0
		 -57.478071 107.638882 3.8768349999999998 1;
	setAttr ".fbxID" 5;
createNode joint -n "thumb_02_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.8695690631866455 0.00011357050243532285 5.5954889830900356e-005 ;
	setAttr ".r" -type "double3" 1.6131423789634627 9.8332445111953497 15.151307188458789 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.043499799999999998 0.78904399999999997 -0.61279499999999998 0
		 0.57761099999999999 0.480605 0.65983599999999998 0 0.81515199999999999 -0.38266 -0.43485400000000002 0
		 -57.607433 105.46724500000001 7.0769640000000003 1;
	setAttr ".fbxID" 5;
createNode joint -n "thumb_03_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -4.0621762275695801 2.0121733541600406e-006 3.2049592846306041e-006 ;
	setAttr ".r" -type "double3" 2.4147621858541104 0.47919251596620299 -12.385634904017572 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0882193 0.67077100000000001 -0.73639900000000003 0
		 0.60730399999999995 0.62220799999999998 0.49400300000000003 0 0.78955600000000004 -0.40363700000000002 -0.46225300000000002 0
		 -57.784132999999997 102.262011 9.5662459999999996 1;
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_01_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -14 2.4331944587174803e-005 -6.578326974704396e-006 ;
	setAttr ".r" -type "double3" -13.510350313925773 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.71849099999999999 0.54738900000000001 -0.42910999999999999 0
		 0.066294900000000004 0.56024300000000005 0.82567100000000004 0 0.69236900000000001 -0.62168500000000004 0.36624099999999998 0
		 -47.323507999999997 118.782162 -5.9027989999999999 1;
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twist_01_r" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -0.5 -3.700793968164362e-006 -1.1559803851923789e-006 ;
	setAttr ".r" -type "double3" -19.951905462246859 0 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.64483999999999997 0.76087099999999996 0.072506699999999993 0
		 -0.32373800000000003 0.18596499999999999 0.92769100000000004 0 0.69236900000000001 -0.62168500000000004 0.36624099999999998 0
		 -18.022582 149.15002100000001 -9.7467520000000007 1;
	setAttr ".fbxID" 5;
createNode joint -n "neck_01" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 16.558782577514648 -0.35531756281852722 -5.9659740259121463e-008 ;
	setAttr ".r" -type "double3" 0 0 -23.50807035605488 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.00122e-007 0.97017399999999998 0.24241099999999999 0
		 2.4822100000000001e-008 0.24241099999999999 -0.97017399999999998 0 -1 1.03153e-007 1.8893599999999999e-010 0
		 6.15428e-006 156.42106100000001 -5.874142 1;
	setAttr ".fbxID" 5;
createNode joint -n "head" -p "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|neck_01";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 9.2836132049560547 0.36415687203407288 2.9273693708751483e-015 ;
	setAttr ".r" -type "double3" 0 0 15.34863159322127 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1.03121e-007 0.99973500000000004 -0.023032400000000001 0
		 -2.5647499999999999e-009 -0.023032400000000001 -0.99973500000000004 0 -1 1.03153e-007 1.8893599999999999e-010 0
		 7.0928099999999999e-006 165.51605499999999 -3.9769920000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "thigh_l" -p "|Mannequin|root|pelvis";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -1.4488286972045898 -0.53142350912094116 -9.0058097839355469 ;
	setAttr ".r" -type "double3" 8.5634556738326904 -7.0322954635026083 -1.5154704017992908 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.122429 0.99202699999999999 0.029882100000000002 0
		 -0.147784 0.011551000000000001 -0.98895200000000005 0 -0.98141299999999998 -0.12549199999999999 0.14519199999999999 0
		 9.0058100000000003 95.299835999999999 -0.53004099999999998 1;
	setAttr ".fbxID" 5;
createNode joint -n "calf_l" -p "|Mannequin|root|pelvis|thigh_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -42.572036743164062 1.7074197611322006e-010 -4.6678749754391902e-010 ;
	setAttr ".r" -type "double3" -5.7359702594615616 1.7872745506295515 -7.6135760671106194 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.071110699999999999 0.98518799999999995 0.15604000000000001 0
		 -0.063531500000000005 0.151645 -0.98639100000000002 0 -0.99544299999999997 -0.0800564 0.051806900000000003 0
		 14.217848 53.067211 -1.8021830000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "calf_twist_01_l" -p "|Mannequin|root|pelvis|thigh_l|calf_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -20.476776123046875 0 0 ;
	setAttr ".r" -type "double3" 0.32356076410216561 -0.21908462697809414 -0.87298220173219809 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.073940199999999998 0.98245000000000005 0.17124700000000001 0
		 -0.070226399999999994 0.166161 -0.983595 0 -0.99478699999999998 -0.084753300000000004 0.056707899999999999 0
		 15.673965000000001 32.893742000000003 -4.9973729999999996 1;
	setAttr ".fbxID" 5;
createNode joint -n "foot_l" -p "|Mannequin|root|pelvis|thigh_l|calf_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -40.196689605712891 -3.9338505786190581e-009 1.8994583683706878e-010 ;
	setAttr ".r" -type "double3" -0.41538650297038404 3.7049346376769421 8.0595688253161288 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.014826000000000001 0.99980800000000003 0.0128223 0
		 -0.045693900000000003 0.0121329 -0.99888200000000005 0 -0.99884499999999998 -0.015395300000000001 0.045505200000000003 0
		 17.076260999999999 13.465925 -8.0744620000000005 1;
	setAttr ".fbxID" 5;
createNode joint -n "ball_l" -p "|Mannequin|root|pelvis|thigh_l|calf_l|foot_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -10.453837394714355 -16.577854156494141 0.080155946314334869 ;
	setAttr ".r" -type "double3" 0.0039439606158808488 0.0089523646390348398 -91.883584507706402 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.046312600000000002 -0.044986400000000003 0.99791399999999997 0
		 -0.013384800000000001 0.99886799999999998 0.0456506 0 -0.99883699999999997 -0.0154711 0.045657999999999997 0
		 17.908691999999999 2.811725 8.3544599999999996 1;
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twist_01_l" -p "|Mannequin|root|pelvis|thigh_l";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -22.09423828125 3.3306690738754696e-016 0 ;
	setAttr ".r" -type "double3" -5.4386740884979243 -0.00021103636139108709 -0.056330304199365598 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.12228700000000001 0.99201499999999998 0.030854900000000001 0
		 -0.054220400000000002 0.024364500000000001 -0.99823200000000001 0 -0.99101300000000003 -0.12374400000000001 0.050807999999999999 0
		 11.710777999999999 73.381747000000004 -1.1902630000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "thigh_r" -p "|Mannequin|root|pelvis";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -1.4486445188522339 -0.53142756223678589 9.005803108215332 ;
	setAttr ".r" -type "double3" 8.5634556738327046 -7.0322954635026029 178.48452878509659 ;
	setAttr ".s" -type "double3" 0.99999999999999911 0.99999999999999911 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.122429 -0.99202699999999999 -0.029882100000000002 0
		 -0.147785 -0.011551000000000001 0.98895200000000005 0 -0.98141299999999998 0.12549199999999999 -0.14519199999999999 0
		 -9.0058030000000002 95.300021999999998 -0.53003599999999995 1;
	setAttr ".fbxID" 5;
createNode joint -n "calf_r" -p "|Mannequin|root|pelvis|thigh_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 42.572250366210938 -1.6233628912232234e-006 -5.8367555766380974e-007 ;
	setAttr ".r" -type "double3" -5.7359702594615616 1.7872745506295515 -7.6135760671106194 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.071110900000000005 -0.98518799999999995 -0.15604000000000001 0
		 -0.063531500000000005 -0.151645 0.98639100000000002 0 -0.99544299999999997 0.080056600000000006 -0.051806900000000003 0
		 -14.217876 53.067186 -1.802187 1;
	setAttr ".fbxID" 5;
createNode joint -n "calf_twist_01_r" -p "|Mannequin|root|pelvis|thigh_r|calf_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 20.476907730102539 0 -3.5527136788005009e-015 ;
	setAttr ".r" -type "double3" 0.3233703567579771 -0.21913229924480676 -0.87296387152696719 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.073941300000000001 -0.98245000000000005 -0.17124700000000001 0
		 -0.070223099999999997 -0.166161 0.983595 0 -0.99478699999999998 0.084753800000000004 -0.056704499999999998 0
		 -15.674006 32.893588000000001 -4.9973979999999996 1;
	setAttr ".fbxID" 5;
createNode joint -n "foot_r" -p "|Mannequin|root|pelvis|thigh_r|calf_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 40.196819305419922 1.6769354260759428e-006 -1.0918018233496696e-005 ;
	setAttr ".r" -type "double3" -0.41538650297038404 3.7049346376769421 8.0595688253161288 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.014826199999999999 -0.99980800000000003 -0.0128223 0
		 -0.045693900000000003 -0.0121329 0.99888200000000005 0 -0.99884499999999998 0.015395499999999999 -0.045505200000000003 0
		 -17.076294999999998 13.465771999999999 -8.074484 1;
	setAttr ".fbxID" 5;
createNode joint -n "ball_r" -p "|Mannequin|root|pelvis|thigh_r|calf_r|foot_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.453816413879395 16.577796936035156 -0.080158449709415436 ;
	setAttr ".r" -type "double3" 0.0039439606158808488 0.0089523646390348398 -91.883584507706402 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.046312600000000002 0.044986400000000003 -0.99791399999999997 0
		 -0.013384999999999999 -0.99886799999999998 -0.0456506 0 -0.99883699999999997 0.0154713 -0.045657999999999997 0
		 -17.908722999999998 2.8115939999999999 8.3543810000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twist_01_r" -p "|Mannequin|root|pelvis|thigh_r";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 22.094240188598633 2.2204460492503131e-016 -3.5527136788005009e-015 ;
	setAttr ".r" -type "double3" -5.4388652516332607 -0.00016294582991486909 -0.056340640185448501 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.12228600000000001 -0.99201499999999998 -0.030855 0
		 -0.054217099999999997 -0.024365000000000001 0.99823200000000001 0 -0.99101300000000003 0.12374300000000001 -0.050804700000000001 0
		 -11.710775999999999 73.381932000000006 -1.190259 1;
	setAttr ".fbxID" 5;
createNode joint -n "ik_foot_root" -p "|Mannequin|root";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr ".fbxID" 5;
createNode joint -n "ik_foot_l" -p "|Mannequin|root|ik_foot_root";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 17.076271057128906 8.0721273422241211 13.465730667114258 ;
	setAttr ".r" -type "double3" 141.82109907679421 -88.877882344641009 -139.2072685533158 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.014826199999999999 0.99980800000000003 0.0127943 0
		 -0.045693900000000003 0.0121049 -0.99888200000000005 0 -0.99884499999999998 -0.0153942 0.0455056 0
		 17.076270999999998 13.465731 -8.0721270000000001 1;
	setAttr ".fbxID" 5;
createNode joint -n "ik_foot_r" -p "|Mannequin|root|ik_foot_root";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -17.076288223266602 8.072148323059082 13.465573310852051 ;
	setAttr ".r" -type "double3" -38.178896254116694 88.87788234464135 139.20726855331429 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.014826199999999999 -0.99980800000000003 -0.0127943 0
		 -0.045693999999999999 -0.0121049 0.99888200000000005 0 -0.99884499999999998 0.0153942 -0.045505700000000003 0
		 -17.076288000000002 13.465572999999999 -8.0721480000000003 1;
	setAttr ".fbxID" 5;
createNode joint -n "ik_hand_root" -p "|Mannequin|root";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr ".fbxID" 5;
createNode joint -n "ik_hand_gun" -p "|Mannequin|root|ik_hand_root";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -56.646099090576172 0.33541175723075867 111.67965698242187 ;
	setAttr ".r" -type "double3" 74.068034932419735 -35.172619359131048 32.751040496204631 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.68747400000000003 0.57604200000000005 -0.442216 0
		 -0.61435799999999996 0.786022 0.068803400000000001 0 0.38722499999999999 0.22437799999999999 0.89426600000000001 0
		 -56.646099 111.67965700000001 -0.33541199999999999 1;
	setAttr ".fbxID" 5;
createNode joint -n "ik_hand_l" -p "|Mannequin|root|ik_hand_root|ik_hand_gun";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 77.885429382324219 -69.601913452148438 43.869503021240234 ;
	setAttr ".r" -type "double3" -145.80035347066806 -32.168746996028787 -93.709015145164315 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.68747400000000003 -0.57604200000000005 0.442216 0
		 -0.61435799999999996 -0.786022 -0.068803900000000001 0 0.38722600000000001 -0.22437799999999999 -0.89426600000000001 0
		 56.646000000000001 111.679664 -0.335453 1;
	setAttr ".fbxID" 5;
createNode joint -n "ik_hand_r" -p "|Mannequin|root|ik_hand_root|ik_hand_gun";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.5527136788005009e-014 0 3.5527136788005009e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.68747400000000003 0.57604200000000005 -0.442216 0
		 -0.61435799999999996 0.786022 0.068803400000000001 0 0.38722499999999999 0.22437799999999999 0.89426600000000001 0
		 -56.646099 111.67965700000001 -0.33541199999999999 1;
	setAttr ".fbxID" 5;
createNode transform -n "Manny";
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode joint -n "root" -p "Manny";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "jointTRSData" -ln "jointTRSData" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".jointTRSData" -type "string" (
		"(dp0&lf;Vupperarm_bicep_l&lf;p1&lf;(dp2&lf;S'rotation'&lf;p3&lf;(F-2.112087093159394e-16&lf;F1.6101558074909054e-14&lf;F-1.948089742396404e-14&lf;tp4&lf;sS'translate'&lf;p5&lf;(F0.4296336514963315&lf;F-3.0014054840172104&lf;F-0.33568228722386095&lf;tp6&lf;sS'scale'&lf;p7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp8&lf;ssVthigh_fwd_r&lf;p9&lf;(dp10&lf;g3&lf;(F-3.2351075555054503e-09&lf;F-3.554814002738346e-09&lf;F4.6893499014910565e-09&lf;tp11&lf;sg5&lf;(F-5.8879919004175605&lf;F7.159845239867742&lf;F-0.8596299999494192&lf;tp12&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp13&lf;ssVupperarm_twist_02_r&lf;p14&lf;(dp15&lf;g3&lf;(F-5.715515410477199e-05&lf;F0.239297380467856&lf;F-0.013684890989370199&lf;tp16&lf;sg5&lf;(F-16.831266561863387&lf;F1.8815802156346706e-05&lf;F-0.00023473533977380612&lf;tp17&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp18&lf;ssVthigh_fwd_l&lf;p19&lf;(dp20&lf;g3&lf;(F-3.0625942677403114e-09&lf;F3.73169190518625e-08&lf;F5.2113571248109e-09&lf;tp21&lf;sg5&lf;(F5.892345071609&lf;F-7.144273484161924&lf;F0.8632194689173218&lf;tp22&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp23&lf;ssVupperarm_twist_02_l&lf;p24&lf;(dp25&lf;g3&lf;(F-5.715515410371704e-05&lf;F0.2392973804688322&lf;F-0.013684890989424315&lf;tp26&lf;sg5&lf;(F16.83153379318587&lf;F1.7763568394002505e-15&lf;F0.0&lf;tp27&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp28&lf;ssVspine_02&lf;p29&lf;(dp30&lf;g3&lf;(F-1.2132853246549658e-20&lf;F-5.763105292111093e-19&lf;F-2.3854160140597598e-15&lf;tp31&lf;sg5&lf;(F4.64819543873827&lf;F0.0&lf;F9.247810850432359e-15&lf;tp32&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp33&lf;ssVspine_03&lf;p34&lf;(dp35&lf;g3&lf;(F3.8839555994523184e-42&lf;F9.390828412829445e-18&lf;F4.739395799433465e-23&lf;tp36&lf;sg5&lf;(F7.10706776307444&lf;F7.105427357601002e-15&lf;F-1.6302063865492045e-14&lf;tp37&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp38&lf;ssVspine_04&lf;p39&lf;(dp40&lf;g3&lf;(F-5.823769558343841e-19&lf;F4.246498636292384e-20&lf;F1.590277269640821e-15&lf;tp41&lf;sg5&lf;(F8.248942899748158&lf;F3.552713678800501e-15&lf;F-2.1010970741031088e-14&lf;tp42&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp43&lf;ssVspine_05&lf;p44&lf;(dp45&lf;g3&lf;(F-1.4559423895859602e-19&lf;F4.659679162086993e-18&lf;F1.4908847995874568e-16&lf;tp46&lf;sg5&lf;(F16.308254953927232&lf;F-7.105427357601002e-15&lf;F2.3062281251373662e-14&lf;tp47&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp48&lf;ssVindex_metacarpal_r&lf;p49&lf;(dp50&lf;g3&lf;(F-4.808104147368675e-15&lf;F2.4351121779955047e-15&lf;F2.2363275104040347e-15&lf;tp51&lf;sg5&lf;(F-3.457892340165678&lf;F-0.010593711576447618&lf;F1.529324513338704&lf;tp52&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp53&lf;ssVupperarm_bicep_r&lf;p54&lf;(dp55&lf;g3&lf;(F3.1557065980145833e-14&lf;F5.367186024969683e-15&lf;F6.361109362927035e-15&lf;tp56&lf;sg5&lf;(F-0.570192043047129&lf;F3.0080906171650774&lf;F0.15133974465763345&lf;tp57&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp58&lf;ssVlowerarm_in_r&lf;p59&lf;(dp60&lf;g3&lf;(F2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp61&lf;sg5&lf;(F-1.5514355804486115&lf;F-0.21415705989632272&lf;F2.2829596952656743&lf;tp62&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp63&lf;ssVwrist_inner_l&lf;p64&lf;(dp65&lf;g3&lf;(F-5.1497652947915144e-14&lf;F-9.541664044390552e-15&lf;F-4.174478019420861e-15&lf;tp66&lf;sg5&lf;(F-0.08634634823715714&lf;F1.6269678363065907&lf;F-0.47525639176425827&lf;tp67&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp68&lf;ssVthigh_out_r&lf;p69&lf;(dp70&lf;g3&lf;(F-1.122660004060381e-09&lf;F7.74599041022121e-09&lf;F1.0052238419628676e-08&lf;tp71&lf;sg5&lf;(F-5.490222724311039&lf;F-1.2357139686785958&lf;F4.529304741894016&lf;tp72&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp73&lf;ssVclavicle_l&lf;p74&lf;(dp75&lf;g3&lf;(F-2.7034714792439897e-14&lf;F6.659286364314223e-15&lf;F359.99999999999994&lf;tp76&lf;sg5&lf;(F5.434344857110261&lf;F0.9364505906511198&lf;F-0.866799571158099&lf;tp77&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp78&lf;ssVupperarm_twist_01_r&lf;p79&lf;(dp80&lf;g3&lf;(F-6.1858806299137406e-15&lf;F-2.4343783062529425e-15&lf;F-9.660793900053754e-15&lf;tp81&lf;sg5&lf;(F-8.639670830686583&lf;F0.09629670980522409&lf;F0.16541554783053414&lf;tp82&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp83&lf;ssVball_r&lf;p84&lf;(dp85&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp86&lf;sg5&lf;(F5.70729832865123&lf;F11.471707953183119&lf;F0.00175755891641316&lf;tp87&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp88&lf;ssVthigh_twistCor_01_r&lf;p89&lf;(dp90&lf;g3&lf;(F-7.966473664013811e-13&lf;F7.136261186895984e-18&lf;F-1.5803581998339445e-10&lf;tp91&lf;sg5&lf;(F-6.110667527536862e-13&lf;F-2.0383694732117874e-13&lf;F7.105427357601002e-15&lf;tp92&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp93&lf;ssVthigh_twistCor_01_l&lf;p94&lf;(dp95&lf;g3&lf;(F-7.679131785889907e-13&lf;F-6.227958139655539e-18&lf;F-1.5803582267887843e-10&lf;tp96&lf;sg5&lf;(F6.252776074688882e-13&lf;F2.0294876890147862e-13&lf;F-1.0658141036401503e-14&lf;tp97&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp98&lf;ssVindex_03_l&lf;p99&lf;(dp100&lf;g3&lf;(F-5.308123295365481e-21&lf;F2.1581542102166356e-40&lf;F4.6590149061444796e-18&lf;tp101&lf;sg5&lf;(F2.3173075307279305&lf;F2.842170943040401e-14&lf;F9.769962616701378e-15&lf;tp102&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp103&lf;ssVball_l&lf;p104&lf;(dp105&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp106&lf;sg5&lf;(F-5.707299374390027&lf;F-11.471697092323957&lf;F-0.0017138404028358423&lf;tp107&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp108&lf;ssVupperarm_twist_01_l&lf;p109&lf;(dp110&lf;g3&lf;(F2.5988450325576927e-15&lf;F1.4877974460841166e-16&lf;F3.2046487033437818e-15&lf;tp111&lf;sg5&lf;(F8.63996069843948&lf;F-0.09628023891043291&lf;F-0.16557725147991675&lf;tp112&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp113&lf;ssVclavicle_r&lf;p114&lf;(dp115&lf;g3&lf;(F180.0&lf;F180.0&lf;F-180.0&lf;tp116&lf;sg5&lf;(F5.433600703058573&lf;F0.9365499957792274&lf;F0.8688515061571342&lf;tp117&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp118&lf;ssVwrist_inner_r&lf;p119&lf;(dp120&lf;g3&lf;(F-1.2709794684129601e-14&lf;F3.1805546814635168e-15&lf;F-3.578124016646457e-15&lf;tp121&lf;sg5&lf;(F0.05073241165543152&lf;F-1.456593948087047&lf;F0.4146242448130657&lf;tp122&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp123&lf;ssVthigh_out_l&lf;p124&lf;(dp125&lf;g3&lf;(F-7.841617927850014e-09&lf;F-1.611360794686607e-08&lf;F-6.402664334885883e-09&lf;tp126&lf;sg5&lf;(F5.488080642544915&lf;F1.2215333393427994&lf;F-4.541695609589556&lf;tp127&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp128&lf;ssVclavicle_out_l&lf;p129&lf;(dp130&lf;g3&lf;(F2.1369351765716433e-15&lf;F-3.0719030044415276e-10&lf;F1.3674210922985612e-14&lf;tp131&lf;sg5&lf;(F10.05977550712825&lf;F0.047623277898917404&lf;F5.124009981794558&lf;tp132&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp133&lf;ssVthigh_l&lf;p134&lf;(dp135&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp136&lf;sg5&lf;(F-3.011926735188311&lf;F-0.06340308345171675&lf;F-10.395847431675032&lf;tp137&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp138&lf;ssVcalf_correctiveRoot_l&lf;p139&lf;(dp140&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp141&lf;sg5&lf;(F7.105427357601002e-15&lf;F-4.440892098500626e-16&lf;F-8.881784197001252e-15&lf;tp142&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp143&lf;ssVclavicle_out_r&lf;p144&lf;(dp145&lf;g3&lf;(F1.5853077242196556e-14&lf;F-1.733539619516481e-08&lf;F-1.1745378447666112e-14&lf;tp146&lf;sg5&lf;(F-10.296855532639404&lf;F0.1711587055647632&lf;F-5.132314944700084&lf;tp147&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp148&lf;ssVfoot_l&lf;p149&lf;(dp150&lf;g3&lf;(F3.1060104311167183e-18&lf;F-3.975696764194372e-15&lf;F-7.450785178706153e-17&lf;tp151&lf;sg5&lf;(F-38.868305766260185&lf;F-1.8835664532534935e-06&lf;F-6.242941395839807e-06&lf;tp152&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp153&lf;ssVthigh_correctiveRoot_l&lf;p154&lf;(dp155&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp156&lf;sg5&lf;(F1.4210854715202004e-14&lf;F2.6645352591003757e-15&lf;F3.552713678800501e-15&lf;tp157&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp158&lf;ssVspine_01&lf;p159&lf;(dp160&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp161&lf;sg5&lf;(F2.303684184416582&lf;F3.552713678800501e-15&lf;F8.632417697329586e-16&lf;tp162&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp163&lf;ssVupperarm_out_r&lf;p164&lf;(dp165&lf;g3&lf;(F0.0&lf;F7.727962875304028e-09&lf;F0.0&lf;tp166&lf;sg5&lf;(F-0.0015998720624850193&lf;F-0.26206737267851477&lf;F-5.478375142778077&lf;tp167&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp168&lf;ssVmiddle_03_l&lf;p169&lf;(dp170&lf;g3&lf;(F-6.212020862233431e-18&lf;F-7.442292181433567e-17&lf;F3.975754016095629e-16&lf;tp171&lf;sg5&lf;(F2.7046150315646855&lf;F-7.105427357601002e-15&lf;F-7.105427357601002e-15&lf;tp172&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp173&lf;ssVring_02_r&lf;p174&lf;(dp175&lf;g3&lf;(F3.7272125173400593e-17&lf;F-9.93923337957349e-17&lf;F-9.541615512977564e-15&lf;tp176&lf;sg5&lf;(F-3.9621715292690425&lf;F1.5004568538756757e-05&lf;F-4.923994394800957e-05&lf;tp177&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp178&lf;ssVthumb_01_r&lf;p179&lf;(dp180&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp181&lf;sg5&lf;(F-2.4749759005593006&lf;F-1.2059805117236948&lf;F2.2430633666914694&lf;tp182&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp183&lf;ssVthumb_01_l&lf;p184&lf;(dp185&lf;g3&lf;(F-1.3517357396219944e-14&lf;F-7.951386703658789e-15&lf;F3.1805546814635168e-15&lf;tp186&lf;sg5&lf;(F2.4749410357123125&lf;F1.2059493890390485&lf;F-2.242953361528688&lf;tp187&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp188&lf;ssVring_02_l&lf;p189&lf;(dp190&lf;g3&lf;(F2.4848083448933737e-17&lf;F-1.4287647983136886e-16&lf;F-1.272226725726705e-14&lf;tp191&lf;sg5&lf;(F3.962151505953962&lf;F-1.4210854715202004e-14&lf;F-3.907985046680551e-14&lf;tp192&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp193&lf;ssVupperarm_out_l&lf;p194&lf;(dp195&lf;g3&lf;(F0.0&lf;F7.727962875304028e-09&lf;F0.0&lf;tp196&lf;sg5&lf;(F-0.13826645305934449&lf;F0.26872367525577534&lf;F5.293475235855169&lf;tp197&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp198&lf;ssVmiddle_03_r&lf;p199&lf;(dp200&lf;g3&lf;(F-1.5530052155583591e-18&lf;F-7.454425034680117e-17&lf;F1.5902788573384142e-15&lf;tp201&lf;sg5&lf;(F-2.7046326736289075&lf;F1.1443238847164139e-05&lf;F2.466278816015688e-05&lf;tp202&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp203&lf;ssVankle_fwd_r&lf;p204&lf;(dp205&lf;g3&lf;(F3.602972100095387e-16&lf;F-2.882377680076312e-15&lf;F1.1927080055488187e-14&lf;tp206&lf;sg5&lf;(F-1.6349691499013561&lf;F4.197070299797255&lf;F-0.4635870315139865&lf;tp207&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp208&lf;ssVthigh_correctiveRoot_r&lf;p209&lf;(dp210&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp211&lf;sg5&lf;(F0.0&lf;F-1.7763568394002505e-15&lf;F-5.329070518200751e-15&lf;tp212&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp213&lf;ssVcalf_correctiveRoot_r&lf;p214&lf;(dp215&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp216&lf;sg5&lf;(F7.105427357601002e-15&lf;F-8.881784197001252e-16&lf;F-1.7763568394002505e-15&lf;tp217&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp218&lf;ssVthigh_bck_lwr_l&lf;p219&lf;(dp220&lf;g3&lf;(F2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp221&lf;sg5&lf;(F-5.597656441629496&lf;F9.947071814613224&lf;F1.4709560480788824&lf;tp222&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp223&lf;ssVupperarm_twistCor_01_r&lf;p224&lf;(dp225&lf;g3&lf;(F-5.715515408476811e-05&lf;F0.2392973804678571&lf;F-0.013684890989359285&lf;tp226&lf;sg5&lf;(F0.22332124117612295&lf;F-0.09634080925396127&lf;F-0.16646707192127508&lf;tp227&lf;sg7&lf;(F0.9999999999999997&lf;F1.0&lf;F0.9999999999999998&lf;tp228&lf;ssVhand_r&lf;p229&lf;(dp230&lf;g3&lf;(F-1.9878466759146967e-16&lf;F-4.770832022195275e-15&lf;F-3.1805546814635168e-15&lf;tp231&lf;sg5&lf;(F-24.320337470574643&lf;F-0.0002950651889577216&lf;F0.0003046297929785169&lf;tp232&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp233&lf;ssVthumb_03_l&lf;p234&lf;(dp235&lf;g3&lf;(F-3.416611474228386e-17&lf;F-4.7366659074529904e-17&lf;F-4.246498636292382e-20&lf;tp236&lf;sg5&lf;(F2.5261795391662645&lf;F3.552713678800501e-14&lf;F-4.263256414560601e-14&lf;tp237&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp238&lf;ssVhand_l&lf;p239&lf;(dp240&lf;g3&lf;(F-6.6592863643142385e-15&lf;F-3.1805546814635168e-15&lf;F-3.1805546814635164e-15&lf;tp241&lf;sg5&lf;(F24.32004358863988&lf;F0.0&lf;F1.4210854715202004e-14&lf;tp242&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp243&lf;ssVthumb_03_r&lf;p244&lf;(dp245&lf;g3&lf;(F-2.174207301781701e-17&lf;F-2.348920388532016e-17&lf;F-4.770874487181638e-15&lf;tp246&lf;sg5&lf;(F-2.526164976356057&lf;F-4.6664516247574284e-05&lf;F7.370655225713563e-06&lf;tp247&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp248&lf;ssVupperarm_twistCor_01_l&lf;p249&lf;(dp250&lf;g3&lf;(F-5.7155154111593384e-05&lf;F0.23929738046885052&lf;F-0.013684890989412526&lf;tp251&lf;sg5&lf;(F-0.22347730841758562&lf;F0.09633378358038591&lf;F0.16651206011033537&lf;tp252&lf;sg7&lf;(F0.9999999999999999&lf;F1.0&lf;F0.9999999999999999&lf;tp253&lf;ssVthigh_bck_lwr_r&lf;p254&lf;(dp255&lf;g3&lf;(F-2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp256&lf;sg5&lf;(F5.844458568800249&lf;F-10.021941949068122&lf;F-1.8531909603709966&lf;tp257&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp258&lf;ssVupperarm_in_r&lf;p259&lf;(dp260&lf;g3&lf;(F-4.0183257565534246e-10&lf;F-4.683048712998474e-10&lf;F-3.3057467384465757e-10&lf;tp261&lf;sg5&lf;(F-5.2225564187980495&lf;F1.2711843167447734&lf;F3.8834782317378966&lf;tp262&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp263&lf;ssVlowerarm_fwd_r&lf;p264&lf;(dp265&lf;g3&lf;(F2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp266&lf;sg5&lf;(F-1.3920519520020491&lf;F2.2598182327670386&lf;F-0.5667739685873983&lf;tp267&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp268&lf;ssVlowerarm_out_r&lf;p269&lf;(dp270&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp271&lf;sg5&lf;(F-0.6170078789895399&lf;F-1.280766963895374&lf;F-2.1175791102128443&lf;tp272&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp273&lf;ssVankle_bck_r&lf;p274&lf;(dp275&lf;g3&lf;(F-1.8803787149980595e-14&lf;F3.9756933518293936e-15&lf;F-1.1877383888590321e-14&lf;tp276&lf;sg5&lf;(F-0.6507357602611608&lf;F-3.799005098240129&lf;F0.5425226013393445&lf;tp277&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp278&lf;ssVupperarm_bck_r&lf;p279&lf;(dp280&lf;g3&lf;(F-1.631032968523696e-08&lf;F-1.793436243543718e-08&lf;F6.623600521598822e-09&lf;tp281&lf;sg5&lf;(F-1.613973273688245&lf;F-5.899539327146831&lf;F-0.6838130492740362&lf;tp282&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp283&lf;ssVupperarm_bck_l&lf;p284&lf;(dp285&lf;g3&lf;(F-1.631031696301823e-08&lf;F-1.7934362477562443e-08&lf;F6.623600333685193e-09&lf;tp286&lf;sg5&lf;(F1.453320472410553&lf;F5.922331709928633&lf;F0.5193119630590957&lf;tp287&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp288&lf;ssVankle_bck_l&lf;p289&lf;(dp290&lf;g3&lf;(F4.821925894076175e-14&lf;F4.709965190659037e-08&lf;F7.032007635867419e-15&lf;tp291&lf;sg5&lf;(F0.7196897359995171&lf;F3.149843256350702&lf;F-0.1865279959374142&lf;tp292&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp293&lf;ssVlowerarm_fwd_l&lf;p294&lf;(dp295&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp296&lf;sg5&lf;(F1.3286701233338505&lf;F-2.523348037160204&lf;F0.4477197471650243&lf;tp297&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp298&lf;ssVmiddle_01_r&lf;p299&lf;(dp300&lf;g3&lf;(F-2.3854160110976384e-15&lf;F5.665363026356887e-15&lf;F-1.8884543421189624e-14&lf;tp301&lf;sg5&lf;(F-5.182307875635303&lf;F1.2473883217012371e-05&lf;F4.441538994015559e-05&lf;tp302&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp303&lf;ssVcalf_twist_02_l&lf;p304&lf;(dp305&lf;g3&lf;(F-1.2813263656616176e-15&lf;F1.2695893467522358e-18&lf;F-7.368169808403853e-17&lf;tp306&lf;sg5&lf;(F-12.958133997348298&lf;F-0.13437907398599447&lf;F0.11553495636094979&lf;tp307&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp308&lf;ssVlowerarm_twist_01_r&lf;p309&lf;(dp310&lf;g3&lf;(F-1.6743337480238544e-18&lf;F-1.428764306601375e-15&lf;F-1.2424050610833987e-17&lf;tp311&lf;sg5&lf;(F-15.709295982891412&lf;F0.0653041102279559&lf;F0.03263931215387572&lf;tp312&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp313&lf;ssVspine_04_latissimus_r&lf;p314&lf;(dp315&lf;g3&lf;(F-2.1200329155989934e-09&lf;F-2.0738501467058974e-08&lf;F9.430233311509153e-09&lf;tp316&lf;sg5&lf;(F-7.8201672809249345&lf;F3.0343685369015496&lf;F11.943057680552283&lf;tp317&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp318&lf;ssVspine_04_latissimus_l&lf;p319&lf;(dp320&lf;g3&lf;(F5.5057566312661764e-09&lf;F1.6766699921248585e-08&lf;F7.858422271679882e-09&lf;tp321&lf;sg5&lf;(F-7.810114020338162&lf;F3.0346754472192004&lf;F-11.935268925526474&lf;tp322&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp323&lf;ssVlowerarm_twist_01_l&lf;p324&lf;(dp325&lf;g3&lf;(F2.0627063804459095e-16&lf;F1.0062276329226985e-15&lf;F-1.2320628108123222e-17&lf;tp326&lf;sg5&lf;(F15.709011726426546&lf;F-0.06554904986637666&lf;F-0.03229837036940353&lf;tp327&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp328&lf;ssVcalf_twist_02_r&lf;p329&lf;(dp330&lf;g3&lf;(F-1.0969433948738022e-15&lf;F-1.1337156085782787e-17&lf;F-7.38058228600257e-17&lf;tp331&lf;sg5&lf;(F12.958172261711361&lf;F0.13438813926951898&lf;F-0.11546192380812315&lf;tp332&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp333&lf;ssVmiddle_01_l&lf;p334&lf;(dp335&lf;g3&lf;(F-1.5902773407317584e-15&lf;F-2.087239009710433e-15&lf;F2.8966260080954173e-32&lf;tp336&lf;sg5&lf;(F5.182243307643894&lf;F4.263256414560601e-14&lf;F-2.4868995751603507e-14&lf;tp337&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp338&lf;ssVcalf_knee_r&lf;p339&lf;(dp340&lf;g3&lf;(F-9.373939481779854e-15&lf;F-6.433371167720549e-09&lf;F1.1927080056014457e-14&lf;tp341&lf;sg5&lf;(F-0.04499406685729923&lf;F4.304237479045141&lf;F-0.11863616250326992&lf;tp342&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp343&lf;ssVclavicle_scap_r&lf;p344&lf;(dp345&lf;g3&lf;(F-7.2333774824279544e-12&lf;F-5.447464020267169e-09&lf;F2.099599539267737e-08&lf;tp346&lf;sg5&lf;(F-8.497017971073436&lf;F-5.6879741751418536&lf;F2.203234247844506&lf;tp347&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp348&lf;ssVclavicle_pec_l&lf;p349&lf;(dp350&lf;g3&lf;(F5.934906090541604e-09&lf;F-4.328964219255888e-09&lf;F-6.3721458878959175e-09&lf;tp351&lf;sg5&lf;(F-7.859747892191649&lf;F-9.235935633950017&lf;F-9.161680251024567&lf;tp352&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp353&lf;ssVcalf_knee_l&lf;p354&lf;(dp355&lf;g3&lf;(F1.1771779534322956e-14&lf;F-6.4333697762278764e-09&lf;F-6.9574633663623315e-15&lf;tp356&lf;sg5&lf;(F0.04207871964077725&lf;F-4.30754958067433&lf;F0.1160674853346002&lf;tp357&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp358&lf;ssVclavicle_scap_l&lf;p359&lf;(dp360&lf;g3&lf;(F-2.0063835062731552e-11&lf;F-8.936741229731349e-09&lf;F2.0529569357960723e-08&lf;tp361&lf;sg5&lf;(F8.269065264677947&lf;F5.697957688764333&lf;F-2.2342434592936797&lf;tp362&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp363&lf;ssVfoot_r&lf;p364&lf;(dp365&lf;g3&lf;(F3.4942617350063054e-18&lf;F2.2716118211881422e-36&lf;F-7.449571893381498e-17&lf;tp366&lf;sg5&lf;(F38.8683479675059&lf;F4.218847493575595e-15&lf;F-1.7763568394002505e-15&lf;tp367&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp368&lf;ssVupperarm_in_l&lf;p369&lf;(dp370&lf;g3&lf;(F-4.0185802536309686e-10&lf;F-4.683430379560251e-10&lf;F-3.305746816879782e-10&lf;tp371&lf;sg5&lf;(F5.574552996471354&lf;F-1.4832878115397845&lf;F-4.299906325106548&lf;tp372&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp373&lf;ssVlowerarm_out_l&lf;p374&lf;(dp375&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp376&lf;sg5&lf;(F0.5829331297469622&lf;F0.9090844050165288&lf;F1.8502389625441538&lf;tp377&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp378&lf;ssVthumb_02_l&lf;p379&lf;(dp380&lf;g3&lf;(F6.0918383961604464e-33&lf;F7.299124513124281e-17&lf;F9.563794368712256e-15&lf;tp381&lf;sg5&lf;(F4.316671956003702&lf;F0.0&lf;F3.552713678800501e-14&lf;tp382&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp383&lf;ssVankle_fwd_l&lf;p384&lf;(dp385&lf;g3&lf;(F2.4532823392578864e-14&lf;F-3.8486528438178006e-08&lf;F-7.156248041532465e-15&lf;tp386&lf;sg5&lf;(F1.2908153718236504&lf;F-3.768957865912955&lf;F-0.07680916272578031&lf;tp387&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp388&lf;ssVthumb_02_r&lf;p389&lf;(dp390&lf;g3&lf;(F3.975693351829394e-16&lf;F-1.584065319869525e-15&lf;F1.2723383479765737e-14&lf;tp391&lf;sg5&lf;(F-4.316661343859899&lf;F-2.3635732418370026e-05&lf;F-4.3211523554020914e-05&lf;tp392&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp393&lf;ssVindex_metacarpal_l&lf;p394&lf;(dp395&lf;g3&lf;(F-4.708711813572941e-15&lf;F9.939233379573501e-17&lf;F2.4848083448933726e-15&lf;tp396&lf;sg5&lf;(F3.4579468886887668&lf;F0.010562601629231949&lf;F-1.5292670130053594&lf;tp397&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp398&lf;ssVlowerarm_in_l&lf;p399&lf;(dp400&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp401&lf;sg5&lf;(F1.3306420256329048&lf;F0.24547389055802427&lf;F-2.7035021548269356&lf;tp402&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp403&lf;ssVlowerarm_twist_02_r&lf;p404&lf;(dp405&lf;g3&lf;(F-6.721600698588516e-18&lf;F-5.715057220481254e-15&lf;F-3.2583346120769835e-23&lf;tp406&lf;sg5&lf;(F-7.8497274814736855&lf;F0.10257835424635431&lf;F0.03918630802392897&lf;tp407&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp408&lf;ssVcalf_twist_01_l&lf;p409&lf;(dp410&lf;g3&lf;(F-8.492997272584769e-20&lf;F-1.1848489498583718e-23&lf;F-7.454422664982217e-17&lf;tp411&lf;sg5&lf;(F-25.92498684096225&lf;F-0.08807316453161773&lf;F0.10071990957672128&lf;tp412&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp413&lf;ssVupperarm_r&lf;p414&lf;(dp415&lf;g3&lf;(F-1.0933156717530838e-15&lf;F1.2424041724466842e-17&lf;F-1.987846675914698e-15&lf;tp416&lf;sg5&lf;(F-14.246069020159924&lf;F-3.984049673277923e-06&lf;F-0.00038072217765261485&lf;tp417&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp418&lf;ssVcalf_twistCor_02_r&lf;p419&lf;(dp420&lf;g3&lf;(F7.504981906187296e-13&lf;F5.256448295143624e-18&lf;F5.706716964926347e-10&lf;tp421&lf;sg5&lf;(F-1.2789769243681803e-12&lf;F2.353672812205332e-14&lf;F0.0&lf;tp422&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp423&lf;ssVthigh_bck_l&lf;p424&lf;(dp425&lf;g3&lf;(F-3.3281960298549105e-10&lf;F7.492530405354367e-09&lf;F-1.1907707579416888e-10&lf;tp426&lf;sg5&lf;(F3.5690050994295888&lf;F10.405499415408876&lf;F2.1497621859770657&lf;tp427&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp428&lf;ssVindex_02_l&lf;p429&lf;(dp430&lf;g3&lf;(F-3.727212517340059e-17&lf;F3.8825130388958945e-18&lf;F-7.279711947929802e-20&lf;tp431&lf;sg5&lf;(F4.25400585260217&lf;F-2.842170943040401e-14&lf;F-7.105427357601002e-15&lf;tp432&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp433&lf;ssVthigh_bck_r&lf;p434&lf;(dp435&lf;g3&lf;(F4.547938750138404e-10&lf;F1.2473182494297477e-09&lf;F1.8459230383879978e-10&lf;tp436&lf;sg5&lf;(F-3.570662230365997&lf;F-10.412042020771928&lf;F-2.17580140441963&lf;tp437&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp438&lf;ssVindex_02_r&lf;p439&lf;(dp440&lf;g3&lf;(F-3.727212517340059e-17&lf;F3.1060104311167156e-18&lf;F-8.492997272584769e-20&lf;tp441&lf;sg5&lf;(F-4.254001839627506&lf;F2.1309285713755344e-05&lf;F8.939731338131196e-05&lf;tp442&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp443&lf;ssVneck_02&lf;p444&lf;(dp445&lf;g3&lf;(F-2.426570649309934e-19&lf;F-3.727212517340059e-17&lf;F2.84363747966008e-22&lf;tp446&lf;sg5&lf;(F5.450919182046334&lf;F1.4210854715202004e-14&lf;F1.3086753902769033e-14&lf;tp447&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp448&lf;ssVneck_01&lf;p449&lf;(dp450&lf;g3&lf;(F3.1060104311167156e-18&lf;F-1.941256519447947e-18&lf;F-9.541663760026802e-15&lf;tp451&lf;sg5&lf;(F11.10442132885018&lf;F1.4210854715202004e-14&lf;F1.2705114738054135e-14&lf;tp452&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp453&lf;ssVcalf_twist_01_r&lf;p454&lf;(dp455&lf;g3&lf;(F-6.066426623274834e-20&lf;F-1.2424077269935359e-17&lf;F-7.454424442255643e-17&lf;tp456&lf;sg5&lf;(F25.925076009789063&lf;F0.08808086210734589&lf;F-0.10067777201496497&lf;tp457&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp458&lf;ssVupperarm_l&lf;p459&lf;(dp460&lf;g3&lf;(F-3.578124016646457e-15&lf;F-7.454425034680119e-17&lf;F-3.975693351829396e-16&lf;tp461&lf;sg5&lf;(F14.246126391528867&lf;F3.9968028886505635e-15&lf;F-2.842170943040401e-14&lf;tp462&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp463&lf;ssVlowerarm_twist_02_l&lf;p464&lf;(dp465&lf;g3&lf;(F8.251007514582334e-16&lf;F4.01248648404208e-15&lf;F-4.9282568712817974e-17&lf;tp466&lf;sg5&lf;(F7.849649281922929&lf;F-0.10263520133286619&lf;F-0.039097261663499694&lf;tp467&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp468&lf;ssVhead&lf;p469&lf;(dp470&lf;g3&lf;(F-4.6590156466750695e-18&lf;F5.056973233161904e-17&lf;F1.113193759360567e-14&lf;tp471&lf;sg5&lf;(F5.366716115241388&lf;F-7.105427357601002e-15&lf;F3.309852392163748e-14&lf;tp472&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp473&lf;ssVthigh_twist_02_l&lf;p474&lf;(dp475&lf;g3&lf;(F-9.220968467377749e-16&lf;F-4.926728712348722e-17&lf;F2.279365015779531e-18&lf;tp476&lf;sg5&lf;(F-28.47903032534198&lf;F0.17386366818659837&lf;F0.0056687508871462455&lf;tp477&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp478&lf;ssVthigh_fwd_lwr_r&lf;p479&lf;(dp480&lf;g3&lf;(F-2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp481&lf;sg5&lf;(F-0.4782982245318834&lf;F6.809431755534755&lf;F-0.7662289287193396&lf;tp482&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp483&lf;ssVring_metacarpal_r&lf;p484&lf;(dp485&lf;g3&lf;(F-6.957463365701443e-16&lf;F4.969616689786745e-16&lf;F-3.1805546814635168e-15&lf;tp486&lf;sg5&lf;(F-2.804780390195006&lf;F-0.22716314349776212&lf;F-1.059677422149715&lf;tp487&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp488&lf;ssVpinky_03_l&lf;p489&lf;(dp490&lf;g3&lf;(F-1.1647539116687691e-18&lf;F3.7344922292879887e-17&lf;F-2.385414873642646e-15&lf;tp491&lf;sg5&lf;(F1.6696361810729314&lf;F-4.973799150320701e-14&lf;F7.105427357601002e-15&lf;tp492&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp493&lf;ssVlowerarm_r&lf;p494&lf;(dp495&lf;g3&lf;(F-1.1181637552020177e-16&lf;F1.2734642767578534e-16&lf;F1.2132853246549658e-19&lf;tp496&lf;sg5&lf;(F-25.246899842795102&lf;F2.8223703232299613e-05&lf;F-0.0003521030096464983&lf;tp497&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp498&lf;ssVpinky_01_r&lf;p499&lf;(dp500&lf;g3&lf;(F1.7393658414253607e-16&lf;F-1.8636062586700284e-17&lf;F-6.359944609015365e-15&lf;tp501&lf;sg5&lf;(F-4.397007478658836&lf;F-4.320010107505823e-05&lf;F-2.742241442632576e-05&lf;tp502&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp503&lf;ssVthigh_twist_01_r&lf;p504&lf;(dp505&lf;g3&lf;(F-2.4265706493099345e-18&lf;F-4.9695017594386094e-17&lf;F1.2430155545048131e-17&lf;tp506&lf;sg5&lf;(F14.287114027195173&lf;F-0.2111677104455696&lf;F-0.0656104539200193&lf;tp507&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp508&lf;ssVclavicle_pec_r&lf;p509&lf;(dp510&lf;g3&lf;(F9.293300890747829e-09&lf;F-5.707670764203161e-09&lf;F-6.492766834151767e-09&lf;tp511&lf;sg5&lf;(F-7.865587754738414&lf;F-9.462906268526464&lf;F9.48653599414189&lf;tp512&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp513&lf;ssVpinky_01_l&lf;p514&lf;(dp515&lf;g3&lf;(F2.4848083448933823e-17&lf;F-1.0094533901129326e-15&lf;F-1.113038837990675e-14&lf;tp516&lf;sg5&lf;(F4.3969685310509234&lf;F-1.4210854715202004e-14&lf;F-6.039613253960852e-14&lf;tp517&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp518&lf;ssVthigh_twist_01_l&lf;p519&lf;(dp520&lf;g3&lf;(F-2.4209895368165213e-16&lf;F-4.9583558853672917e-17&lf;F6.810511763785889e-18&lf;tp521&lf;sg5&lf;(F-14.287183632223432&lf;F0.21116362092060248&lf;F0.06561795810833893&lf;tp522&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp523&lf;ssVlowerarm_l&lf;p524&lf;(dp525&lf;g3&lf;(F-7.454425034680117e-17&lf;F8.386228164015132e-17&lf;F7.279711947929797e-20&lf;tp526&lf;sg5&lf;(F25.247300689778797&lf;F-5.329070518200751e-15&lf;F-4.263256414560601e-14&lf;tp527&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp528&lf;ssVpinky_03_r&lf;p529&lf;(dp530&lf;g3&lf;(F3.8825130388958945e-19&lf;F1.2436174577713411e-17&lf;F3.791516639546773e-22&lf;tp531&lf;sg5&lf;(F-1.669605250518572&lf;F-8.182164268788483e-05&lf;F-2.731165606206787e-05&lf;tp532&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp533&lf;ssVthigh_fwd_lwr_l&lf;p534&lf;(dp535&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp536&lf;sg5&lf;(F0.39812935021383566&lf;F-7.309934383244445&lf;F0.6883540989376549&lf;tp537&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp538&lf;ssVring_metacarpal_l&lf;p539&lf;(dp540&lf;g3&lf;(F1.2827915178708273e-31&lf;F-6.1623246953355635e-15&lf;F-2.3854160110976376e-15&lf;tp541&lf;sg5&lf;(F2.8047746330326007&lf;F0.22714913893837263&lf;F1.0596930230372124&lf;tp542&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp543&lf;ssVlowerarm_bck_r&lf;p544&lf;(dp545&lf;g3&lf;(F2.5444437451708134e-14&lf;F1.821991149690184e-07&lf;F7.600179899673703e-23&lf;tp546&lf;sg5&lf;(F-1.5862762297890214&lf;F-3.40166381371057&lf;F0.8892462340683522&lf;tp547&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp548&lf;ssVlowerarm_correctiveRoot_l&lf;p549&lf;(dp550&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp551&lf;sg5&lf;(F-3.552713678800501e-14&lf;F0.0&lf;F-5.684341886080802e-14&lf;tp552&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp553&lf;ssVpinky_02_l&lf;p554&lf;(dp555&lf;g3&lf;(F1.8636062586700294e-17&lf;F-7.76502607779179e-18&lf;F1.2722218725854067e-14&lf;tp556&lf;sg5&lf;(F2.6964561558300915&lf;F2.842170943040401e-14&lf;F3.552713678800501e-15&lf;tp557&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp558&lf;ssVcalf_twistCor_02_l&lf;p559&lf;(dp560&lf;g3&lf;(F7.786203609148045e-13&lf;F2.2381283947562397e-18&lf;F5.706716775610707e-10&lf;tp561&lf;sg5&lf;(F1.2931877790833823e-12&lf;F-2.3092638912203256e-14&lf;F-5.329070518200751e-15&lf;tp562&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp563&lf;ssVlowerarm_correctiveRoot_r&lf;p564&lf;(dp565&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp566&lf;sg5&lf;(F3.552713678800501e-14&lf;F0.0&lf;F-1.4210854715202004e-14&lf;tp567&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp568&lf;ssVpelvis&lf;p569&lf;(dp570&lf;g3&lf;(F-8.746525374024675e-15&lf;F1.9369081048443843e-14&lf;F-8.348956038841735e-15&lf;tp571&lf;sg5&lf;(F0.00010491341864091094&lf;F-2.2175793100900107&lf;F91.97877241348029&lf;tp572&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp573&lf;ssVlowerarm_bck_l&lf;p574&lf;(dp575&lf;g3&lf;(F0.0&lf;F1.821991149690184e-07&lf;F0.0&lf;tp576&lf;sg5&lf;(F1.3859786452671514&lf;F3.3413824665105096&lf;F-1.1761296577728615&lf;tp577&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp578&lf;ssVthigh_in_r&lf;p579&lf;(dp580&lf;g3&lf;(F-1.799777415242335e-11&lf;F1.7811260677643742e-08&lf;F-1.1301263803149778e-08&lf;tp581&lf;sg5&lf;(F9.68590753589298&lf;F0.7278592457790922&lf;F-8.591039347640994&lf;tp582&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp583&lf;ssVindex_01_l&lf;p584&lf;(dp585&lf;g3&lf;(F5.367186024969684e-15&lf;F-1.5902773407317588e-15&lf;F9.442271710594815e-15&lf;tp586&lf;sg5&lf;(F5.011096571254832&lf;F-4.263256414560601e-14&lf;F-3.552713678800501e-14&lf;tp587&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp588&lf;ssVupperarm_tricep_r&lf;p589&lf;(dp590&lf;g3&lf;(F3.7924387363587275e-14&lf;F6.075963094069785e-09&lf;F-6.5598940285076466e-15&lf;tp591&lf;sg5&lf;(F-0.2668024100145914&lf;F-4.4614700865646535&lf;F-0.06149644816963473&lf;tp592&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp593&lf;ssVthigh_twistCor_02_l&lf;p594&lf;(dp595&lf;g3&lf;(F-9.700266400628902e-13&lf;F4.420414151584964e-17&lf;F-1.9859764446290498e-10&lf;tp596&lf;sg5&lf;(F6.039613253960852e-13&lf;F1.8474111129762605e-13&lf;F-7.105427357601002e-15&lf;tp597&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp598&lf;ssVindex_03_r&lf;p599&lf;(dp600&lf;g3&lf;(F-4.549819967456126e-21&lf;F1.849846171874749e-40&lf;F4.659014165613886e-18&lf;tp601&lf;sg5&lf;(F-2.317379606058509&lf;F-3.482151544176304e-05&lf;F-1.4542190249322573e-05&lf;tp602&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp603&lf;ssVwrist_outer_r&lf;p604&lf;(dp605&lf;g3&lf;(F-2.5456861493432594e-14&lf;F-3.379339349054985e-15&lf;F3.1805546814635168e-15&lf;tp606&lf;sg5&lf;(F-0.03274741621405042&lf;F1.6563393407212317&lf;F0.025852490706835596&lf;tp607&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp608&lf;ssVwrist_outer_l&lf;p609&lf;(dp610&lf;g3&lf;(F-5.783391422739323e-14&lf;F9.34287937679908e-15&lf;F4.373262687012329e-15&lf;tp611&lf;sg5&lf;(F-0.03377910590610611&lf;F-1.4964501513575073&lf;F-0.18007976338952147&lf;tp612&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp613&lf;ssVpinky_metacarpal_r&lf;p614&lf;(dp615&lf;g3&lf;(F1.3914926731402885e-14&lf;F-1.5902773407317588e-15&lf;F1.5902773407317582e-15&lf;tp616&lf;sg5&lf;(F-2.558789946909897&lf;F-0.5003207482651391&lf;F-2.0640128067549632&lf;tp617&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp618&lf;ssVupperarm_tricep_l&lf;p619&lf;(dp620&lf;g3&lf;(F1.2424042072290844e-17&lf;F6.0759658770551315e-09&lf;F6.5598940305191614e-15&lf;tp621&lf;sg5&lf;(F0.11027252258691078&lf;F4.4684969383725015&lf;F-0.13297608266564964&lf;tp622&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp623&lf;ssVthigh_twistCor_02_r&lf;p624&lf;(dp625&lf;g3&lf;(F-9.971666437558038e-13&lf;F7.130715464304176e-18&lf;F-1.9859764570803904e-10&lf;tp626&lf;sg5&lf;(F-6.252776074688882e-13&lf;F-1.829647544582258e-13&lf;F7.105427357601002e-15&lf;tp627&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp628&lf;ssVindex_01_r&lf;p629&lf;(dp630&lf;g3&lf;(F-1.987846675914698e-16&lf;F-1.7241821476758432e-34&lf;F-9.93923337957349e-17&lf;tp631&lf;sg5&lf;(F-5.011125795495047&lf;F1.255617310391699e-05&lf;F-3.957483904848402e-05&lf;tp632&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp633&lf;ssVthigh_in_l&lf;p634&lf;(dp635&lf;g3&lf;(F7.81972953015046e-10&lf;F1.783717115280913e-08&lf;F2.898665566940874e-09&lf;tp636&lf;sg5&lf;(F-9.624813217005851&lf;F-0.7872489589315337&lf;F8.569114048741081&lf;tp637&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp638&lf;ssVmiddle_metacarpal_l&lf;p639&lf;(dp640&lf;g3&lf;(F5.168401357378214e-15&lf;F4.721135855297406e-15&lf;F6.162324695335562e-15&lf;tp641&lf;sg5&lf;(F2.9473948030703525&lf;F-1.4210854715202004e-14&lf;F2.4868995751603507e-14&lf;tp642&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp643&lf;ssVring_01_r&lf;p644&lf;(dp645&lf;g3&lf;(F3.7272125173400585e-16&lf;F-9.939233379573484e-17&lf;F-1.90833280887811e-14&lf;tp646&lf;sg5&lf;(F-4.653074699202811&lf;F-2.4532645610975123e-05&lf;F5.51067713736586e-05&lf;tp647&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp648&lf;ssVupperarm_correctiveRoot_r&lf;p649&lf;(dp650&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp651&lf;sg5&lf;(F1.4210854715202004e-14&lf;F-4.440892098500626e-15&lf;F2.842170943040401e-14&lf;tp652&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp653&lf;ssVcalf_kneeBack_l&lf;p654&lf;(dp655&lf;g3&lf;(F8.63470899849898e-15&lf;F-9.039156283186074e-11&lf;F6.957463365694632e-15&lf;tp656&lf;sg5&lf;(F0.2417278422375233&lf;F4.878562416091983&lf;F0.29022114718005376&lf;tp657&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp658&lf;ssVcalf_kneeBack_r&lf;p659&lf;(dp660&lf;g3&lf;(F-2.35124989635446e-14&lf;F-9.039096647785796e-11&lf;F-1.1330726052695231e-14&lf;tp661&lf;sg5&lf;(F-0.2449349235955367&lf;F-4.883272954147831&lf;F-0.3136576664737962&lf;tp662&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp663&lf;ssVring_01_l&lf;p664&lf;(dp665&lf;g3&lf;(F3.354491265606054e-16&lf;F-3.975693351829396e-16&lf;F-1.9084881093996662e-14&lf;tp666&lf;sg5&lf;(F4.653086398712624&lf;F4.263256414560601e-14&lf;F-1.0658141036401503e-14&lf;tp667&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp668&lf;ssVupperarm_correctiveRoot_l&lf;p669&lf;(dp670&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp671&lf;sg5&lf;(F2.842170943040401e-14&lf;F0.0&lf;F1.4210854715202004e-14&lf;tp672&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp673&lf;ssVmiddle_metacarpal_r&lf;p674&lf;(dp675&lf;g3&lf;(F2.5842006786891076e-15&lf;F3.0811623476677818e-15&lf;F4.721135855297408e-15&lf;tp676&lf;sg5&lf;(F-2.9473407769463975&lf;F-3.6594834583070224e-05&lf;F5.6656297143575785e-05&lf;tp677&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp678&lf;ssVthigh_twist_02_r&lf;p679&lf;(dp680&lf;g3&lf;(F7.939739164542105e-16&lf;F-5.006542507309081e-17&lf;F1.0461552711837454e-17&lf;tp681&lf;sg5&lf;(F28.47895122626658&lf;F-0.17387919837305565&lf;F-0.005720635786287787&lf;tp682&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp683&lf;ssVring_03_r&lf;p684&lf;(dp685&lf;g3&lf;(F-3.1060104311167156e-18&lf;F-1.9897879324341458e-16&lf;F-4.2464986362923846e-20&lf;tp686&lf;sg5&lf;(F-3.0146802324974686&lf;F-4.5867904766794254e-05&lf;F6.070594956142372e-05&lf;tp687&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp688&lf;ssVupperarm_fwd_r&lf;p689&lf;(dp690&lf;g3&lf;(F2.5414619751459016e-11&lf;F-1.8553765734468644e-11&lf;F6.818250487293744e-10&lf;tp691&lf;sg5&lf;(F-3.1383986238786576&lf;F6.085192473500279&lf;F0.3701752564989107&lf;tp692&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp693&lf;ssVcalf_r&lf;p694&lf;(dp695&lf;g3&lf;(F7.765026077791785e-19&lf;F-7.453211749355463e-17&lf;F5.963577942910489e-16&lf;tp696&lf;sg5&lf;(F42.6392716823317&lf;F-1.7763568394002505e-15&lf;F1.2434497875801753e-14&lf;tp697&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp698&lf;ssVupperarm_twistCor_02_r&lf;p699&lf;(dp700&lf;g3&lf;(F-5.7155154104789345e-05&lf;F0.2392973804678591&lf;F-0.01368489098937418&lf;tp701&lf;sg5&lf;(F-4.263256414560601e-14&lf;F7.105427357601002e-15&lf;F5.684341886080802e-14&lf;tp702&lf;sg7&lf;(F0.9999999999999997&lf;F1.0&lf;F0.9999999999999998&lf;tp703&lf;ssVmiddle_02_r&lf;p704&lf;(dp705&lf;g3&lf;(F-7.45442503468011e-17&lf;F4.080521203879585e-16&lf;F2.2263640113179687e-14&lf;tp706&lf;sg5&lf;(F-4.584910207198277&lf;F-3.1438676543871225e-05&lf;F-3.066261484363508e-05&lf;tp707&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp708&lf;ssVpinky_metacarpal_l&lf;p709&lf;(dp710&lf;g3&lf;(F-3.180554681463515e-15&lf;F1.3318572728628474e-14&lf;F3.180554681463515e-15&lf;tp711&lf;sg5&lf;(F2.558828022670248&lf;F0.5003618244700903&lf;F2.064049345253842&lf;tp712&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp713&lf;ssVthigh_r&lf;p714&lf;(dp715&lf;g3&lf;(F-3.620782510119271e-33&lf;F-2.3854160110976376e-15&lf;F1.7393658414253607e-16&lf;tp716&lf;sg5&lf;(F-3.012337184531063&lf;F-0.06336612202783964&lf;F10.395765560224552&lf;tp717&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp718&lf;ssVmiddle_02_l&lf;p719&lf;(dp720&lf;g3&lf;(F-8.696829207126799e-17&lf;F4.158171464657503e-16&lf;F1.9082854907504484e-14&lf;tp721&lf;sg5&lf;(F4.58496782082122&lf;F-1.4210854715202004e-14&lf;F-2.842170943040401e-14&lf;tp722&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp723&lf;ssVpinky_02_r&lf;p724&lf;(dp725&lf;g3&lf;(F1.2424041724466862e-17&lf;F-7.765026077791789e-17&lf;F-9.706282597239736e-20&lf;tp726&lf;sg5&lf;(F-2.696477533033118&lf;F3.068206100920179e-05&lf;F5.3911045487353704e-05&lf;tp727&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp728&lf;ssVupperarm_twistCor_02_l&lf;p729&lf;(dp730&lf;g3&lf;(F-5.715515410377221e-05&lf;F0.23929738046881302&lf;F-0.013684890989438625&lf;tp731&lf;sg5&lf;(F8.526512829121202e-14&lf;F7.105427357601002e-15&lf;F-4.263256414560601e-14&lf;tp732&lf;sg7&lf;(F0.9999999999999999&lf;F1.0&lf;F0.9999999999999999&lf;tp733&lf;ssVcalf_l&lf;p734&lf;(dp735&lf;g3&lf;(F2.717759127227125e-18&lf;F-7.451998464030805e-17&lf;F5.963555193810652e-16&lf;tp736&lf;sg5&lf;(F-42.63936190162267&lf;F-7.829074149423576e-06&lf;F-4.4586872256502375e-05&lf;tp737&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp738&lf;ssVring_03_l&lf;p739&lf;(dp740&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp741&lf;sg5&lf;(F3.0147511882823608&lf;F-4.973799150320701e-14&lf;F-1.0658141036401503e-14&lf;tp742&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp743&lf;ssVupperarm_fwd_l&lf;p744&lf;(dp745&lf;g3&lf;(F2.5408755603765092e-11&lf;F-1.8548994902446404e-11&lf;F6.818210730360224e-10&lf;tp746&lf;sg5&lf;(F2.998532437400442&lf;F-6.078429423751953&lf;F-0.5550002675375794&lf;tp747&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp748&lf;ss.");
	setAttr ".fbxID" 2;
createNode joint -n "pelvis" -p "|Manny|root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.4314998759166215e-017 -2.2808661460876465 95.896781921386719 ;
	setAttr ".r" -type "double3" -90.000000000001009 -86.366893050032431 90.000000000000796 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000004 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.99799000000000004 -0.063367199999999999 0 0 -0.063367199999999999 -0.99799000000000004 0
		 -1 0 0 0 0 95.896782000000002 2.2808660000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_01" -p "|Manny|root|pelvis";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.6770534515380859 7.1054273576010019e-015 -4.5206953076261901e-016 ;
	setAttr ".r" -type "double3" 0 0 -14.457321828304915 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.98220799999999997 0.18779599999999999 0 0 0.18779599999999999 -0.98220799999999997 0
		 -1 0 0 0 0 99.566445999999999 2.0478619999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_02" -p "|Manny|root|pelvis|spine_01";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 6.7950572967529297 2.1316282072803006e-014 2.1133375419299247e-016 ;
	setAttr ".r" -type "double3" 0 0 3.4644695084247528 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.991761 0.12809899999999999 0 0 0.12809899999999999 -0.991761 0
		 -1 0 0 0 0 106.240605 3.3239489999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_03" -p "|Manny|root|pelvis|spine_01|spine_02";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 7.2382278442382812 -2.1316282072803006e-014 1.506632591055597e-016 ;
	setAttr ".r" -type "double3" 0 0 10.946079405533538 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.99804199999999998 -0.062552499999999997 0 0 -0.062552499999999997 -0.99804199999999998 0
		 -1 0 0 0 0 113.4192 4.2511580000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_04" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 8.5238933563232422 -5.3290705182007514e-015 2.8456974482492638e-016 ;
	setAttr ".r" -type "double3" 0.00044952872062758461 -3.0332133116374176e-021 5.8669839318741586 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.98641999999999996 -0.164244 0 -7.8457599999999992e-006 -0.164244 -0.98641999999999996 0
		 -1 1.28862e-006 7.7392099999999994e-006 0 0 121.926401 3.7179669999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_05" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 19.439800262451172 -1.7817309583278984e-007 -3.2154725930488848e-016 ;
	setAttr ".r" -type "double3" -0.00044949784312740739 5.34588068271325e-006 0.68138935939446854 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.98439699999999997 -0.17596300000000001 0 0 -0.17596300000000001 -0.98439699999999997 0
		 -1 0 0 0 0 141.102204 0.52509700000000004 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "neck_01" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 11.887765884399414 1.0658141036401503e-014 1.5994318796304428e-015 ;
	setAttr ".r" -type "double3" 0 0 -23.928404052334628 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.97116100000000005 0.238427 0 0 0.238427 -0.97116100000000005 0
		 -1 0 0 0 0 152.80448200000001 -1.56671 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "neck_02" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.1102595329284668 -4.9737991503207013e-014 -4.0832131241713004e-014 ;
	setAttr ".r" -type "double3" -9.7964785668692511e-005 0 1.9135286365136528 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.97858000000000001 0.20586499999999999 0 1.70982e-006 0.20586499999999999 -0.97858000000000001 0
		 -1 3.5198699999999999e-007 -1.6731999999999999e-006 0 0 157.76736399999999 -0.34828799999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "head" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01|neck_02";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.912971019744873 -5.6843418860808015e-014 2.1716040966325567e-014 ;
	setAttr ".r" -type "double3" 9.5867333839370802e-005 -2.0167398428292683e-005 11.88016967271597 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 1 0 0 0 0 -1 0 -1 0 0 0 0 162.57510099999999 0.66312300000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.5162687301635742 1.3147660493850708 -1.4279042482376099 ;
	setAttr ".r" -type "double3" 163.26358510455574 80.831225890108712 153.12438365112948 ;
	setAttr ".s" -type "double3" 0.99999999999999911 1 0.999999999999999 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.98722299999999996 -0.15259 -0.045897899999999998 0
		 -0.0458859 0.00360181 -0.99894000000000005 0 0.15259300000000001 0.98828300000000002 -0.0034459299999999998 0
		 1.4279040000000001 146.301051 -1.739814 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 17.80952262878418 2.3092638912203256e-014 5.6843418860808015e-014 ;
	setAttr ".r" -type "double3" -4.337345261917851 46.029604216550766 -4.3585186559705047 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.57603400000000005 -0.81709100000000001 0.023413799999999999 0
		 -0.032592099999999999 -0.051578499999999999 -0.99813700000000005 0 0.81677599999999995 0.57419699999999996 -0.056341599999999999 0
		 19.009879000000002 143.58349999999999 -2.5572330000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 27.771139144897461 1.0658141036401503e-014 -5.6843418860808015e-014 ;
	setAttr ".r" -type "double3" 0 0 -38.978821942625942 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.46829799999999999 -0.60274399999999995 0.64606300000000005 0
		 0.33700799999999997 -0.55407300000000004 -0.76120200000000005 0 0.81677599999999995 0.57419699999999996 -0.056341599999999999 0
		 35.006988 120.89196200000001 -1.907006 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_02_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 9.0836915969848633 -6.3948846218409017e-014 5.6843418860808015e-014 ;
	setAttr ".r" -type "double3" 1.2856768460267201 -1.7275331230962878 1.9858280815512828 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50409899999999996 -0.603989 0.617317 0 0.33849099999999999 -0.51942200000000005 -0.78461800000000004 0
		 0.79454899999999995 0.60448199999999996 -0.057395399999999999 0 39.260859000000004 115.41682 3.961627 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_01_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 18.167383193969727 -2.8421709430404007e-014 4.2632564145606011e-014 ;
	setAttr ".r" -type "double3" 1.2856768693497505 -1.7275255464775083 1.9858281662294797 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50409899999999996 -0.60399000000000003 0.617317 0
		 0.33849099999999999 -0.51942200000000005 -0.78461800000000004 0 0.79454899999999995 0.60448100000000005 -0.057395300000000003 0
		 43.51473 109.941678 9.8302600000000009 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_correctiveRoot_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 8.5265128291212022e-014 1.4210854715202004e-014 -1.5631940186722204e-013 ;
	setAttr ".r" -type "double3" 1.346877215468562 -1.743090348945737 3.1074483518923395e-018 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.49292599999999998 -0.58499900000000005 0.64405000000000001 0
		 0.35576999999999998 -0.53999900000000001 -0.76277799999999996 0 0.79400999999999999 0.60512600000000005 -0.0580542 0
		 35.006988 120.89196200000001 -1.907006 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_in_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.71718597412109375 0.71880793571472168 -3.9889290332794189 ;
	setAttr ".r" -type "double3" -180 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.49292599999999998 -0.58499900000000005 0.64405000000000001 0
		 -0.35576999999999998 0.53999900000000001 0.76277799999999996 0 -0.79400999999999999 -0.60512600000000005 0.0580542 0
		 32.448985999999998 117.670449 -1.761819 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_out_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.58395910263061523 0.57518672943115234 2.721245288848877 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.49292599999999998 -0.58499900000000005 0.64405000000000001 0
		 0.35576999999999998 -0.53999900000000001 -0.76277799999999996 0 0.79400999999999999 0.60512600000000005 -0.0580542 0
		 37.660167000000001 121.886442 -2.1276259999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_fwd_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.6934813261032104 -3.659092903137207 -0.43889614939689636 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.49292599999999998 -0.58499900000000005 0.64405000000000001 0
		 0.79400999999999999 0.60512600000000005 -0.0580542 0 -0.35576999999999998 0.53999900000000001 0.76277799999999996 0
		 34.191465999999998 121.611594 2.0002339999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_bck_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.6623389720916748 4.9182863235473633 -1.1642642021179199 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.49292599999999998 -0.58499900000000005 0.64405000000000001 0
		 -0.79400999999999999 -0.60512600000000005 0.0580542 0 0.35576999999999998 -0.53999900000000001 -0.76277799999999996 0
		 36.158810000000003 117.14409999999999 -5.1643939999999997 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "hand_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 27.251073837280273 -2.8421709430404007e-014 7.1054273576010019e-014 ;
	setAttr ".r" -type "double3" -67.770758746900071 1.473470780007927 1.8489162697849522 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.45776600000000001 -0.63486699999999996 0.62241000000000002 0
		 -0.645509 -0.71872800000000003 -0.258357 0 0.61136599999999997 -0.28350399999999998 -0.73882099999999995 0
		 47.768600999999997 104.466537 15.698893 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "wrist_inner_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.70358890295028687 1.6588308811187744 0.03799104318022728 ;
	setAttr ".r" -type "double3" -92.342591451814627 16.064920194671945 2.5608065498514208 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.24255499999999999 -0.56187100000000001 0.79086599999999996 0
		 -0.67827499999999996 0.48463499999999998 0.55233299999999996 0 -0.69362100000000004 -0.67039499999999996 -0.26355200000000001 0
		 46.398958 103.710204 14.804332 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "wrist_outer_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.019651234149932861 -2.2384965419769287 -0.12413483113050461 ;
	setAttr ".r" -type "double3" 87.657408548185415 16.064920194671945 2.5608065498514239 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.24255499999999999 -0.56187100000000001 0.79086599999999996 0
		 0.67827499999999996 -0.48463499999999998 -0.55233299999999996 0 0.69362100000000004 0.67039499999999996 0.26355200000000001 0
		 49.146675000000002 106.098123 16.381169 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_metacarpal_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.4445061683654785 -0.38468080759048462 -2.3793244361877441 ;
	setAttr ".r" -type "double3" 3.2877464546581563 7.3255016683865044 -0.60616237917610738 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.38282500000000003 -0.58596000000000004 0.71421000000000001 0
		 -0.60140300000000002 -0.744923 -0.28879899999999997 0 0.70125599999999999 -0.318969 -0.63757299999999995 0
		 48.139055999999997 103.230763 19.700068999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_01_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.8770980834960937 0.043181736022233963 0.24087569117546082 ;
	setAttr ".r" -type "double3" 0 0 23.372999646513971 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.11282499999999999 -0.833399 0.54103299999999999 0
		 -0.70392500000000002 -0.45133699999999999 -0.54843900000000001 0 0.70125599999999999 -0.318969 -0.63757299999999995 0
		 50.5319 99.678021999999999 23.731507000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_02_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.0799999237060547 1.4210854715202004e-014 -9.2370555648813024e-014 ;
	setAttr ".r" -type "double3" 0 0 14.892568419110992 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.071878600000000001 -0.92140200000000005 0.38190600000000002 0
		 -0.70927700000000005 -0.22198599999999999 -0.66906600000000005 0 0.70125599999999999 -0.318969 -0.63757299999999995 0
		 50.992227 96.277754000000002 25.938921000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_03_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l|index_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.5950000286102295 5.6843418860808015e-014 -2.1316282072803006e-014 ;
	setAttr ".r" -type "double3" 0 0 12.51640099754699 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.223884 -0.94761200000000001 0.22783100000000001 0
		 -0.67684200000000005 -0.0170253 -0.735931 0 0.70125599999999999 -0.318969 -0.63757299999999995 0
		 50.805701999999997 93.886717000000004 26.929967999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_metacarpal_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.3758335113525391 -0.75357073545455933 -0.18286436796188354 ;
	setAttr ".r" -type "double3" -4.2725003027381465 -0.13075114456697903 -2.3183915821069583 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.484898 -0.60591799999999996 0.630664 0 -0.67018599999999995 -0.72073600000000004 -0.177171 0
		 0.561894 -0.33675300000000002 -0.75556199999999996 0 49.688583000000001 102.916787 18.129840000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_01_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 6.0982089042663574 7.1054273576010019e-014 2.1316282072803006e-014 ;
	setAttr ".r" -type "double3" 0 0 31.57268201739824 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.062225500000000003 -0.89359100000000002 0.444548 0
		 -0.82486599999999999 -0.29680400000000001 -0.48114800000000002 0 0.561894 -0.33675300000000002 -0.75556199999999996 0
		 52.645589999999999 99.221771000000004 21.975762 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_02_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.1690001487731934 0 4.2632564145606011e-014 ;
	setAttr ".r" -type "double3" 0 0 20.769210477739517 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.234319 -0.94077 0.24504200000000001 0 -0.79332899999999995 0.039355000000000001 -0.60751999999999995 0
		 0.561894 -0.33675300000000002 -0.75556199999999996 0 52.967233999999998 94.602799000000005 24.273631000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_03_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l|middle_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.4739999771118164 4.2632564145606011e-014 3.5527136788005009e-015 ;
	setAttr ".r" -type "double3" 0 0 9.9999999709533771 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.36852000000000001 -0.91964400000000002 0.135825 0
		 -0.740587 0.20211999999999999 -0.64084200000000002 0 0.561894 -0.33675300000000002 -0.75556199999999996 0
		 52.387528000000003 92.275333000000003 24.879866 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_01_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.9924465417861938 1.3566048145294189 -2.5815360546112061 ;
	setAttr ".r" -type "double3" 73.564463907750024 39.904178427023133 20.508675504416573 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.23677699999999999 -0.46744599999999997 0.85172199999999998 0
		 0.358045 -0.85693299999999994 -0.37076900000000002 0 0.90318299999999996 0.217165 0.37026900000000001 0
		 46.226711000000002 102.958445 18.495816999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_02_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.3779997825622559 9.9475983006414026e-014 -9.9475983006414026e-014 ;
	setAttr ".r" -type "double3" 3.5306280002014301 -1.9322904957701363 23.246005781061289 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.045745000000000001 -0.75995299999999999 0.648366 0
		 0.47737499999999999 -0.58677000000000001 -0.65407499999999996 0 0.87750799999999995 0.27959299999999998 0.38962400000000003 0
		 45.190100000000001 100.911968 22.224657000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_03_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.0859999656677246 5.6843418860808015e-014 8.5265128291212022e-014 ;
	setAttr ".r" -type "double3" 0 0 9.9999999709533771 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.037845200000000002 -0.85029900000000003 0.52493699999999999 0
		 0.47806599999999999 -0.44589099999999998 -0.75672600000000001 0 0.87750799999999995 0.27959299999999998 0.38962400000000003 0
		 45.048931000000003 98.566753000000006 24.225515999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_metacarpal_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.3143784999847412 -0.30591726303100586 2.391110897064209 ;
	setAttr ".r" -type "double3" -27.769049129171517 -19.527703069996928 11.850627289629658 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50165899999999997 -0.81947000000000003 0.27714100000000003 0
		 -0.86150499999999997 -0.50229900000000005 0.0741975 0 0.078405100000000005 -0.27598 -0.95796000000000003 0
		 50.945126999999999 101.904329 16.074227 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_01_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.9575676918029785 -0.14312039315700531 -0.19884027540683746 ;
	setAttr ".r" -type "double3" 10.491640062438092 0.60504264270136554 14.833680882858841 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.26354100000000003 -0.91778899999999997 0.29699999999999999 0
		 -0.93037099999999995 -0.32317400000000002 -0.17311599999999999 0 0.25486700000000001 -0.23069700000000001 -0.93905400000000006 0
		 53.539845999999997 97.968518000000003 17.628035000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_02_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.8159999847412109 1.7053025658242404e-013 5.6843418860808015e-014 ;
	setAttr ".r" -type "double3" 0 0 21.28699904924385 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.092201500000000006 -0.97249699999999994 0.213889 0
		 -0.96257000000000004 0.032068899999999997 -0.26912799999999998 0 0.25486700000000001 -0.23069700000000001 -0.93905400000000006 0
		 54.545515999999999 94.466234 18.761389000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_03_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l|pinky_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.0399999618530273 0 2.1316282072803006e-014 ;
	setAttr ".r" -type "double3" 0 0 4.9170000470223636 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.17436699999999999 -0.96616899999999994 0.19003400000000001 0
		 -0.951125 0.11530600000000001 -0.28647 0 0.25486700000000001 -0.23069700000000001 -0.93905400000000006 0
		 54.357424999999999 92.482339999999994 19.197723 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_metacarpal_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.3743038177490234 -0.54251688718795776 1.0917565822601318 ;
	setAttr ".r" -type "double3" -13.299834889366384 -11.809318654920901 -1.5945633604277298 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.59060500000000005 -0.65963300000000002 0.46483400000000002 0
		 -0.73083299999999995 -0.68147000000000002 -0.038479100000000002 0 0.34215200000000001 -0.31698999999999999 -0.88456100000000004 0
		 50.330905000000001 102.404708 17.132643000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_01_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.6455168724060059 -0.041624534875154495 -0.02068917453289032 ;
	setAttr ".r" -type "double3" 6.3958444445851033 -0.11693801365858437 29.414482479749037 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.15623799999999999 -0.90993100000000005 0.38420799999999999 0
		 -0.88283500000000004 -0.303087 -0.35880499999999999 0 0.442936 -0.28313300000000002 -0.85067199999999998 0
		 53.688516999999997 98.715664000000004 19.776772999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_02_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.9770002365112305 -8.5265128291212022e-014 -9.5923269327613525e-014 ;
	setAttr ".r" -type "double3" 0 0 18.963999541971834 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.13914000000000001 -0.95903799999999995 0.246752 0
		 -0.88568999999999998 0.0090675100000000008 -0.46418799999999999 0 0.442936 -0.28313300000000002 -0.85067199999999998 0
		 54.466115000000002 94.186938999999995 21.688974000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_03_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l|ring_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.2650001049041748 3.5527136788005009e-014 1.5631940186722204e-013 ;
	setAttr ".r" -type "double3" 0 0 9.1679997480250002 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.27848000000000001 -0.94534200000000002 0.16964099999999999 0
		 -0.85220700000000005 0.16175500000000001 -0.49757299999999999 0 0.442936 -0.28313300000000002 -0.85067199999999998 0
		 54.150962 92.014718000000002 22.247866999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "weapon_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" 1.1633778810501099 1.317058801651001 0.5195159912109375 ;
	setAttr ".r" -type "double3" -11.617611580307555 -15.80837073479014 8.5170863439819282 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.51015699999999997 -0.783771 0.35417799999999999 0
		 -0.79058799999999996 -0.58949099999999999 -0.165741 0 0.33868799999999999 -0.19545499999999999 -0.92037400000000003 0
		 47.768597 102.634055 15.698888999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "upperarm_twist_01_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 9.2570457458496094 8.8817841970012523e-015 -7.1054273576010019e-014 ;
	setAttr ".r" -type "double3" 7.7705132047025806e-019 -2.1533312395632271 -0.32660888591551801 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60649299999999995 -0.79463200000000001 0.026965599999999999 0
		 -0.029308000000000001 -0.056235399999999998 -0.99798699999999996 0 0.79454899999999995 0.60448199999999996 -0.057395399999999999 0
		 24.342248000000001 136.019654 -2.3404910000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twistCor_01_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.2632564145606011e-014 3.5527136788005009e-015 8.5265128291212022e-014 ;
	setAttr ".r" -type "double3" 7.7705132047025806e-019 -2.1533312395632271 -0.32660888591551801 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.63607599999999997 -0.77102499999999996 0.030474500000000002 0
		 -0.0258503 -0.060764199999999997 -0.99781699999999995 0 0.77119400000000005 0.63390000000000002 -0.058581800000000003 0
		 24.342248000000001 136.019654 -2.3404910000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twist_02_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 18.514091491699219 5.3290705182007514e-015 -5.6843418860808015e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.57603400000000005 -0.81709100000000001 0.023413799999999999 0
		 -0.032592099999999999 -0.051578499999999999 -0.99813700000000005 0 0.81677599999999995 0.57419699999999996 -0.056341599999999999 0
		 29.674617000000001 128.45580899999999 -2.123748 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_tricep_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.63981693983078003 4.8805856704711914 -0.20165041089057922 ;
	setAttr ".r" -type "double3" -94.95644638895449 -0.42448471047106484 0.86833329383278834 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.58150900000000005 -0.81350199999999995 0.0078669900000000008 0
		 -0.80588199999999999 -0.57468399999999997 0.14244899999999999 0 -0.111361 -0.089175099999999993 -0.98977099999999996 0
		 29.719401999999999 127.5655 -6.9688999999999997 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_bicep_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.67974680662155151 -4.4393792152404785 -1.7917963266372681 ;
	setAttr ".r" -type "double3" 85.043553611045567 -0.42448471047106517 0.86833329383278812 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.58150900000000005 -0.81350199999999995 0.0078669900000000008 0
		 0.80588199999999999 0.57468399999999997 -0.14244899999999999 0 0.111361 0.089175099999999993 0.98977099999999996 0
		 28.747367000000001 127.100526 2.4242279999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twistCor_02_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.6843418860808015e-014 1.7763568394002505e-014 -1.4210854715202004e-014 ;
	setAttr ".r" -type "double3" 0.037033075345610997 -6.4598177141619368 -0.98284030053750582 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.66474 -0.74630399999999997 0.033935199999999999 0
		 -0.022224000000000001 -0.065158300000000002 -0.99762700000000004 0 0.74674399999999996 0.66240900000000003 -0.0598992 0
		 29.674617000000001 128.45580899999999 -2.123748 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_correctiveRoot_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4210854715202004e-014 7.1054273576010019e-015 -1.1368683772161603e-013 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.57603400000000005 -0.81709100000000001 0.023413799999999999 0
		 -0.032592099999999999 -0.051578499999999999 -0.99813700000000005 0 0.81677599999999995 0.57419699999999996 -0.056341599999999999 0
		 19.009879000000002 143.58349999999999 -2.5572330000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_bck_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.4677364826202393 7.644437313079834 0.38593786954879761 ;
	setAttr ".r" -type "double3" -71.338605903548057 0 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.57603400000000005 -0.81709100000000001 0.023413799999999999 0
		 -0.78426399999999996 -0.56051300000000004 -0.26599899999999999 0 0.23046900000000001 0.13486200000000001 -0.96368900000000002 0
		 19.921420999999999 142.21154200000001 -10.174808000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_fwd_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.2550060749053955 -8.5091581344604492 -1.0630378723144531 ;
	setAttr ".r" -type "double3" 98.945174165607767 -1.9520053287632744 11.877573660059191 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.58448999999999995 -0.790184 -0.184338 0 0.81102600000000002 0.57584500000000005 0.103144 0
		 0.024648099999999999 -0.20979 0.97743599999999997 0 20.293939000000002 140.75236100000001 6.0721769999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_in_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 6.4101486206054687 -0.54440605640411377 -4.761751651763916 ;
	setAttr ".r" -type "double3" 180 -48.194143483235486 -1.0594296830222398e-030 ;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99282000000000004 -0.11666899999999999 -0.026389699999999999 0
		 0.032592099999999999 0.051578499999999999 0.99813700000000005 0 -0.11509 -0.99183100000000002 0.0550106 0
		 18.830798999999999 135.63972200000001 -1.5954710000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_out_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.22034949064254761 0.051736541092395782 5.8040661811828613 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.57603400000000005 -0.81709100000000001 0.023413799999999999 0
		 -0.032592099999999999 -0.051578499999999999 -0.99813700000000005 0 0.81677599999999995 0.57419699999999996 -0.056341599999999999 0
		 23.875744000000001 146.733465 -2.9307249999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_out_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 11.81339168548584 -0.44387754797935486 6.2818398475646973 ;
	setAttr ".r" -type "double3" -0.1805298097407074 -3.1102894160722525 -4.2915710380114067 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99471299999999996 -0.098584500000000005 0.028753799999999999 0
		 0.0278073 -0.0109622 -0.99955300000000002 0 0.098855700000000005 0.99506799999999995 -0.0081629200000000006 0
		 14.069293999999999 150.705085 -1.860263 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_scap_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 9.9858322143554687 7.5781621932983398 -1.9931055307388306 ;
	setAttr ".r" -type "double3" 0.18052980974070743 3.1102894160722525 175.7084289619886 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.99471299999999996 0.098584500000000005 -0.028753799999999999 0
		 -0.0278073 0.0109622 0.99955300000000002 0 0.098855700000000005 0.99506799999999995 -0.0081629200000000006 0
		 10.634283999999999 142.834858 -9.7614049999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.5162200927734375 1.3148112297058105 1.4278726577758789 ;
	setAttr ".r" -type "double3" 163.26358510455586 80.831225890108655 -26.875616348870651 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000004 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.98722299999999996 0.15259 0.045897899999999998 0
		 -0.0458859 -0.00360181 0.99894000000000005 0 0.15259300000000001 -0.98828300000000002 0.0034459299999999998 0
		 -1.4278729999999999 146.300995 -1.7398499999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -17.809625625610352 2.8716144697682466e-006 0.00043809693306684494 ;
	setAttr ".r" -type "double3" -4.337345261917851 46.029604216550766 -4.3585186559705047 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.57603400000000005 0.81709100000000001 -0.023413799999999999 0
		 -0.032592099999999999 0.051578499999999999 0.99813700000000005 0 0.81677599999999995 -0.57419699999999996 0.056341599999999999 0
		 -19.009882000000001 143.58299500000001 -2.5572699999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -27.770694732666016 -3.5527136788005009e-014 5.6843418860808015e-014 ;
	setAttr ".r" -type "double3" 0 0 -38.978821942625942 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.46829799999999999 0.60274399999999995 -0.64606300000000005 0
		 0.33700799999999997 0.55407300000000004 0.76120200000000005 0 0.81677599999999995 -0.57419699999999996 0.056341599999999999 0
		 -35.006734999999999 120.89182099999999 -1.9070530000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_02_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -9.0836620330810547 -7.1054273576010019e-015 -2.8421709430404007e-014 ;
	setAttr ".r" -type "double3" 1.2856768460267201 -1.7275331230962878 1.9858280815512828 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50409899999999996 0.603989 -0.617317 0 0.33849099999999999 0.51942200000000005 0.78461800000000004 0
		 0.79454899999999995 -0.60448199999999996 0.057395399999999999 0 -39.260592000000003 115.416697 3.9615610000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_01_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -18.167304992675781 -7.1054273576010019e-015 -1.4210854715202004e-014 ;
	setAttr ".r" -type "double3" 1.2856768693497505 -1.7275255464775083 1.9858281662294797 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50409899999999996 0.60399000000000003 -0.617317 0
		 0.33849099999999999 0.51942200000000005 0.78461800000000004 0 0.79454899999999995 -0.60448100000000005 0.057395300000000003 0
		 -43.514440999999998 109.94158400000001 9.8301630000000007 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_correctiveRoot_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.9253389837103896e-005 2.3793934815330431e-005 -0.00030234770383685827 ;
	setAttr ".r" -type "double3" 1.346877215468562 -1.743090348945737 3.1074483518923395e-018 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.49292599999999998 0.58499900000000005 -0.64405000000000001 0
		 0.35576999999999998 0.53999900000000001 0.76277799999999996 0 0.79400999999999999 -0.60512600000000005 0.0580542 0
		 -35.006982999999998 120.89199600000001 -1.9070389999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_out_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.70708566904067993 -0.61784440279006958 -2.9244780540466309 ;
	setAttr ".r" -type "double3" 2.4148364981233015e-006 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.49292599999999998 0.58499900000000005 -0.64405000000000001 0
		 0.35576999999999998 0.53999900000000001 0.76277799999999996 0 0.79400999999999999 -0.60512600000000005 0.0580542 0
		 -37.897399 121.914393 -2.0926969999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_in_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.85778617858886719 -0.81687408685684204 3.8254637718200684 ;
	setAttr ".r" -type "double3" 179.99999879300006 0 0 ;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1.0000000000000009 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.49292599999999998 0.58499900000000005 -0.64405000000000001 0
		 -0.355769 -0.53999900000000001 -0.76277799999999996 0 -0.79400999999999999 0.60512600000000005 -0.0580542 0
		 -32.682969 117.63419399999999 -1.7555909999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_fwd_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.8127350807189941 3.5876975059509277 0.22602805495262146 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.49292599999999998 0.58499900000000005 -0.64405000000000001 0
		 0.79400999999999999 -0.60512600000000005 0.0580542 0 -0.35576999999999998 -0.53999900000000001 -0.76277799999999996 0
		 -34.444664000000003 121.63212300000001 2.0101900000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_bck_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.77233541011810303 -5.0015811920166016 0.9858056902885437 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.49292599999999998 0.58499900000000005 -0.64405000000000001 0
		 -0.79400999999999999 0.60512600000000005 -0.0580542 0 0.35576999999999998 0.53999900000000001 0.76277799999999996 0
		 -36.384357000000001 117.142797 -5.1674800000000003 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "hand_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -27.251010894775391 -7.1054273576010019e-015 -1.4210854715202004e-014 ;
	setAttr ".r" -type "double3" -67.770758746900071 1.473470780007927 1.8489162697849522 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.45776600000000001 0.63486699999999996 -0.62241000000000002 0
		 -0.645509 0.71872800000000003 0.258357 0 0.61136599999999997 0.28350399999999998 0.73882099999999995 0
		 -47.768318999999998 104.46643400000001 15.698805 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "wrist_inner_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.70334106683731079 -1.6586792469024658 -0.038177095353603363 ;
	setAttr ".r" -type "double3" -92.342591451814627 16.064920194671945 2.5608065498514208 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.24255499999999999 0.56187100000000001 -0.79086599999999996 0
		 -0.67827499999999996 -0.48463499999999998 -0.55233299999999996 0 -0.69362100000000004 0.67039499999999996 0.26355200000000001 0
		 -46.399000999999998 103.709999 14.804301000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "wrist_outer_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.019879069179296494 2.2387115955352783 0.12402799725532532 ;
	setAttr ".r" -type "double3" 87.657408548185415 16.064920194671945 2.5608065498514239 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.24255499999999999 0.56187100000000001 -0.79086599999999996 0
		 0.67827499999999996 0.48463499999999998 0.55233299999999996 0 0.69362100000000004 -0.67039499999999996 -0.26355200000000001 0
		 -49.146701 106.097999 16.3812 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_metacarpal_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.3146772384643555 0.30593535304069519 -2.3912868499755859 ;
	setAttr ".r" -type "double3" -27.769049129171517 -19.527703069996928 11.850627289629658 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50165899999999997 0.81947000000000003 -0.27714100000000003 0
		 -0.86150499999999997 0.50229900000000005 -0.0741975 0 0.078405100000000005 0.27598 0.95796000000000003 0
		 -50.945101000000001 101.903999 16.074200000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_01_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.9573006629943848 0.14326146245002747 0.19892024993896484 ;
	setAttr ".r" -type "double3" 10.491640062438092 0.60504264270136554 14.833680882858841 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.26354100000000003 0.91778899999999997 -0.29699999999999999 0
		 -0.93037099999999995 0.32317400000000002 0.17311599999999999 0 0.25486700000000001 0.23069700000000001 0.93905400000000006 0
		 -53.539800999999997 97.968500000000006 17.628001000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_02_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.8160362243652344 3.036602538486477e-005 3.2629206543788314e-005 ;
	setAttr ".r" -type "double3" 0 0 21.28699904924385 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.092201500000000006 0.97249699999999994 -0.213889 0
		 -0.96257000000000004 -0.032068899999999997 0.26912799999999998 0 0.25486700000000001 0.23069700000000001 0.93905400000000006 0
		 -54.545501000000002 94.466200000000001 18.761400999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_03_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r|pinky_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.0399997234344482 -1.752387652231846e-005 -3.1002964533399791e-005 ;
	setAttr ".r" -type "double3" 1.7075472925031882e-006 -1.1848489498583662e-023 4.9170000470223654 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.17436699999999999 0.96616899999999994 -0.19003400000000001 0
		 -0.951125 -0.11530600000000001 0.28647 0 0.25486700000000001 0.23069700000000001 0.93905400000000006 0
		 -54.357401000000003 92.482299999999995 19.197700999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_metacarpal_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.3742079734802246 0.5429917573928833 -1.0917816162109375 ;
	setAttr ".r" -type "double3" -13.299834889366384 -11.809318654920901 -1.5945633604277298 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.59060500000000005 0.65963300000000002 -0.46483400000000002 0
		 -0.73083299999999995 0.68147000000000002 0.038479100000000002 0 0.34215200000000001 0.31698999999999999 0.88456100000000004 0
		 -50.330900999999997 102.404999 17.132601000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_01_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.6457118988037109 0.041443493217229843 0.020674973726272583 ;
	setAttr ".r" -type "double3" 6.3958444445851033 -0.11693801365858437 29.414482479749037 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.15623799999999999 0.90993100000000005 -0.38420799999999999 0
		 -0.88283500000000004 0.303087 0.35880499999999999 0 0.442936 0.28313300000000002 0.85067199999999998 0
		 -53.688501000000002 98.715699000000001 19.776800999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_02_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.9770674705505371 -2.0846833649557084e-005 -2.3612021323060617e-005 ;
	setAttr ".r" -type "double3" 0 0 18.963999541971834 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.13914000000000001 0.95903799999999995 -0.246752 0
		 -0.88568999999999998 -0.0090675100000000008 0.46418799999999999 0 0.442936 0.28313300000000002 0.85067199999999998 0
		 -54.466101000000002 94.186898999999997 21.689001000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_03_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r|ring_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.2649745941162109 5.0017570174532011e-005 -1.1221488421142567e-005 ;
	setAttr ".r" -type "double3" 0 0 9.1679997480250002 ;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999967 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.27848000000000001 0.94534200000000002 -0.16964099999999999 0
		 -0.85220700000000005 -0.16175500000000001 0.49757299999999999 0 0.442936 0.28313300000000002 0.85067199999999998 0
		 -54.151001000000001 92.014700000000005 22.247900999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_metacarpal_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.3758001327514648 0.75400394201278687 0.18280552327632904 ;
	setAttr ".r" -type "double3" -4.2725003027381465 -0.13075114456697903 -2.3183915821069583 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.484898 0.60591799999999996 -0.630664 0 -0.67018599999999995 0.72073600000000004 0.177171 0
		 0.561894 0.33675300000000002 0.75556199999999996 0 -49.688600999999998 102.917 18.129799999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_01_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -6.0983657836914063 -0.00012385072477627546 1.4303818716143724e-006 ;
	setAttr ".r" -type "double3" 0 0 31.57268201739824 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.062225500000000003 0.89359100000000002 -0.444548 0
		 -0.82486599999999999 0.29680400000000001 0.48114800000000002 0 0.561894 0.33675300000000002 0.75556199999999996 0
		 -52.645600999999999 99.221800000000002 21.9758 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_02_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.1689915657043457 -7.7438591688405722e-005 -3.7045669159851968e-005 ;
	setAttr ".r" -type "double3" 0 0 20.769210477739517 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.234319 0.94077 -0.24504200000000001 0 -0.79332899999999995 -0.039355000000000001 0.60751999999999995 0
		 0.561894 0.33675300000000002 0.75556199999999996 0 -52.967201000000003 94.602800000000002 24.273600999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_03_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r|middle_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.4740469455718994 4.577730578603223e-005 3.4385015169391409e-005 ;
	setAttr ".r" -type "double3" 0 0 9.9999999709533771 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.36852000000000001 0.91964400000000002 -0.135825 0
		 -0.740587 -0.20211999999999999 0.64084200000000002 0 0.561894 0.33675300000000002 0.75556199999999996 0
		 -52.387501 92.275300000000001 24.879901 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_metacarpal_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.4445140361785889 0.38516682386398315 2.3793087005615234 ;
	setAttr ".r" -type "double3" 3.2877464546581563 7.3255016683865044 -0.60616237917610738 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.38282500000000003 0.58596000000000004 -0.71421000000000001 0
		 -0.60140300000000002 0.744923 0.28879899999999997 0 0.70125599999999999 0.318969 0.63757299999999995 0
		 -48.139100999999997 103.23099999999999 19.700101 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_01_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.8772053718566895 -0.043412361294031143 -0.24095164239406586 ;
	setAttr ".r" -type "double3" 0 0 23.372999646513971 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.11282499999999999 0.833399 -0.54103299999999999 0
		 -0.70392500000000002 0.45133699999999999 0.54843900000000001 0 0.70125599999999999 0.318969 0.63757299999999995 0
		 -50.531900999999998 99.677999999999997 23.731501000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_02_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.079932689666748 5.0402059059706517e-006 3.2106661819852889e-005 ;
	setAttr ".r" -type "double3" 0 0 14.892568419110992 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.071878600000000001 0.92140200000000005 -0.38190600000000002 0
		 -0.70927700000000005 0.22198599999999999 0.66906600000000005 0 0.70125599999999999 0.318969 0.63757299999999995 0
		 -50.992201000000001 96.277799999999999 25.938901000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_03_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r|index_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.595076322555542 3.9602186006959528e-005 -3.560681989256409e-006 ;
	setAttr ".r" -type "double3" 0 0 12.51640099754699 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.223884 0.94761200000000001 -0.22783100000000001 0
		 -0.67684200000000005 0.0170253 0.735931 0 0.70125599999999999 0.318969 0.63757299999999995 0
		 -50.805700999999999 93.886700000000005 26.930001000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_01_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.9928325414657593 -1.3566571474075317 2.5813255310058594 ;
	setAttr ".r" -type "double3" 73.564463907750024 39.904178427023133 20.508675504416573 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.23677699999999999 0.46744599999999997 -0.85172199999999998 0
		 0.358045 0.85693299999999994 0.37076900000000002 0 0.90318299999999996 -0.217165 -0.37026900000000001 0
		 -46.226700999999998 102.957999 18.495801 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_02_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.3778247833251953 0.00042712956201285124 -0.00013574546028394252 ;
	setAttr ".r" -type "double3" 3.5306280002014301 -1.9322904957701363 23.246005781061289 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.045745000000000001 0.75995299999999999 -0.648366 0
		 0.47737499999999999 0.58677000000000001 0.65407499999999996 0 0.87750799999999995 -0.27959299999999998 -0.38962400000000003 0
		 -45.190100999999999 100.91200000000001 22.224701 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_03_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.0859522819519043 -1.4851160813122988e-005 4.5825581764802337e-005 ;
	setAttr ".r" -type "double3" 0 0 9.9999999709533771 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.037845200000000002 0.85029900000000003 -0.52493699999999999 0
		 0.47806599999999999 0.44589099999999998 0.75672600000000001 0 0.87750799999999995 -0.27959299999999998 -0.38962400000000003 0
		 -45.048901000000001 98.566800000000001 24.225501000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "weapon_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" -1.1633833646774292 -1.3170545101165771 -0.51951736211776733 ;
	setAttr ".r" -type "double3" -11.617611866448348 -15.808370499724781 8.5170885216315781 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.51015699999999997 0.783771 -0.35417799999999999 0
		 -0.79058899999999999 0.58949099999999999 0.165741 0 0.33868799999999999 0.19545499999999999 0.92037400000000003 0
		 -47.768321 102.633951 15.698805 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "upperarm_twist_01_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -9.2568979263305664 1.0202637895417865e-005 -0.00010078256309498101 ;
	setAttr ".r" -type "double3" 7.7705132047025806e-019 -2.1533312395632271 -0.32660888591551801 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60649299999999995 0.79463200000000001 -0.026965599999999999 0
		 -0.029308000000000001 0.056235399999999998 0.99798699999999996 0 0.79454899999999995 -0.60448199999999996 0.057395399999999999 0
		 -24.342248999999999 136.019329 -2.3405260000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twistCor_01_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -9.9475983006414026e-014 -9.7699626167013776e-015 1.4210854715202004e-014 ;
	setAttr ".r" -type "double3" 7.7705132047025806e-019 -2.1533312395632271 -0.32660888591551801 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.63607599999999997 0.77102499999999996 -0.030474500000000002 0
		 -0.0258503 0.060764199999999997 0.99781699999999995 0 0.77119400000000005 -0.63390000000000002 0.058581800000000003 0
		 -24.342248999999999 136.019329 -2.3405260000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twist_02_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -18.513795852661133 2.0405275790835731e-005 -0.00020156512618996203 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.57603400000000005 0.81709100000000001 -0.023413799999999999 0
		 -0.032592099999999999 0.051578499999999999 0.99813700000000005 0 0.81677599999999995 -0.57419699999999996 0.056341599999999999 0
		 -29.674616 128.45566299999999 -2.123783 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_tricep_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.75752013921737671 -4.8716654777526855 0.0035142137203365564 ;
	setAttr ".r" -type "double3" -94.95644638895449 -0.42448471047106484 0.86833329383278834 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.58150900000000005 0.81350199999999995 -0.0078669900000000008 0
		 -0.80588199999999999 0.57468399999999997 -0.14244899999999999 0 -0.111361 0.089175099999999993 0.98977099999999996 0
		 -29.949325000000002 127.583409 -6.9684379999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_bicep_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.79847818613052368 4.448310375213623 1.5932773351669312 ;
	setAttr ".r" -type "double3" 85.043553611045567 -0.42448471047106517 0.86833329383278812 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.58150900000000005 0.81350199999999995 -0.0078669900000000008 0
		 0.80588199999999999 -0.57468399999999997 0.14244899999999999 0 0.111361 -0.089175099999999993 -0.98977099999999996 0
		 -28.978194999999999 127.11781499999999 2.4247040000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twistCor_02_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 7.6897767939954065e-006 -4.3503746383066755e-008 1.4233457079626533e-007 ;
	setAttr ".r" -type "double3" 0.037033075345610997 -6.4598177141619368 -0.98284030053750582 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.66474 0.74630399999999997 -0.033935199999999999 0
		 -0.022224000000000001 0.065158300000000002 0.99762700000000004 0 0.74674399999999996 -0.66240900000000003 0.0598992 0
		 -29.674610999999999 128.455669 -2.123783 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_correctiveRoot_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -7.1054273576010019e-014 1.7763568394002505e-015 1.4210854715202004e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.57603400000000005 0.81709100000000001 -0.023413799999999999 0
		 -0.032592099999999999 0.051578499999999999 0.99813700000000005 0 0.81677599999999995 -0.57419699999999996 0.056341599999999999 0
		 -19.009882000000001 143.58299500000001 -2.5572699999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_bck_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.5995808839797974 -7.6376986503601074 -0.57636767625808716 ;
	setAttr ".r" -type "double3" -71.338605903548057 0 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.57603400000000005 0.81709100000000001 -0.023413799999999999 0
		 -0.78426399999999996 0.56051300000000004 0.26599899999999999 0 0.23046900000000001 -0.13486200000000001 0.96368900000000002 0
		 -20.153129 142.21300099999999 -10.17576 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_in_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -6.5511422157287598 0.5461316704750061 4.5569877624511719 ;
	setAttr ".r" -type "double3" 179.99999914599996 -48.194143483235486 -7.1097122515502626e-023 ;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99282000000000004 0.11666899999999999 0.026389699999999999 0
		 0.032592099999999999 -0.051578499999999999 -0.99813700000000005 0 -0.11509 0.99183100000000002 -0.055010700000000003 0
		 -19.079322000000001 135.64167699999999 -1.60202 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_fwd_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.3879806995391846 8.5167255401611328 0.8736957311630249 ;
	setAttr ".r" -type "double3" 98.945174165607767 -1.9520053287632744 11.877573660059191 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.58448999999999995 0.790184 0.184338 0 0.81102600000000002 -0.57584500000000005 -0.103144 0
		 0.024648099999999999 0.20979 -0.97743599999999997 0 -20.525437 140.75231400000001 6.0721400000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_out_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.35331422090530396 -0.044167179614305496 -5.9935150146484375 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.57603400000000005 0.81709100000000001 -0.023413799999999999 0
		 -0.032592099999999999 0.051578499999999999 0.99813700000000005 0 0.81677599999999995 -0.57419699999999996 0.056341599999999999 0
		 -24.107323000000001 146.73348799999999 -2.9307669999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_out_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -12.041718482971191 0.44230145215988159 -6.3165755271911621 ;
	setAttr ".r" -type "double3" -0.1805298097407074 -3.1102894160722525 -4.2915710380114067 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99471299999999996 0.098584500000000005 -0.028753799999999999 0
		 0.0278073 0.0109622 0.99955300000000002 0 0.098855700000000005 -0.99506799999999995 0.0081629200000000006 0
		 -14.299899999999999 150.70452299999999 -1.8724730000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_scap_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -10.214470863342285 -7.5677251815795898 1.9570828676223755 ;
	setAttr ".r" -type "double3" 0.18052980974070743 3.1102894160722525 175.7084289619886 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.99471299999999996 -0.098584500000000005 0.028753799999999999 0
		 -0.0278073 -0.0109622 -0.99955300000000002 0 0.098855700000000005 -0.99506799999999995 0.0081629200000000006 0
		 -10.865945999999999 142.835477 -9.7616329999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_pec_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -9.2378215789794922 -7.915499210357666 9.635502815246582 ;
	setAttr ".r" -type "double3" 123.22087241428461 82.005483575089315 -67.346542998772435 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99028099999999997 0.075315699999999999 0.11692 0
		 -0.11634799999999999 -0.011954899999999999 0.99313700000000005 0 0.076196600000000003 -0.99708799999999997 -0.0030758999999999999 0
		 -9.6355029999999999 133.40135699999999 9.9426050000000004 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_04_latissimus_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -9.9618148803710937 4.6262931823730469 -15.443478584289551 ;
	setAttr ".r" -type "double3" 130.38472935526508 71.622025192132099 118.20949958519994 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.94899699999999998 -0.19559699999999999 -0.247277 0
		 -0.24015500000000001 0.059707799999999998 -0.96889599999999998 0 0.20427799999999999 0.97886499999999999 0.0096887699999999993 0
		 15.443479 130.48176900000001 -2.2760989999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_04_latissimus_r" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -9.9671039581298828 4.6270122528076172 15.454672813415527 ;
	setAttr ".r" -type "double3" -145.9767130968215 84.725073756067971 23.82468309464182 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99576500000000001 0.076253799999999997 -0.0513553 0
		 0.051440300000000001 0.00085021800000000002 0.99867600000000001 0 0.0761965 -0.99708799999999997 -0.0030758999999999999 0
		 -15.454673 130.47643600000001 -2.2758759999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_pec_l" -p "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -9.2428960800170898 -7.6847681999206543 -9.3102016448974609 ;
	setAttr ".r" -type "double3" 123.20088551351532 82.006463152853811 112.63366553706553 ;
	setAttr ".s" -type "double3" 0.99999999999999944 1 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99028400000000005 -0.075266200000000005 -0.11693199999999999 0
		 -0.11636000000000001 0.011949100000000001 -0.99313499999999999 0 0.076146699999999998 0.99709199999999998 0.0030749699999999998 0
		 9.3102020000000003 133.355762 9.716367 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_r" -p "|Manny|root|pelvis";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.3657262325286865 -0.11948779225349426 9.9690914154052734 ;
	setAttr ".r" -type "double3" 8.4085386612241138 -3.1255399000842647 176.4398666592337 ;
	setAttr ".s" -type "double3" 0.99999999999999911 0.99999999999999911 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 -0.99851199999999996 0.00127173 0 -0.146013 0.0092329899999999999 0.98924000000000001 0
		 -0.98777899999999996 0.053751500000000001 -0.14629900000000001 0 -9.9690910000000006 93.543381999999994 2.5500229999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "calf_r" -p "|Manny|root|pelvis|thigh_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 43.341262817382812 3.5527136788005009e-015 7.1054273576010019e-015 ;
	setAttr ".r" -type "double3" 0 0 -5.0048445558743575 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041577900000000001 -0.99551000000000001 -0.085034399999999996 0
		 -0.15021300000000001 -0.077912300000000004 0.98557899999999998 0 -0.98777899999999996 0.053751500000000001 -0.14629900000000001 0
		 -12.332227 50.266626000000002 2.6051419999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "foot_r" -p "|Manny|root|pelvis|thigh_r|calf_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 42.217948913574219 -1.1102230246251565e-015 5.3290705182007514e-015 ;
	setAttr ".r" -type "double3" -0.004662608385495883 3.0812019613373778 2.6641047060062917 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0046495299999999998 -0.999502 -0.031211800000000001 0
		 -0.148038 -0.0315562 0.98847799999999997 0 -0.98897100000000004 2.4559500000000001e-005 -0.14810999999999999 0
		 -14.087559000000001 8.2382290000000005 -0.98483399999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ball_r" -p "|Manny|root|pelvis|thigh_r|calf_r|foot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 7.0094366073608398 15.237594604492187 -0.53894561529159546 ;
	setAttr ".r" -type "double3" 0 0 -90.000000000000014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.148038 0.0315562 -0.98847799999999997 0 0.0046495299999999998 -0.999502 -0.031211800000000001 0
		 -0.98897100000000004 2.4559500000000001e-005 -0.14810999999999999 0 -15.777702 0.75143000000000004 13.938242000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ankle_fwd_r" -p "|Manny|root|pelvis|thigh_r|calf_r|foot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.1680757999420166 5.0973677635192871 -0.39477404952049255 ;
	setAttr ".r" -type "double3" 90.801170212482674 -3.5810265870160771 -4.5301367468424685 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1.0000000000000002 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.045475500000000002 -0.99194499999999997 -0.118225 0
		 -0.98590500000000003 0.063640299999999997 -0.15473200000000001 0 0.16100900000000001 0.109523 -0.98085699999999998 0
		 -14.461821 10.244362000000001 4.1799419999999996 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ankle_bck_r" -p "|Manny|root|pelvis|thigh_r|calf_r|foot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.52658110857009888 -4.0418381690979004 0.92914694547653198 ;
	setAttr ".r" -type "double3" -89.198829787517411 -3.5810265870160674 -4.5301367468424676 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.045475500000000002 -0.99194499999999997 -0.118225 0
		 0.98590500000000003 -0.063640299999999997 0.15473200000000001 0 -0.16100900000000001 -0.109523 0.98085699999999998 0
		 -14.410563 8.8921159999999997 -5.1012839999999997 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twist_02_r" -p "|Manny|root|pelvis|thigh_r|calf_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 14.072649955749512 5.773159728050814e-015 0.037728950381278992 ;
	setAttr ".r" -type "double3" -0.0046559128746443742 0.25816272471228924 2.6643342814062052 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 -0.99828799999999995 -0.038468599999999999 0
		 -0.148038 -0.0315562 0.98847799999999997 0 -0.98799999999999999 0.049251400000000001 -0.146394 0
		 -12.954605000000001 36.259188000000002 1.402963 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twistCor_02_r" -p "|Manny|root|pelvis|thigh_r|calf_r|calf_twist_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4210854715202004e-014 -4.4408920985006262e-016 8.8817841970012523e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 -0.99828799999999995 -0.038468599999999999 0
		 -0.148038 -0.0315562 0.98847799999999997 0 -0.98799999999999999 0.049251400000000001 -0.146394 0
		 -12.954605000000001 36.259188000000002 1.402963 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twist_01_r" -p "|Manny|root|pelvis|thigh_r|calf_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 28.145299911499023 7.1054273576010019e-015 0.075457900762557983 ;
	setAttr ".r" -type "double3" -0.0046559128746443742 0.25816272471228924 2.6643342814062052 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 -0.99828799999999995 -0.038468599999999999 0
		 -0.148038 -0.0315562 0.98847799999999997 0 -0.98799999999999999 0.049251400000000001 -0.146394 0
		 -13.576983999999999 22.251750000000001 0.20078499999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_correctiveRoot_r" -p "|Manny|root|pelvis|thigh_r|calf_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -7.1054273576010019e-015 2.2204460492503131e-015 -4.9737991503207013e-014 ;
	setAttr ".r" -type "double3" 0.0024874098349542081 -0.15361033275133484 7.5830605318140299e-022 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044226000000000001 -0.99536199999999997 -0.085426299999999997 0
		 -0.150256 -0.077909900000000004 0.98557300000000003 0 -0.98765700000000001 0.0564237 -0.14611299999999999 0
		 -12.332227 50.266626000000002 2.6051419999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_kneeBack_r" -p "|Manny|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.15535767376422882 -5.7634234428405762 -0.42761912941932678 ;
	setAttr ".r" -type "double3" -87.809358873689121 -0.63786814850703222 -2.8106705899652917 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.047797800000000001 -0.98965499999999995 -0.13527 0
		 0.98064600000000002 -0.0722362 0.181978 0 -0.18986700000000001 -0.12395399999999999 0.97395399999999999 0
		 -11.050769000000001 50.536887999999998 -3.0259209999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_knee_r" -p "|Manny|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.18996571004390717 5.2457842826843262 -0.0016205285210162401 ;
	setAttr ".r" -type "double3" 92.190641126310908 -0.63786814850703155 -2.8106705899652926 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.047797800000000001 -0.98965499999999995 -0.13527 0
		 -0.98064600000000002 0.0722362 -0.181978 0 0.18986700000000001 0.12395399999999999 -0.97395399999999999 0
		 -13.127236999999999 49.668751 7.759252 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twist_01_r" -p "|Manny|root|pelvis|thigh_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 14.447087287902832 6.2172489379008766e-015 -3.5527136788005009e-015 ;
	setAttr ".r" -type "double3" 0 0.25820470285919356 -1.3073006136480458 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 -0.99869399999999997 -0.020638299999999998 0
		 -0.14721899999999999 -0.0135502 0.98901099999999997 0 -0.98799999999999999 0.049251400000000001 -0.146394 0
		 -10.756803 79.117796999999996 2.5683959999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twistCor_01_r" -p "|Manny|root|pelvis|thigh_r|thigh_twist_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4210854715202004e-014 4.8849813083506888e-015 1.5987211554602254e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 -0.99869399999999997 -0.020638299999999998 0
		 -0.14721899999999999 -0.0135502 0.98901099999999997 0 -0.98799999999999999 0.049251400000000001 -0.146394 0
		 -10.756803 79.117796999999996 2.5683959999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twist_02_r" -p "|Manny|root|pelvis|thigh_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 28.894174575805664 7.9936057773011271e-015 -3.5527136788005009e-014 ;
	setAttr ".r" -type "double3" 0 0.25820470285919356 -1.3073006136480458 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 -0.99869399999999997 -0.020638299999999998 0
		 -0.14721899999999999 -0.0135502 0.98901099999999997 0 -0.98799999999999999 0.049251400000000001 -0.146394 0
		 -11.544515000000001 64.692211999999998 2.5867689999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twistCor_02_r" -p "|Manny|root|pelvis|thigh_r|thigh_twist_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.4210854715202004e-014 5.3290705182007514e-015 1.5987211554602254e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 -0.99869399999999997 -0.020638299999999998 0
		 -0.14721899999999999 -0.0135502 0.98901099999999997 0 -0.98799999999999999 0.049251400000000001 -0.146394 0
		 -11.544515000000001 64.692211999999998 2.5867689999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_correctiveRoot_r" -p "|Manny|root|pelvis|thigh_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -7.1054273576010019e-014 3.5527136788005009e-015 -2.1316282072803006e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 -0.99851199999999996 0.00127173 0 -0.146013 0.0092329899999999999 0.98924000000000001 0
		 -0.98777899999999996 0.053751500000000001 -0.14629900000000001 0 -9.9690910000000006 93.543381999999994 2.5500229999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_fwd_r" -p "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.2409243583679199 6.7747397422790527 -0.75509780645370483 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 -0.99851199999999996 0.00127173 0 -0.98777899999999996 0.053751500000000001 -0.14629900000000001 0
		 0.146013 -0.0092329899999999999 -0.98924000000000001 0 -9.9811890000000005 97.799958000000004 9.3569410000000008 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_bck_r" -p "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.0374994277954102 -10.062273979187012 -1.5191730260848999 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 -0.99851199999999996 0.00127173 0 0.98777899999999996 -0.053751500000000001 0.14629900000000001 0
		 -0.146013 0.0092329899999999999 0.98924000000000001 0 -6.7245980000000003 98.398820999999998 -7.188129 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_out_r" -p "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.8166170120239258 -0.60062211751937866 5.1101841926574707 ;
	setAttr ".r" -type "double3" 179.99999774099993 0 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 -0.99851199999999996 0.00127173 0 0.146013 -0.0092329899999999999 -0.98924000000000001 0
		 0.98777899999999996 -0.053751500000000001 0.14629900000000001 0 -14.611981 99.620475999999996 1.200852 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_in_r" -p "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 10.928328514099121 0.76586586236953735 -8.5778665542602539 ;
	setAttr ".r" -type "double3" 2.2588726814303131e-006 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 -0.99851199999999996 0.00127173 0 -0.146013 0.0092329899999999999 0.98924000000000001 0
		 -0.98777899999999996 0.053751500000000001 -0.14629900000000001 0 -2.2037360000000001 82.177316000000005 4.5764800000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_bck_lwr_r" -p "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.2761650085449219 -10.648496627807617 -1.4992258548736572 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 -0.99851199999999996 0.00127173 0 0.98777899999999996 -0.053751500000000001 0.14629900000000001 0
		 -0.146013 0.0092329899999999999 0.98924000000000001 0 -7.2210470000000004 88.096165999999997 -7.7578459999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_fwd_lwr_r" -p "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.0280262231826782 6.8996591567993164 -0.72430419921875 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 -0.99851199999999996 0.00127173 0 -0.98777899999999996 0.053751500000000001 -0.14629900000000001 0
		 0.146013 -0.0092329899999999999 -0.98924000000000001 0 -10.317130000000001 92.541657999999998 9.4827119999999994 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_l" -p "|Manny|root|pelvis";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.3657112121582031 -0.11004376411437988 -9.969202995300293 ;
	setAttr ".r" -type "double3" 8.4085386612241173 -3.1255399000842665 -3.5601333407663098 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 0.99851199999999996 -0.00127173 0 -0.146013 -0.0092329899999999999 -0.98924000000000001 0
		 -0.98777899999999996 -0.053751500000000001 0.14629900000000001 0 9.9692030000000003 93.542798000000005 2.540597 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "calf_l" -p "|Manny|root|pelvis|thigh_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -43.34130859375 4.4408920985006262e-015 5.3290705182007514e-015 ;
	setAttr ".r" -type "double3" 0 0 -5.0048445558743575 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041577900000000001 0.99551000000000001 0.085034399999999996 0
		 -0.15021300000000001 0.077912300000000004 -0.98557899999999998 0 -0.98777899999999996 -0.053751500000000001 0.14629900000000001 0
		 12.332341 50.265996999999999 2.5957159999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "foot_l" -p "|Manny|root|pelvis|thigh_l|calf_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -42.217914581298828 -2.1094237467877974e-015 7.1054273576010019e-015 ;
	setAttr ".r" -type "double3" -0.004662608385495883 3.0812019613373778 2.6641047060062917 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0046495299999999998 0.999502 0.031211800000000001 0
		 -0.148038 0.0315562 -0.98847799999999997 0 -0.98897100000000004 -2.4559500000000001e-005 0.14810999999999999 0
		 14.087671 8.2376339999999999 -0.99425699999999995 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ball_l" -p "|Manny|root|pelvis|thigh_l|calf_l|foot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -7.0094366073608398 -15.237588882446289 0.53888744115829468 ;
	setAttr ".r" -type "double3" 0 0 -90.000000000000014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.148038 -0.0315562 0.98847799999999997 0 0.0046495299999999998 0.999502 0.031211800000000001 0
		 -0.98897100000000004 -2.4559500000000001e-005 0.14810999999999999 0 15.777870999999999 0.75083500000000003 13.928805000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ankle_bck_l" -p "|Manny|root|pelvis|thigh_l|calf_l|foot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.61270773410797119 3.4437336921691895 -0.4924950897693634 ;
	setAttr ".r" -type "double3" -97.228839501486391 -4.1793485300993209 -3.9848641766103801 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.057188799999999998 0.99224500000000004 0.110357 0
		 0.99812199999999995 0.059253199999999999 -0.0155158 0 -0.021934499999999999 0.109263 -0.99377099999999996 0
		 14.067781999999999 8.9587199999999996 -4.4521329999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ankle_fwd_l" -p "|Manny|root|pelvis|thigh_l|calf_l|foot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.7797976732254028 -4.5947589874267578 -0.26459750533103943 ;
	setAttr ".r" -type "double3" 82.771160498513609 -4.1793485300993227 -3.9848641766103818 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.057188799999999998 0.99224500000000004 0.110357 0
		 -0.99812199999999995 -0.059253199999999999 0.0155158 0 0.021934499999999999 -0.109263 0.99377099999999996 0
		 15.037822 9.8715589999999995 3.563923 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twist_02_l" -p "|Manny|root|pelvis|thigh_l|calf_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -14.072638511657715 2.2204460492503131e-015 1.9539925233402755e-014 ;
	setAttr ".r" -type "double3" -0.0046559128746443742 0.25816272471228924 2.6643342814062052 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 0.99828799999999995 0.038468599999999999 0
		 -0.148038 0.0315562 -0.98847799999999997 0 -0.98799999999999999 -0.049251400000000001 0.146394 0
		 12.917451 36.256542000000003 1.3990579999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twistCor_02_l" -p "|Manny|root|pelvis|thigh_l|calf_l|calf_twist_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4210854715202004e-014 -3.5527136788005009e-015 -1.4210854715202004e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 0.99828799999999995 0.038468599999999999 0
		 -0.148038 0.0315562 -0.98847799999999997 0 -0.98799999999999999 -0.049251400000000001 0.146394 0
		 12.917451 36.256542000000003 1.3990579999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twist_01_l" -p "|Manny|root|pelvis|thigh_l|calf_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -28.14527702331543 5.0670109885686543e-006 -0.075448110699653625 ;
	setAttr ".r" -type "double3" -0.0046559128746443742 0.25816272471228924 2.6643342814062052 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 0.99828799999999995 0.038468599999999999 0
		 -0.148038 0.0315562 -0.98847799999999997 0 -0.98799999999999999 -0.049251400000000001 0.146394 0
		 13.577086 22.251144 0.191358 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_correctiveRoot_l" -p "|Manny|root|pelvis|thigh_l|calf_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.9690784231206635e-007 -3.3903711482707877e-006 -1.2112296644772869e-005 ;
	setAttr ".r" -type "double3" 0.0024874098349539362 -0.15361033275133484 1.516612106362806e-021 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044226000000000001 0.99536199999999997 0.085426299999999997 0
		 -0.150256 0.077909900000000004 -0.98557300000000003 0 -0.98765700000000001 -0.0564237 0.14611299999999999 0
		 12.332352999999999 50.265996999999999 2.5957170000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_kneeBack_l" -p "|Manny|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.15856355428695679 5.7585320472717285 0.40399324893951416 ;
	setAttr ".r" -type "double3" -87.809315223536359 -0.63887652912769677 -2.8097805136317739 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.047817600000000002 0.98965599999999998 0.13525699999999999 0
		 0.98064499999999999 0.072253200000000004 -0.181977 0 -0.18986700000000001 0.12393800000000001 -0.97395600000000004 0
		 11.075106 50.534021000000003 -3.0342500000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_knee_l" -p "|Manny|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.1928076446056366 -5.2492456436157227 -0.0011415837798267603 ;
	setAttr ".r" -type "double3" 92.190684776463655 -0.63887652912769843 -2.8097805136317802 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.047817600000000002 0.98965599999999998 0.13525699999999999 0
		 -0.98064499999999999 -0.072253200000000004 0.181977 0 0.18986700000000001 -0.12393800000000001 0.97395600000000004 0
		 13.130737 49.665179999999999 7.7525919999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twist_01_l" -p "|Manny|root|pelvis|thigh_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -14.447102546691895 -1.7763568394002505e-015 3.5527136788005009e-015 ;
	setAttr ".r" -type "double3" 0 0.25820470285919356 -1.3073006136480458 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 0.99869399999999997 0.020638299999999998 0
		 -0.14721899999999999 0.0135502 -0.98901099999999997 0 -0.98799999999999999 -0.049251400000000001 0.146394 0
		 10.756916 79.117198000000002 2.55897 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twistCor_01_l" -p "|Manny|root|pelvis|thigh_l|thigh_twist_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4210854715202004e-014 -8.8817841970012523e-016 1.7763568394002505e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 0.99869399999999997 0.020638299999999998 0
		 -0.14721899999999999 0.0135502 -0.98901099999999997 0 -0.98799999999999999 -0.049251400000000001 0.146394 0
		 10.756916 79.117198000000002 2.55897 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twist_02_l" -p "|Manny|root|pelvis|thigh_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -28.894205093383789 -2.2688980152452132e-006 -8.0748641266836785e-006 ;
	setAttr ".r" -type "double3" 0 0.25820470285919356 -1.3073006136480458 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 0.99869399999999997 0.020638299999999998 0
		 -0.14721899999999999 0.0135502 -0.98901099999999997 0 -0.98799999999999999 -0.049251400000000001 0.146394 0
		 11.544636000000001 64.691597999999999 2.5773440000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twistCor_02_l" -p "|Manny|root|pelvis|thigh_l|thigh_twist_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0 -7.1054273576010019e-015 1.2434497875801753e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 0.99869399999999997 0.020638299999999998 0
		 -0.14721899999999999 0.0135502 -0.98901099999999997 0 -0.98799999999999999 -0.049251400000000001 0.146394 0
		 11.544636000000001 64.691597999999999 2.5773440000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_correctiveRoot_l" -p "|Manny|root|pelvis|thigh_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4210854715202004e-014 -1.7763568394002505e-015 -1.0658141036401503e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 0.99851199999999996 -0.00127173 0 -0.146013 -0.0092329899999999999 -0.98924000000000001 0
		 -0.98777899999999996 -0.053751500000000001 0.14629900000000001 0 9.9692030000000003 93.542798000000005 2.540597 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_bck_l" -p "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.0354571342468262 10.055751800537109 1.4929672479629517 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 0.99851199999999996 -0.00127173 0 0.98777899999999996 0.053751500000000001 -0.14629900000000001 0
		 -0.146013 -0.0092329899999999999 -0.98924000000000001 0 6.7516590000000001 98.397666999999998 -7.1949350000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_fwd_l" -p "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.2295513153076172 -6.7731161117553711 0.74736285209655762 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 0.99851199999999996 -0.00127173 0 -0.98777899999999996 -0.053751500000000001 0.14629900000000001 0
		 0.146013 0.0092329899999999999 0.98924000000000001 0 9.9893249999999991 97.788419000000005 9.3447910000000007 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_out_l" -p "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.8140983581542969 0.58643501996994019 -5.1227350234985352 ;
	setAttr ".r" -type "double3" 180 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 0.99851199999999996 -0.00127173 0 0.146013 0.0092329899999999999 0.98924000000000001 0
		 0.98777899999999996 0.053751500000000001 -0.14629900000000001 0 14.626699 99.618183999999999 1.203627 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_bck_lwr_l" -p "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.2984728813171387 10.491520881652832 1.2301521301269531 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 0.99851199999999996 -0.00127173 0 0.98777899999999996 0.053751500000000001 -0.14629900000000001 0
		 -0.146013 -0.0092329899999999999 -0.98924000000000001 0 7.5110799999999998 88.089220999999995 -7.6513220000000004 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_in_l" -p "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -10.868840217590332 -0.82668650150299072 8.5551881790161133 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 0.99851199999999996 -0.00127173 0 -0.146013 -0.0092329899999999999 -0.98924000000000001 0
		 -0.98777899999999996 -0.053751500000000001 0.14629900000000001 0 2.2318859999999998 82.237913000000006 4.6238260000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_fwd_lwr_l" -p "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.1209093332290649 -7.3878488540649414 0.64839571714401245 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0545239 0.99851199999999996 -0.00127173 0 -0.98777899999999996 -0.053751500000000001 0.14629900000000001 0
		 0.146013 0.0092329899999999999 0.98924000000000001 0 10.468569 92.456917000000004 9.9452350000000003 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ik_foot_root" -p "|Manny|root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_foot_l" -p "|Manny|root|ik_foot_root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" 14.087671279907227 0.99425750970840454 8.2376375198364258 ;
	setAttr ".r" -type "double3" 90.044595639783623 -88.191663071784689 -81.527131053351454 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0046495199999999999 0.999502 0.031211800000000001 0
		 -0.148037 0.0315562 -0.98847799999999997 0 -0.98897100000000004 -2.4561499999999999e-005 0.14810999999999999 0
		 14.087671 8.2376380000000005 -0.99425799999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_foot_r" -p "|Manny|root|ik_foot_root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" -14.087558746337891 0.98483455181121826 8.2382316589355469 ;
	setAttr ".r" -type "double3" -89.955404360216178 88.1916630717853 81.527131053352846 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999967 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0046495199999999999 -0.999502 -0.031211800000000001 0
		 -0.148037 -0.0315562 0.98847799999999997 0 -0.98897100000000004 2.4561499999999999e-005 -0.14810999999999999 0
		 -14.087559000000001 8.238232 -0.98483500000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_hand_root" -p "|Manny|root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_hand_gun" -p "|Manny|root|ik_hand_root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" -47.768318176269531 -15.69880485534668 104.4664306640625 ;
	setAttr ".r" -type "double3" 68.473107478131155 -39.410111911239163 53.666512015145315 ;
	setAttr ".s" -type "double3" 1 1.0000000000000007 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.45776600000000001 0.63486699999999996 -0.62241000000000002 0
		 -0.645509 0.71872800000000003 0.258357 0 0.61136599999999997 0.28350399999999998 0.73882099999999995 0
		 -47.768318000000001 104.466431 15.698805 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_hand_l" -p "|Manny|root|ik_hand_root|ik_hand_gun";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" 43.733570098876953 -61.669849395751953 58.408111572265625 ;
	setAttr ".r" -type "double3" -107.73758596138394 -34.036790747396601 -134.50699481505316 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.45776600000000001 -0.63486699999999996 0.62241000000000002 0
		 -0.645509 -0.71872800000000003 -0.258357 0 0.61136599999999997 -0.28350399999999998 -0.73882099999999995 0
		 47.768600999999997 104.466539 15.698888 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_hand_r" -p "|Manny|root|ik_hand_root|ik_hand_gun";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" -7.1054273576010019e-015 0 7.1054273576010019e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.45776600000000001 0.63486699999999996 -0.62241000000000002 0
		 -0.645509 0.71872800000000003 0.258357 0 0.61136599999999997 0.28350399999999998 0.73882099999999995 0
		 -47.768318000000001 104.466431 15.698805 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "interaction" -p "|Manny|root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "center_of_mass" -p "|Manny|root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode transform -n "Quinn";
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode joint -n "root" -p "Quinn";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "jointTRSData" -ln "jointTRSData" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".jointTRSData" -type "string" (
		"(dp0&lf;Vupperarm_bicep_l&lf;p1&lf;(dp2&lf;S'rotation'&lf;p3&lf;(F-2.112087093159394e-16&lf;F1.6101558074909054e-14&lf;F-1.948089742396404e-14&lf;tp4&lf;sS'translate'&lf;p5&lf;(F0.4296336514963315&lf;F-3.0014054840172104&lf;F-0.33568228722386095&lf;tp6&lf;sS'scale'&lf;p7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp8&lf;ssVthigh_fwd_r&lf;p9&lf;(dp10&lf;g3&lf;(F-3.2351075555054503e-09&lf;F-3.554814002738346e-09&lf;F4.6893499014910565e-09&lf;tp11&lf;sg5&lf;(F-5.8879919004175605&lf;F7.159845239867742&lf;F-0.8596299999494192&lf;tp12&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp13&lf;ssVupperarm_twist_02_r&lf;p14&lf;(dp15&lf;g3&lf;(F-5.715515410477199e-05&lf;F0.239297380467856&lf;F-0.013684890989370199&lf;tp16&lf;sg5&lf;(F-16.831266561863387&lf;F1.8815802156346706e-05&lf;F-0.00023473533977380612&lf;tp17&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp18&lf;ssVthigh_fwd_l&lf;p19&lf;(dp20&lf;g3&lf;(F-3.0625942677403114e-09&lf;F3.73169190518625e-08&lf;F5.2113571248109e-09&lf;tp21&lf;sg5&lf;(F5.892345071609&lf;F-7.144273484161924&lf;F0.8632194689173218&lf;tp22&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp23&lf;ssVupperarm_twist_02_l&lf;p24&lf;(dp25&lf;g3&lf;(F-5.715515410371704e-05&lf;F0.2392973804688322&lf;F-0.013684890989424315&lf;tp26&lf;sg5&lf;(F16.83153379318587&lf;F1.7763568394002505e-15&lf;F0.0&lf;tp27&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp28&lf;ssVspine_02&lf;p29&lf;(dp30&lf;g3&lf;(F-1.2132853246549658e-20&lf;F-5.763105292111093e-19&lf;F-2.3854160140597598e-15&lf;tp31&lf;sg5&lf;(F4.64819543873827&lf;F0.0&lf;F9.247810850432359e-15&lf;tp32&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp33&lf;ssVspine_03&lf;p34&lf;(dp35&lf;g3&lf;(F3.8839555994523184e-42&lf;F9.390828412829445e-18&lf;F4.739395799433465e-23&lf;tp36&lf;sg5&lf;(F7.10706776307444&lf;F7.105427357601002e-15&lf;F-1.6302063865492045e-14&lf;tp37&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp38&lf;ssVspine_04&lf;p39&lf;(dp40&lf;g3&lf;(F-5.823769558343841e-19&lf;F4.246498636292384e-20&lf;F1.590277269640821e-15&lf;tp41&lf;sg5&lf;(F8.248942899748158&lf;F3.552713678800501e-15&lf;F-2.1010970741031088e-14&lf;tp42&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp43&lf;ssVspine_05&lf;p44&lf;(dp45&lf;g3&lf;(F-1.4559423895859602e-19&lf;F4.659679162086993e-18&lf;F1.4908847995874568e-16&lf;tp46&lf;sg5&lf;(F16.308254953927232&lf;F-7.105427357601002e-15&lf;F2.3062281251373662e-14&lf;tp47&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp48&lf;ssVindex_metacarpal_r&lf;p49&lf;(dp50&lf;g3&lf;(F-4.808104147368675e-15&lf;F2.4351121779955047e-15&lf;F2.2363275104040347e-15&lf;tp51&lf;sg5&lf;(F-3.457892340165678&lf;F-0.010593711576447618&lf;F1.529324513338704&lf;tp52&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp53&lf;ssVupperarm_bicep_r&lf;p54&lf;(dp55&lf;g3&lf;(F3.1557065980145833e-14&lf;F5.367186024969683e-15&lf;F6.361109362927035e-15&lf;tp56&lf;sg5&lf;(F-0.570192043047129&lf;F3.0080906171650774&lf;F0.15133974465763345&lf;tp57&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp58&lf;ssVlowerarm_in_r&lf;p59&lf;(dp60&lf;g3&lf;(F2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp61&lf;sg5&lf;(F-1.5514355804486115&lf;F-0.21415705989632272&lf;F2.2829596952656743&lf;tp62&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp63&lf;ssVwrist_inner_l&lf;p64&lf;(dp65&lf;g3&lf;(F-5.1497652947915144e-14&lf;F-9.541664044390552e-15&lf;F-4.174478019420861e-15&lf;tp66&lf;sg5&lf;(F-0.08634634823715714&lf;F1.6269678363065907&lf;F-0.47525639176425827&lf;tp67&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp68&lf;ssVthigh_out_r&lf;p69&lf;(dp70&lf;g3&lf;(F-1.122660004060381e-09&lf;F7.74599041022121e-09&lf;F1.0052238419628676e-08&lf;tp71&lf;sg5&lf;(F-5.490222724311039&lf;F-1.2357139686785958&lf;F4.529304741894016&lf;tp72&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp73&lf;ssVclavicle_l&lf;p74&lf;(dp75&lf;g3&lf;(F-2.7034714792439897e-14&lf;F6.659286364314223e-15&lf;F359.99999999999994&lf;tp76&lf;sg5&lf;(F5.434344857110261&lf;F0.9364505906511198&lf;F-0.866799571158099&lf;tp77&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp78&lf;ssVupperarm_twist_01_r&lf;p79&lf;(dp80&lf;g3&lf;(F-6.1858806299137406e-15&lf;F-2.4343783062529425e-15&lf;F-9.660793900053754e-15&lf;tp81&lf;sg5&lf;(F-8.639670830686583&lf;F0.09629670980522409&lf;F0.16541554783053414&lf;tp82&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp83&lf;ssVball_r&lf;p84&lf;(dp85&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp86&lf;sg5&lf;(F5.70729832865123&lf;F11.471707953183119&lf;F0.00175755891641316&lf;tp87&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp88&lf;ssVthigh_twistCor_01_r&lf;p89&lf;(dp90&lf;g3&lf;(F-7.966473664013811e-13&lf;F7.136261186895984e-18&lf;F-1.5803581998339445e-10&lf;tp91&lf;sg5&lf;(F-6.110667527536862e-13&lf;F-2.0383694732117874e-13&lf;F7.105427357601002e-15&lf;tp92&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp93&lf;ssVthigh_twistCor_01_l&lf;p94&lf;(dp95&lf;g3&lf;(F-7.679131785889907e-13&lf;F-6.227958139655539e-18&lf;F-1.5803582267887843e-10&lf;tp96&lf;sg5&lf;(F6.252776074688882e-13&lf;F2.0294876890147862e-13&lf;F-1.0658141036401503e-14&lf;tp97&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp98&lf;ssVindex_03_l&lf;p99&lf;(dp100&lf;g3&lf;(F-5.308123295365481e-21&lf;F2.1581542102166356e-40&lf;F4.6590149061444796e-18&lf;tp101&lf;sg5&lf;(F2.3173075307279305&lf;F2.842170943040401e-14&lf;F9.769962616701378e-15&lf;tp102&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp103&lf;ssVball_l&lf;p104&lf;(dp105&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp106&lf;sg5&lf;(F-5.707299374390027&lf;F-11.471697092323957&lf;F-0.0017138404028358423&lf;tp107&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp108&lf;ssVupperarm_twist_01_l&lf;p109&lf;(dp110&lf;g3&lf;(F2.5988450325576927e-15&lf;F1.4877974460841166e-16&lf;F3.2046487033437818e-15&lf;tp111&lf;sg5&lf;(F8.63996069843948&lf;F-0.09628023891043291&lf;F-0.16557725147991675&lf;tp112&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp113&lf;ssVclavicle_r&lf;p114&lf;(dp115&lf;g3&lf;(F180.0&lf;F180.0&lf;F-180.0&lf;tp116&lf;sg5&lf;(F5.433600703058573&lf;F0.9365499957792274&lf;F0.8688515061571342&lf;tp117&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp118&lf;ssVwrist_inner_r&lf;p119&lf;(dp120&lf;g3&lf;(F-1.2709794684129601e-14&lf;F3.1805546814635168e-15&lf;F-3.578124016646457e-15&lf;tp121&lf;sg5&lf;(F0.05073241165543152&lf;F-1.456593948087047&lf;F0.4146242448130657&lf;tp122&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp123&lf;ssVthigh_out_l&lf;p124&lf;(dp125&lf;g3&lf;(F-7.841617927850014e-09&lf;F-1.611360794686607e-08&lf;F-6.402664334885883e-09&lf;tp126&lf;sg5&lf;(F5.488080642544915&lf;F1.2215333393427994&lf;F-4.541695609589556&lf;tp127&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp128&lf;ssVclavicle_out_l&lf;p129&lf;(dp130&lf;g3&lf;(F2.1369351765716433e-15&lf;F-3.0719030044415276e-10&lf;F1.3674210922985612e-14&lf;tp131&lf;sg5&lf;(F10.05977550712825&lf;F0.047623277898917404&lf;F5.124009981794558&lf;tp132&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp133&lf;ssVthigh_l&lf;p134&lf;(dp135&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp136&lf;sg5&lf;(F-3.011926735188311&lf;F-0.06340308345171675&lf;F-10.395847431675032&lf;tp137&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp138&lf;ssVcalf_correctiveRoot_l&lf;p139&lf;(dp140&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp141&lf;sg5&lf;(F7.105427357601002e-15&lf;F-4.440892098500626e-16&lf;F-8.881784197001252e-15&lf;tp142&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp143&lf;ssVclavicle_out_r&lf;p144&lf;(dp145&lf;g3&lf;(F1.5853077242196556e-14&lf;F-1.733539619516481e-08&lf;F-1.1745378447666112e-14&lf;tp146&lf;sg5&lf;(F-10.296855532639404&lf;F0.1711587055647632&lf;F-5.132314944700084&lf;tp147&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp148&lf;ssVfoot_l&lf;p149&lf;(dp150&lf;g3&lf;(F3.1060104311167183e-18&lf;F-3.975696764194372e-15&lf;F-7.450785178706153e-17&lf;tp151&lf;sg5&lf;(F-38.868305766260185&lf;F-1.8835664532534935e-06&lf;F-6.242941395839807e-06&lf;tp152&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp153&lf;ssVthigh_correctiveRoot_l&lf;p154&lf;(dp155&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp156&lf;sg5&lf;(F1.4210854715202004e-14&lf;F2.6645352591003757e-15&lf;F3.552713678800501e-15&lf;tp157&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp158&lf;ssVspine_01&lf;p159&lf;(dp160&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp161&lf;sg5&lf;(F2.303684184416582&lf;F3.552713678800501e-15&lf;F8.632417697329586e-16&lf;tp162&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp163&lf;ssVupperarm_out_r&lf;p164&lf;(dp165&lf;g3&lf;(F0.0&lf;F7.727962875304028e-09&lf;F0.0&lf;tp166&lf;sg5&lf;(F-0.0015998720624850193&lf;F-0.26206737267851477&lf;F-5.478375142778077&lf;tp167&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp168&lf;ssVmiddle_03_l&lf;p169&lf;(dp170&lf;g3&lf;(F-6.212020862233431e-18&lf;F-7.442292181433567e-17&lf;F3.975754016095629e-16&lf;tp171&lf;sg5&lf;(F2.7046150315646855&lf;F-7.105427357601002e-15&lf;F-7.105427357601002e-15&lf;tp172&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp173&lf;ssVring_02_r&lf;p174&lf;(dp175&lf;g3&lf;(F3.7272125173400593e-17&lf;F-9.93923337957349e-17&lf;F-9.541615512977564e-15&lf;tp176&lf;sg5&lf;(F-3.9621715292690425&lf;F1.5004568538756757e-05&lf;F-4.923994394800957e-05&lf;tp177&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp178&lf;ssVthumb_01_r&lf;p179&lf;(dp180&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp181&lf;sg5&lf;(F-2.4749759005593006&lf;F-1.2059805117236948&lf;F2.2430633666914694&lf;tp182&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp183&lf;ssVthumb_01_l&lf;p184&lf;(dp185&lf;g3&lf;(F-1.3517357396219944e-14&lf;F-7.951386703658789e-15&lf;F3.1805546814635168e-15&lf;tp186&lf;sg5&lf;(F2.4749410357123125&lf;F1.2059493890390485&lf;F-2.242953361528688&lf;tp187&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp188&lf;ssVring_02_l&lf;p189&lf;(dp190&lf;g3&lf;(F2.4848083448933737e-17&lf;F-1.4287647983136886e-16&lf;F-1.272226725726705e-14&lf;tp191&lf;sg5&lf;(F3.962151505953962&lf;F-1.4210854715202004e-14&lf;F-3.907985046680551e-14&lf;tp192&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp193&lf;ssVupperarm_out_l&lf;p194&lf;(dp195&lf;g3&lf;(F0.0&lf;F7.727962875304028e-09&lf;F0.0&lf;tp196&lf;sg5&lf;(F-0.13826645305934449&lf;F0.26872367525577534&lf;F5.293475235855169&lf;tp197&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp198&lf;ssVmiddle_03_r&lf;p199&lf;(dp200&lf;g3&lf;(F-1.5530052155583591e-18&lf;F-7.454425034680117e-17&lf;F1.5902788573384142e-15&lf;tp201&lf;sg5&lf;(F-2.7046326736289075&lf;F1.1443238847164139e-05&lf;F2.466278816015688e-05&lf;tp202&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp203&lf;ssVankle_fwd_r&lf;p204&lf;(dp205&lf;g3&lf;(F3.602972100095387e-16&lf;F-2.882377680076312e-15&lf;F1.1927080055488187e-14&lf;tp206&lf;sg5&lf;(F-1.6349691499013561&lf;F4.197070299797255&lf;F-0.4635870315139865&lf;tp207&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp208&lf;ssVthigh_correctiveRoot_r&lf;p209&lf;(dp210&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp211&lf;sg5&lf;(F0.0&lf;F-1.7763568394002505e-15&lf;F-5.329070518200751e-15&lf;tp212&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp213&lf;ssVcalf_correctiveRoot_r&lf;p214&lf;(dp215&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp216&lf;sg5&lf;(F7.105427357601002e-15&lf;F-8.881784197001252e-16&lf;F-1.7763568394002505e-15&lf;tp217&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp218&lf;ssVthigh_bck_lwr_l&lf;p219&lf;(dp220&lf;g3&lf;(F2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp221&lf;sg5&lf;(F-5.597656441629496&lf;F9.947071814613224&lf;F1.4709560480788824&lf;tp222&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp223&lf;ssVupperarm_twistCor_01_r&lf;p224&lf;(dp225&lf;g3&lf;(F-5.715515408476811e-05&lf;F0.2392973804678571&lf;F-0.013684890989359285&lf;tp226&lf;sg5&lf;(F0.22332124117612295&lf;F-0.09634080925396127&lf;F-0.16646707192127508&lf;tp227&lf;sg7&lf;(F0.9999999999999997&lf;F1.0&lf;F0.9999999999999998&lf;tp228&lf;ssVhand_r&lf;p229&lf;(dp230&lf;g3&lf;(F-1.9878466759146967e-16&lf;F-4.770832022195275e-15&lf;F-3.1805546814635168e-15&lf;tp231&lf;sg5&lf;(F-24.320337470574643&lf;F-0.0002950651889577216&lf;F0.0003046297929785169&lf;tp232&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp233&lf;ssVthumb_03_l&lf;p234&lf;(dp235&lf;g3&lf;(F-3.416611474228386e-17&lf;F-4.7366659074529904e-17&lf;F-4.246498636292382e-20&lf;tp236&lf;sg5&lf;(F2.5261795391662645&lf;F3.552713678800501e-14&lf;F-4.263256414560601e-14&lf;tp237&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp238&lf;ssVhand_l&lf;p239&lf;(dp240&lf;g3&lf;(F-6.6592863643142385e-15&lf;F-3.1805546814635168e-15&lf;F-3.1805546814635164e-15&lf;tp241&lf;sg5&lf;(F24.32004358863988&lf;F0.0&lf;F1.4210854715202004e-14&lf;tp242&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp243&lf;ssVthumb_03_r&lf;p244&lf;(dp245&lf;g3&lf;(F-2.174207301781701e-17&lf;F-2.348920388532016e-17&lf;F-4.770874487181638e-15&lf;tp246&lf;sg5&lf;(F-2.526164976356057&lf;F-4.6664516247574284e-05&lf;F7.370655225713563e-06&lf;tp247&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp248&lf;ssVupperarm_twistCor_01_l&lf;p249&lf;(dp250&lf;g3&lf;(F-5.7155154111593384e-05&lf;F0.23929738046885052&lf;F-0.013684890989412526&lf;tp251&lf;sg5&lf;(F-0.22347730841758562&lf;F0.09633378358038591&lf;F0.16651206011033537&lf;tp252&lf;sg7&lf;(F0.9999999999999999&lf;F1.0&lf;F0.9999999999999999&lf;tp253&lf;ssVthigh_bck_lwr_r&lf;p254&lf;(dp255&lf;g3&lf;(F-2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp256&lf;sg5&lf;(F5.844458568800249&lf;F-10.021941949068122&lf;F-1.8531909603709966&lf;tp257&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp258&lf;ssVupperarm_in_r&lf;p259&lf;(dp260&lf;g3&lf;(F-4.0183257565534246e-10&lf;F-4.683048712998474e-10&lf;F-3.3057467384465757e-10&lf;tp261&lf;sg5&lf;(F-5.2225564187980495&lf;F1.2711843167447734&lf;F3.8834782317378966&lf;tp262&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp263&lf;ssVlowerarm_fwd_r&lf;p264&lf;(dp265&lf;g3&lf;(F2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp266&lf;sg5&lf;(F-1.3920519520020491&lf;F2.2598182327670386&lf;F-0.5667739685873983&lf;tp267&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp268&lf;ssVlowerarm_out_r&lf;p269&lf;(dp270&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp271&lf;sg5&lf;(F-0.6170078789895399&lf;F-1.280766963895374&lf;F-2.1175791102128443&lf;tp272&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp273&lf;ssVankle_bck_r&lf;p274&lf;(dp275&lf;g3&lf;(F-1.8803787149980595e-14&lf;F3.9756933518293936e-15&lf;F-1.1877383888590321e-14&lf;tp276&lf;sg5&lf;(F-0.6507357602611608&lf;F-3.799005098240129&lf;F0.5425226013393445&lf;tp277&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp278&lf;ssVupperarm_bck_r&lf;p279&lf;(dp280&lf;g3&lf;(F-1.631032968523696e-08&lf;F-1.793436243543718e-08&lf;F6.623600521598822e-09&lf;tp281&lf;sg5&lf;(F-1.613973273688245&lf;F-5.899539327146831&lf;F-0.6838130492740362&lf;tp282&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp283&lf;ssVupperarm_bck_l&lf;p284&lf;(dp285&lf;g3&lf;(F-1.631031696301823e-08&lf;F-1.7934362477562443e-08&lf;F6.623600333685193e-09&lf;tp286&lf;sg5&lf;(F1.453320472410553&lf;F5.922331709928633&lf;F0.5193119630590957&lf;tp287&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp288&lf;ssVankle_bck_l&lf;p289&lf;(dp290&lf;g3&lf;(F4.821925894076175e-14&lf;F4.709965190659037e-08&lf;F7.032007635867419e-15&lf;tp291&lf;sg5&lf;(F0.7196897359995171&lf;F3.149843256350702&lf;F-0.1865279959374142&lf;tp292&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp293&lf;ssVlowerarm_fwd_l&lf;p294&lf;(dp295&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp296&lf;sg5&lf;(F1.3286701233338505&lf;F-2.523348037160204&lf;F0.4477197471650243&lf;tp297&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp298&lf;ssVmiddle_01_r&lf;p299&lf;(dp300&lf;g3&lf;(F-2.3854160110976384e-15&lf;F5.665363026356887e-15&lf;F-1.8884543421189624e-14&lf;tp301&lf;sg5&lf;(F-5.182307875635303&lf;F1.2473883217012371e-05&lf;F4.441538994015559e-05&lf;tp302&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp303&lf;ssVcalf_twist_02_l&lf;p304&lf;(dp305&lf;g3&lf;(F-1.2813263656616176e-15&lf;F1.2695893467522358e-18&lf;F-7.368169808403853e-17&lf;tp306&lf;sg5&lf;(F-12.958133997348298&lf;F-0.13437907398599447&lf;F0.11553495636094979&lf;tp307&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp308&lf;ssVlowerarm_twist_01_r&lf;p309&lf;(dp310&lf;g3&lf;(F-1.6743337480238544e-18&lf;F-1.428764306601375e-15&lf;F-1.2424050610833987e-17&lf;tp311&lf;sg5&lf;(F-15.709295982891412&lf;F0.0653041102279559&lf;F0.03263931215387572&lf;tp312&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp313&lf;ssVspine_04_latissimus_r&lf;p314&lf;(dp315&lf;g3&lf;(F-2.1200329155989934e-09&lf;F-2.0738501467058974e-08&lf;F9.430233311509153e-09&lf;tp316&lf;sg5&lf;(F-7.8201672809249345&lf;F3.0343685369015496&lf;F11.943057680552283&lf;tp317&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp318&lf;ssVspine_04_latissimus_l&lf;p319&lf;(dp320&lf;g3&lf;(F5.5057566312661764e-09&lf;F1.6766699921248585e-08&lf;F7.858422271679882e-09&lf;tp321&lf;sg5&lf;(F-7.810114020338162&lf;F3.0346754472192004&lf;F-11.935268925526474&lf;tp322&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp323&lf;ssVlowerarm_twist_01_l&lf;p324&lf;(dp325&lf;g3&lf;(F2.0627063804459095e-16&lf;F1.0062276329226985e-15&lf;F-1.2320628108123222e-17&lf;tp326&lf;sg5&lf;(F15.709011726426546&lf;F-0.06554904986637666&lf;F-0.03229837036940353&lf;tp327&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp328&lf;ssVcalf_twist_02_r&lf;p329&lf;(dp330&lf;g3&lf;(F-1.0969433948738022e-15&lf;F-1.1337156085782787e-17&lf;F-7.38058228600257e-17&lf;tp331&lf;sg5&lf;(F12.958172261711361&lf;F0.13438813926951898&lf;F-0.11546192380812315&lf;tp332&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp333&lf;ssVmiddle_01_l&lf;p334&lf;(dp335&lf;g3&lf;(F-1.5902773407317584e-15&lf;F-2.087239009710433e-15&lf;F2.8966260080954173e-32&lf;tp336&lf;sg5&lf;(F5.182243307643894&lf;F4.263256414560601e-14&lf;F-2.4868995751603507e-14&lf;tp337&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp338&lf;ssVcalf_knee_r&lf;p339&lf;(dp340&lf;g3&lf;(F-9.373939481779854e-15&lf;F-6.433371167720549e-09&lf;F1.1927080056014457e-14&lf;tp341&lf;sg5&lf;(F-0.04499406685729923&lf;F4.304237479045141&lf;F-0.11863616250326992&lf;tp342&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp343&lf;ssVclavicle_scap_r&lf;p344&lf;(dp345&lf;g3&lf;(F-7.2333774824279544e-12&lf;F-5.447464020267169e-09&lf;F2.099599539267737e-08&lf;tp346&lf;sg5&lf;(F-8.497017971073436&lf;F-5.6879741751418536&lf;F2.203234247844506&lf;tp347&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp348&lf;ssVclavicle_pec_l&lf;p349&lf;(dp350&lf;g3&lf;(F5.934906090541604e-09&lf;F-4.328964219255888e-09&lf;F-6.3721458878959175e-09&lf;tp351&lf;sg5&lf;(F-7.859747892191649&lf;F-9.235935633950017&lf;F-9.161680251024567&lf;tp352&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp353&lf;ssVcalf_knee_l&lf;p354&lf;(dp355&lf;g3&lf;(F1.1771779534322956e-14&lf;F-6.4333697762278764e-09&lf;F-6.9574633663623315e-15&lf;tp356&lf;sg5&lf;(F0.04207871964077725&lf;F-4.30754958067433&lf;F0.1160674853346002&lf;tp357&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp358&lf;ssVclavicle_scap_l&lf;p359&lf;(dp360&lf;g3&lf;(F-2.0063835062731552e-11&lf;F-8.936741229731349e-09&lf;F2.0529569357960723e-08&lf;tp361&lf;sg5&lf;(F8.269065264677947&lf;F5.697957688764333&lf;F-2.2342434592936797&lf;tp362&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp363&lf;ssVfoot_r&lf;p364&lf;(dp365&lf;g3&lf;(F3.4942617350063054e-18&lf;F2.2716118211881422e-36&lf;F-7.449571893381498e-17&lf;tp366&lf;sg5&lf;(F38.8683479675059&lf;F4.218847493575595e-15&lf;F-1.7763568394002505e-15&lf;tp367&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp368&lf;ssVupperarm_in_l&lf;p369&lf;(dp370&lf;g3&lf;(F-4.0185802536309686e-10&lf;F-4.683430379560251e-10&lf;F-3.305746816879782e-10&lf;tp371&lf;sg5&lf;(F5.574552996471354&lf;F-1.4832878115397845&lf;F-4.299906325106548&lf;tp372&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp373&lf;ssVlowerarm_out_l&lf;p374&lf;(dp375&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp376&lf;sg5&lf;(F0.5829331297469622&lf;F0.9090844050165288&lf;F1.8502389625441538&lf;tp377&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp378&lf;ssVthumb_02_l&lf;p379&lf;(dp380&lf;g3&lf;(F6.0918383961604464e-33&lf;F7.299124513124281e-17&lf;F9.563794368712256e-15&lf;tp381&lf;sg5&lf;(F4.316671956003702&lf;F0.0&lf;F3.552713678800501e-14&lf;tp382&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp383&lf;ssVankle_fwd_l&lf;p384&lf;(dp385&lf;g3&lf;(F2.4532823392578864e-14&lf;F-3.8486528438178006e-08&lf;F-7.156248041532465e-15&lf;tp386&lf;sg5&lf;(F1.2908153718236504&lf;F-3.768957865912955&lf;F-0.07680916272578031&lf;tp387&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp388&lf;ssVthumb_02_r&lf;p389&lf;(dp390&lf;g3&lf;(F3.975693351829394e-16&lf;F-1.584065319869525e-15&lf;F1.2723383479765737e-14&lf;tp391&lf;sg5&lf;(F-4.316661343859899&lf;F-2.3635732418370026e-05&lf;F-4.3211523554020914e-05&lf;tp392&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp393&lf;ssVindex_metacarpal_l&lf;p394&lf;(dp395&lf;g3&lf;(F-4.708711813572941e-15&lf;F9.939233379573501e-17&lf;F2.4848083448933726e-15&lf;tp396&lf;sg5&lf;(F3.4579468886887668&lf;F0.010562601629231949&lf;F-1.5292670130053594&lf;tp397&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp398&lf;ssVlowerarm_in_l&lf;p399&lf;(dp400&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp401&lf;sg5&lf;(F1.3306420256329048&lf;F0.24547389055802427&lf;F-2.7035021548269356&lf;tp402&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp403&lf;ssVlowerarm_twist_02_r&lf;p404&lf;(dp405&lf;g3&lf;(F-6.721600698588516e-18&lf;F-5.715057220481254e-15&lf;F-3.2583346120769835e-23&lf;tp406&lf;sg5&lf;(F-7.8497274814736855&lf;F0.10257835424635431&lf;F0.03918630802392897&lf;tp407&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp408&lf;ssVcalf_twist_01_l&lf;p409&lf;(dp410&lf;g3&lf;(F-8.492997272584769e-20&lf;F-1.1848489498583718e-23&lf;F-7.454422664982217e-17&lf;tp411&lf;sg5&lf;(F-25.92498684096225&lf;F-0.08807316453161773&lf;F0.10071990957672128&lf;tp412&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp413&lf;ssVupperarm_r&lf;p414&lf;(dp415&lf;g3&lf;(F-1.0933156717530838e-15&lf;F1.2424041724466842e-17&lf;F-1.987846675914698e-15&lf;tp416&lf;sg5&lf;(F-14.246069020159924&lf;F-3.984049673277923e-06&lf;F-0.00038072217765261485&lf;tp417&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp418&lf;ssVcalf_twistCor_02_r&lf;p419&lf;(dp420&lf;g3&lf;(F7.504981906187296e-13&lf;F5.256448295143624e-18&lf;F5.706716964926347e-10&lf;tp421&lf;sg5&lf;(F-1.2789769243681803e-12&lf;F2.353672812205332e-14&lf;F0.0&lf;tp422&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp423&lf;ssVthigh_bck_l&lf;p424&lf;(dp425&lf;g3&lf;(F-3.3281960298549105e-10&lf;F7.492530405354367e-09&lf;F-1.1907707579416888e-10&lf;tp426&lf;sg5&lf;(F3.5690050994295888&lf;F10.405499415408876&lf;F2.1497621859770657&lf;tp427&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp428&lf;ssVindex_02_l&lf;p429&lf;(dp430&lf;g3&lf;(F-3.727212517340059e-17&lf;F3.8825130388958945e-18&lf;F-7.279711947929802e-20&lf;tp431&lf;sg5&lf;(F4.25400585260217&lf;F-2.842170943040401e-14&lf;F-7.105427357601002e-15&lf;tp432&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp433&lf;ssVthigh_bck_r&lf;p434&lf;(dp435&lf;g3&lf;(F4.547938750138404e-10&lf;F1.2473182494297477e-09&lf;F1.8459230383879978e-10&lf;tp436&lf;sg5&lf;(F-3.570662230365997&lf;F-10.412042020771928&lf;F-2.17580140441963&lf;tp437&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp438&lf;ssVindex_02_r&lf;p439&lf;(dp440&lf;g3&lf;(F-3.727212517340059e-17&lf;F3.1060104311167156e-18&lf;F-8.492997272584769e-20&lf;tp441&lf;sg5&lf;(F-4.254001839627506&lf;F2.1309285713755344e-05&lf;F8.939731338131196e-05&lf;tp442&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp443&lf;ssVneck_02&lf;p444&lf;(dp445&lf;g3&lf;(F-2.426570649309934e-19&lf;F-3.727212517340059e-17&lf;F2.84363747966008e-22&lf;tp446&lf;sg5&lf;(F5.450919182046334&lf;F1.4210854715202004e-14&lf;F1.3086753902769033e-14&lf;tp447&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp448&lf;ssVneck_01&lf;p449&lf;(dp450&lf;g3&lf;(F3.1060104311167156e-18&lf;F-1.941256519447947e-18&lf;F-9.541663760026802e-15&lf;tp451&lf;sg5&lf;(F11.10442132885018&lf;F1.4210854715202004e-14&lf;F1.2705114738054135e-14&lf;tp452&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp453&lf;ssVcalf_twist_01_r&lf;p454&lf;(dp455&lf;g3&lf;(F-6.066426623274834e-20&lf;F-1.2424077269935359e-17&lf;F-7.454424442255643e-17&lf;tp456&lf;sg5&lf;(F25.925076009789063&lf;F0.08808086210734589&lf;F-0.10067777201496497&lf;tp457&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp458&lf;ssVupperarm_l&lf;p459&lf;(dp460&lf;g3&lf;(F-3.578124016646457e-15&lf;F-7.454425034680119e-17&lf;F-3.975693351829396e-16&lf;tp461&lf;sg5&lf;(F14.246126391528867&lf;F3.9968028886505635e-15&lf;F-2.842170943040401e-14&lf;tp462&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp463&lf;ssVlowerarm_twist_02_l&lf;p464&lf;(dp465&lf;g3&lf;(F8.251007514582334e-16&lf;F4.01248648404208e-15&lf;F-4.9282568712817974e-17&lf;tp466&lf;sg5&lf;(F7.849649281922929&lf;F-0.10263520133286619&lf;F-0.039097261663499694&lf;tp467&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp468&lf;ssVhead&lf;p469&lf;(dp470&lf;g3&lf;(F-4.6590156466750695e-18&lf;F5.056973233161904e-17&lf;F1.113193759360567e-14&lf;tp471&lf;sg5&lf;(F5.366716115241388&lf;F-7.105427357601002e-15&lf;F3.309852392163748e-14&lf;tp472&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp473&lf;ssVthigh_twist_02_l&lf;p474&lf;(dp475&lf;g3&lf;(F-9.220968467377749e-16&lf;F-4.926728712348722e-17&lf;F2.279365015779531e-18&lf;tp476&lf;sg5&lf;(F-28.47903032534198&lf;F0.17386366818659837&lf;F0.0056687508871462455&lf;tp477&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp478&lf;ssVthigh_fwd_lwr_r&lf;p479&lf;(dp480&lf;g3&lf;(F-2.5444437451708134e-14&lf;F0.0&lf;F0.0&lf;tp481&lf;sg5&lf;(F-0.4782982245318834&lf;F6.809431755534755&lf;F-0.7662289287193396&lf;tp482&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp483&lf;ssVring_metacarpal_r&lf;p484&lf;(dp485&lf;g3&lf;(F-6.957463365701443e-16&lf;F4.969616689786745e-16&lf;F-3.1805546814635168e-15&lf;tp486&lf;sg5&lf;(F-2.804780390195006&lf;F-0.22716314349776212&lf;F-1.059677422149715&lf;tp487&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp488&lf;ssVpinky_03_l&lf;p489&lf;(dp490&lf;g3&lf;(F-1.1647539116687691e-18&lf;F3.7344922292879887e-17&lf;F-2.385414873642646e-15&lf;tp491&lf;sg5&lf;(F1.6696361810729314&lf;F-4.973799150320701e-14&lf;F7.105427357601002e-15&lf;tp492&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp493&lf;ssVlowerarm_r&lf;p494&lf;(dp495&lf;g3&lf;(F-1.1181637552020177e-16&lf;F1.2734642767578534e-16&lf;F1.2132853246549658e-19&lf;tp496&lf;sg5&lf;(F-25.246899842795102&lf;F2.8223703232299613e-05&lf;F-0.0003521030096464983&lf;tp497&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp498&lf;ssVpinky_01_r&lf;p499&lf;(dp500&lf;g3&lf;(F1.7393658414253607e-16&lf;F-1.8636062586700284e-17&lf;F-6.359944609015365e-15&lf;tp501&lf;sg5&lf;(F-4.397007478658836&lf;F-4.320010107505823e-05&lf;F-2.742241442632576e-05&lf;tp502&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp503&lf;ssVthigh_twist_01_r&lf;p504&lf;(dp505&lf;g3&lf;(F-2.4265706493099345e-18&lf;F-4.9695017594386094e-17&lf;F1.2430155545048131e-17&lf;tp506&lf;sg5&lf;(F14.287114027195173&lf;F-0.2111677104455696&lf;F-0.0656104539200193&lf;tp507&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp508&lf;ssVclavicle_pec_r&lf;p509&lf;(dp510&lf;g3&lf;(F9.293300890747829e-09&lf;F-5.707670764203161e-09&lf;F-6.492766834151767e-09&lf;tp511&lf;sg5&lf;(F-7.865587754738414&lf;F-9.462906268526464&lf;F9.48653599414189&lf;tp512&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp513&lf;ssVpinky_01_l&lf;p514&lf;(dp515&lf;g3&lf;(F2.4848083448933823e-17&lf;F-1.0094533901129326e-15&lf;F-1.113038837990675e-14&lf;tp516&lf;sg5&lf;(F4.3969685310509234&lf;F-1.4210854715202004e-14&lf;F-6.039613253960852e-14&lf;tp517&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp518&lf;ssVthigh_twist_01_l&lf;p519&lf;(dp520&lf;g3&lf;(F-2.4209895368165213e-16&lf;F-4.9583558853672917e-17&lf;F6.810511763785889e-18&lf;tp521&lf;sg5&lf;(F-14.287183632223432&lf;F0.21116362092060248&lf;F0.06561795810833893&lf;tp522&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp523&lf;ssVlowerarm_l&lf;p524&lf;(dp525&lf;g3&lf;(F-7.454425034680117e-17&lf;F8.386228164015132e-17&lf;F7.279711947929797e-20&lf;tp526&lf;sg5&lf;(F25.247300689778797&lf;F-5.329070518200751e-15&lf;F-4.263256414560601e-14&lf;tp527&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp528&lf;ssVpinky_03_r&lf;p529&lf;(dp530&lf;g3&lf;(F3.8825130388958945e-19&lf;F1.2436174577713411e-17&lf;F3.791516639546773e-22&lf;tp531&lf;sg5&lf;(F-1.669605250518572&lf;F-8.182164268788483e-05&lf;F-2.731165606206787e-05&lf;tp532&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp533&lf;ssVthigh_fwd_lwr_l&lf;p534&lf;(dp535&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp536&lf;sg5&lf;(F0.39812935021383566&lf;F-7.309934383244445&lf;F0.6883540989376549&lf;tp537&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp538&lf;ssVring_metacarpal_l&lf;p539&lf;(dp540&lf;g3&lf;(F1.2827915178708273e-31&lf;F-6.1623246953355635e-15&lf;F-2.3854160110976376e-15&lf;tp541&lf;sg5&lf;(F2.8047746330326007&lf;F0.22714913893837263&lf;F1.0596930230372124&lf;tp542&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp543&lf;ssVlowerarm_bck_r&lf;p544&lf;(dp545&lf;g3&lf;(F2.5444437451708134e-14&lf;F1.821991149690184e-07&lf;F7.600179899673703e-23&lf;tp546&lf;sg5&lf;(F-1.5862762297890214&lf;F-3.40166381371057&lf;F0.8892462340683522&lf;tp547&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp548&lf;ssVlowerarm_correctiveRoot_l&lf;p549&lf;(dp550&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp551&lf;sg5&lf;(F-3.552713678800501e-14&lf;F0.0&lf;F-5.684341886080802e-14&lf;tp552&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp553&lf;ssVpinky_02_l&lf;p554&lf;(dp555&lf;g3&lf;(F1.8636062586700294e-17&lf;F-7.76502607779179e-18&lf;F1.2722218725854067e-14&lf;tp556&lf;sg5&lf;(F2.6964561558300915&lf;F2.842170943040401e-14&lf;F3.552713678800501e-15&lf;tp557&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp558&lf;ssVcalf_twistCor_02_l&lf;p559&lf;(dp560&lf;g3&lf;(F7.786203609148045e-13&lf;F2.2381283947562397e-18&lf;F5.706716775610707e-10&lf;tp561&lf;sg5&lf;(F1.2931877790833823e-12&lf;F-2.3092638912203256e-14&lf;F-5.329070518200751e-15&lf;tp562&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp563&lf;ssVlowerarm_correctiveRoot_r&lf;p564&lf;(dp565&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp566&lf;sg5&lf;(F3.552713678800501e-14&lf;F0.0&lf;F-1.4210854715202004e-14&lf;tp567&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp568&lf;ssVpelvis&lf;p569&lf;(dp570&lf;g3&lf;(F-8.746525374024675e-15&lf;F1.9369081048443843e-14&lf;F-8.348956038841735e-15&lf;tp571&lf;sg5&lf;(F0.00010491341864091094&lf;F-2.2175793100900107&lf;F91.97877241348029&lf;tp572&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp573&lf;ssVlowerarm_bck_l&lf;p574&lf;(dp575&lf;g3&lf;(F0.0&lf;F1.821991149690184e-07&lf;F0.0&lf;tp576&lf;sg5&lf;(F1.3859786452671514&lf;F3.3413824665105096&lf;F-1.1761296577728615&lf;tp577&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp578&lf;ssVthigh_in_r&lf;p579&lf;(dp580&lf;g3&lf;(F-1.799777415242335e-11&lf;F1.7811260677643742e-08&lf;F-1.1301263803149778e-08&lf;tp581&lf;sg5&lf;(F9.68590753589298&lf;F0.7278592457790922&lf;F-8.591039347640994&lf;tp582&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp583&lf;ssVindex_01_l&lf;p584&lf;(dp585&lf;g3&lf;(F5.367186024969684e-15&lf;F-1.5902773407317588e-15&lf;F9.442271710594815e-15&lf;tp586&lf;sg5&lf;(F5.011096571254832&lf;F-4.263256414560601e-14&lf;F-3.552713678800501e-14&lf;tp587&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp588&lf;ssVupperarm_tricep_r&lf;p589&lf;(dp590&lf;g3&lf;(F3.7924387363587275e-14&lf;F6.075963094069785e-09&lf;F-6.5598940285076466e-15&lf;tp591&lf;sg5&lf;(F-0.2668024100145914&lf;F-4.4614700865646535&lf;F-0.06149644816963473&lf;tp592&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp593&lf;ssVthigh_twistCor_02_l&lf;p594&lf;(dp595&lf;g3&lf;(F-9.700266400628902e-13&lf;F4.420414151584964e-17&lf;F-1.9859764446290498e-10&lf;tp596&lf;sg5&lf;(F6.039613253960852e-13&lf;F1.8474111129762605e-13&lf;F-7.105427357601002e-15&lf;tp597&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp598&lf;ssVindex_03_r&lf;p599&lf;(dp600&lf;g3&lf;(F-4.549819967456126e-21&lf;F1.849846171874749e-40&lf;F4.659014165613886e-18&lf;tp601&lf;sg5&lf;(F-2.317379606058509&lf;F-3.482151544176304e-05&lf;F-1.4542190249322573e-05&lf;tp602&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp603&lf;ssVwrist_outer_r&lf;p604&lf;(dp605&lf;g3&lf;(F-2.5456861493432594e-14&lf;F-3.379339349054985e-15&lf;F3.1805546814635168e-15&lf;tp606&lf;sg5&lf;(F-0.03274741621405042&lf;F1.6563393407212317&lf;F0.025852490706835596&lf;tp607&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp608&lf;ssVwrist_outer_l&lf;p609&lf;(dp610&lf;g3&lf;(F-5.783391422739323e-14&lf;F9.34287937679908e-15&lf;F4.373262687012329e-15&lf;tp611&lf;sg5&lf;(F-0.03377910590610611&lf;F-1.4964501513575073&lf;F-0.18007976338952147&lf;tp612&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp613&lf;ssVpinky_metacarpal_r&lf;p614&lf;(dp615&lf;g3&lf;(F1.3914926731402885e-14&lf;F-1.5902773407317588e-15&lf;F1.5902773407317582e-15&lf;tp616&lf;sg5&lf;(F-2.558789946909897&lf;F-0.5003207482651391&lf;F-2.0640128067549632&lf;tp617&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp618&lf;ssVupperarm_tricep_l&lf;p619&lf;(dp620&lf;g3&lf;(F1.2424042072290844e-17&lf;F6.0759658770551315e-09&lf;F6.5598940305191614e-15&lf;tp621&lf;sg5&lf;(F0.11027252258691078&lf;F4.4684969383725015&lf;F-0.13297608266564964&lf;tp622&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp623&lf;ssVthigh_twistCor_02_r&lf;p624&lf;(dp625&lf;g3&lf;(F-9.971666437558038e-13&lf;F7.130715464304176e-18&lf;F-1.9859764570803904e-10&lf;tp626&lf;sg5&lf;(F-6.252776074688882e-13&lf;F-1.829647544582258e-13&lf;F7.105427357601002e-15&lf;tp627&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp628&lf;ssVindex_01_r&lf;p629&lf;(dp630&lf;g3&lf;(F-1.987846675914698e-16&lf;F-1.7241821476758432e-34&lf;F-9.93923337957349e-17&lf;tp631&lf;sg5&lf;(F-5.011125795495047&lf;F1.255617310391699e-05&lf;F-3.957483904848402e-05&lf;tp632&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp633&lf;ssVthigh_in_l&lf;p634&lf;(dp635&lf;g3&lf;(F7.81972953015046e-10&lf;F1.783717115280913e-08&lf;F2.898665566940874e-09&lf;tp636&lf;sg5&lf;(F-9.624813217005851&lf;F-0.7872489589315337&lf;F8.569114048741081&lf;tp637&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp638&lf;ssVmiddle_metacarpal_l&lf;p639&lf;(dp640&lf;g3&lf;(F5.168401357378214e-15&lf;F4.721135855297406e-15&lf;F6.162324695335562e-15&lf;tp641&lf;sg5&lf;(F2.9473948030703525&lf;F-1.4210854715202004e-14&lf;F2.4868995751603507e-14&lf;tp642&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp643&lf;ssVring_01_r&lf;p644&lf;(dp645&lf;g3&lf;(F3.7272125173400585e-16&lf;F-9.939233379573484e-17&lf;F-1.90833280887811e-14&lf;tp646&lf;sg5&lf;(F-4.653074699202811&lf;F-2.4532645610975123e-05&lf;F5.51067713736586e-05&lf;tp647&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp648&lf;ssVupperarm_correctiveRoot_r&lf;p649&lf;(dp650&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp651&lf;sg5&lf;(F1.4210854715202004e-14&lf;F-4.440892098500626e-15&lf;F2.842170943040401e-14&lf;tp652&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp653&lf;ssVcalf_kneeBack_l&lf;p654&lf;(dp655&lf;g3&lf;(F8.63470899849898e-15&lf;F-9.039156283186074e-11&lf;F6.957463365694632e-15&lf;tp656&lf;sg5&lf;(F0.2417278422375233&lf;F4.878562416091983&lf;F0.29022114718005376&lf;tp657&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp658&lf;ssVcalf_kneeBack_r&lf;p659&lf;(dp660&lf;g3&lf;(F-2.35124989635446e-14&lf;F-9.039096647785796e-11&lf;F-1.1330726052695231e-14&lf;tp661&lf;sg5&lf;(F-0.2449349235955367&lf;F-4.883272954147831&lf;F-0.3136576664737962&lf;tp662&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp663&lf;ssVring_01_l&lf;p664&lf;(dp665&lf;g3&lf;(F3.354491265606054e-16&lf;F-3.975693351829396e-16&lf;F-1.9084881093996662e-14&lf;tp666&lf;sg5&lf;(F4.653086398712624&lf;F4.263256414560601e-14&lf;F-1.0658141036401503e-14&lf;tp667&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp668&lf;ssVupperarm_correctiveRoot_l&lf;p669&lf;(dp670&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp671&lf;sg5&lf;(F2.842170943040401e-14&lf;F0.0&lf;F1.4210854715202004e-14&lf;tp672&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp673&lf;ssVmiddle_metacarpal_r&lf;p674&lf;(dp675&lf;g3&lf;(F2.5842006786891076e-15&lf;F3.0811623476677818e-15&lf;F4.721135855297408e-15&lf;tp676&lf;sg5&lf;(F-2.9473407769463975&lf;F-3.6594834583070224e-05&lf;F5.6656297143575785e-05&lf;tp677&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp678&lf;ssVthigh_twist_02_r&lf;p679&lf;(dp680&lf;g3&lf;(F7.939739164542105e-16&lf;F-5.006542507309081e-17&lf;F1.0461552711837454e-17&lf;tp681&lf;sg5&lf;(F28.47895122626658&lf;F-0.17387919837305565&lf;F-0.005720635786287787&lf;tp682&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp683&lf;ssVring_03_r&lf;p684&lf;(dp685&lf;g3&lf;(F-3.1060104311167156e-18&lf;F-1.9897879324341458e-16&lf;F-4.2464986362923846e-20&lf;tp686&lf;sg5&lf;(F-3.0146802324974686&lf;F-4.5867904766794254e-05&lf;F6.070594956142372e-05&lf;tp687&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp688&lf;ssVupperarm_fwd_r&lf;p689&lf;(dp690&lf;g3&lf;(F2.5414619751459016e-11&lf;F-1.8553765734468644e-11&lf;F6.818250487293744e-10&lf;tp691&lf;sg5&lf;(F-3.1383986238786576&lf;F6.085192473500279&lf;F0.3701752564989107&lf;tp692&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp693&lf;ssVcalf_r&lf;p694&lf;(dp695&lf;g3&lf;(F7.765026077791785e-19&lf;F-7.453211749355463e-17&lf;F5.963577942910489e-16&lf;tp696&lf;sg5&lf;(F42.6392716823317&lf;F-1.7763568394002505e-15&lf;F1.2434497875801753e-14&lf;tp697&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp698&lf;ssVupperarm_twistCor_02_r&lf;p699&lf;(dp700&lf;g3&lf;(F-5.7155154104789345e-05&lf;F0.2392973804678591&lf;F-0.01368489098937418&lf;tp701&lf;sg5&lf;(F-4.263256414560601e-14&lf;F7.105427357601002e-15&lf;F5.684341886080802e-14&lf;tp702&lf;sg7&lf;(F0.9999999999999997&lf;F1.0&lf;F0.9999999999999998&lf;tp703&lf;ssVmiddle_02_r&lf;p704&lf;(dp705&lf;g3&lf;(F-7.45442503468011e-17&lf;F4.080521203879585e-16&lf;F2.2263640113179687e-14&lf;tp706&lf;sg5&lf;(F-4.584910207198277&lf;F-3.1438676543871225e-05&lf;F-3.066261484363508e-05&lf;tp707&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp708&lf;ssVpinky_metacarpal_l&lf;p709&lf;(dp710&lf;g3&lf;(F-3.180554681463515e-15&lf;F1.3318572728628474e-14&lf;F3.180554681463515e-15&lf;tp711&lf;sg5&lf;(F2.558828022670248&lf;F0.5003618244700903&lf;F2.064049345253842&lf;tp712&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp713&lf;ssVthigh_r&lf;p714&lf;(dp715&lf;g3&lf;(F-3.620782510119271e-33&lf;F-2.3854160110976376e-15&lf;F1.7393658414253607e-16&lf;tp716&lf;sg5&lf;(F-3.012337184531063&lf;F-0.06336612202783964&lf;F10.395765560224552&lf;tp717&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp718&lf;ssVmiddle_02_l&lf;p719&lf;(dp720&lf;g3&lf;(F-8.696829207126799e-17&lf;F4.158171464657503e-16&lf;F1.9082854907504484e-14&lf;tp721&lf;sg5&lf;(F4.58496782082122&lf;F-1.4210854715202004e-14&lf;F-2.842170943040401e-14&lf;tp722&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp723&lf;ssVpinky_02_r&lf;p724&lf;(dp725&lf;g3&lf;(F1.2424041724466862e-17&lf;F-7.765026077791789e-17&lf;F-9.706282597239736e-20&lf;tp726&lf;sg5&lf;(F-2.696477533033118&lf;F3.068206100920179e-05&lf;F5.3911045487353704e-05&lf;tp727&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp728&lf;ssVupperarm_twistCor_02_l&lf;p729&lf;(dp730&lf;g3&lf;(F-5.715515410377221e-05&lf;F0.23929738046881302&lf;F-0.013684890989438625&lf;tp731&lf;sg5&lf;(F8.526512829121202e-14&lf;F7.105427357601002e-15&lf;F-4.263256414560601e-14&lf;tp732&lf;sg7&lf;(F0.9999999999999999&lf;F1.0&lf;F0.9999999999999999&lf;tp733&lf;ssVcalf_l&lf;p734&lf;(dp735&lf;g3&lf;(F2.717759127227125e-18&lf;F-7.451998464030805e-17&lf;F5.963555193810652e-16&lf;tp736&lf;sg5&lf;(F-42.63936190162267&lf;F-7.829074149423576e-06&lf;F-4.4586872256502375e-05&lf;tp737&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp738&lf;ssVring_03_l&lf;p739&lf;(dp740&lf;g3&lf;(F0.0&lf;F0.0&lf;F0.0&lf;tp741&lf;sg5&lf;(F3.0147511882823608&lf;F-4.973799150320701e-14&lf;F-1.0658141036401503e-14&lf;tp742&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp743&lf;ssVupperarm_fwd_l&lf;p744&lf;(dp745&lf;g3&lf;(F2.5408755603765092e-11&lf;F-1.8548994902446404e-11&lf;F6.818210730360224e-10&lf;tp746&lf;sg5&lf;(F2.998532437400442&lf;F-6.078429423751953&lf;F-0.5550002675375794&lf;tp747&lf;sg7&lf;(F1.0&lf;F1.0&lf;F1.0&lf;tp748&lf;ss.");
	setAttr ".fbxID" 2;
createNode joint -n "pelvis" -p "|Quinn|root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.6435803111873939e-021 -2.3794624805450439 98.693222045898438 ;
	setAttr ".r" -type "double3" -90.000000000000199 -86.397351007170869 90.000000000000412 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1.0000000000000004 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.99802400000000002 -0.062836699999999995 0 0 -0.062836699999999995 -0.99802400000000002 0
		 -1 0 0 0 0 98.693222000000006 2.3794620000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_01" -p "|Quinn|root|pelvis";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.4718530178070068 7.4249939530091069e-011 7.0516366361647359e-016 ;
	setAttr ".r" -type "double3" 9.8812894210232921e-005 -3.0332133116374176e-021 -17.246748106522677 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.97177999999999998 0.23588999999999999 0 -1.72461e-006 0.23588999999999999 -0.97177999999999998 0
		 -1 -4.0681900000000001e-007 1.67594e-006 0 0 101.16019 2.2241390000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_02" -p "|Quinn|root|pelvis|spine_01";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.987513542175293 -1.5134915543058014e-010 2.0640498858692791e-017 ;
	setAttr ".r" -type "double3" -0.00015024847762012511 1.174267408677568e-005 6.8250141674364917 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.99292599999999998 0.11873499999999999 0 9.0994100000000003e-007 0.11873499999999999 -0.99292599999999998 0
		 -1 1.08042e-007 -9.0350400000000002e-007 0 0 106.006955 3.4006449999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_03" -p "|Quinn|root|pelvis|spine_01|spine_02";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 7.6258835792541504 -6.5896621492811391e-010 2.2933603394158578e-015 ;
	setAttr ".r" -type "double3" 0.00019582582638155986 -9.340980007714823e-006 10.321205436521648 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.99813300000000005 -0.061085500000000001 0 -2.5225899999999999e-006 -0.061085500000000001 -0.99813300000000005 0
		 -1 1.54094e-007 2.5178799999999999e-006 0 0 113.57889299999999 4.3061020000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_04" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 8.8511152267456055 -4.1083119128870749e-009 1.560869624739683e-014 ;
	setAttr ".r" -type "double3" 0.00020316379146831617 2.1309992596476027e-005 8.4785796171651313 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 0.97821800000000003 -0.20758199999999999 0 -6.0409e-006 -0.20758199999999999 -0.97821800000000003 0
		 -1 1.2539800000000001e-006 5.9093100000000002e-006 0 0 122.413479 3.7654269999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_05" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 17.498758316040039 2.1512569503556733e-009 -5.0903291998194433e-016 ;
	setAttr ".r" -type "double3" -0.00022273812462562028 -9.4787915988669323e-023 0.25847918164930622 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -2.7252199999999999e-008 0.977271 -0.21199299999999999 0
		 -2.1533199999999999e-006 -0.21199299999999999 -0.977271 0 -1 4.2985600000000001e-007 2.1101599999999999e-006 0
		 0 139.53107199999999 0.132997 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "neck_01" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 11.915043830871582 1.576496799771121e-008 7.4958973490107939e-014 ;
	setAttr ".r" -type "double3" 1.8949480765987697e-005 -5.2403140924599043e-005 -25.134380877474733 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -2.46718e-008 0.97477999999999998 0.22316800000000001 0
		 -2.2917399999999998e-006 0.22316800000000001 -0.97477999999999998 0 -1 -5.3549300000000002e-007 2.2284300000000001e-006 0
		 -3.2471e-007 151.17530099999999 -2.3929109999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "neck_02" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.8488359451293945 -1.5143690745844651e-008 5.7679555576228836e-017 ;
	setAttr ".r" -type "double3" -0.00047322388824942897 1.3771594957842295e-006 0.603987832158143 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -2.4792499999999998e-008 0.977078 0.21288099999999999 0
		 5.96796e-006 0.21288099999999999 -0.977078 0 -1 1.2462400000000001e-006 -5.8364499999999998e-006 0
		 -4.6901100000000002e-007 156.87662800000001 -1.0876349999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "head" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01|neck_02";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.7584848403930664 -4.5170800433425029e-008 9.0698932739274873e-016 ;
	setAttr ".r" -type "double3" 0.00033440372860465034 -7.1404242095122631e-005 12.291212305152229 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0 1 0 0 0 0 -1 0 -1 0 0 0 -6.1177899999999996e-007 162.503119 0.138235 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.8308753967285156 1.0048158168792725 -0.93136221170425415 ;
	setAttr ".r" -type "double3" 168.95365297185563 81.648336872022014 156.7853698608553 ;
	setAttr ".s" -type "double3" 0.99999999999999978 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.98939500000000002 -0.142592 -0.027655699999999998 0
		 -0.027832099999999999 0.00075738200000000002 -0.99961199999999995 0 0.14255799999999999 0.98978100000000002 -0.0032192900000000001 0
		 0.93135999999999997 145.01640399999999 -2.0850879999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 15.286093711853027 -4.9737991503207013e-014 5.6843418860808015e-014 ;
	setAttr ".r" -type "double3" -4.5809595688709104 44.675542396438779 -3.6140379164620295 ;
	setAttr ".s" -type "double3" 0.99999999999999922 0.99999999999999956 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60317600000000005 -0.79713599999999996 0.0274434 0
		 -0.0291639 -0.056425700000000002 -0.99798100000000001 0 0.79707499999999998 0.60115799999999997 -0.057282199999999998 0
		 16.055346 142.83672899999999 -2.5078360000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 27.090353012084961 1.5099033134902129e-014 -2.8421709430404007e-014 ;
	setAttr ".r" -type "double3" 0 0 -36.700415987379365 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50103799999999998 -0.60539900000000002 0.61842799999999998 0
		 0.337094 -0.52163400000000004 -0.78375099999999998 0 0.79707499999999998 0.60115799999999997 -0.057282199999999998 0
		 32.395592999999998 121.242034 -1.764384 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_02_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 8.6983861923217773 2.8421709430404007e-014 -1.4210854715202004e-014 ;
	setAttr ".r" -type "double3" 0.14286657397097186 -0.19199482366530793 0.066859810526319716 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50409899999999996 -0.603989 0.617317 0 0.33849099999999999 -0.51942100000000002 -0.78461800000000004 0
		 0.79454899999999995 0.60448199999999996 -0.057394899999999999 0 36.753816999999998 115.976039 3.614938 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_01_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 17.396772384643555 -7.1054273576010019e-015 2.8421709430404007e-014 ;
	setAttr ".r" -type "double3" 0.14286657840378938 -0.19198717974961288 0.066859826719066234 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50409899999999996 -0.60399000000000003 0.617317 0
		 0.33849099999999999 -0.51942100000000002 -0.78461800000000004 0 0.79454899999999995 0.60448199999999996 -0.057394800000000003 0
		 41.112042000000002 110.71004499999999 8.9942600000000006 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_correctiveRoot_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.2632564145606011e-014 7.1054273576010019e-015 0 ;
	setAttr ".r" -type "double3" 0.14312404358245595 -0.24927142973289015 0 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50450099999999998 -0.60277800000000004 0.61817299999999997 0
		 0.33907799999999999 -0.52012400000000003 -0.78389900000000001 0 0.79404300000000005 0.60508700000000004 -0.058014200000000002 0
		 32.395592999999998 121.242034 -1.764384 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_in_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.427778959274292 0.26339352130889893 -2.9008581638336182 ;
	setAttr ".r" -type "double3" 180 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50450099999999998 -0.60277800000000004 0.61817299999999997 0
		 -0.33907799999999999 0.52012400000000003 0.78389900000000001 0 -0.79404300000000005 -0.60508700000000004 0.058014200000000002 0
		 30.901814000000002 118.489132 -0.91995300000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_out_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.62548738718032837 0.97544765472412109 1.9853060245513916 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50450099999999998 -0.60277800000000004 0.61817299999999997 0
		 0.33907799999999999 -0.52012400000000003 -0.78389900000000001 0 0.79404300000000005 0.60508700000000004 -0.058014200000000002 0
		 34.618322999999997 121.558933 -2.2575530000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_fwd_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.4256632328033447 -2.707552433013916 0.48040297627449036 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50450099999999998 -0.60277800000000004 0.61817299999999997 0
		 0.79404300000000005 0.60508700000000004 -0.058014200000000002 0 -0.33907799999999999 0.52012400000000003 0.78389900000000001 0
		 32.578229999999998 122.08162299999999 1.2114990000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_bck_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.4871551990509033 3.5853035449981689 -1.2619874477386475 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50450099999999998 -0.60277800000000004 0.61817299999999997 0
		 -0.79404300000000005 -0.60508700000000004 0.058014200000000002 0 0.33907799999999999 -0.52012400000000003 -0.78389900000000001 0
		 33.359490999999998 117.717196 -3.5823670000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "hand_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 26.095159530639648 1.4210854715202004e-014 2.8421709430404007e-014 ;
	setAttr ".r" -type "double3" -72.649020017143457 10.438206921770172 3.7480588003257802 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999944 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.368954 -0.73655599999999999 0.56688499999999997 0
		 -0.74793699999999996 -0.59737099999999999 -0.28937600000000002 0 0.55178199999999999 -0.31722800000000001 -0.77129999999999999 0
		 45.470267999999997 105.44405 14.373582000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_metacarpal_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.1166257858276367 -0.067716322839260101 -0.36451041698455811 ;
	setAttr ".r" -type "double3" 0.17325280972623608 -2.0095534662863019 -7.1627766956724717 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.47839999999999999 -0.66704300000000005 0.57112799999999997 0
		 -0.69447400000000004 -0.68543500000000002 -0.21882599999999999 0 0.53743799999999997 -0.29194700000000001 -0.79115599999999997 0
		 46.469675000000002 103.30456599999999 16.441092999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_01_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.560546875 5.6843418860808015e-014 -2.1316282072803006e-014 ;
	setAttr ".r" -type "double3" -3.6730637845344645 -4.2858601894917054 24.041609185493812 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.19370299999999999 -0.90775600000000001 0.37209799999999998 0
		 -0.86102199999999995 -0.33909499999999998 -0.37902000000000002 0 0.47023399999999999 -0.24696699999999999 -0.84728199999999998 0
		 49.129840000000002 99.595443000000003 19.616878 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_02_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.919670581817627 0 -4.6185277824406512e-014 ;
	setAttr ".r" -type "double3" 0.091920208090801175 0.47605626610472823 19.152857815306415 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.10341400000000001 -0.96667700000000001 0.234181 0
		 -0.87615900000000002 -0.022908600000000001 -0.48147699999999999 0 0.47079799999999999 -0.25497199999999998 -0.84459399999999996 0
		 50.082796999999999 95.129580000000004 21.447479999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_03_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l|middle_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.9020519256591797 -6.3948846218409017e-014 -1.0658141036401503e-014 ;
	setAttr ".r" -type "double3" -0.010883744676917736 -0.21859978126610352 2.8503214688172114 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.14505799999999999 -0.96758599999999995 0.20672499999999999 0
		 -0.87002199999999996 0.0252374 -0.49236600000000003 0 0.47118900000000002 -0.25127699999999997 -0.84548199999999996 0
		 49.782682999999999 92.324233000000007 22.127085000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_metacarpal_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.9831223487854004 0.24203738570213318 1.9275012016296387 ;
	setAttr ".r" -type "double3" -25.373373080934769 -21.620639643750227 9.1694232541789038 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.43112 -0.88136700000000001 0.19320499999999999 0
		 -0.90139400000000003 -0.43026300000000001 0.0486001 0 0.040294499999999997 -0.195107 -0.97995399999999999 0
		 47.453431999999999 102.49077 14.507949 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_01_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.7179470062255859 -2.8421709430404007e-014 -2.8421709430404007e-014 ;
	setAttr ".r" -type "double3" 0.26538035456964859 1.1126126272551744 11.738438100862078 ;
	setAttr ".s" -type "double3" 0.99999999999999978 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.23789299999999999 -0.94650100000000004 0.21804299999999999 0
		 -0.97003399999999995 -0.24294199999999999 0.00375699 0 0.049415800000000003 -0.21240300000000001 -0.97593200000000002 0
		 49.487434 98.332527999999996 15.419480999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_02_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.8932974338531494 7.1054273576010019e-014 -3.5527136788005009e-014 ;
	setAttr ".r" -type "double3" -0.10148181421340575 -0.18573522121583416 20.297180049109812 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.11321199999999999 -0.97268699999999997 0.20264199999999999 0
		 -0.99240899999999999 0.100845 -0.070383200000000007 0 0.048025400000000003 -0.20907200000000001 -0.97672000000000003 0
		 50.175728999999997 95.594019000000003 16.050343000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_03_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l|pinky_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.7915196418762207 -1.2079226507921703e-013 7.1054273576010019e-015 ;
	setAttr ".r" -type "double3" -0.005286173405561102 -0.083787899462276424 3.2540501701083291 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.169292 -0.96569899999999997 0.19689200000000001 0
		 -0.98438700000000001 0.155914 -0.081682199999999996 0 0.048182200000000001 -0.207646 -0.97701700000000002 0
		 49.972906999999999 93.851432000000003 16.413381000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_metacarpal_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.1086082458496094 0.060311742126941681 0.80135923624038696 ;
	setAttr ".r" -type "double3" -10.136288986672826 -13.676159490561643 -2.8714231797088861 ;
	setAttr ".s" -type "double3" 0.99999999999999967 1 0.99999999999999967 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.52490800000000004 -0.76070099999999996 0.38184499999999999 0
		 -0.79460799999999998 -0.59874799999999995 -0.100492 0 0.30507299999999998 -0.250668 -0.91874699999999998 0
		 47.014265999999999 102.864144 15.500265000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_01_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.9927616119384766 -2.8421709430404007e-014 -4.9737991503207013e-014 ;
	setAttr ".r" -type "double3" -0.66912127038302172 0.77379288197049567 17.914846757663064 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.25089099999999998 -0.90452699999999997 0.34479599999999999 0
		 -0.92108500000000004 -0.33263100000000001 -0.20238600000000001 0 0.29775400000000002 -0.26680999999999999 -0.91659999999999997 0
		 49.635007000000002 99.066145000000006 17.406724000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_02_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.2513885498046875 -1.1368683772161603e-013 -4.9737991503207013e-014 ;
	setAttr ".r" -type "double3" 0.039595206032477751 0.44621963314915625 26.377458842572953 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.18676599999999999 -0.95602900000000002 0.22611300000000001 0
		 -0.93644899999999998 0.10367700000000001 -0.33513399999999999 0 0.29695500000000002 -0.274335 -0.91463499999999998 0
		 50.701639999999998 95.220647999999997 18.872586999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_03_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l|ring_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.234827995300293 -7.1054273576010019e-014 -2.8421709430404007e-014 ;
	setAttr ".r" -type "double3" -0.03028402719688043 -0.36756110862860197 4.6277904759557869 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.259801 -0.94628800000000002 0.192465 0 -0.918485 0.180615 -0.35180099999999997 0
		 0.29814299999999999 -0.268175 -0.91607499999999997 0 50.097484999999999 92.128058999999993 19.604026000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_01_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.3100066184997559 1.4519228935241699 -2.5470774173736572 ;
	setAttr ".r" -type "double3" 81.999702342485648 33.192793462058347 20.268136703556095 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.22926199999999999 -0.57771300000000003 0.78338200000000002 0
		 0.388988 -0.79213599999999995 -0.470329 0 0.89226000000000005 0.19689699999999999 0.40633000000000002 0
		 43.831175000000002 103.68326999999999 17.227499000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_02_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.6317892074584961 4.2632564145606011e-014 5.6843418860808015e-014 ;
	setAttr ".r" -type "double3" -1.0675530496969974 -6.2936964461530671 20.230195885170954 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0176896 -0.78948600000000002 0.61351299999999998 0
		 0.42750300000000002 -0.54871999999999999 -0.71843400000000002 0 0.90384100000000001 0.27498800000000001 0.32780100000000001 0
		 42.769280999999999 101.00742700000001 20.855958000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_03_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.7105906009674072 3.5527136788005009e-014 -5.6843418860808015e-014 ;
	setAttr ".r" -type "double3" 0.030462792318610196 0.19497582261579605 8.4044110179707925 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.076907000000000003 -0.86213899999999999 0.50080100000000005 0
		 0.42080699999999999 -0.42729200000000001 -0.80021399999999998 0 0.90388400000000002 0.272283 0.32993299999999998 0
		 42.817230000000002 98.867452999999998 22.518941999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_metacarpal_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.4526736736297607 0.11279580742120743 -2.0519018173217773 ;
	setAttr ".r" -type "double3" 17.559800682032183 5.64076381464099 -3.8648803596469201 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.36226599999999998 -0.66007199999999999 0.65807899999999997 0
		 -0.50967499999999999 -0.73141599999999996 -0.45305899999999999 0 0.78038099999999999 -0.17127899999999999 -0.60138999999999998 0
		 45.527577999999998 103.484503 17.880842000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_01_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.3769063949584961 -1.1368683772161603e-013 -1.7763568394002505e-014 ;
	setAttr ".r" -type "double3" -10.60188133623139 -4.445498342593071 19.228492788237713 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.23416600000000001 -0.87480599999999997 0.424124 0
		 -0.73095900000000003 -0.44605400000000001 -0.51646400000000003 0 0.640988 -0.189078 -0.74389799999999995 0
		 47.475451 99.935360000000003 21.419273 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_02_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.5645484924316406 7.1054273576010019e-014 5.1514348342607263e-014 ;
	setAttr ".r" -type "double3" 0.065065998363444483 0.24752358950161163 11.714154952194031 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.078113000000000002 -0.946322 0.31364399999999998 0
		 -0.76254900000000003 -0.25937100000000002 -0.59265999999999996 0 0.64219800000000005 -0.19287399999999999 -0.74187700000000001 0
		 48.544311999999998 95.942265000000006 23.355205000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_03_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l|index_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.4864709377288818 1.4210854715202004e-014 2.8421709430404007e-014 ;
	setAttr ".r" -type "double3" -6.4861054623717384e-006 0.060168684807359527 -0.012352818826017872 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.077602900000000002 -0.94606299999999999 0.31455 0
		 -0.76253199999999999 -0.259575 -0.59259300000000004 0 0.64227999999999996 -0.19386800000000001 -0.74154699999999996 0
		 48.738537999999998 93.589262000000005 24.135071 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "wrist_inner_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.17634814977645874 1.6798155307769775 -0.28417164087295532 ;
	setAttr ".r" -type "double3" -86.686132378320437 11.672095037733474 3.6951851362489876 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.201735 -0.69335000000000002 0.69178600000000001 0
		 -0.64861500000000005 0.43466399999999999 0.62479200000000001 0 -0.73389400000000005 -0.57474599999999998 -0.36203099999999999 0
		 43.992006000000003 104.660616 14.006697000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "wrist_outer_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.081474699079990387 -1.6855558156967163 -0.31309774518013 ;
	setAttr ".r" -type "double3" 93.313867621679591 11.672095037733463 3.695185136248984 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.201735 -0.69335000000000002 0.69178600000000001 0
		 0.64861500000000005 -0.43466399999999999 -0.62479200000000001 0 0.73389400000000005 0.57474599999999998 0.36203099999999999 0
		 46.528136000000003 106.610286 15.056646000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "weapon_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" 1.0735470056533813 1.486369252204895 0.48718661069869995 ;
	setAttr ".r" -type "double3" 112.35690692337171 -33.48932631449054 -63.743122703326449 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 8.2889299999999998e-008 3.3677100000000003e-008 0
		 3.3677100000000003e-008 2.7473099999999999e-008 -1 0 -8.2889299999999998e-008 1 2.7473099999999999e-008 0
		 45.023465999999999 103.61086 14.176273999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "upperarm_twist_01_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 9.0301179885864258 5.3290705182007514e-015 -5.6843418860808015e-014 ;
	setAttr ".r" -type "double3" -2.8577454260826296e-005 -0.23929740151694759 0.013684771499399997 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60649299999999995 -0.79463200000000001 0.026965599999999999 0
		 -0.029308399999999998 -0.056235599999999997 -0.99798699999999996 0 0.79454899999999995 0.60448199999999996 -0.0573959 0
		 21.502095000000001 135.638497 -2.2600180000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twistCor_01_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.5631940186722204e-013 9.7699626167013776e-015 -4.2632564145606011e-014 ;
	setAttr ".r" -type "double3" -2.8577454199830088e-005 -0.23929740151694734 0.013684771499399869 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60979899999999998 -0.79211399999999998 0.026487299999999998 0
		 -0.0294536 -0.056046100000000001 -0.99799400000000005 0 0.79200899999999996 0.60779499999999997 -0.057507500000000003 0
		 21.502095000000001 135.638497 -2.2600180000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twist_02_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 18.060235977172852 6.2172489379008766e-015 -8.5265128291212022e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60317600000000005 -0.79713599999999996 0.0274434 0
		 -0.0291639 -0.056425700000000002 -0.99798100000000001 0 0.79707499999999998 0.60115799999999997 -0.057282199999999998 0
		 26.948844000000001 128.44026500000001 -2.0122010000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_tricep_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.11777227371931076 4.7947254180908203 -0.14219054579734802 ;
	setAttr ".r" -type "double3" -94.860632691061539 3.6417365982027312 1.5381314250522926 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1.0000000000000004 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.55033200000000004 -0.83493499999999998 0.0042826299999999999 0
		 -0.826874 -0.544292 0.141513 0 -0.115823 -0.081420400000000004 -0.989927 0 26.766711999999998 127.990359 -6.7858679999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_bicep_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.463266521692276 -3.2203977108001709 -0.3582572340965271 ;
	setAttr ".r" -type "double3" 85.139367308938517 3.6417365982027272 1.5381314250522913 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.55033200000000004 -0.83493499999999998 0.0042826299999999999 0
		 0.826874 0.544292 -0.141513 0 0.115823 0.081420400000000004 0.989927 0 27.036636999999999 128.03732299999999 1.2349289999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twistCor_02_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 8.5265128291212022e-014 1.4210854715202004e-014 -1.4210854715202004e-014 ;
	setAttr ".r" -type "double3" -0.00011431230040307274 -0.47859476617873364 0.027370020102988678 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60979899999999998 -0.79211399999999998 0.026487299999999998 0
		 -0.0294536 -0.056046100000000001 -0.99799400000000005 0 0.79200899999999996 0.60779499999999997 -0.057507500000000003 0
		 26.948844000000001 128.44026500000001 -2.0122010000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_correctiveRoot_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.2632564145606011e-014 1.7763568394002505e-015 -5.6843418860808015e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60317600000000005 -0.79713599999999996 0.0274434 0
		 -0.0291639 -0.056425700000000002 -0.99798100000000001 0 0.79707499999999998 0.60115799999999997 -0.057282199999999998 0
		 16.055346 142.83672899999999 -2.5078360000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_bck_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.5594130754470825 6.3546619415283203 0.55722165107727051 ;
	setAttr ".r" -type "double3" -71.338605903548057 0 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60317600000000005 -0.79713599999999996 0.0274434 0
		 -0.76450099999999999 -0.58760699999999999 -0.26505800000000002 0 0.227413 0.13889599999999999 -0.96384199999999998 0
		 17.254767000000001 141.570076 -8.8387890000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_fwd_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.2174253463745117 -6.5221548080444336 -0.59551537036895752 ;
	setAttr ".r" -type "double3" 98.945174165607767 -1.9520053287632744 11.877573660059191 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.61107 -0.77074600000000004 -0.180397 0 0.79100499999999996 0.60321499999999995 0.102186 0
		 0.030058600000000001 -0.20513799999999999 0.978271 0 17.711561 140.28202200000001 4.1235590000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_in_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.9814953804016113 -1.5915678739547729 -4.6137995719909668 ;
	setAttr ".r" -type "double3" 179.99999999999997 -48.194143483235486 -2.1188593660444797e-030 ;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.996228 -0.083270200000000003 -0.024404599999999999 0
		 0.0291639 0.056425700000000002 0.99798100000000001 0 -0.081725000000000006 -0.99492800000000003 0.058641400000000003 0
		 16.032112000000001 135.38484800000001 -0.49103999999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_out_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.14835970103740692 0.28834047913551331 5.679898738861084 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60317600000000005 -0.79713599999999996 0.0274434 0
		 -0.0291639 -0.056425700000000002 -0.99798100000000001 0 0.79707499999999998 0.60115799999999997 -0.057282199999999998 0
		 20.484755 146.35323500000001 -3.1250230000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_out_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 10.79413890838623 0.0510997474193573 5.4980626106262207 ;
	setAttr ".r" -type "double3" -0.1805298097407074 -3.1102894160722525 -4.2915710380114067 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99498200000000003 -0.088335700000000003 0.046980599999999997 0
		 0.0460046 -0.013053500000000001 -0.99885599999999997 0 0.088847899999999994 0.99600500000000003 -0.0089241600000000004 0
		 12.393397 148.91916399999999 -2.452388 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_scap_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 8.8727073669433594 6.1139087677001953 -2.3973433971405029 ;
	setAttr ".r" -type "double3" 0.18052980974070743 3.1102894160722525 175.7084289619886 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.99498200000000003 0.088335700000000003 -0.046980599999999997 0
		 -0.0460046 0.013053500000000001 0.99885599999999997 0 0.088847899999999994 0.99600500000000003 -0.0089241600000000004 0
		 9.1980500000000003 141.38301100000001 -8.4342900000000007 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.8304305076599121 1.0049138069152832 0.93135738372802734 ;
	setAttr ".r" -type "double3" 168.95208683885181 81.648241450662169 -23.216179029159459 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.98939500000000002 0.142592 0.027655699999999998 0
		 -0.027832099999999999 -0.00075737099999999996 0.99961199999999995 0 0.14255799999999999 -0.98978100000000002 0.0032193 0
		 -0.93135999999999997 145.01594900000001 -2.085086 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -15.285988807678223 -5.4686129260517191e-006 -0.00040209831786341965 ;
	setAttr ".r" -type "double3" -4.5809595688709104 44.675542396438779 -3.6140379164620295 ;
	setAttr ".s" -type "double3" 0.99999999999999922 0.99999999999999956 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60317600000000005 0.79713599999999996 -0.0274434 0
		 -0.0291639 0.056425700000000002 0.99798100000000001 0 0.79707499999999998 -0.60115799999999997 0.057282199999999998 0
		 -16.055299000000002 142.83668599999999 -2.5078369999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -27.089923858642578 -1.0658141036401503e-014 -2.8421709430404007e-014 ;
	setAttr ".r" -type "double3" 0 0 -36.700415987379365 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50103799999999998 0.60539900000000002 -0.61842799999999998 0
		 0.337094 0.52163400000000004 0.78375099999999998 0 0.79707499999999998 -0.60115799999999997 0.057282199999999998 0
		 -32.395285999999999 121.242333 -1.7643960000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_02_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -8.6985101699829102 -2.8421709430404007e-014 -2.8421709430404007e-014 ;
	setAttr ".r" -type "double3" 0.14286657397097186 -0.19199482366530793 0.066859810526319716 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50409899999999996 0.603989 -0.617317 0 0.33849099999999999 0.51942100000000002 0.78461800000000004 0
		 0.79454899999999995 -0.60448199999999996 0.057394899999999999 0 -36.753573000000003 115.976264 3.615002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_twist_01_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -17.397001266479492 0 2.8421709430404007e-014 ;
	setAttr ".r" -type "double3" 0.14286657840378938 -0.19198717974961288 0.066859826719066234 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50409899999999996 0.60399000000000003 -0.617317 0
		 0.33849099999999999 0.51942100000000002 0.78461800000000004 0 0.79454899999999995 -0.60448199999999996 0.057394800000000003 0
		 -41.111851000000001 110.710206 8.994389 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_correctiveRoot_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.6877833331818692e-005 2.2643009288003668e-005 -0.00035186088643968105 ;
	setAttr ".r" -type "double3" 0.14312404358245595 -0.24927142973289015 0 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50450099999999998 0.60277800000000004 -0.61817299999999997 0
		 0.33907799999999999 0.52012400000000003 0.78389900000000001 0 0.79404300000000005 -0.60508700000000004 0.058014200000000002 0
		 -32.395567999999997 121.242546 -1.7643880000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_out_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.66188704967498779 -1.3741538524627686 -2.271906852722168 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50450099999999998 0.60277800000000004 -0.61817299999999997 0
		 0.33907799999999999 0.52012400000000003 0.78389900000000001 0 0.79404300000000005 -0.60508700000000004 0.058014200000000002 0
		 -34.999428000000002 121.503546 -2.564228 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_in_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.6645280122756958 -0.2296813577413559 2.449871301651001 ;
	setAttr ".r" -type "double3" 179.99999879299995 0 0 ;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1.0000000000000009 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50450099999999998 0.60277800000000004 -0.61817299999999997 0
		 -0.33907799999999999 -0.52012400000000003 -0.78389900000000001 0 -0.79404300000000005 0.60508700000000004 -0.058014200000000002 0
		 -31.367901 118.63735800000001 -0.77334199999999997 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_fwd_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4935092926025391 2.4248940944671631 -0.60789287090301514 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50450099999999998 0.60277800000000004 -0.61817299999999997 0
		 0.79404300000000005 -0.60508700000000004 0.058014200000000002 0 -0.33907799999999999 -0.52012400000000003 -0.78389900000000001 0
		 -32.809508999999998 121.97136500000001 1.0244629999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "lowerarm_bck_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.7019120454788208 -3.6498761177062988 0.95441687107086182 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.50450099999999998 0.60277800000000004 -0.61817299999999997 0
		 -0.79404300000000005 0.60508700000000004 -0.058014200000000002 0 0.33907799999999999 0.52012400000000003 0.78389900000000001 0
		 -33.733930000000001 117.740779 -3.5180760000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "hand_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -26.095495223999023 -2.8421709430404007e-014 1.4210854715202004e-014 ;
	setAttr ".r" -type "double3" -72.649020017143457 10.438206921770172 3.7480588003257802 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999944 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.368954 0.73655599999999999 -0.56688499999999997 0
		 -0.74793699999999996 0.59736999999999996 0.28937600000000002 0 0.55178199999999999 0.31722800000000001 0.77129999999999999 0
		 -45.470129 105.444147 14.373777 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_metacarpal_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.1166098117828369 0.067716680467128754 0.3642047643661499 ;
	setAttr ".r" -type "double3" 0.17325280972623608 -2.0095534662863019 -7.1627766956724717 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.47839999999999999 0.66704300000000005 -0.57112799999999997 0
		 -0.69447400000000004 0.68543500000000002 0.21882599999999999 0 0.53743799999999997 0.29194700000000001 0.79115599999999997 0
		 -46.469700000000003 103.30457699999999 16.441043000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_01_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.5606164932250977 1.325793255091412e-005 4.7712139348732308e-005 ;
	setAttr ".r" -type "double3" -3.6730637845344645 -4.2858601894917054 24.041609185493812 ;
	setAttr ".s" -type "double3" 1 0.99999999999999978 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.19370299999999999 0.90775600000000001 -0.37209799999999998 0
		 -0.86102199999999995 0.33909499999999998 0.37902000000000002 0 0.47023399999999999 0.24696699999999999 0.84728199999999998 0
		 -49.129882000000002 99.595431000000005 19.616909 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_02_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.9196085929870605 -3.3851731132017449e-005 -3.2841686333995312e-005 ;
	setAttr ".r" -type "double3" 0.091920208090801175 0.47605626610472823 19.152857815306415 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.10341500000000001 0.96667700000000001 -0.234181 0
		 -0.87615900000000002 0.022908600000000001 0.48147699999999999 0 0.47079799999999999 0.25497199999999998 0.84459399999999996 0
		 -50.082813000000002 95.129604999999998 21.447447 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "middle_03_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r|middle_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.9020707607269287 1.2209041415189859e-005 2.6500769308768213e-005 ;
	setAttr ".r" -type "double3" -0.010883744676917736 -0.21859978126610352 2.8503214688172114 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.14505799999999999 0.96758599999999995 -0.20672499999999999 0
		 -0.87002199999999996 -0.0252374 0.49236600000000003 0 0.47118900000000002 0.25127699999999997 0.84548199999999996 0
		 -49.782694999999997 92.324246000000002 22.127085000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_metacarpal_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.9830863475799561 -0.24203243851661682 -1.9277585744857788 ;
	setAttr ".r" -type "double3" -25.373373080934769 -21.620639643750227 9.1694232541789038 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.43112 0.88136700000000001 -0.19320499999999999 0
		 -0.90139400000000003 0.43026300000000001 -0.0486001 0 0.040294499999999997 0.195107 0.97995399999999999 0
		 -47.453426 102.490814 14.507925999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_01_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.7179889678955078 -4.6482160541927442e-005 -2.9418628400890157e-005 ;
	setAttr ".r" -type "double3" 0.26538035456964859 1.1126126272551744 11.738438100862078 ;
	setAttr ".s" -type "double3" 0.99999999999999978 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.23789299999999999 0.94650100000000004 -0.21804299999999999 0
		 -0.97003399999999995 0.24294199999999999 -0.00375699 0 0.049415800000000003 0.21240300000000001 0.97593200000000002 0
		 -49.487405000000003 98.332509999999999 15.41944 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_02_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.8933203220367432 3.2843097869772464e-005 5.7850324083119631e-005 ;
	setAttr ".r" -type "double3" -0.10148181421340575 -0.18573522121583416 20.297180049109812 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.11321199999999999 0.97268699999999997 -0.20264199999999999 0
		 -0.99240899999999999 -0.100845 0.070383200000000007 0 0.048025400000000003 0.20907200000000001 0.97672000000000003 0
		 -50.175735000000003 95.593998999999997 16.050363999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "pinky_03_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r|pinky_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.7914743423461914 1.8642145732883364e-005 -3.4456210414646193e-005 ;
	setAttr ".r" -type "double3" -0.0052861729888471756 -0.083787899474112887 3.2540501701080173 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.169292 0.96569899999999997 -0.19689200000000001 0
		 -0.98438700000000001 -0.155914 0.081682199999999996 0 0.048182200000000001 0.207646 0.97701700000000002 0
		 -49.972937999999999 93.851446999999993 16.413360000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_metacarpal_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.1086218357086182 -0.060363952070474625 -0.80163866281509399 ;
	setAttr ".r" -type "double3" -10.136288986672826 -13.676159490561643 -2.8714231797088861 ;
	setAttr ".s" -type "double3" 0.99999999999999967 1 0.99999999999999967 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.52490800000000004 0.76070099999999996 -0.38184499999999999 0
		 -0.79460799999999998 0.59874799999999995 0.100492 0 0.30507299999999998 0.250668 0.91874699999999998 0
		 -47.014248000000002 102.86411099999999 15.500237 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_01_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.9928054809570312 5.880850221728906e-005 2.6425819669384509e-005 ;
	setAttr ".r" -type "double3" -0.66912127038302172 0.77379288197049567 17.914846757663064 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.25089099999999998 0.90452699999999997 -0.34479599999999999 0
		 -0.92108500000000004 0.33263100000000001 0.20238600000000001 0 0.29775400000000002 0.26680999999999999 0.91659999999999997 0
		 -49.63505 99.066119999999998 17.406744 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_02_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.2513833045959473 -8.2842801930382848e-005 -2.0854413378401659e-005 ;
	setAttr ".r" -type "double3" 0.039595206032477751 0.44621963314915625 26.377458842572953 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.18676599999999999 0.95602900000000002 -0.22611300000000001 0
		 -0.93644899999999998 -0.10367700000000001 0.33513399999999999 0 0.29695500000000002 0.274335 0.91463499999999998 0
		 -50.701611999999997 95.220595000000003 18.872568999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ring_03_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r|ring_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.234731912612915 5.118075932841748e-005 3.3301119401585311e-005 ;
	setAttr ".r" -type "double3" -0.03028402719688043 -0.36756110862860197 4.6277904759557869 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.259801 0.94628800000000002 -0.192465 0 -0.918485 -0.180615 0.35180099999999997 0
		 0.29814299999999999 0.268175 0.91607499999999997 0 -50.097512999999999 92.128101999999998 19.604033000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_01_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.3100779056549072 -1.4519234895706177 2.5468409061431885 ;
	setAttr ".r" -type "double3" 81.999702342485648 33.192793462058347 20.268136703556095 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.22926199999999999 0.57771300000000003 -0.78338200000000002 0
		 0.388988 0.79213599999999995 0.470329 0 0.89226000000000005 -0.19689699999999999 -0.40633000000000002 0
		 -43.831192999999999 103.683239 17.227551999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_02_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.6318020820617676 1.643262839934323e-005 4.9452719395048916e-005 ;
	setAttr ".r" -type "double3" -1.0675530496969974 -6.2936964461530671 20.230195885170954 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0176896 0.78948600000000002 -0.61351299999999998 0
		 0.42750300000000002 0.54871999999999999 0.71843400000000002 0 0.90384100000000001 -0.27498800000000001 -0.32780100000000001 0
		 -42.769244999999998 101.007391 20.856009 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thumb_03_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.7105751037597656 -5.0043054216075689e-005 7.9691708378959447e-006 ;
	setAttr ".r" -type "double3" 0.030462792318610196 0.19497582261579605 8.4044110179707925 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.076907000000000003 0.86213899999999999 -0.50080100000000005 0
		 0.42080699999999999 0.42729200000000001 0.80021399999999998 0 0.90388400000000002 -0.272283 -0.32993299999999998 0
		 -42.817208000000001 98.867400000000004 22.518944000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_metacarpal_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.4526569843292236 -0.11278965324163437 2.0515975952148437 ;
	setAttr ".r" -type "double3" 17.559800682032183 5.64076381464099 -3.8648803596469201 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.36226599999999998 0.66007199999999999 -0.65807899999999997 0
		 -0.50967499999999999 0.73141599999999996 0.45305899999999999 0 0.78038099999999999 0.17127899999999999 0.60138999999999998 0
		 -45.527605999999999 103.48451900000001 17.880794999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_01_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.376899242401123 -4.1306844650534913e-005 4.1358642192790285e-005 ;
	setAttr ".r" -type "double3" -10.60188133623139 -4.445498342593071 19.228492788237713 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.23416600000000001 0.87480599999999997 -0.424124 0
		 -0.73095900000000003 0.44605400000000001 0.51646400000000003 0 0.640988 0.189079 0.74389799999999995 0
		 -47.475422999999999 99.935356999999996 21.419226999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_02_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.5645689964294434 0.00010120132355950773 2.7219850380788557e-005 ;
	setAttr ".r" -type "double3" 0.065065998363444483 0.24752358950161163 11.714154952194031 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.078112899999999999 0.946322 -0.31364399999999998 0
		 -0.76254900000000003 0.25937100000000002 0.59265999999999996 0 0.64219800000000005 0.19287399999999999 0.74187700000000001 0
		 -48.544345 95.942295000000001 23.355240999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "index_03_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r|index_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.4864468574523926 -9.5848290584399365e-006 5.1345959946047515e-006 ;
	setAttr ".r" -type "double3" -5.2786869249955411e-006 0.060168684937517515 -0.012352818192037556 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.077602900000000002 0.94606299999999999 -0.31455 0
		 -0.76253199999999999 0.259575 0.59259300000000004 0 0.64227999999999996 0.19386800000000001 0.74154699999999996 0
		 -48.738559000000002 93.589313000000004 24.135096999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "wrist_inner_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.17632202804088593 -1.6797837018966675 0.28392773866653442 ;
	setAttr ".r" -type "double3" -86.686132378320437 11.672095037733474 3.6951851362489876 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.201735 0.69335000000000002 -0.69178600000000001 0
		 -0.64861500000000005 -0.43466399999999999 -0.62479200000000001 0 -0.73389400000000005 0.57474599999999998 0.36203099999999999 0
		 -43.992035999999999 104.660634 14.006728000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "wrist_outer_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.081433132290840149 1.6855744123458862 0.31282311677932739 ;
	setAttr ".r" -type "double3" 93.313867621679591 11.672095037733463 3.695185136248984 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.201735 0.69335000000000002 -0.69178600000000001 0
		 0.64861500000000005 0.43466399999999999 0.62479200000000001 0 0.73389400000000005 -0.57474599999999998 -0.36203099999999999 0
		 -46.528177999999997 106.610275 15.056659 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "weapon_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" -1.0735610723495483 -1.4863772392272949 -0.48742842674255371 ;
	setAttr ".r" -type "double3" -67.643093076628332 -33.489326314490533 -63.743122703326407 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000007 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 -6.3597400000000005e-008 -3.9253299999999997e-008 0
		 -3.9253299999999997e-008 1.6402399999999999e-008 -1 0 6.3597400000000005e-008 1 1.6402399999999999e-008 0
		 -45.023460999999998 103.610865 14.176288 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "upperarm_twist_01_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -9.0299749374389648 1.0100946383317932e-005 -0.00012584890646394342 ;
	setAttr ".r" -type "double3" -2.8577454255080262e-005 -0.23929740151694759 0.01368477149939998 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60649299999999995 0.79463200000000001 -0.026965599999999999 0
		 -0.029308399999999998 0.056235599999999997 0.99798699999999996 0 0.79454899999999995 -0.60448199999999996 0.0573959 0
		 -21.502061999999999 135.638645 -2.2600210000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twistCor_01_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.6843418860808015e-014 -1.5099033134902129e-014 1.4210854715202004e-014 ;
	setAttr ".r" -type "double3" -2.8577454217843389e-005 -0.23929740151694734 0.013684771499399902 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60979899999999998 0.79211399999999998 -0.026487299999999998 0
		 -0.0294536 0.056046199999999997 0.99799400000000005 0 0.79200899999999996 -0.60779499999999997 0.057507500000000003 0
		 -21.502061999999999 135.638645 -2.2600210000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twist_02_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -18.05994987487793 2.0201892766635865e-005 -0.00025169781292788684 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60317600000000005 0.79713599999999996 -0.0274434 0
		 -0.0291639 0.056425700000000002 0.99798100000000001 0 0.79707499999999998 -0.60115799999999997 0.057282199999999998 0
		 -26.948826 128.44060300000001 -2.0122040000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_tricep_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.28466442227363586 -4.7872347831726074 -0.066920988261699677 ;
	setAttr ".r" -type "double3" -94.860632691061539 3.6417365982027312 1.5381314250522926 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1.0000000000000004 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.55033100000000001 0.83493499999999998 -0.0042826399999999999 0
		 -0.826874 0.544292 -0.141513 0 -0.115823 0.081420400000000004 0.989927 0 -27.034255000000002 127.98379300000001 -6.7857940000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_bicep_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.61306673288345337 3.2275254726409912 0.16008666157722473 ;
	setAttr ".r" -type "double3" 85.139367308938517 3.6417365982027272 1.5381314250522913 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.55033100000000001 0.83493499999999998 -0.0042826399999999999 0
		 0.826874 -0.544292 0.141513 0 0.115823 -0.081420400000000004 -0.989927 0 -27.285139000000001 128.03778399999999 1.234799 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_twistCor_02_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4210854715202004e-013 -2.042810365310288e-014 8.5265128291212022e-014 ;
	setAttr ".r" -type "double3" -0.00011431230043738753 -0.47859476617873398 0.027370020102988821 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60979899999999998 0.79211399999999998 -0.026487299999999998 0
		 -0.0294536 0.056046199999999997 0.99799400000000005 0 0.79200899999999996 -0.60779499999999997 0.057507500000000003 0
		 -26.948826 128.44060300000001 -2.0122040000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_correctiveRoot_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -4.2632564145606011e-014 0 9.9475983006414026e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60317600000000005 0.79713599999999996 -0.0274434 0
		 -0.0291639 0.056425700000000002 0.99798100000000001 0 0.79707499999999998 -0.60115799999999997 0.057282199999999998 0
		 -16.055299000000002 142.83668599999999 -2.5078369999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_bck_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.7315992116928101 -6.3302149772644043 -0.73347479104995728 ;
	setAttr ".r" -type "double3" -71.338605903548057 0 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60317600000000005 0.79713599999999996 -0.0274434 0
		 -0.76450099999999999 0.58760699999999999 0.26505800000000002 0 0.227413 -0.13889599999999999 0.96384199999999998 0
		 -17.499779 141.54011299999999 -8.8197639999999993 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_in_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.6036086082458496 1.3639713525772095 4.1672286987304687 ;
	setAttr ".r" -type "double3" 179.99999914599996 -48.194143483235486 -7.1097122515502626e-023 ;
	setAttr ".s" -type "double3" 1 1.0000000000000009 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.996228 0.083270200000000003 0.024404599999999999 0
		 0.0291639 -0.056425799999999998 -0.99798100000000001 0 -0.081725000000000006 0.99492800000000003 -0.058641400000000003 0
		 -16.153445999999999 135.94165100000001 -0.75412900000000005 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_fwd_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.3673076629638672 6.5294022560119629 0.39745467901229858 ;
	setAttr ".r" -type "double3" 98.945174165607767 -1.9520053287632744 11.877573660059191 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.61107 0.77074600000000004 0.180397 0 0.79100499999999996 -0.60321499999999995 -0.102186 0
		 0.030058600000000001 0.20513799999999999 -0.978271 0 -17.960000000000001 140.28197800000001 4.1235580000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "upperarm_out_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.0015225569950416684 -0.28120768070220947 -5.8780398368835449 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.60317600000000005 0.79713599999999996 -0.0274434 0
		 -0.0291639 0.056425700000000002 0.99798100000000001 0 0.79707499999999998 -0.60115799999999997 0.057282199999999998 0
		 -20.733255 146.35323299999999 -3.1251419999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_out_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -11.048164367675781 0.18364313244819641 -5.5069217681884766 ;
	setAttr ".r" -type "double3" -0.1805298097407074 -3.1102894160722525 -4.2915710380114067 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99498200000000003 0.088335700000000003 -0.046980599999999997 0
		 0.0460046 0.013053500000000001 0.99885599999999997 0 0.088847899999999994 -0.99600500000000003 0.0089241700000000004 0
		 -12.652525000000001 148.891077 -2.2247870000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_scap_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -9.116938591003418 -6.1032066345214844 2.3641226291656494 ;
	setAttr ".r" -type "double3" 0.18052980974070743 3.1102894160722525 175.7084289619886 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.99498200000000003 -0.088335700000000003 0.046980599999999997 0
		 -0.0460046 -0.013053500000000001 -0.99885599999999997 0 0.088847899999999994 -0.99600500000000003 0.0089241700000000004 0
		 -9.444725 141.38060400000001 -8.4304509999999997 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_pec_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -8.4378414154052734 -10.153745651245117 10.180425643920898 ;
	setAttr ".r" -type "double3" 123.22087241428461 82.005483575089315 -67.346542998772435 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.990282 0.079558000000000004 0.11407299999999999 0
		 -0.116346 0.0245229 0.99290599999999996 0 0.076196200000000006 -0.996529 0.033540800000000003 0
		 -10.180403999999999 133.43754200000001 11.844745 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_04_latissimus_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -8.382685661315918 3.2562665939331055 -12.805118560791016 ;
	setAttr ".r" -type "double3" 130.38472935526508 71.622025192132099 118.20949958519994 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.94899699999999998 -0.20454600000000001 -0.239929 0
		 -0.24015800000000001 0.024088100000000001 -0.97043500000000005 0 0.20427799999999999 0.97855999999999999 -0.0262638 0
		 12.805111999999999 130.64860400000001 -1.272214 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "spine_04_latissimus_r" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -8.3886041641235352 3.2558174133300781 12.816327095031738 ;
	setAttr ".r" -type "double3" -145.9767130968215 84.725073756067971 23.82468309464182 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1.0000000000000002 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99576500000000001 0.074316099999999996 -0.054122900000000002 0
		 0.051442399999999999 0.037522699999999999 0.99797100000000005 0 0.076196200000000006 -0.996529 0.033540800000000003 0
		 -12.816333999999999 130.64292599999999 -1.270467 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "clavicle_pec_l" -p "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -8.4353771209716797 -9.9101133346557617 -9.8291101455688477 ;
	setAttr ".r" -type "double3" 123.20088551351532 82.006463152853811 112.63366553706553 ;
	setAttr ".s" -type "double3" 0.99999999999999944 1 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99028300000000002 -0.079509800000000005 -0.114091 0
		 -0.11636299999999999 -0.024528600000000001 -0.99290400000000001 0 0.076147099999999995 0.99653199999999997 -0.033542200000000001 0
		 9.8291319999999995 133.388293 11.606085999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_r" -p "|Quinn|root|pelvis";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.2320435047149658 -0.067991852760314941 11.154600143432617 ;
	setAttr ".r" -type "double3" 8.4754687071906272 -2.3901870130953 175.20250764755187 ;
	setAttr ".s" -type "double3" 0.99999999999999922 0.99999999999999956 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 -0.99891300000000005 -0.0208343 0
		 -0.147258 -0.0144794 0.98899199999999998 0 -0.98821899999999996 0.044313499999999999 -0.14649400000000001 0
		 -11.1546 95.471838000000005 2.6504110000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "calf_r" -p "|Quinn|root|pelvis|thigh_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 45.751937866210938 -4.4408920985006262e-016 -8.8817841970012523e-015 ;
	setAttr ".r" -type "double3" 0 0 -1.0934579619251561 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.038886799999999999 -0.99845499999999998 -0.039703700000000001 0
		 -0.14802699999999999 -0.033539300000000001 0.98841400000000001 0 -0.98821899999999996 0.044313499999999999 -0.14649400000000001 0
		 -13.062663000000001 49.769644 1.697201 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "foot_r" -p "|Quinn|root|pelvis|thigh_r|calf_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 41.705467224121094 -5.773159728050814e-015 5.3290705182007514e-015 ;
	setAttr ".r" -type "double3" 0.0051126536856260481 2.539826615900501 0.11379509111340619 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0046495299999999998 -0.999502 -0.031211800000000001 0
		 -0.148037 -0.0315562 0.98847799999999997 0 -0.98897100000000004 2.4554700000000001e-005 -0.14810999999999999 0
		 -14.684455 8.1286319999999996 0.041339099999999997 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ball_r" -p "|Quinn|root|pelvis|thigh_r|calf_r|foot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 6.5367636680603027 13.629230499267578 -0.04389764741063118 ;
	setAttr ".r" -type "double3" 0 0 -90.000000000000014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.148037 0.0315562 -0.98847799999999997 0 0.0046495299999999998 -0.999502 -0.031211800000000001 0
		 -0.98897100000000004 2.4554700000000001e-005 -0.14810999999999999 0 -16.628285000000002 1.165036 13.316013999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ankle_bck_r" -p "|Quinn|root|pelvis|thigh_r|calf_r|foot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.70488619804382324 -4.0763192176818848 0.73197096586227417 ;
	setAttr ".r" -type "double3" -89.198829787517411 -3.5810265870160674 -4.5301367468424676 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.045475500000000002 -0.99194499999999997 -0.118225 0
		 0.98590500000000003 -0.063640299999999997 0.15473100000000001 0 -0.16100900000000001 -0.109523 0.98085699999999998 0
		 -14.808182 8.9618179999999992 -4.0744249999999997 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ankle_fwd_r" -p "|Quinn|root|pelvis|thigh_r|calf_r|foot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.7609685659408569 4.5034699440002441 -0.34758466482162476 ;
	setAttr ".r" -type "double3" 90.801170212482674 -3.5810265870160771 -4.5301367468424685 ;
	setAttr ".s" -type "double3" 0.99999999999999956 1.0000000000000002 1.0000000000000002 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.045475500000000002 -0.99194499999999997 -0.118225 0
		 -0.98590500000000003 0.063640299999999997 -0.15473100000000001 0 0.16100900000000001 0.109523 -0.98085699999999998 0
		 -15.015574000000001 9.7466030000000003 4.5993649999999997 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twist_02_r" -p "|Quinn|root|pelvis|thigh_r|calf_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 13.901822090148926 -8.4376949871511897e-015 0.049997188150882721 ;
	setAttr ".r" -type "double3" 0.0050312530041799414 -0.28321279513104031 0.11354327747809669 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 -0.99828799999999995 -0.038468599999999999 0
		 -0.148036 -0.031556300000000002 0.98847799999999997 0 -0.98799999999999999 0.049251400000000001 -0.14639199999999999 0
		 -13.652668999999999 35.891522999999999 1.137923 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twistCor_02_r" -p "|Quinn|root|pelvis|thigh_r|calf_r|calf_twist_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.4210854715202004e-014 3.5527136788005009e-015 3.0198066269804258e-014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 -0.99828799999999995 -0.038468599999999999 0
		 -0.148036 -0.031556300000000002 0.98847799999999997 0 -0.98799999999999999 0.049251400000000001 -0.14639199999999999 0
		 -13.652668999999999 35.891522999999999 1.137923 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twist_01_r" -p "|Quinn|root|pelvis|thigh_r|calf_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 27.803644180297852 -7.7715611723760958e-015 0.099994376301765442 ;
	setAttr ".r" -type "double3" 0.0050312530041799414 -0.28321279513104031 0.11354327747809669 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 -0.99828799999999995 -0.038468599999999999 0
		 -0.148036 -0.031556300000000002 0.98847799999999997 0 -0.98799999999999999 0.049251400000000001 -0.14639199999999999 0
		 -14.242673999999999 22.013401000000002 0.57864499999999996 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_correctiveRoot_r" -p "|Quinn|root|pelvis|thigh_r|calf_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4210854715202004e-014 -4.8849813083506888e-015 1.7763568394002505e-015 ;
	setAttr ".r" -type "double3" 0.0055160494694889983 -0.20606043342954133 3.0332329280348273e-021 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.042440600000000002 -0.99828899999999998 -0.040230299999999997 0
		 -0.148122 -0.033534700000000001 0.98839999999999995 0 -0.98805799999999999 0.0479073 -0.14644499999999999 0
		 -13.062663000000001 49.769644 1.697201 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_kneeBack_r" -p "|Quinn|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.26281517744064331 -5.2397518157958984 -0.33655467629432678 ;
	setAttr ".r" -type "double3" -87.809358873689121 -0.63786814850703222 -2.8106705899652917 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0461238 -0.99484799999999995 -0.090273699999999998 0
		 0.98114900000000005 -0.0620946 0.183003 0 -0.187666 -0.0801312 0.97895900000000002 0
		 -11.942852 50.191600000000001 -3.4219110000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_knee_r" -p "|Quinn|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.048278633505105972 4.6184468269348145 -0.12729659676551819 ;
	setAttr ".r" -type "double3" 92.190641126310908 -0.63786814850703155 -2.8106705899652926 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.0461238 -0.99484799999999995 -0.090273699999999998 0
		 -0.98114900000000005 0.0620946 -0.183003 0 0.187666 0.0801312 -0.97895900000000002 0
		 -13.618931 49.656863999999999 6.2826599999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twist_01_r" -p "|Quinn|root|pelvis|thigh_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 15.250646591186523 0 -1.0658141036401503e-014 ;
	setAttr ".r" -type "double3" -0.000131744936953447 -0.28325887367358027 0.053296923185454523 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 -0.99869399999999997 -0.020638299999999998 0
		 -0.14721699999999999 -0.013550299999999999 0.98901099999999997 0 -0.98799999999999999 0.049251400000000001 -0.14639099999999999 0
		 -11.790621 80.237773000000004 2.3326739999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twistCor_01_r" -p "|Quinn|root|pelvis|thigh_r|thigh_twist_01_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.4210854715202004e-014 -3.5527136788005009e-015 1.7763568394002505e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 -0.99869399999999997 -0.020638299999999998 0
		 -0.14721699999999999 -0.013550299999999999 0.98901099999999997 0 -0.98799999999999999 0.049251400000000001 -0.14639099999999999 0
		 -11.790621 80.237773000000004 2.3326739999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twist_02_r" -p "|Quinn|root|pelvis|thigh_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 30.501293182373047 -3.9968028886505635e-015 -5.3290705182007514e-015 ;
	setAttr ".r" -type "double3" -0.00013174493731204874 -0.28325887367358044 0.053296923185455425 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 -0.99869399999999997 -0.020638299999999998 0
		 -0.14721699999999999 -0.013550299999999999 0.98901099999999997 0 -0.98799999999999999 0.049251400000000001 -0.14639099999999999 0
		 -12.426641999999999 65.003708000000003 2.0149379999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twistCor_02_r" -p "|Quinn|root|pelvis|thigh_r|thigh_twist_02_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.6843418860808015e-014 -2.6645352591003757e-015 -1.7763568394002505e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 -0.99869399999999997 -0.020638299999999998 0
		 -0.14721699999999999 -0.013550299999999999 0.98901099999999997 0 -0.98799999999999999 0.049251400000000001 -0.14639099999999999 0
		 -12.426641999999999 65.003708000000003 2.0149379999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_correctiveRoot_r" -p "|Quinn|root|pelvis|thigh_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4210854715202004e-014 -4.4408920985006262e-016 -8.8817841970012523e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 -0.99891300000000005 -0.0208343 0
		 -0.147258 -0.0144794 0.98899199999999998 0 -0.98821899999999996 0.044313499999999999 -0.14649400000000001 0
		 -11.1546 95.471838000000005 2.6504110000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_fwd_r" -p "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -6.3178153038024902 7.6825137138366699 -0.92238301038742065 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 -0.99891300000000005 -0.0208343 0
		 -0.98821899999999996 0.044313499999999999 -0.14649400000000001 0 0.147258 0.0144794 -0.98899199999999998 0
		 -11.110912000000001 101.630672 10.515107 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_bck_r" -p "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.8313205242156982 -11.172121047973633 -2.3346350193023682 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 -0.99891300000000005 -0.0208343 0
		 0.98821899999999996 -0.044313499999999999 0.14649400000000001 0 -0.147258 -0.0144794 0.98899199999999998 0
		 -7.0425060000000004 99.357303000000002 -7.9768970000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_out_r" -p "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.8910088539123535 -1.3259210586547852 4.8599438667297363 ;
	setAttr ".r" -type "double3" 179.99999774099993 0 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 -0.99891300000000005 -0.0208343 0
		 0.147258 0.0144794 -0.98899199999999998 0 0.98821899999999996 -0.044313499999999999 0.14649400000000001 0
		 -15.516353000000001 101.59100100000001 0.74986900000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_in_r" -p "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 10.392978668212891 0.78099298477172852 -9.2181854248046875 ;
	setAttr ".r" -type "double3" 2.2588726814303131e-006 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 -0.99891300000000005 -0.0208343 0
		 -0.147258 -0.0144794 0.98899199999999998 0 -0.98821899999999996 0.044313499999999999 -0.14649400000000001 0
		 -2.5934599999999999 84.670361 4.5566829999999996 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_bck_lwr_r" -p "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 6.2711038589477539 -10.753543853759766 -1.9884738922119141 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 -0.99891300000000005 -0.0208343 0
		 0.98821899999999996 -0.044313499999999999 0.14649400000000001 0 -0.147258 -0.0144794 0.98899199999999998 0
		 -7.8675439999999996 89.275141000000005 -7.8241149999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_fwd_lwr_r" -p "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.51321399211883545 7.3065204620361328 -0.82216364145278931 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 -0.99891300000000005 -0.0208343 0
		 -0.98821899999999996 0.044313499999999999 -0.14649400000000001 0 0.147258 0.0144794 -0.98899199999999998 0
		 -11.396661 95.842267000000007 10.007637000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_l" -p "|Quinn|root|pelvis";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "blendParent1" -ln "blendParent1" -dt "string";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.2319915294647217 -0.06803150475025177 -11.154585838317871 ;
	setAttr ".r" -type "double3" 8.4754687071906272 -2.3901870130953 -4.7974923524481259 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 0.99891300000000005 0.0208343 0
		 -0.147258 0.0144794 -0.98899199999999998 0 -0.98821899999999996 -0.044313499999999999 0.14649400000000001 0
		 11.154586 95.471891999999997 2.6504470000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".blendParent1" -type "string" "1.000000";
	setAttr ".fbxID" 5;
createNode joint -n "calf_l" -p "|Quinn|root|pelvis|thigh_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -45.752037048339844 3.1086244689504383e-015 3.5527136788005009e-015 ;
	setAttr ".r" -type "double3" 0 0 -1.0934579619251561 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.038886799999999999 0.99845499999999998 0.039703700000000001 0
		 -0.14802699999999999 0.033539300000000001 -0.98841400000000001 0 -0.98821899999999996 -0.044313499999999999 0.14649400000000001 0
		 13.062652999999999 49.769599999999997 1.697236 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "foot_l" -p "|Quinn|root|pelvis|thigh_l|calf_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -41.705421447753906 4.4408920985006262e-016 -1.7763568394002505e-015 ;
	setAttr ".r" -type "double3" 0.0051126536856260481 2.539826615900501 0.11379509111340619 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0046495299999999998 0.999502 0.031211800000000001 0
		 -0.148037 0.0315562 -0.98847799999999997 0 -0.98897100000000004 -2.4554700000000001e-005 0.14810999999999999 0
		 14.684443 8.1286330000000007 0.041375099999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ball_l" -p "|Quinn|root|pelvis|thigh_l|calf_l|foot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -6.5367622375488281 -13.629229545593262 0.043890230357646942 ;
	setAttr ".r" -type "double3" 0 0 -90.000000000000014 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.148037 -0.0315562 0.98847799999999997 0 0.0046495299999999998 0.999502 0.031211800000000001 0
		 -0.98897100000000004 -2.4554700000000001e-005 0.14810999999999999 0 16.628281000000001 1.1650389999999999 13.316048 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ankle_bck_l" -p "|Quinn|root|pelvis|thigh_l|calf_l|foot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.77887719869613647 3.3797261714935303 -0.35025531053543091 ;
	setAttr ".r" -type "double3" -97.228839501486391 -4.1793485300993209 -3.9848641766103801 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.057188799999999998 0.99224500000000004 0.110357 0
		 0.99812199999999995 0.059253199999999999 -0.0155158 0 -0.021934499999999999 0.109263 -0.99377099999999996 0
		 14.534129999999999 9.0137820000000008 -3.3269769999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ankle_fwd_l" -p "|Quinn|root|pelvis|thigh_l|calf_l|foot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.3916950225830078 -4.0441474914550781 -0.23252701759338379 ;
	setAttr ".r" -type "double3" 82.771160498513609 -4.1793485300993227 -3.9848641766103818 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.057188799999999998 0.99224500000000004 0.110357 0
		 -0.99812199999999995 -0.059253199999999999 0.0155158 0 0.021934499999999999 -0.109263 0.99377099999999996 0
		 15.519560999999999 9.392023 4.0479240000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twist_02_l" -p "|Quinn|root|pelvis|thigh_l|calf_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -13.901806831359863 -9.0725407062564045e-006 -0.050047211349010468 ;
	setAttr ".r" -type "double3" 0.0050312530041799414 -0.28321279513104031 0.11354327747809669 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 0.99828799999999995 0.038468599999999999 0
		 -0.148036 0.031556300000000002 -0.98847799999999997 0 -0.98799999999999999 -0.049251400000000001 0.14639199999999999 0
		 13.652709 35.891494999999999 1.1379589999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twistCor_02_l" -p "|Quinn|root|pelvis|thigh_l|calf_l|calf_twist_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.6843418860808015e-014 -2.6645352591003757e-015 7.1054273576010019e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 0.99828799999999995 0.038468599999999999 0
		 -0.148036 0.031556300000000002 -0.98847799999999997 0 -0.98799999999999999 -0.049251400000000001 0.14639199999999999 0
		 13.652709 35.891494999999999 1.1379589999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_twist_01_l" -p "|Quinn|root|pelvis|thigh_l|calf_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -27.803615570068359 -9.7460151664563455e-006 -0.10004657506942749 ;
	setAttr ".r" -type "double3" 0.0050312530041799414 -0.28321279513104031 0.11354327747809669 ;
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.044064300000000001 0.99828799999999995 0.038468599999999999 0
		 -0.148036 0.031556300000000002 -0.98847799999999997 0 -0.98799999999999999 -0.049251400000000001 0.14639199999999999 0
		 14.242716 22.013387000000002 0.57868200000000003 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_correctiveRoot_l" -p "|Quinn|root|pelvis|thigh_l|calf_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.4940447101707832e-007 -7.8276489148265682e-006 -4.4586871808860451e-005 ;
	setAttr ".r" -type "double3" 0.0055160494694875325 -0.20606043342954136 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 0.99999999999999956 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.042440600000000002 0.99828899999999998 0.040230299999999997 0
		 -0.148122 0.033534700000000001 -0.98839999999999995 0 -0.98805799999999999 -0.0479073 0.14644499999999999 0
		 13.062697999999999 49.769601999999999 1.6972370000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_kneeBack_l" -p "|Quinn|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.25936487317085266 5.2346658706665039 0.3111952543258667 ;
	setAttr ".r" -type "double3" -87.809315223536359 -0.63887652912769677 -2.8097805136317739 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046143499999999997 0.99484899999999998 0.090260999999999994 0
		 0.98114800000000002 0.062111600000000003 -0.183003 0 -0.187666 0.080115000000000006 -0.97896000000000005 0
		 11.968843 50.189157000000002 -3.4207019999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "calf_knee_l" -p "|Quinn|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.045141357928514481 -4.622032642364502 0.1243283748626709 ;
	setAttr ".r" -type "double3" 92.190684776463655 -0.63887652912769843 -2.8097805136317802 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046143499999999997 0.99484899999999998 0.090260999999999994 0
		 -0.98114800000000002 -0.062111600000000003 0.183003 0 0.187666 -0.080115000000000006 0.97896000000000005 0
		 13.622563 49.653711000000001 6.285679 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twist_01_l" -p "|Quinn|root|pelvis|thigh_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -15.250678062438965 -2.8001988994219573e-006 -1.5947238352964632e-005 ;
	setAttr ".r" -type "double3" -0.00013174493730826561 -0.28325887367358044 0.05329692318545539 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 0.99869399999999997 0.020638299999999998 0
		 -0.14721699999999999 0.013550299999999999 -0.98901099999999997 0 -0.98799999999999999 -0.049251400000000001 0.14639099999999999 0
		 11.790623999999999 80.237796000000003 2.3327100000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twistCor_01_l" -p "|Quinn|root|pelvis|thigh_l|thigh_twist_01_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.8421709430404007e-014 0 8.8817841970012523e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 0.99869399999999997 0.020638299999999998 0
		 -0.14721699999999999 0.013550299999999999 -0.98901099999999997 0 -0.98799999999999999 -0.049251400000000001 0.14639099999999999 0
		 11.790623999999999 80.237796000000003 2.3327100000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twist_02_l" -p "|Quinn|root|pelvis|thigh_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -30.50135612487793 -5.6003977988439146e-006 -3.1894476705929264e-005 ;
	setAttr ".r" -type "double3" -0.00013174493743412023 -0.28325887367357994 0.053296923185455689 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 0.99869399999999997 0.020638299999999998 0
		 -0.14721699999999999 0.013550299999999999 -0.98901099999999997 0 -0.98799999999999999 -0.049251400000000001 0.14639099999999999 0
		 12.426663 65.003699999999995 2.014974 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_twistCor_02_l" -p "|Quinn|root|pelvis|thigh_l|thigh_twist_02_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.4210854715202004e-014 -4.4408920985006262e-016 -5.3290705182007514e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.046726499999999997 0.99869399999999997 0.020638299999999998 0
		 -0.14721699999999999 0.013550299999999999 -0.98901099999999997 0 -0.98799999999999999 -0.049251400000000001 0.14639099999999999 0
		 12.426663 65.003699999999995 2.014974 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_correctiveRoot_l" -p "|Quinn|root|pelvis|thigh_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -8.5265128291212022e-014 -8.8817841970012523e-016 3.5527136788005009e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 0.99891300000000005 0.0208343 0
		 -0.147258 0.0144794 -0.98899199999999998 0 -0.98821899999999996 -0.044313499999999999 0.14649400000000001 0
		 11.154586 95.471891999999997 2.6504470000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_bck_l" -p "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.829533576965332 11.165069580078125 2.3064827919006348 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 0.99891300000000005 0.0208343 0
		 0.98821899999999996 0.044313499999999999 -0.14649400000000001 0 -0.147258 0.0144794 -0.98899199999999998 0
		 7.0714249999999996 99.356717000000003 -7.9740479999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_fwd_l" -p "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 6.3224773406982422 -7.665837287902832 0.92602241039276123 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 0.99891300000000005 0.0208343 0
		 -0.98821899999999996 -0.044313499999999999 0.14649400000000001 0 0.147258 -0.0144794 0.98899199999999998 0
		 11.104651 101.635464 10.499281 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_out_l" -p "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.8887014389038086 1.310673713684082 -4.8734512329101563 ;
	setAttr ".r" -type "double3" 179.99999999999994 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 0.99891300000000005 0.0208343 0
		 0.147258 -0.0144794 0.98899199999999998 0 0.98821899999999996 0.044313499999999999 -0.14649400000000001 0
		 15.532028 101.589129 0.76295800000000003 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_bck_lwr_l" -p "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -6.0062942504882812 10.673176765441895 1.5781238079071045 ;
	setAttr ".r" -type "double3" -90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 0.99891300000000005 0.0208343 0
		 0.98821899999999996 0.044313499999999999 -0.14649400000000001 0 -0.147258 0.0144794 -0.98899199999999998 0
		 8.2738370000000003 89.556736999999998 -7.7991929999999998 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_in_l" -p "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -10.327433586120605 -0.84474974870681763 9.1944475173950195 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 0.99891300000000005 0.0208343 0
		 -0.147258 0.0144794 -0.98899199999999998 0 -0.98821899999999996 -0.044313499999999999 0.14649400000000001 0
		 2.6235590000000002 84.736018000000001 4.6176620000000002 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "thigh_fwd_lwr_l" -p "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.4271838366985321 -7.8435912132263184 0.73839187622070313 ;
	setAttr ".r" -type "double3" 90.000000000000014 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" -0.041704499999999999 0.99891300000000005 0.0208343 0
		 -0.98821899999999996 -0.044313499999999999 0.14649400000000001 0 0.147258 -0.0144794 0.98899199999999998 0
		 11.562106999999999 95.752320999999995 10.524767000000001 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "ik_foot_root" -p "|Quinn|root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_foot_l" -p "|Quinn|root|ik_foot_root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" 14.711810111999512 -0.041452370584011078 8.1437892913818359 ;
	setAttr ".r" -type "double3" 65.811926104294187 -89.334715222394976 -60.618624010004865 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999978 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.00569667 0.99993299999999996 0.010117599999999999 0
		 -0.090485999999999997 0.0105918 -0.99584099999999998 0 -0.99588100000000002 0.0047574699999999998 0.090540200000000001 0
		 14.71181 8.1437889999999999 0.0414524 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_foot_r" -p "|Quinn|root|ik_foot_root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" -14.711830139160156 -0.041416238993406296 8.1437873840332031 ;
	setAttr ".r" -type "double3" -114.1877119832894 89.334717284087205 60.61901644698159 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1.0000000000000004 0.99999999999999989 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.0056965799999999997 -0.99993299999999996 -0.0101177 0
		 -0.090485499999999996 -0.0105918 0.99584099999999998 0 -0.99588100000000002 -0.0047573900000000002 -0.090539700000000001 0
		 -14.711830000000001 8.1437869999999997 0.0414162 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_hand_root" -p "|Quinn|root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_hand_gun" -p "|Quinn|root|ik_hand_root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" -45.554889678955078 -14.400569915771484 105.64070129394531 ;
	setAttr ".r" -type "double3" 71.656260217610267 -51.607202035610754 34.77041895495254 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1.0000000000000002 1 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.51015699999999997 0.78377200000000002 -0.35417799999999999 0
		 -0.79058899999999999 0.58949099999999999 0.165741 0 0.33868799999999999 0.19545499999999999 0.92037400000000003 0
		 -45.55489 105.64070100000001 14.40057 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_hand_l" -p "|Quinn|root|ik_hand_root|ik_hand_gun";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" 46.480350494384766 -72.030532836914063 30.857639312744141 ;
	setAttr ".r" -type "double3" -145.2020987720432 -20.216507801115316 -120.72764770353569 ;
	setAttr ".s" -type "double3" 0.99999999999999967 1 0.99999999999999967 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.51015699999999997 -0.783771 0.35417799999999999 0
		 -0.79058799999999996 -0.58949099999999999 -0.165741 0 0.33868799999999999 -0.19545499999999999 -0.92037400000000003 0
		 45.555014 105.64060499999999 14.400378999999999 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "ik_hand_r" -p "|Quinn|root|ik_hand_root|ik_hand_gun";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -is true -ci true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" -dt "string";
	setAttr ".t" -type "double3" -1.4210854715202004e-014 -1.4210854715202004e-014 -7.1054273576010019e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 0.51015699999999997 0.78377200000000002 -0.35417799999999999 0
		 -0.79058899999999999 0.58949099999999999 0.165741 0 0.33868799999999999 0.19545499999999999 0.92037400000000003 0
		 -45.55489 105.64070100000001 14.40057 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr -k on ".filmboxTypeID" -type "string" "5";
createNode joint -n "interaction" -p "|Quinn|root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.7763568394002505e-015 1.8735013540549517e-016 3.5527136788005009e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;
createNode joint -n "center_of_mass" -p "|Quinn|root";
	addAttr -is true -ci true -k true -sn "lockInfluenceWeights" -ln "lockInfluenceWeights" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.7763568394002505e-015 1.8735013540549517e-016 3.5527136788005009e-015 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0 -1 0 0 1 0 0 0 0 0 1;
	setAttr -k on ".lockInfluenceWeights";
	setAttr ".fbxID" 5;

connectAttr "Mannequin.s" "|Mannequin|root.is";
connectAttr "|Mannequin|root.s" "|Mannequin|root|pelvis.is";
connectAttr "|Mannequin|root|pelvis.s" "|Mannequin|root|pelvis|spine_01.is";
connectAttr "|Mannequin|root|pelvis|spine_01.s" "|Mannequin|root|pelvis|spine_01|spine_02.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_01_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_01_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_01_l|index_02_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_01_l|index_02_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_01_l|index_02_l|index_03_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_01_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_01_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_01_l|middle_02_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_01_l|middle_02_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_01_l|middle_02_l|middle_03_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_01_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_01_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_01_l|pinky_02_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_01_l|pinky_02_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_01_l|pinky_02_l|pinky_03_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_01_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_01_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_01_l|ring_02_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_01_l|ring_02_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_01_l|ring_02_l|ring_03_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l|thumb_03_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|lowerarm_l|lowerarm_twist_01_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_l|upperarm_l|upperarm_twist_01_l.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_01_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_01_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_01_r|index_02_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_01_r|index_02_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_01_r|index_02_r|index_03_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_01_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_01_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_01_r|middle_02_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_01_r|middle_02_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_01_r|middle_02_r|middle_03_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_01_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_01_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_01_r|pinky_02_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_01_r|pinky_02_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_01_r|pinky_02_r|pinky_03_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_01_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_01_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_01_r|ring_02_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_01_r|ring_02_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_01_r|ring_02_r|ring_03_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r|thumb_03_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|lowerarm_r|lowerarm_twist_01_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|clavicle_r|upperarm_r|upperarm_twist_01_r.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|neck_01.is"
		;
connectAttr "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|neck_01.s" "|Mannequin|root|pelvis|spine_01|spine_02|spine_03|neck_01|head.is"
		;
connectAttr "|Mannequin|root|pelvis.s" "|Mannequin|root|pelvis|thigh_l.is";
connectAttr "|Mannequin|root|pelvis|thigh_l.s" "|Mannequin|root|pelvis|thigh_l|calf_l.is"
		;
connectAttr "|Mannequin|root|pelvis|thigh_l|calf_l.s" "|Mannequin|root|pelvis|thigh_l|calf_l|calf_twist_01_l.is"
		;
connectAttr "|Mannequin|root|pelvis|thigh_l|calf_l.s" "|Mannequin|root|pelvis|thigh_l|calf_l|foot_l.is"
		;
connectAttr "|Mannequin|root|pelvis|thigh_l|calf_l|foot_l.s" "|Mannequin|root|pelvis|thigh_l|calf_l|foot_l|ball_l.is"
		;
connectAttr "|Mannequin|root|pelvis|thigh_l.s" "|Mannequin|root|pelvis|thigh_l|thigh_twist_01_l.is"
		;
connectAttr "|Mannequin|root|pelvis.s" "|Mannequin|root|pelvis|thigh_r.is";
connectAttr "|Mannequin|root|pelvis|thigh_r.s" "|Mannequin|root|pelvis|thigh_r|calf_r.is"
		;
connectAttr "|Mannequin|root|pelvis|thigh_r|calf_r.s" "|Mannequin|root|pelvis|thigh_r|calf_r|calf_twist_01_r.is"
		;
connectAttr "|Mannequin|root|pelvis|thigh_r|calf_r.s" "|Mannequin|root|pelvis|thigh_r|calf_r|foot_r.is"
		;
connectAttr "|Mannequin|root|pelvis|thigh_r|calf_r|foot_r.s" "|Mannequin|root|pelvis|thigh_r|calf_r|foot_r|ball_r.is"
		;
connectAttr "|Mannequin|root|pelvis|thigh_r.s" "|Mannequin|root|pelvis|thigh_r|thigh_twist_01_r.is"
		;
connectAttr "|Mannequin|root.s" "|Mannequin|root|ik_foot_root.is";
connectAttr "|Mannequin|root|ik_foot_root.s" "|Mannequin|root|ik_foot_root|ik_foot_l.is"
		;
connectAttr "|Mannequin|root|ik_foot_root.s" "|Mannequin|root|ik_foot_root|ik_foot_r.is"
		;
connectAttr "|Mannequin|root.s" "|Mannequin|root|ik_hand_root.is";
connectAttr "|Mannequin|root|ik_hand_root.s" "|Mannequin|root|ik_hand_root|ik_hand_gun.is"
		;
connectAttr "|Mannequin|root|ik_hand_root|ik_hand_gun.s" "|Mannequin|root|ik_hand_root|ik_hand_gun|ik_hand_l.is"
		;
connectAttr "|Mannequin|root|ik_hand_root|ik_hand_gun.s" "|Mannequin|root|ik_hand_root|ik_hand_gun|ik_hand_r.is"
		;
connectAttr "Manny.s" "|Manny|root.is";
connectAttr "|Manny|root.s" "|Manny|root|pelvis.is";
connectAttr "|Manny|root|pelvis.s" "|Manny|root|pelvis|spine_01.is";
connectAttr "|Manny|root|pelvis|spine_01.s" "|Manny|root|pelvis|spine_01|spine_02.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01|neck_02.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01|neck_02.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01|neck_02|head.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_twist_02_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_twist_01_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l|lowerarm_in_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l|lowerarm_out_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l|lowerarm_fwd_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l|lowerarm_bck_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|wrist_inner_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|wrist_outer_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l|index_02_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l|index_02_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l|index_02_l|index_03_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l|middle_02_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l|middle_02_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l|middle_02_l|middle_03_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l|thumb_03_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l|pinky_02_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l|pinky_02_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l|pinky_02_l|pinky_03_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l|ring_02_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l|ring_02_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l|ring_02_l|ring_03_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|weapon_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_01_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_01_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_01_l|upperarm_twistCor_01_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l|upperarm_tricep_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l|upperarm_bicep_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l|upperarm_twistCor_02_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l|upperarm_bck_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l|upperarm_fwd_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l|upperarm_in_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l|upperarm_out_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|clavicle_out_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|clavicle_scap_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_twist_02_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_twist_01_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r|lowerarm_out_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r|lowerarm_in_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r|lowerarm_fwd_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r|lowerarm_bck_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|wrist_inner_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|wrist_outer_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r|pinky_02_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r|pinky_02_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r|pinky_02_r|pinky_03_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r|ring_02_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r|ring_02_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r|ring_02_r|ring_03_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r|middle_02_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r|middle_02_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r|middle_02_r|middle_03_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r|index_02_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r|index_02_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r|index_02_r|index_03_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r|thumb_03_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|weapon_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_01_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_01_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_01_r|upperarm_twistCor_01_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r|upperarm_tricep_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r|upperarm_bicep_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r|upperarm_twistCor_02_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r|upperarm_bck_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r|upperarm_in_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r|upperarm_fwd_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r|upperarm_out_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|clavicle_out_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|clavicle_scap_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_pec_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|spine_04_latissimus_l.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|spine_04_latissimus_r.is"
		;
connectAttr "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Manny|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_pec_l.is"
		;
connectAttr "|Manny|root|pelvis.s" "|Manny|root|pelvis|thigh_r.is";
connectAttr "|Manny|root|pelvis|thigh_r.s" "|Manny|root|pelvis|thigh_r|calf_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|calf_r.s" "|Manny|root|pelvis|thigh_r|calf_r|foot_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|calf_r|foot_r.s" "|Manny|root|pelvis|thigh_r|calf_r|foot_r|ball_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|calf_r|foot_r.s" "|Manny|root|pelvis|thigh_r|calf_r|foot_r|ankle_fwd_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|calf_r|foot_r.s" "|Manny|root|pelvis|thigh_r|calf_r|foot_r|ankle_bck_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|calf_r.s" "|Manny|root|pelvis|thigh_r|calf_r|calf_twist_02_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|calf_r|calf_twist_02_r.s" "|Manny|root|pelvis|thigh_r|calf_r|calf_twist_02_r|calf_twistCor_02_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|calf_r.s" "|Manny|root|pelvis|thigh_r|calf_r|calf_twist_01_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|calf_r.s" "|Manny|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r.s" "|Manny|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r|calf_kneeBack_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r.s" "|Manny|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r|calf_knee_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r.s" "|Manny|root|pelvis|thigh_r|thigh_twist_01_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|thigh_twist_01_r.s" "|Manny|root|pelvis|thigh_r|thigh_twist_01_r|thigh_twistCor_01_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r.s" "|Manny|root|pelvis|thigh_r|thigh_twist_02_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|thigh_twist_02_r.s" "|Manny|root|pelvis|thigh_r|thigh_twist_02_r|thigh_twistCor_02_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r.s" "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_fwd_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_bck_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_out_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_in_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_bck_lwr_r.is"
		;
connectAttr "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Manny|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_fwd_lwr_r.is"
		;
connectAttr "|Manny|root|pelvis.s" "|Manny|root|pelvis|thigh_l.is";
connectAttr "|Manny|root|pelvis|thigh_l.s" "|Manny|root|pelvis|thigh_l|calf_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|calf_l.s" "|Manny|root|pelvis|thigh_l|calf_l|foot_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|calf_l|foot_l.s" "|Manny|root|pelvis|thigh_l|calf_l|foot_l|ball_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|calf_l|foot_l.s" "|Manny|root|pelvis|thigh_l|calf_l|foot_l|ankle_bck_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|calf_l|foot_l.s" "|Manny|root|pelvis|thigh_l|calf_l|foot_l|ankle_fwd_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|calf_l.s" "|Manny|root|pelvis|thigh_l|calf_l|calf_twist_02_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|calf_l|calf_twist_02_l.s" "|Manny|root|pelvis|thigh_l|calf_l|calf_twist_02_l|calf_twistCor_02_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|calf_l.s" "|Manny|root|pelvis|thigh_l|calf_l|calf_twist_01_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|calf_l.s" "|Manny|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l.s" "|Manny|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l|calf_kneeBack_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l.s" "|Manny|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l|calf_knee_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l.s" "|Manny|root|pelvis|thigh_l|thigh_twist_01_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|thigh_twist_01_l.s" "|Manny|root|pelvis|thigh_l|thigh_twist_01_l|thigh_twistCor_01_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l.s" "|Manny|root|pelvis|thigh_l|thigh_twist_02_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|thigh_twist_02_l.s" "|Manny|root|pelvis|thigh_l|thigh_twist_02_l|thigh_twistCor_02_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l.s" "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_bck_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_fwd_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_out_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_bck_lwr_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_in_l.is"
		;
connectAttr "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Manny|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_fwd_lwr_l.is"
		;
connectAttr "|Manny|root.s" "|Manny|root|ik_foot_root.is";
connectAttr "|Manny|root|ik_foot_root.s" "|Manny|root|ik_foot_root|ik_foot_l.is"
		;
connectAttr "|Manny|root|ik_foot_root.s" "|Manny|root|ik_foot_root|ik_foot_r.is"
		;
connectAttr "|Manny|root.s" "|Manny|root|ik_hand_root.is";
connectAttr "|Manny|root|ik_hand_root.s" "|Manny|root|ik_hand_root|ik_hand_gun.is"
		;
connectAttr "|Manny|root|ik_hand_root|ik_hand_gun.s" "|Manny|root|ik_hand_root|ik_hand_gun|ik_hand_l.is"
		;
connectAttr "|Manny|root|ik_hand_root|ik_hand_gun.s" "|Manny|root|ik_hand_root|ik_hand_gun|ik_hand_r.is"
		;
connectAttr "|Manny|root.s" "|Manny|root|interaction.is";
connectAttr "|Manny|root.s" "|Manny|root|center_of_mass.is";
connectAttr "Quinn.s" "|Quinn|root.is";
connectAttr "|Quinn|root.s" "|Quinn|root|pelvis.is";
connectAttr "|Quinn|root|pelvis.s" "|Quinn|root|pelvis|spine_01.is";
connectAttr "|Quinn|root|pelvis|spine_01.s" "|Quinn|root|pelvis|spine_01|spine_02.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01|neck_02.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01|neck_02.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|neck_01|neck_02|head.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_twist_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_twist_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l|lowerarm_in_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l|lowerarm_out_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l|lowerarm_fwd_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|lowerarm_correctiveRoot_l|lowerarm_bck_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l|middle_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l|middle_02_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|middle_metacarpal_l|middle_01_l|middle_02_l|middle_03_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l|pinky_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l|pinky_02_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|pinky_metacarpal_l|pinky_01_l|pinky_02_l|pinky_03_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l|ring_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l|ring_02_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|ring_metacarpal_l|ring_01_l|ring_02_l|ring_03_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|thumb_01_l|thumb_02_l|thumb_03_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l|index_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l|index_02_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|index_metacarpal_l|index_01_l|index_02_l|index_03_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|wrist_inner_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|wrist_outer_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|lowerarm_l|hand_l|weapon_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_01_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_01_l|upperarm_twistCor_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l|upperarm_tricep_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l|upperarm_bicep_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_twist_02_l|upperarm_twistCor_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l|upperarm_bck_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l|upperarm_fwd_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l|upperarm_in_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|upperarm_l|upperarm_correctiveRoot_l|upperarm_out_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|clavicle_out_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_l|clavicle_scap_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_twist_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_twist_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r|lowerarm_out_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r|lowerarm_in_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r|lowerarm_fwd_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|lowerarm_correctiveRoot_r|lowerarm_bck_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r|middle_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r|middle_02_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|middle_metacarpal_r|middle_01_r|middle_02_r|middle_03_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r|pinky_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r|pinky_02_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|pinky_metacarpal_r|pinky_01_r|pinky_02_r|pinky_03_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r|ring_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r|ring_02_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|ring_metacarpal_r|ring_01_r|ring_02_r|ring_03_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|thumb_01_r|thumb_02_r|thumb_03_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r|index_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r|index_02_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|index_metacarpal_r|index_01_r|index_02_r|index_03_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|wrist_inner_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|wrist_outer_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|lowerarm_r|hand_r|weapon_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_01_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_01_r|upperarm_twistCor_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r|upperarm_tricep_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r|upperarm_bicep_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_twist_02_r|upperarm_twistCor_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r|upperarm_bck_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r|upperarm_in_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r|upperarm_fwd_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|upperarm_r|upperarm_correctiveRoot_r|upperarm_out_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|clavicle_out_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_r|clavicle_scap_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_pec_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|spine_04_latissimus_l.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|spine_04_latissimus_r.is"
		;
connectAttr "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05.s" "|Quinn|root|pelvis|spine_01|spine_02|spine_03|spine_04|spine_05|clavicle_pec_l.is"
		;
connectAttr "|Quinn|root|pelvis.s" "|Quinn|root|pelvis|thigh_r.is";
connectAttr "|Quinn|root|pelvis|thigh_r.s" "|Quinn|root|pelvis|thigh_r|calf_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|calf_r.s" "|Quinn|root|pelvis|thigh_r|calf_r|foot_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|calf_r|foot_r.s" "|Quinn|root|pelvis|thigh_r|calf_r|foot_r|ball_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|calf_r|foot_r.s" "|Quinn|root|pelvis|thigh_r|calf_r|foot_r|ankle_bck_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|calf_r|foot_r.s" "|Quinn|root|pelvis|thigh_r|calf_r|foot_r|ankle_fwd_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|calf_r.s" "|Quinn|root|pelvis|thigh_r|calf_r|calf_twist_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|calf_r|calf_twist_02_r.s" "|Quinn|root|pelvis|thigh_r|calf_r|calf_twist_02_r|calf_twistCor_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|calf_r.s" "|Quinn|root|pelvis|thigh_r|calf_r|calf_twist_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|calf_r.s" "|Quinn|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r.s" "|Quinn|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r|calf_kneeBack_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r.s" "|Quinn|root|pelvis|thigh_r|calf_r|calf_correctiveRoot_r|calf_knee_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r.s" "|Quinn|root|pelvis|thigh_r|thigh_twist_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|thigh_twist_01_r.s" "|Quinn|root|pelvis|thigh_r|thigh_twist_01_r|thigh_twistCor_01_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r.s" "|Quinn|root|pelvis|thigh_r|thigh_twist_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|thigh_twist_02_r.s" "|Quinn|root|pelvis|thigh_r|thigh_twist_02_r|thigh_twistCor_02_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r.s" "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_fwd_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_bck_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_out_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_in_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_bck_lwr_r.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r.s" "|Quinn|root|pelvis|thigh_r|thigh_correctiveRoot_r|thigh_fwd_lwr_r.is"
		;
connectAttr "|Quinn|root|pelvis.s" "|Quinn|root|pelvis|thigh_l.is";
connectAttr "|Quinn|root|pelvis|thigh_l.s" "|Quinn|root|pelvis|thigh_l|calf_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|calf_l.s" "|Quinn|root|pelvis|thigh_l|calf_l|foot_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|calf_l|foot_l.s" "|Quinn|root|pelvis|thigh_l|calf_l|foot_l|ball_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|calf_l|foot_l.s" "|Quinn|root|pelvis|thigh_l|calf_l|foot_l|ankle_bck_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|calf_l|foot_l.s" "|Quinn|root|pelvis|thigh_l|calf_l|foot_l|ankle_fwd_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|calf_l.s" "|Quinn|root|pelvis|thigh_l|calf_l|calf_twist_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|calf_l|calf_twist_02_l.s" "|Quinn|root|pelvis|thigh_l|calf_l|calf_twist_02_l|calf_twistCor_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|calf_l.s" "|Quinn|root|pelvis|thigh_l|calf_l|calf_twist_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|calf_l.s" "|Quinn|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l.s" "|Quinn|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l|calf_kneeBack_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l.s" "|Quinn|root|pelvis|thigh_l|calf_l|calf_correctiveRoot_l|calf_knee_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l.s" "|Quinn|root|pelvis|thigh_l|thigh_twist_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|thigh_twist_01_l.s" "|Quinn|root|pelvis|thigh_l|thigh_twist_01_l|thigh_twistCor_01_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l.s" "|Quinn|root|pelvis|thigh_l|thigh_twist_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|thigh_twist_02_l.s" "|Quinn|root|pelvis|thigh_l|thigh_twist_02_l|thigh_twistCor_02_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l.s" "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_bck_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_fwd_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_out_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_bck_lwr_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_in_l.is"
		;
connectAttr "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l.s" "|Quinn|root|pelvis|thigh_l|thigh_correctiveRoot_l|thigh_fwd_lwr_l.is"
		;
connectAttr "|Quinn|root.s" "|Quinn|root|ik_foot_root.is";
connectAttr "|Quinn|root|ik_foot_root.s" "|Quinn|root|ik_foot_root|ik_foot_l.is"
		;
connectAttr "|Quinn|root|ik_foot_root.s" "|Quinn|root|ik_foot_root|ik_foot_r.is"
		;
connectAttr "|Quinn|root.s" "|Quinn|root|ik_hand_root.is";
connectAttr "|Quinn|root|ik_hand_root.s" "|Quinn|root|ik_hand_root|ik_hand_gun.is"
		;
connectAttr "|Quinn|root|ik_hand_root|ik_hand_gun.s" "|Quinn|root|ik_hand_root|ik_hand_gun|ik_hand_l.is"
		;
connectAttr "|Quinn|root|ik_hand_root|ik_hand_gun.s" "|Quinn|root|ik_hand_root|ik_hand_gun|ik_hand_r.is"
		;
connectAttr "|Quinn|root.s" "|Quinn|root|interaction.is";
connectAttr "|Quinn|root.s" "|Quinn|root|center_of_mass.is";

// End of asUnreal.ma
