package systems;

import h2d.Graphics;
import store.*;
import registry.*;
import components.*;

function process() {
	for (entity in EntityStore.entities) {
		if (entity == null) continue;
		if (entity.graphicsComponentId == null) continue;
		var component = ComponentsStore.graphics[entity.graphicsComponentId];
		var graphic = updateGraphic(component, InstancesStore.graphics[entity.graphicsId]);

		if (graphic == null && entity.graphicsId != null) {
			InstanceRegistry.removeGraphics(entity.graphicsId);
			entity.graphicsId = null;
		}
		else if (graphic != null && entity.graphicsId == null) {
			entity.graphicsId = InstanceRegistry.addGraphics(graphic);
		}
	}
}

function updateGraphic(component:GraphicsComponent, existingGraphics:Null<Graphics>):Graphics {
	if (component == null) {
		return null;
	}

	var g = existingGraphics != null ? existingGraphics : new Graphics();

	// Set line properties if they exist
	if (component.lineColor != null && component.lineWidth != null) {
		g.lineStyle(component.lineWidth, component.lineColor);
	}

	// Set fill color if it exists
	if (component.fillColor != null) {
		g.beginFill(component.fillColor);
	}

	// Draw shapes
	if (component.drawRect != null) {
		var rect = component.drawRect;
		g.drawRect(rect.x, rect.y, rect.width, rect.height);
	}
	if (component.drawCircle != null) {
		var circle = component.drawCircle;
		g.drawCircle(circle.x, circle.y, circle.radius);
	}

	// Draw custom path if it exists
	if (component.customPath != null) {
		var path = component.customPath;
		for (point in path) {
			g.lineTo(point.x, point.y);
		}
	}

	// Set alpha if it exists
	if (component.alpha != null) {
		g.alpha = component.alpha;
	}

	return g;
}
