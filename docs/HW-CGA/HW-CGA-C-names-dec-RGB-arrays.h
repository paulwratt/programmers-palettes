// the length of the longest color name
#define CGA_NAMES_MAX=12

char namesCGA[][CGA_NAMES_MAX] = 
{

	{ "black" },
	{ "low blue" },
	{ "low green" },
	{ "low cyan" },
	{ "low red" },
	{ "low magenta" },
	{ "brown" },
	{ "light gray" },
	{ "dark gray" },
	{ "high blue" },
	{ "high green" },
	{ "high cyan" },
	{ "high red" },
	{ "high magenta" },
	{ "yellow" },
	{ "white" },
	{ "" } // delete this line, and comma last above
};

char dcolorsCGA[][3] = 
{

	{ 0, 0, 0 },
	{ 0, 0, 170 },
	{ 0, 170, 0 },
	{ 0, 170, 170 },
	{ 170, 0, 0 },
	{ 170, 0, 170 },
	{ 170, 85, 0 },
	{ 170, 170, 170 },
	{ 85, 85, 85 },
	{ 85, 85, 255 },
	{ 85, 255, 85 },
	{ 85, 255, 255 },
	{ 255, 85, 85 },
	{ 255, 85, 255 },
	{ 255, 255, 85 },
	{ 255, 255, 255 },
	{ 0,0,0 } // delete this line, and last comma above
};
