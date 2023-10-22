import Entity;
import components.*;
import registry.*;
import systems.*;
import store.*;

class Main extends hxd.App {
	static function main() {
		new Main();
	}

	override function init() {
		var transformComponent:TransformComponent = {
			position: {x: 0, y: 0},
			rotation: 0,
			scale: {x: 1, y: 1},
			parentId: null,
			childIds: null,
			isAddedToParent: false
		};

		var graphicsComponent:GraphicsComponent = {
			lineColor: 0xFF0000,
			lineWidth: 2,
			fillColor: 0x00FF00,
			drawRect: {
				x: 10,
				y: 10,
				width: 100,
				height: 100
			},
			drawCircle: null,
			customPath: null,
			alpha: 1
		};

		var id = generateEntityId();

		var entity:Entity = {
			id: id,
			transformComponentId: ComponentRegistry.addTransform(transformComponent, id),
			bodyComponentId: null,
			worldComponentId: null,
			fixtureComponentId: null,
			jointComponentId: null,
			graphicsComponentId: ComponentRegistry.addGraphics(graphicsComponent),
			transformId: null,
			bodyId: null,
			worldId: null,
			fixtureIds: new Array<Int>(),
			jointIds: new Array<Int>(),
			graphicsId: null
		}

		EntityStore.add(entity);
	}

	override function update(dt:Float) {
		GraphicsSystem.process();
		TransformSystem.process(dt, s2d);
	}
}
