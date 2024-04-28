global.dialogue = [
"Let's hurry!",
"We need to protect our land",
"Be careful, we're getting close"
];
function tutorialDialog(i){
	if i >= array_length(global.dialogue) { return true; }
	return array_get(global.dialogue,i);
}