package components;

typedef GraphicsComponent = {
	// Line Properties
	var lineColor:Null<Int>;
	var lineWidth:Null<Float>;

	// Fill Properties
	var fillColor:Null<Int>;

	// Shape Properties
	var drawRect:Null<{
		x:Float,
		y:Float,
		width:Float,
		height:Float
	}>;
	var drawCircle:Null<{x:Float, y:Float, radius:Float}>;

	// Custom Path (Optional)
	var customPath:Null<Array<{x:Float, y:Float}>>;

	// Alpha setting
	var alpha:Null<Float>;
};
