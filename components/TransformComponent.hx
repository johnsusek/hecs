package components;

typedef TransformComponent = {
	var position:{x:Float, y:Float};
	var rotation:Float; // In radians
	var scale:{x:Float, y:Float};
	var parentId:Null<Int>; // ID of the parent TransformComponent
	var childIds:Array<Int>; // IDs of child TransformComponents
	var isAddedToParent:Bool; // Flag to prevent double-adding to parent
};
