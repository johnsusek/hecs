package systems;

import store.*;
import registry.*;
import components.*;
import components.Box2D;

function process(timeDelta:Float, s2d:h2d.Scene) {
	for (entity in EntityStore.entities) {
		if (entity == null) continue;
		if (entity.transformComponentId == null) continue;

		var transform = ComponentsStore.transforms[entity.transformComponentId];

		// Update position and rotation if there's a body component
		if (entity.bodyComponentId != null) {
			var body = ComponentsStore.bodies[entity.bodyComponentId];
			update(transform, body, timeDelta);
		}

		// Handle hierarchy
		var parentGraphics:Dynamic = null;
		var entityGraphics = InstancesStore.graphics[entity.graphicsId];

		if (entityGraphics == null) {
			return; // Exit early if entityGraphics is null
		}

		if (transform.parentId != null) {
			var parentEntityId = ComponentRegistry.getEntityByTransformId(transform.parentId);
			var parentEntity = EntityStore.entities[parentEntityId];
			if (parentEntity != null && parentEntity.graphicsId != null) {
				parentGraphics = InstancesStore.graphics[parentEntity.graphicsId];
			}
		}

		if (parentGraphics != null && !transform.isAddedToParent) {
			parentGraphics.addChild(entityGraphics);
			transform.isAddedToParent = true;
		}
		else if (transform.parentId == null && !transform.isAddedToParent) {
			// Add top-level transforms to the default scene
			s2d.addChild(entityGraphics);
			transform.isAddedToParent = true;
		}

		if (transform.childIds == null) continue;

		// Handle children
		for (childId in transform.childIds) {
			var childEntityId = ComponentRegistry.getEntityByTransformId(childId);
			var childEntity = EntityStore.entities[childEntityId];
			if (childEntity != null && childEntity.graphicsId != null) {
				var childGraphics = InstancesStore.graphics[childEntity.graphicsId];
				if (childGraphics != null) {
					entityGraphics.addChild(childGraphics);
					// Update the child's transform state
					var childTransform = ComponentsStore.transforms[childId];
					childTransform.isAddedToParent = true;
				}
			}
		}
	}
}

function update(transform:TransformComponent, body:B2BodyComponent, timeDelta:Float) {
	if (transform == null || body == null) {
		return;
	}

	transform.position.x += body.linearVelocity.x * timeDelta;
	transform.position.y += body.linearVelocity.y * timeDelta;
	transform.rotation += body.angularVelocity * timeDelta;
}
