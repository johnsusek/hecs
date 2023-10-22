package components;

typedef B2BodyComponent = {
	type:B2BodyType, // Dynamic, Static, or Kinematic
	position:{x:Float, y:Float},
	angle:Float,
	linearVelocity:{x:Float, y:Float},
	angularVelocity:Float,
	linearDamping:Float,
	angularDamping:Float,
	allowSleep:Bool,
	awake:Bool,
	fixedRotation:Bool,
	bullet:Bool,
	active:Bool,
	userData:Dynamic,
	fixtures:Array<B2FixtureComponent>
}

typedef B2BodyType = {
	type:String // 'dynamic', 'static', 'kinematic'
}

typedef B2ShapeType = {
	type:String, // 'circle', 'polygon', 'edge', etc.
	data:Dynamic // shape-specific data, e.g., radius for circle
}

typedef B2WorldComponent = {
	gravity:{x:Float, y:Float},
	allowSleep:Bool,
	warmStarting:Bool,
	continuousPhysics:Bool
};

typedef B2FixtureComponent = {
	shape:B2ShapeType,
	density:Float,
	friction:Float,
	restitution:Float,
	isSensor:Bool,
	userData:Dynamic
};

typedef B2JointComponent = {
	type:String, // 'revolute', 'prismatic', etc.
	bodyA:Int, // Entity ID
	bodyB:Int, // Entity ID
	anchorA:{x:Float, y:Float},
	anchorB:{x:Float, y:Float},
	jointData:Dynamic // Joint-specific settings
};
