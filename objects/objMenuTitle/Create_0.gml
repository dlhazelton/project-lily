/// @description
// m = menu
// Definitions includes default dimensions and
// Space between elements in the window
KeyBinds();

// Using a 2D Array to allow for submenus when needed  
 
// Primary Menu
mOption[0, 0] = "Continue";
mOption[0, 1] = "Start Game";
mOption[0, 2] = "Settings";
mOption[0, 3] = "Quit";

// Settings Sub-Menu
mOption[1, 0] = "Window Size";
mOption[1, 1] = "Controls";
mOption[1, 2] = "Back";

// Window Size Sub-Menu
mOption[2, 0] = "640x360";
mOption[2, 1] = "960x540";
mOption[2, 2] = "1280x720";
mOption[2, 3] = "1366x768";
mOption[2, 4] = "1600x900";
mOption[2, 5] = "1920x1080";
mOption[2, 6] = "Fullscreen?"
mOption[2, 7] = "Back";

// Control Remap Sub-Menu
mOption[3, 0] = "Keyboard";
mOption[3, 1] = "Controller";
mOption[3, 2] = "Reset to Default";
mOption[3, 3] = "Back";

// Keyboard Remap Sub-Menu
mOption[4, 0] = "Left";
mOption[4, 1] = "Right";
mOption[4, 2] = "Attack";
mOption[4, 3] = "Back";

// Controller Remap Sub-Menu
mOption[5, 0] = "Left";
mOption[5, 1] = "Right";
mOption[5, 2] = "Jump";
mOption[5, 3] = "Attack";
mOption[5, 4] = "Back";

// Changing left on KB/M
mOption[6, 0] = "A";
mOption[6, 1] = "<-";
mOption[6, 2] = "Numpad 4";
mOption[6, 3] = "Back";

// Changing Right on KB/M
mOption[7, 0] = "D";
mOption[7, 1] = "->";
mOption[7, 2] = "Numpad 6";
mOption[7, 3] = "Back";

// Changing Attack on KB/M
mOption[8, 0] = "Mouse Left";
mOption[8, 1] = "Shift";
mOption[8, 2] = "Enter";
mOption[8, 3] = "Back";


// File Select Sub-Menu

// Needs to be outside of Variable Definitions to avoid crashing
// Seems to be some sort of bug with GPL itself causing it
mLength = 0;
mDepth = 0;
