package util;

import haxe.ds.*;

function resizeVector<T>(vec:Vector<T>, newSize:Int):Vector<T> {
	var newVector = new Vector<T>(newSize);

	for (j in 0...vec.length) {
		newVector[j] = vec[j];
	}

	return newVector;
}

class Ref<T> {
	public var value:T;

	public function new(value:T) {
		this.value = value;
	}
}
