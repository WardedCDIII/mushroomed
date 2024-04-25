{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_level_2",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_6CF2F996_1","path":"rooms/rm_level_2/rm_level_2.yy",},
    {"name":"inst_7189912_1","path":"rooms/rm_level_2/rm_level_2.yy",},
    {"name":"inst_4452C235_1","path":"rooms/rm_level_2/rm_level_2.yy",},
    {"name":"inst_628F3F08_1","path":"rooms/rm_level_2/rm_level_2.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"GUI","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4452C235_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_endturn","path":"objects/obj_endturn/obj_endturn.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":32.0,"y":188.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_628F3F08_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_modebutton","path":"objects/obj_modebutton/obj_modebutton.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":81.0,"y":203.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":false,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":100,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7189912_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"con_render","path":"objects/con_render/con_render.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6CF2F996_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"con_controller","path":"objects/con_controller/con_controller.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":16.0,"y":32.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":false,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Mobs","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":8,"SerialiseWidth":12,"TileCompressedData":[
-5,-2147483648,1,0,-7,-2147483648,3,1,-2147483648,0,-5,-2147483648,
2,5,0,-3,-2147483648,1,0,-3,-2147483648,3,4,-2147483648,
0,-11,-2147483648,23,0,4,0,-2147483648,-2147483648,3,0,-2147483648,
0,-2147483648,0,-2147483648,0,-2147483648,0,5,-2147483648,-2147483648,0,0,
-2147483648,-2147483648,0,-6,-2147483648,2,2,0,-3,-2147483648,5,0,
-2147483648,-2147483648,4,0,-6,-2147483648,-2,0,-5,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"mobs","path":"tilesets/mobs/mobs.yy",},"userdefinedDepth":false,"visible":false,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Map","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":8,"SerialiseWidth":12,"TileCompressedData":[
-2,1,1,4,-3,1,2,4,1,-3,4,-2,
1,-3,4,-3,1,1,4,-3,2,-6,1,2,
4,1,-3,2,5,1,4,4,1,1,-3,4,
-2,1,-2,2,3,1,4,4,-4,1,1,4,
-3,1,3,2,1,1,-3,2,9,1,4,1,
1,4,1,4,1,1,-3,2,4,4,1,1,
4,-5,1,-4,2,1,1,-4,4,-2,1,1,
4,],"TileDataFormat":1,},"tilesetId":{"name":"tiles","path":"tilesets/tiles/tiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":400,"effectEnabled":true,"effectType":"_filter_contrast","gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_ContrastIntensity","type":0,"value":"1",},
        {"name":"g_ContrastBrightness","type":0,"value":"1",},
      ],"spriteId":{"name":"spr_background","path":"sprites/spr_background/spr_background.yy",},"stretch":true,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":true,"x":32,"y":-20,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 256,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 384,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":1024,"hspeed":-1,"hview":256,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1536,"wview":384,"xport":0,"xview":32,"yport":0,"yview":-20,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": true,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}