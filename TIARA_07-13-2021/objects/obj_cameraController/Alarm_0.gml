/// @description Insert description here
// You can write your code in this editor

var _followObject = followObject;

if (scr_isValidInstance(_followObject))
{
	camera_set_view_pos(camera, _followObject.x - halfWidth, _followObject.y - halfHeight);
	cameraX = camera_get_view_x(camera);
	cameraY = camera_get_view_y(camera);
}
