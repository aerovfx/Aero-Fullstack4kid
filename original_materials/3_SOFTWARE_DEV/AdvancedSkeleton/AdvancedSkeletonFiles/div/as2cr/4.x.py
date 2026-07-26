# AdvancedSkeleton To ControlRig
#	Copyright (C) Animation Studios
# email: support@animationstudios.com.au
# exported using AdvancedSkeleton version:x.xx
import unreal
import re

engineVersion = unreal.SystemLibrary.get_engine_version()
asExportVersion = x.xx
asExportTemplate = '4x'
print ('AdvancedSkeleton To ControlRig (Unreal:'+engineVersion+') (AsExport:'+str(asExportVersion)+') (Template:'+asExportTemplate+')')
utilityBase = unreal.GlobalEditorUtilityBase.get_default_object()
selectedAssets = utilityBase.get_selected_assets()
if len(selectedAssets)<1:
	raise Exception('Nothing selected, you must select a ControlRig')
selectedAsset = selectedAssets[0]
if selectedAsset.get_class().get_name() != 'ControlRigBlueprint':
	raise Exception('Selected object is not a ControlRigBlueprint, you must select a ControlRigBlueprint')
ControlRigBlueprint = selectedAsset
HierarchyModifier = ControlRigBlueprint.get_hierarchy_modifier()
try:
	RigVMController = ControlRigBlueprint.get_editor_property('controller') #UE4
except:
	RigVMController = ControlRigBlueprint.get_controller() #UE5
PreviousArrayInfo = dict()
global ASCtrlNr
global PreviousEndPlug
global PreviousEndPlugInv
global PreviousYInv
global sp
global nonTransformFaceCtrlNr
ASCtrlNr = 0
PreviousYInv = 0
nonTransformFaceCtrlNr = -1
sp = '/Script/ControlRig.RigUnit_'
PreviousEndPlug = 'RigUnit_BeginExecution.ExecuteContext'
PreviousEndPlugInv = 'RigUnit_InverseExecution.ExecuteContext'

def asAddCtrl (name, parent, joint, type, arrayInfo, gizmoName, ws, size, offT, color):
	global PreviousEndPlug
	global PreviousEndPlugInv
	global PreviousArrayInfo
	global ctrlBoxSize
	global ASCtrlNr
	global nonTransformFaceCtrlNr
	endPlug = name+'_CON.ExecuteContext'
	RigVMGraph = ControlRigBlueprint.model
	numNodes = len(RigVMGraph.get_nodes())
	y = ASCtrlNr*400
	ASCtrlNr=ASCtrlNr+1
	ASDrivenNr = int()
	RootScale = unreal.Vector(x=1.0, y=1.0, z=1.0)
	ParentRigBone = unreal.RigBone()
	ParentRigBoneName = parent.replace("FK", "")
	hasCon = True
	x = joint.split("_")
	if len(x)>1:
		baseName = x[0]
		side = '_'+x[1]
	x = ParentRigBoneName.split("_")
	if len(x)>1:
		ParentRigBoneBaseName = x[0]
	RigElementKeys = HierarchyModifier.get_elements()
	for key in RigElementKeys:
		if (key.name == 'Root_M'):
			RootScale = HierarchyModifier.get_bone (key).get_editor_property('global_transform').scale3d
		if (key.name == ParentRigBoneName):
			if (key.type == 1):#Bone
				ParentRigBone = HierarchyModifier.get_bone (key)
	RigControl = asAddController (name, parent, joint, type, gizmoName, ws, size, offT, color)
	if name=='Main':
		return

	#GT
	GT = asAddNode (sp+'GetTransform','Execute',node_name=name+'_GT')
	RigVMController.set_node_position (GT, [-500, y])
	RigVMController.set_pin_default_value(name+'_GT.Item.Type','Control')
	RigVMController.set_pin_default_value(name+'_GT.Item.Name',name)

	if name=='RootX_M':
		#CON
		CON = asAddNode (sp+'TransformConstraintPerItem','Execute',node_name=name+'_CON')
		RigVMController.set_node_position (CON, [100, y-90])
		RigVMController.set_pin_default_value(name+'_CON.Item.Type','Bone')
		RigVMController.set_pin_default_value(name+'_CON.Item.Name',joint)
		RigVMController.add_array_pin(name+'_CON.Targets')
		RigVMController.add_link(name+'_GT.Transform' , name+'_CON.Targets.0.Transform')
		RigVMController.add_link(PreviousEndPlug , name+'_CON.ExecuteContext')
		endPlug = name+'_CON.ExecuteContext'
	else:
		#ST
		ST = asAddNode (sp+'SetTransform','Execute',node_name=name+'_ST')
		RigVMController.set_node_position (ST, [100, y])
		RigVMController.set_pin_default_value(name+'_ST.Item.Type','Bone')
		RigVMController.set_pin_default_value(name+'_ST.Item.Name',joint)
		RigVMController.add_link(name+'_GT.Transform' , name+'_ST.Transform')
		RigVMController.set_pin_default_value(name+'_ST.bPropagateToChildren','True')
		RigVMController.add_link(PreviousEndPlug , name+'_ST.ExecuteContext')
		endPlug = name+'_ST.ExecuteContext'

	if type=='FK':
		if "twistJoints" in PreviousArrayInfo:
			inbetweenJoints = int (PreviousArrayInfo["twistJoints"])

			key = HierarchyModifier.add_bone ('UnTwist'+ParentRigBoneName,parent_name=joint)
			UnTwistBone = HierarchyModifier.get_bone (key)
			UnTwistBone.set_editor_property('local_transform', unreal.Transform())
			asParent ('UnTwist'+ParentRigBoneName,'TwistSystem')
			asAlign (ParentRigBoneName,'UnTwist'+ParentRigBoneName)

			#GTParent
			constraintTo = str(ParentRigBone.get_editor_property('parent_name'))
			x = re.search("Part", constraintTo)
			if x:
				constraintTo = ParentRigBoneName
			GTParent = asAddNode (sp+'GetTransform','Execute',node_name=name+'_GTParent')
			RigVMController.set_node_position (GTParent, [600, y])
			RigVMController.set_pin_default_value(name+'_GTParent.Item.Type','Bone')
			RigVMController.set_pin_default_value(name+'_GTParent.Item.Name',constraintTo)

			#CONUnTwist
			CONUnTwist = asAddNode (sp+'TransformConstraintPerItem','Execute',node_name=name+'_CONUnTwist')
			RigVMController.set_node_position (CONUnTwist, [1000, y])
			RigVMController.set_pin_default_value(name+'_CONUnTwist.Item.Type','Bone')
			RigVMController.set_pin_default_value(name+'_CONUnTwist.Item.Name','UnTwist'+ParentRigBoneName)
			RigVMController.add_array_pin(name+'_CONUnTwist.Targets')
			RigVMController.add_link(name+'_GTParent.Transform' , name+'_CONUnTwist.Targets.0.Transform')
			RigVMController.add_link(endPlug , name+'_CONUnTwist.ExecuteContext')

			Items = asAddNode (sp+'CollectionItems','Execute',node_name=name+'_Items')
			RigVMController.set_node_position (Items, [1450, y])
			RigVMController.set_pin_default_value(name+'_Items.Items.0.Name','UnTwist'+ParentRigBoneName)
			for x in range(1,inbetweenJoints+3):
				RigVMController.add_array_pin(name+'_Items.Items')
				RigVMController.set_pin_default_value(name+'_Items.Items.'+str(x)+'.Name',ParentRigBoneBaseName+'Part'+str((x-1))+side)
				RigVMController.set_pin_default_value(name+'_Items.Items.'+str(x)+'.Type','Bone')
			RigVMController.set_pin_default_value(name+'_Items.Items.1.Name',ParentRigBoneName)
			RigVMController.set_pin_default_value(name+'_Items.Items.'+str((inbetweenJoints+2))+'.Name',joint)

			Twist = asAddNode (sp+'TwistBonesPerItem','Execute',node_name=name+'_Twist')
			RigVMController.set_node_position (Twist, [1750, y])
			RigVMController.add_link(name+'_Items.Collection' , name+'_Twist.Items')
			RigVMController.add_link(name+'_CONUnTwist.ExecuteContext' , name+'_Twist.ExecuteContext')
			endPlug = name+'_Twist.ExecuteContext'

		if "inbetweenJoints" in arrayInfo:
			inbetweenJoints = int (arrayInfo["inbetweenJoints"])
			Chain = asAddNode (sp+'CollectionChain','Execute',node_name=name+'_Chain')
			RigVMController.set_node_position (Chain, [1350, y])
			RigVMController.set_pin_default_value(name+'_Chain.FirstItem.Name',baseName+'Part1'+side)
			RigVMController.set_pin_default_value(name+'_Chain.LastItem.Name',baseName+'Part'+str(inbetweenJoints)+side)

			#GTDistr
			GTDistr = asAddNode (sp+'GetTransform','Execute',node_name=name+'_GTDistr')
			RigVMController.set_node_position (GTDistr, [1700, y])
			RigVMController.set_pin_default_value(name+'_GTDistr.Item.Type','Control')
			RigVMController.set_pin_default_value(name+'_GTDistr.Item.Name',name)
			RigVMController.set_pin_default_value(name+'_GTDistr.Space','LocalSpace')

			#Distr
			Distr = asAddNode (sp+'DistributeRotationForCollection','Execute',node_name=name+'_Distr')
			RigVMController.set_node_position (Distr, [2100, y])
			weight = (1.0 / inbetweenJoints)
			RigVMController.set_pin_default_value(name+'_Distr.Weight',str(weight))
			RigVMController.add_link(name+'_Chain.Collection' , name+'_Distr.Items')
			RigVMController.add_array_pin(name+'_Distr.Rotations')
			RigVMController.add_link(name+'_GTDistr.Transform.Rotation' , name+'_Distr.Rotations.0.Rotation')
			RigVMController.add_link(PreviousEndPlug , name+'_Distr.ExecuteContext')
			endPlug = name+'_Distr.ExecuteContext'

		if "inbetweenJoints" in PreviousArrayInfo:
			Transform = RigControl.get_editor_property('offset_transform')
			SpaceKey = HierarchyModifier.add_space ('Space'+joint)
			Space = HierarchyModifier.get_space (SpaceKey)
			Space.set_editor_property('initial_transform', Transform)
			HierarchyModifier.set_space (Space)
			RigControl.set_editor_property('offset_transform', unreal.Transform())
			HierarchyModifier.set_control (RigControl)
			asParent (name,'Space'+joint)
			asParent ('Space'+joint,parent)

			#GTSpace
			GTSpace = asAddNode (sp+'GetTransform','Execute',node_name=name+'_GTSpace')
			RigVMController.set_node_position (GTSpace, [600, y])
			RigVMController.set_pin_default_value(name+'_GTSpace.Item.Type','Bone')
			RigVMController.set_pin_default_value(name+'_GTSpace.Item.Name',joint)

			#STSpace
			STSpace = asAddNode (sp+'SetTransform','Execute',node_name=name+'_STSpace')
			RigVMController.set_node_position (STSpace, [950, y])
			RigVMController.set_pin_default_value(name+'_STSpace.Item.Type','Space')
			RigVMController.set_pin_default_value(name+'_STSpace.Item.Name','Space'+joint)
			RigVMController.add_link(name+'_GTSpace.Transform' , name+'_STSpace.Transform')
			RigVMController.set_pin_default_value(name+'_STSpace.bPropagateToChildren','True')
			RigVMController.add_link(PreviousEndPlug , name+'_STSpace.ExecuteContext')
			if not "inbetweenJoints" in arrayInfo:
				RigVMController.add_link(name+'_STSpace.ExecuteContext' , name+'_ST.ExecuteContext')
			else:
				RigVMController.add_link(name+'_STSpace.ExecuteContext' , name+'_Distr.ExecuteContext')

		if "global" in arrayInfo and float(arrayInfo["global"])==10:
			SpaceKey = HierarchyModifier.add_space ('Global'+name)
			SpaceObj = HierarchyModifier.get_space (SpaceKey)
			asParent ('Global'+name, parent)
			asAlign (name,'Global'+name)
			RigControl.set_editor_property('offset_transform', unreal.Transform())
			HierarchyModifier.set_control (RigControl)
			asParent (name,'Global'+name)

			PNPGlobal = asAddNode (sp+'ProjectTransformToNewParent','Execute',node_name=name+'_PNPGlobal')
			RigVMController.set_node_position (PNPGlobal, [-1200, y])
			RigVMController.set_pin_default_value(name+'_PNPGlobal.Child.Type','Control')
			RigVMController.set_pin_default_value(name+'_PNPGlobal.Child.Name',name)
			RigVMController.set_pin_default_value(name+'_PNPGlobal.OldParent.Type','Control')
			RigVMController.set_pin_default_value(name+'_PNPGlobal.OldParent.Name','Main')
			RigVMController.set_pin_default_value(name+'_PNPGlobal.NewParent.Type','Control')
			RigVMController.set_pin_default_value(name+'_PNPGlobal.NewParent.Name','Main')

			#SRGlobal
			SRGlobal = asAddNode (sp+'SetRotation','Execute',node_name=name+'_SRGlobal')
			RigVMController.set_node_position (SRGlobal, [-850, y])
			RigVMController.set_pin_default_value(name+'_SRGlobal.Item.Type','Space')
			RigVMController.set_pin_default_value(name+'_SRGlobal.Item.Name','Global'+name)
			RigVMController.set_pin_default_value(name+'_SRGlobal.bPropagateToChildren','True')
			RigVMController.add_link(name+'_PNPGlobal.Transform.Rotation' , name+'_SRGlobal.Rotation')
			RigVMController.add_link(PreviousEndPlug , name+'_SRGlobal.ExecuteContext')
	
			#STGlobal
			STGlobal = asAddNode (sp+'SetTranslation','Execute',node_name=name+'_STGlobal')
			RigVMController.set_node_position (STGlobal, [-850, y+250])
			RigVMController.set_pin_default_value(name+'_STGlobal.Item.Type','Space')
			RigVMController.set_pin_default_value(name+'_STGlobal.Item.Name','Global'+name)
			RigVMController.set_pin_default_value(name+'_STGlobal.Space','LocalSpace')
			RigVMController.set_pin_default_value(name+'_STGlobal.bPropagateToChildren','True')
			Transform = HierarchyModifier.get_initial_transform(SpaceKey)
			RigVMController.set_pin_default_value(name+'_STGlobal.Translation.X',str(Transform.translation.x))
			RigVMController.set_pin_default_value(name+'_STGlobal.Translation.Y',str(Transform.translation.y))
			RigVMController.set_pin_default_value(name+'_STGlobal.Translation.Z',str(Transform.translation.z))
			RigVMController.add_link(name+'_SRGlobal.ExecuteContext' , name+'_STGlobal.ExecuteContext')
#			RigVMController.add_link(name+'_STGlobal.ExecuteContext' , endPlug)
			RigVMController.add_link(name+'_STGlobal.ExecuteContext' , name+'_ST.ExecuteContext')

	if type=='IK':
		RigControl = asAddController ('Pole'+name, parent, joint, type, 'Box_Solid', ws, size/5.0, offT, color)
		RigControl.set_editor_property('offset_transform', unreal.Transform(location=[float(arrayInfo["ppX"])*RootScale.x,float(arrayInfo["ppZ"])*RootScale.y,float(arrayInfo["ppY"])*RootScale.z],scale=RootScale))
		HierarchyModifier.set_control (RigControl)

		#IK(Basic IK)
		IK = asAddNode (sp+'TwoBoneIKSimplePerItem','Execute',node_name=name+'_IK')
		RigVMController.set_node_position (IK, [600, y-130])
		RigVMController.set_pin_default_value(name+'_IK.ItemA.Name',arrayInfo["startJoint"])
		RigVMController.set_pin_default_value(name+'_IK.ItemB.Name',arrayInfo["middleJoint"])
		RigVMController.set_pin_default_value(name+'_IK.EffectorItem.Name',arrayInfo["endJoint"])
		RigVMController.set_pin_default_value(name+'_IK.PrimaryAxis.X',arrayInfo["paX"])
		RigVMController.set_pin_default_value(name+'_IK.PrimaryAxis.Y',arrayInfo["paY"])
		RigVMController.set_pin_default_value(name+'_IK.PrimaryAxis.Z',arrayInfo["paZ"])
		RigVMController.set_pin_default_value(name+'_IK.SecondaryAxis.X',arrayInfo["saX"])
		RigVMController.set_pin_default_value(name+'_IK.SecondaryAxis.Y',arrayInfo["paY"])
		RigVMController.set_pin_default_value(name+'_IK.SecondaryAxis.Z',arrayInfo["paZ"])
		RigVMController.set_pin_default_value(name+'_IK.PoleVectorKind','Location')
		RigVMController.set_pin_default_value(name+'_IK.PoleVectorSpace.Type','Control')
		RigVMController.set_pin_default_value(name+'_IK.PoleVectorSpace.Name','Pole'+name)
		RigVMController.set_pin_default_value(name+'_IK.bPropagateToChildren','True')
		RigVMController.add_link(name+'_GT.Transform' , name+'_IK.Effector')
		RigVMController.add_link(PreviousEndPlug , name+'_IK.ExecuteContext')
		endPlug = name+'_IK.ExecuteContext'

		#GTSpace
		GTSpace = asAddNode (sp+'GetTransform','Execute',node_name=name+'_GTSpace')
		RigVMController.set_node_position (GTSpace, [1000, y])
		RigVMController.set_pin_default_value(name+'_GTSpace.Item.Type','Bone')
		RigVMController.set_pin_default_value(name+'_GTSpace.Item.Name',arrayInfo["endJoint"])

		#modify _GT to use a local-oriented child of ws controller
		key = HierarchyModifier.add_control (name+'LS',parent_name=name)
		RigControl = HierarchyModifier.get_control (key)
		RigControl.set_editor_property('gizmo_enabled',False)
		HierarchyModifier.set_control (RigControl)
		RigVMController.set_pin_default_value(name+'_GT.Item.Name',name+'LS')

		for key in RigElementKeys:
			if (key.name == arrayInfo["endJoint"]):
				endJointObject = HierarchyModifier.get_bone (key)
		EndJointTransform = endJointObject.get_editor_property('global_transform')
		Rotation = EndJointTransform.rotation.rotator()
		Transform = unreal.Transform(location=[0,0,0],rotation=Rotation,scale=[1,1,1])
		RigControl.set_editor_property('offset_transform', Transform)
		HierarchyModifier.set_control (RigControl)

		#Backwards solve nodes (IK)
		PNPinvIK = asAddNode (sp+'ProjectTransformToNewParent','Execute',node_name=name+'_PNPinvIK')
		RigVMController.set_node_position (PNPinvIK, [-2900, y])
		RigVMController.set_pin_default_value(name+'_PNPinvIK.Child.Type','Control')
		RigVMController.set_pin_default_value(name+'_PNPinvIK.Child.Name',name)
		RigVMController.set_pin_default_value(name+'_PNPinvIK.OldParent.Type','Control')
		RigVMController.set_pin_default_value(name+'_PNPinvIK.OldParent.Name',name+'LS')
		RigVMController.set_pin_default_value(name+'_PNPinvIK.NewParent.Type','Bone')
		RigVMController.set_pin_default_value(name+'_PNPinvIK.NewParent.Name',joint)

		#STinvIK
		STinvIK = asAddNode (sp+'SetTransform','Execute',node_name=name+'_STinvIK')
		RigVMController.set_node_position (STinvIK, [-2500, y])
		RigVMController.set_pin_default_value(name+'_STinvIK.Item.Type','Control')
		RigVMController.set_pin_default_value(name+'_STinvIK.Item.Name',name)
		RigVMController.add_link(name+'_GTSpace.Transform' , name+'_STinvIK.Transform')
		RigVMController.set_pin_default_value(name+'_STinvIK.bPropagateToChildren','True')
		RigVMController.add_link(name+'_PNPinvIK.Transform' , name+'_STinvIK.Transform')
		RigVMController.add_link(PreviousEndPlugInv , name+'_STinvIK.ExecuteContext')

		#GTinvPole
		GTinvPole = asAddNode (sp+'GetTransform','Execute',node_name=name+'_GTinvPole')
		RigVMController.set_node_position (GTinvPole, [-1700, y])
		RigVMController.set_pin_default_value(name+'_GTinvPole.Item.Type','Bone')
		RigVMController.set_pin_default_value(name+'_GTinvPole.Item.Name',arrayInfo["middleJoint"])

		#STinvPole
		STinvPole = asAddNode (sp+'SetTransform','Execute',node_name=name+'_STinvPole')
		RigVMController.set_node_position (STinvPole, [-1300, y])
		RigVMController.set_pin_default_value(name+'_STinvPole.Item.Type','Control')
		RigVMController.set_pin_default_value(name+'_STinvPole.Item.Name','Pole'+name)
		RigVMController.add_link(name+'_GTSpace.Transform' , name+'_STinvPole.Transform')
		RigVMController.set_pin_default_value(name+'_STinvPole.bPropagateToChildren','True')
		RigVMController.add_link(name+'_GTinvPole.Transform' , name+'_STinvPole.Transform')
		RigVMController.add_link(name+'_STinvIK.ExecuteContext' , name+'_STinvPole.ExecuteContext')
		endPlugInv = name+'_STinvPole.ExecuteContext'
		PreviousEndPlugInv = endPlugInv
	if "twistJoints" in arrayInfo or "inbetweenJoints" in arrayInfo:
		PreviousArrayInfo = arrayInfo
	else:
		PreviousArrayInfo.clear()

	#DrivingSystem
	if type=='DrivingSystem' or type=='ctrlBox':
		if type=='DrivingSystem':
			RigVMController.set_pin_default_value(name+'_GT.Item.Type','Bone')
			RigVMController.set_pin_default_value(name+'_GT.Item.Name',joint)
			RigVMController.set_pin_default_value(name+'_ST.Item.Type','Control')
			RigVMController.set_pin_default_value(name+'_ST.Item.Name',name)
		if type=='ctrlBox':
			Transform = RigControl.get_editor_property('gizmo_transform')
		if name=='ctrlBox':
			RigControl.offset_transform.translation = [Transform.translation.z,(Transform.translation.y*-1),Transform.translation.x]
			ctrlBoxSize = float (arrayInfo["ctrlBoxSize"])
			Scale = [0.07,0.15,0.1]
			ctrlBoxScale = [ctrlBoxSize,ctrlBoxSize,ctrlBoxSize]
			RigControl.offset_transform.scale3d = ctrlBoxScale
			RigControl.gizmo_transform.scale3d = Scale
			RigControl.gizmo_transform.translation = [0,0,-1.5] #guestimate
			HierarchyModifier.set_control (RigControl)
			return
		nonTransformFaceCtrl = False
		if name=='ctrlEmotions_M' or name=='ctrlPhonemes_M' or name=='ctrlARKit_M' or name=='ctrlBoxRobloxHead_M':
			nonTransformFaceCtrl = True
			nonTransformFaceCtrlNr = nonTransformFaceCtrlNr+1
			RigControl.set_editor_property('gizmo_enabled',False)
			HierarchyModifier.set_control (RigControl)
		if type=='ctrlBox':
			RigVMController.remove_node(RigVMGraph.find_node_by_name(name+'_GT'))
			RigVMController.remove_node(RigVMGraph.find_node_by_name(name+'_ST'))
			RigControl.set_editor_property('control_type',unreal.RigControlType.VECTOR2D)
			RigControl.set_editor_property('primary_axis',unreal.RigControlAxis.Y)	
			RigControl.offset_transform.translation = Transform.translation * (1.0/ctrlBoxSize)
			RigControl.gizmo_transform.scale3d = [0.05,0.05,0.05]
			RigControl.limit_translation = True
			value = unreal.RigControlValue()
			RigControl.maximum_value = value
			RigControl.gizmo_transform.translation = [0,0,0]
			HierarchyModifier.set_control (RigControl)

			maxXform = unreal.Transform(location=[1,1,1])
			minXform = unreal.Transform(location=[-1,-1,-1])
			if name=='ctrlMouth_M':
					maxXform = unreal.Transform(location=[1,1,0])
			if re.search("^ctrlCheek_", name) or re.search("^ctrlNose_", name):
					minXform = unreal.Transform(location=[-1,-1,0])
			RigElementKeys = HierarchyModifier.get_elements()
			for key in RigElementKeys:
				if (key.name == name):
					RigControlKey = key
			HierarchyModifier.set_control_value_transform (RigControlKey, maxXform, value_type=unreal.RigControlValueType.MAXIMUM)
			HierarchyModifier.set_control_value_transform (RigControlKey, minXform, value_type=unreal.RigControlValueType.MINIMUM)
			HierarchyModifier.set_control (HierarchyModifier.get_control (RigControlKey))
			endPlug = PreviousEndPlug
		if type=='ctrlBox':
			AttrGrpkey = HierarchyModifier.add_control (name+"_Attributes",parent_name=parent)
		else:
			AttrGrpkey = HierarchyModifier.add_control (name+"_Attributes",parent_name=name)
		AttrGrpRigControl = HierarchyModifier.get_control (AttrGrpkey)
		AttrGrpRigControl.set_editor_property('gizmo_transform', unreal.Transform(location=[0,0,0],rotation=[0,0,0],scale=[0,0,0]))
		Transform = RigControl.get_editor_property('offset_transform').copy()
		if type=='ctrlBox':
			Transform.translation.x = -5.0
			Transform.translation.z += 0.8
			if re.search("_L", name) or re.search("_M", name):
				Transform.translation.x = 4.0
			if nonTransformFaceCtrl:
				Transform.translation.z = -5.5-(nonTransformFaceCtrlNr*2) # stack rows of sliders downwards
		else:
			numAttrs = 0
			for Attr in arrayInfo.keys():
				if not re.search("-set", Attr):
					numAttrs=numAttrs+1
			Transform = unreal.Transform(location=[0,0,0],rotation=[0,0,0],scale=[1,1,1])
			Transform.translation.x = offT[0]
			Transform.translation.y = numAttrs*0.5*(size/4.0)*-0.5
			Transform.translation.z = size/8.0
			if re.search("_L", name):
					Transform.translation.z *= -1
			Transform.scale3d=[size/4.0,size/4.0,size/4.0]
		AttrGrpRigControl.set_editor_property('offset_transform', Transform)
		HierarchyModifier.set_control (AttrGrpRigControl)

		Attrs = arrayInfo.keys()
		attrNr = 0
		for Attr in Attrs:
			if re.search("-set", Attr):
				if re.search("-setLimits", Attr):
					DictDrivens = arrayInfo.get(Attr)
					min = float(list(DictDrivens.keys())[0])
					max = float(list(DictDrivens.values())[0])
					minXform = unreal.Transform(location=[min,min,min])
					RigElementKeys = HierarchyModifier.get_elements()
					for key in RigElementKeys:
						if key.name == name+"_"+Attr.replace("-setLimits", ""):
								HierarchyModifier.set_control_value_transform (key, minXform, value_type=unreal.RigControlValueType.MINIMUM)
								HierarchyModifier.set_control (HierarchyModifier.get_control (key))
					continue

			transformAttrDriver = True
			if not re.search("translate", Attr) or re.search("rotate", Attr) or re.search("scale", Attr):
				key = HierarchyModifier.add_control (name+"_"+Attr,parent_name=parent)
				AttrRigControl = HierarchyModifier.get_control (key)
				AttrRigControl = asParent (name+"_"+Attr, name+"_Attributes")
				AttrRigControl.set_editor_property('control_type',unreal.RigControlType.FLOAT)
				AttrRigControl.set_editor_property('gizmo_color', unreal.LinearColor(r=1.0, g=0.0, b=0.0, a=0.0))
				AttrRigControl.set_editor_property('gizmo_transform', unreal.Transform(location=[0,0,0],rotation=[0,0,0],scale=[0.035,0.035,0.035]))
				Transform = unreal.Transform(location=[0,0,0],rotation=[0,0,0],scale=[1,1,1])
				Transform.translation = [0,attrNr*0.5,0]
				if type=='ctrlBox':
					Transform.translation = [0,0,attrNr*-0.5]
				if nonTransformFaceCtrl or re.search("_M", name):
					AttrRigControl.set_editor_property('primary_axis',unreal.RigControlAxis.Z)
					Transform.translation = [attrNr,0,0]
				attrNr = attrNr+1
				AttrRigControl.set_editor_property('offset_transform', Transform)
				AttrRigControl.limit_translation = True
				HierarchyModifier.set_control (AttrRigControl)

				maxXform = unreal.Transform(location=[1,1,1])
				RigElementKeys = HierarchyModifier.get_elements()
				for key in RigElementKeys:
					if (key.name == name+"_"+Attr):
						RigControlKey = key
				HierarchyModifier.set_control_value_transform (RigControlKey, maxXform, value_type=unreal.RigControlValueType.MAXIMUM)
				HierarchyModifier.set_control (HierarchyModifier.get_control (RigControlKey))

				transformAttrDriver = False
			DictDrivens = arrayInfo.get(Attr)
			KeysDrivens = DictDrivens.keys()

			for Driven in KeysDrivens:
				Value = float(DictDrivens.get(Driven))
				x2 = ASDrivenNr*1200
				dNr = str(ASDrivenNr)
				ASDrivenNr = ASDrivenNr+1
				x = Driven.split(".")
				obj = x[0]
				attr = '_'+x[1]
				axis = attr[-1]
				valueMult = 1
				if re.search("rotate", attr):
					if axis == 'X' or axis=='Z':
						valueMult = -1
				if re.search("translate", attr):
					if axis=='Y':
						valueMult = -1
				multiplier = Value*valueMult

				asFaceBSDriven = False
				if re.search("asFaceBS[.]", Driven):#asFaceBS
					asFaceBSDriven = True

				if not (asFaceBSDriven):
					RigElementKeys = HierarchyModifier.get_elements()
					for key in RigElementKeys:
						if key.name == obj:
							objObject = HierarchyModifier.get_control(key)
					if not asObjExists ('Offset'+obj):
						SpaceKey = HierarchyModifier.add_space ('Offset'+obj)
						SpaceObj = HierarchyModifier.get_space (SpaceKey)
						objParent = str(objObject.get_editor_property('parent_name'))
						asParent ('Offset'+obj, objParent)
						asAlign (obj,'Offset'+obj)
						parentTo = 'Offset'+obj

					for x in range(1,9):
						sdk = 'SDK'+obj+"_"+str(x)
						if not asObjExists (sdk):
							break
					if x>1:
						parentTo = 'SDK'+obj+"_"+str(x-1)

					SpaceKey = HierarchyModifier.add_space (sdk)
					asParent (sdk,parentTo)
					objObject.set_editor_property('offset_transform', unreal.Transform())
					HierarchyModifier.set_control (objObject)
					asParent (obj,sdk)

				#GTDriver
				if transformAttrDriver:
					GTDriver = asAddNode (sp+'GetControlVector2D','Execute',node_name=name+"_"+obj+"_"+attr+dNr+'_GTDriver')
					RigVMController.set_pin_default_value(name+"_"+obj+"_"+attr+dNr+'_GTDriver.Control',name)
					gtPlug = name+"_"+obj+"_"+attr+dNr+'_GTDriver.Vector.'+Attr[-1]#Attr[-1] is DriverAxis
				else:
					GTDriver = asAddNode (sp+'GetControlFloat','Execute',node_name=name+"_"+obj+"_"+attr+dNr+'_GTDriver')
					RigVMController.set_pin_default_value(name+"_"+obj+"_"+attr+dNr+'_GTDriver.Control',name+"_"+Attr)
					gtPlug = name+"_"+obj+"_"+attr+dNr+'_GTDriver.FloatValue'
				RigVMController.set_node_position (GTDriver, [500+x2, y])

				#MFM
				MFM = asAddNode (sp+'MathFloatMul','Execute',node_name=name+"_"+obj+"_"+attr+dNr+'_MFM')
				RigVMController.set_node_position (MFM, [900+x2, y])
				RigVMController.add_link(gtPlug , name+"_"+obj+"_"+attr+dNr+'_MFM.A')
				RigVMController.set_pin_default_value(name+"_"+obj+"_"+attr+dNr+'_MFM.B',str(multiplier))

				if asFaceBSDriven:
					#Clamp
					Clamp = asAddNode (sp+'MathFloatClamp','Execute',node_name=name+"_"+obj+"_"+attr+dNr+'_Clamp')
					RigVMController.set_node_position (Clamp, [900+x2, y+100])
					RigVMController.set_pin_default_value(name+"_"+obj+"_"+attr+dNr+'_Clamp.Maximum','5.0')
					RigVMController.add_link(name+"_"+obj+"_"+attr+dNr+'_MFM.Result' , name+"_"+obj+"_"+attr+dNr+'_Clamp.Value')
					#STDriven
					STDriven = asAddNode (sp+'SetCurveValue','Execute',node_name=name+"_"+Attr+"_"+attr+'_STDriven')
					RigVMController.set_node_position (STDriven, [1100+x2, y])
					RigVMController.set_pin_default_value(name+"_"+Attr+"_"+attr+'_STDriven.Curve',Driven.split(".")[1])
					RigVMController.add_link(name+"_"+obj+"_"+attr+dNr+'_Clamp.Result' , name+"_"+Attr+"_"+attr+'_STDriven.Value')
					RigVMController.add_link(endPlug , name+"_"+Attr+"_"+attr+'_STDriven.ExecuteContext')
					endPlug =name+"_"+Attr+"_"+attr+'_STDriven.ExecuteContext'
				else:
					#STDriven
					STDriven = asAddNode (sp+'SetTransform','Execute',node_name=name+"_"+obj+"_"+attr+dNr+'_STDriven')
					RigVMController.set_node_position (STDriven, [1300+x2, y])
					RigVMController.set_pin_default_value(name+"_"+obj+"_"+attr+dNr+'_STDriven.Item.Type','Space')
					RigVMController.set_pin_default_value(name+"_"+obj+"_"+attr+dNr+'_STDriven.Item.Name',sdk)
					RigVMController.set_pin_default_value(name+"_"+obj+"_"+attr+dNr+'_STDriven.Space','LocalSpace')
					RigVMController.set_pin_default_value(name+"_"+obj+"_"+attr+dNr+'_STDriven.bPropagateToChildren','True')
					RigVMController.add_link(endPlug , name+"_"+obj+"_"+attr+dNr+'_STDriven.ExecuteContext')
					endPlug = name+"_"+obj+"_"+attr+dNr+'_STDriven.ExecuteContext'

					#TFSRT
					TFSRT = asAddNode (sp+'MathTransformFromSRT','Execute',node_name=name+"_"+obj+"_"+attr+dNr+'_TFSRT')
					RigVMController.set_node_position (TFSRT, [900+x2, y+150])
					if re.search("translate", attr):
						RigVMController.add_link(name+"_"+obj+"_"+attr+dNr+'_MFM.Result' , name+"_"+obj+"_"+attr+dNr+'_TFSRT.Location.'+axis)
					if re.search("rotate", attr):
						RigVMController.add_link(name+"_"+obj+"_"+attr+dNr+'_MFM.Result' , name+"_"+obj+"_"+attr+dNr+'_TFSRT.Rotation.'+axis)
					if re.search("scale", attr):
						#scale just add 1, not accurate but simplified workaround
						MFA = asAddNode (sp+'MathFloatAdd','Execute',node_name=name+"_"+obj+"_"+attr+dNr+'_MFA')
						RigVMController.set_node_position (MFA, [1100+x2, y])
						RigVMController.add_link(name+"_"+obj+"_"+attr+dNr+'_MFM.Result' , name+"_"+obj+"_"+attr+dNr+'_MFA.A')
						RigVMController.set_pin_default_value(name+"_"+obj+"_"+attr+dNr+'_MFA.B','1')
						RigVMController.add_link(name+"_"+obj+"_"+attr+dNr+'_MFA.Result' , name+"_"+obj+"_"+attr+dNr+'_TFSRT.Scale.'+axis)
					RigVMController.add_link(name+"_"+obj+"_"+attr+dNr+'_TFSRT.Transform', name+"_"+obj+"_"+attr+dNr+'_STDriven.Transform')

	#face
	if re.search("Teeth_M", name):
		RigControl.set_editor_property('gizmo_enabled',False)
		HierarchyModifier.set_control (RigControl)
	if name=="Jaw_M":
		RigControl.set_editor_property('gizmo_name','HalfCircle_Thick')
		RigControl.set_editor_property('gizmo_name','HalfCircle_Thick')
		Transform = RigControl.get_editor_property('gizmo_transform')
		Transform.rotation=[0,0,180]
		RigControl.set_editor_property('gizmo_transform', Transform)
		HierarchyModifier.set_control (RigControl)	

	PreviousEndPlug = endPlug

def asObjExists (obj):
	RigElementKeys = HierarchyModifier.get_elements()
	LocObject = None
	for key in RigElementKeys:
		if key.name == obj:
			return True
	return False

def asAddController (name, parent, joint, type, gizmoName, ws, size, offT, color):
	x = re.search("^Space.*", parent)
	if x:
		key = HierarchyModifier.add_control (name,space_name=parent)
	else:
		key = HierarchyModifier.add_control (name,parent_name=parent)
	RigControl = HierarchyModifier.get_control (key)
	RigElementKeys = HierarchyModifier.get_elements()
	LocObject = None
	jointIsBone = False
	for key in RigElementKeys:
		if key.name == joint:
			if key.type == 1: #BONE
				jointObject = HierarchyModifier.get_bone(key)
				jointIsBone = True
		if key.name == 'Loc'+name:
			LocObject = HierarchyModifier.get_bone(key)
	OffsetTransform = unreal.Transform(location=[0,0,0],rotation=[0,0,0],scale=[1,1,1])
	GizmoLocation = [offT[0],offT[2],offT[1]]
	GizmoRotation = [0,0,0]
	if ws is 0:
		GizmoRotation = [90,0,0]
		GizmoLocation = [offT[0],offT[1]*-1,offT[2]]
	if type=="DrivingSystem":
		GizmoRotation = [0,0,0]
	if type=="ctrlBox":
		GizmoRotation = [0,0,90]
	if re.search("^Eye_.*", name) or re.search("^Iris_.*", name) or re.search("^Pupil_.*", name):
		GizmoRotation = [0,90,0]
		RigControl.set_editor_property('gizmo_visible',False)
	x = re.search("^Pole.*", name)
	if x:
		GizmoLocation = [0,0,0]
	s = 0.01*size
	Scale = [s,s,s]
	if LocObject==None:
		LocKey = HierarchyModifier.add_bone ('Loc'+name,'LocBones')
		LocObject = HierarchyModifier.get_bone (LocKey)
		if jointIsBone:
			jointTransform = jointObject.get_editor_property('global_transform')
			if ws is 1:
				jointTransform.rotation = [0,0,0]
			OffsetTransform = jointTransform
			if name!='Main':
				LocObject.set_editor_property('initial_transform', jointTransform)
			HierarchyModifier.set_bone (LocObject)
	if parent!='':
		for key in RigElementKeys:
			if key.name == 'Loc'+parent:
				ParentLocObject = HierarchyModifier.get_bone(key)
				LocTransform = ParentLocObject.get_editor_property('global_transform')
				if jointIsBone:
					OffsetTransform = jointTransform.make_relative(LocTransform)
		RigControl.set_editor_property('offset_transform', OffsetTransform)
	RigControl.set_editor_property('gizmo_name',gizmoName)
	RigControl.set_editor_property('gizmo_transform', unreal.Transform(location=GizmoLocation,rotation=GizmoRotation,scale=Scale))
	Color = unreal.Color(b=color[2]*255, g=color[1]*255, r=color[0]*255, a=0)
	LinearColor = unreal.LinearColor()
	LinearColor.set_from_srgb(Color)
	RigControl.set_editor_property('gizmo_color',LinearColor)
	HierarchyModifier.set_control (RigControl)
	return RigControl

def asParent (child,parent):
	RigElementKeys = HierarchyModifier.get_elements()
	for key in RigElementKeys:
		if (key.name == child):
			childKey = key
	for key in RigElementKeys:
		if (key.name == parent):
			parentKey = key
	if not HierarchyModifier.reparent_element (childKey, parentKey):
		#bug in UE4.27: n`th Space, can not be child of n`th Ctrl, making a new space
		HierarchyModifier.rename_element (childKey, child+'SpaceParentX')
		childKey = HierarchyModifier.add_space (child)
		if not HierarchyModifier.reparent_element (childKey, parentKey):
			raise Exception('Failed to parent:'+child+' to '+parent)
		asParent (child+'SpaceParentX','Spaces')

	return asGetRigElement(child)

def asGetRigElement (elementName):
	RigElementKeys = HierarchyModifier.get_elements()
	for key in RigElementKeys:
		if key.name == elementName:
			if key.type == 1: #BONE
				element = HierarchyModifier.get_bone(key)
			if key.type == 2: #SPACE
				element = HierarchyModifier.get_space(key)
			if key.type == 4: #CONTROL
				element = HierarchyModifier.get_control(key)
	return element

def asAlign (source,dest):
	RigElementKeys = HierarchyModifier.get_elements()
	for key in RigElementKeys:
		if (key.name == source):
			if key.type == 1: #BONE
				sourceObject = HierarchyModifier.get_bone(key)
				sourceType = 'Bone'
			if key.type == 2: #SPACE
				sourceObject = HierarchyModifier.get_space(key)
				sourceType = 'Space'
			if key.type == 4: #CONTROL
				sourceObject = HierarchyModifier.get_control(key)
				sourceType = 'Control'
		if (key.name == dest):
			if key.type == 1: #BONE
				destObject = HierarchyModifier.get_bone(key)
				destType = 'Bone'
			if key.type == 2: #SPACE
				destObject = HierarchyModifier.get_space(key)
				destType = 'Space'
			if key.type == 4: #CONTROL
				destObject = HierarchyModifier.get_control(key)
				destType = 'Control'

	if sourceType != 'Bone':
		for key in RigElementKeys:
			if key.name == 'Loc'+source:
				source = 'Loc'+source
				sourceObject = HierarchyModifier.get_bone(key)
				sourceType = 'Bone'
	Transform = sourceObject.get_editor_property('global_transform')
	#Relative to parent 
	LocDestParent = None
	DestParent = destObject.get_editor_property('parent_name')
	for key in RigElementKeys:
		if key.name == 'Loc'+str(DestParent):
			LocDestParent = HierarchyModifier.get_bone(key)
			LocDestParentTransform = LocDestParent.get_editor_property('global_transform')
			Transform = Transform.make_relative(LocDestParentTransform)
	destObject.set_editor_property('initial_transform', Transform)
	if destType == 'Bone':
		HierarchyModifier.set_bone (destObject)
	if destType == 'Space':
		HierarchyModifier.set_space (destObject)
	if destType == 'Control':
		HierarchyModifier.set_control (destObject)

def asAddNode (script_struct_path, method_name, node_name):
	#RigVMController.
	#add_struct_node_from_struct_path UE4
	#add_unit_node_from_struct_path UE5
	try:
		node = RigVMController.add_struct_node_from_struct_path(script_struct_path,method_name,node_name=node_name) #UE4
	except:
		node = RigVMController.add_unit_node_from_struct_path(script_struct_path,method_name,node_name=node_name) #UE5
	return node

def main ():
	global PreviousEndPlugInv
	RigElementKeys = HierarchyModifier.get_elements()
	RigVMGraph = ControlRigBlueprint.model

	#Clear out existing rig-setup
	nodes = RigVMGraph.get_nodes()
	for node in nodes:
		RigVMController.remove_node(node)
	#Clear out existing controllers
	for key in RigElementKeys:
		if key.name == 'MotionSystem':
			HierarchyModifier.remove_element(key)
		if not (key.type==1 or key.type==8): #BONE
			try:
				HierarchyModifier.remove_element(key)
			except:
				pass

	BeginExecutionNode = asAddNode (sp+'BeginExecution','Execute',node_name='RigUnit_BeginExecution')
	RigVMController.set_node_position (BeginExecutionNode, [-300, -100])
	InverseExecutionNode = asAddNode (sp+'InverseExecution','Execute',node_name='RigUnit_InverseExecution')
	RigVMController.set_node_position (InverseExecutionNode, [-1900, -100])

	#Backwards solve nodes
	GTinvRoot = asAddNode (sp+'GetTransform','Execute',node_name='Root_M_GTinvRoot')
	RigVMController.set_node_position (GTinvRoot, [-2100, 400])
	RigVMController.set_pin_default_value('Root_M_GTinvRoot.Item.Type','Bone')
	RigVMController.set_pin_default_value('Root_M_GTinvRoot.Item.Name','Root_M')

	CONinvRoot = asAddNode (sp+'TransformConstraintPerItem','Execute',node_name='Root_M_CONinvRoot')
	RigVMController.set_node_position (CONinvRoot, [-1500, 400-90])
	RigVMController.set_pin_default_value('Root_M_CONinvRoot.Item.Type','Control')
	RigVMController.set_pin_default_value('Root_M_CONinvRoot.Item.Name','RootX_M')
	RigVMController.add_array_pin('Root_M_CONinvRoot.Targets')
	RigVMController.add_link('Root_M_GTinvRoot.Transform' , 'Root_M_CONinvRoot.Targets.0.Transform')
	RigVMController.add_link('RigUnit_InverseExecution.ExecuteContext' , 'Root_M_CONinvRoot.ExecuteContext')

	CCinv = asAddNode (sp+'CollectionChildren','Execute',node_name='CCinv')
	RigVMController.set_node_position (CCinv, [-2600, 1000])
	RigVMController.set_pin_default_value('CCinv.Parent.Type','Bone')
	RigVMController.set_pin_default_value('CCinv.Parent.Name','Root_M')
	RigVMController.set_pin_default_value('CCinv.bRecursive','True')
	RigVMController.set_pin_default_value('CCinv.TypeToSearch','Bone')

	CLinv = asAddNode (sp+'CollectionLoop','Execute',node_name='CLinv')
	RigVMController.set_node_position (CLinv, [-2150, 1000])
	RigVMController.add_link('Root_M_CONinvRoot.ExecuteContext' , 'CLinv.ExecuteContext')
	RigVMController.add_link('CCinv.Collection' , 'CLinv.Collection')
	PreviousEndPlugInv = 'CLinv.Completed'

	NCinv = asAddNode (sp+'NameConcat','Execute',node_name='NCinv')
	RigVMController.set_node_position (NCinv, [-1900, 900])
	RigVMController.set_pin_default_value('NCinv.A','FK')
	RigVMController.add_link('CLinv.Item.Name' , 'NCinv.B')

	GTinv = asAddNode (sp+'GetTransform','Execute',node_name='GTinv')
	RigVMController.set_node_position (GTinv, [-1900, 1000])
	RigVMController.add_link('CLinv.Item.Name' , 'GTinv.Item.Name')

	IEinv = asAddNode (sp+'ItemExists','Execute',node_name='IEinv')
	RigVMController.set_node_position (IEinv, [-1700, 700])
	RigVMController.set_pin_default_value('IEinv.Item.Type','Control')
	RigVMController.add_link('NCinv.Result' , 'IEinv.Item.Name')

	BRinv = RigVMController.add_branch_node(node_name='BRinv')
	RigVMController.set_node_position (BRinv, [-1650, 850])
	RigVMController.add_link('IEinv.Exists' , 'BRinv.Condition')
	RigVMController.add_link('CLinv.ExecuteContext' , 'BRinv.ExecuteContext')

	STinv = asAddNode (sp+'SetTransform','Execute',node_name='STinv')
	RigVMController.set_node_position (STinv, [-1500, 1000])
	RigVMController.set_pin_default_value('STinv.Item.Type','Control')
	RigVMController.add_link('NCinv.Result' , 'STinv.Item.Name')
	RigVMController.add_link('GTinv.Transform' , 'STinv.Transform')
	RigVMController.add_link('BRinv.True' , 'STinv.ExecuteContext')

	HierarchyModifier.add_bone ('MotionSystem')
	HierarchyModifier.add_bone ('TwistSystem')
	HierarchyModifier.add_bone ('LocBones')
	HierarchyModifier.add_bone ('DrivingSystem')
	HierarchyModifier.add_bone ('Spaces')
	asParent ('TwistSystem','MotionSystem')
	asParent ('LocBones','MotionSystem')
	asParent ('DrivingSystem','MotionSystem')
	asParent ('Spaces','MotionSystem')
	selectedAsset.get_class().modify(True)#tag dirty

	#//-- ASControllers Starts Here --//

	#//-- ASControllers Ends Here --//
#	selectedAsset.get_class().modify(True)#tag dirty
# Unreal un-sets `dirty` flag upon opening of ControlRigEditor, causing non-prompt for save upon exit and loss of ControlRig, therefor just save
#	unreal.EditorAssetLibrary.save_asset(selectedAsset.get_path_name()) #Removed since this requires "Editor Scripting Utilities" plugin

	selectedAsset.get_class().modify(False)
	print ("ControlRig created")

if __name__ == "__main__":
    main()