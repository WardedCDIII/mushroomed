/// @description DEBUG REMOVE

if validGridLocation(hover) and isOccupied(hover) {
	with global.Mobs[# hover[0], hover[1]] {
		hp -= 1000;	
	}
}


