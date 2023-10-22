package store;

import haxe.ds.*;
import util.DataStructures;

var entities:Vector<Entity> = new Vector<Entity>(100);
var nextEntityIdx:Ref<Int> = new Ref(0);
var freeEntityIndices:Vector<Int> = new Vector<Int>(100);
var nextFreeIndex:Ref<Int> = new Ref(0);

function add(entity:Entity):Void {
	var index:Int;

	if (nextFreeIndex.value > 0) {
		nextFreeIndex.value--;
		index = freeEntityIndices[nextFreeIndex.value];
	}
	else {
		index = nextEntityIdx.value++;

		if (index >= entities.length) {
			entities = resizeVector(entities, entities.length * 2);
		}
	}
	entities[index] = entity;
}

function remove(entityId:Int):Void {
	for (i in 0...entities.length) {
		if (entities[i] != null && entities[i].id == entityId) {
			entities[i] = null;
			freeEntityIndices[nextFreeIndex.value] = i;
			nextFreeIndex.value++;

			if (nextFreeIndex.value >= freeEntityIndices.length) {
				freeEntityIndices = resizeVector(freeEntityIndices, freeEntityIndices.length * 2);
			}

			break;
		}
	}
}
