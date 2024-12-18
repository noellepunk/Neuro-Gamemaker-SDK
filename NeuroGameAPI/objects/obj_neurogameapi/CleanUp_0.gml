/// @description Close server and unregister all actions on shutdown

//get rid of socket connection and unregister all actions when the game closes
network_destroy(global.socket);
NeuroSendUnregisterAll();