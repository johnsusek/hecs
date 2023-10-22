var nextEntityId:Int = 1;

function generateEntityId():Int {
	return nextEntityId++;
}

typedef Entity = {
	var id:Int;

	// Component IDs
	var transformComponentId:Null<Int>;
	var bodyComponentId:Null<Int>;
	var worldComponentId:Null<Int>;
	var fixtureComponentId:Null<Int>;
	var jointComponentId:Null<Int>;
	var graphicsComponentId:Null<Int>;

	// Instance IDs
	var transformId:Null<Int>;
	var bodyId:Null<Int>;
	var worldId:Null<Int>;
	var fixtureIds:Array<Int>;
	var jointIds:Array<Int>;
	var graphicsId:Null<Int>;
};
