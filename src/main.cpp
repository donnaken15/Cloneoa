#if _WIN32 || _WIN64 || defined(WIN32) || defined(__NT__)
#define GFX_ENABLE_D3D9 1
#define SFX_ENABLE_MMS 1

#if GFX_ENABLE_D3D9
#include "C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Include\d3d9.h"
#include "C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)\Include\d3dx9.h"
#endif

#include <Windows.h>

#if GFX_ENABLE_D3D9
#pragma comment (lib, "\"C:\\Program Files (x86)\\Microsoft DirectX SDK (June 2010)\\Lib\\x86\\d3d9.lib\"")
#pragma comment (lib, "\"C:\\Program Files (x86)\\Microsoft DirectX SDK (June 2010)\\Lib\\x86\\d3dx9.lib\"")
#endif
#endif

#if SFX_ENABLE_MMS
#pragma comment (lib, "winmm.lib")
#endif

#include "klo.h"

#include <direct.h>
#include <stdio.h>
#include <stdint.h>

//int _chdir(const char* WorkingDirectoryToChangeTo);

#pragma region data
static const string title = "Cloneoa",
version = "v0.04", buildtime[] = { __DATE__, __TIME__ };
static string filename;

#pragma region ctrl defines
#define CTRL_START	64
#define CTRL_FIRE	32
#define CTRL_JUMP	16
#define CTRL_LEFT	8
#define CTRL_UP		4
#define CTRL_DOWN	2
#define CTRL_RIGHT	1
#pragma endregion

//static byte binds[8];

static /*const*/ SIZE32 res;
static const SIZE32 resmin = { 160, 80 };
static const uint_fast16_t poscount = 16;
static POINT32 pos[poscount];
static RECT rect[16];

// i dont know why im adding things that allow two or more players in memory

#define PLAYERCOUNT 1

#define LOGGING 0

#if PLAYERCOUNT > 1
static PLAYERINFO player[PLAYERCOUNT];
#else
static PLAYERINFO player;
#endif

static LEVEL level;

static const unsigned long strbufsz = 512;
string strbuf = new char[strbufsz];
static maxplus frame, drawintv = 16, intvcurr = 0, interval = 4,
lastintv, clock, clocklast, clockstart, clockpauselast, clockmusiclpst,
clockmusicint, clockmusicintlen, clockpause, delta;
static byte mode = 0, musicpos = 0;//, pod = 0;
static FLOAT speed = 1;

// STUPID TIMING STUFF
#define NO_STEPPING_IN_BETWEEN_FRAMES 0

#pragma endregion

#pragma region game funcs

// names suck, have this

void draw();
void play();
void game();
void sfx();
void ctrl();
DWORD time();

void play()
{
	//player.pos.x += 50;
	frame = 0;
	mode = 1;
	clockstart = time();
#if LOGGING
	fprintf(stdout, "%d> Game is started\n", time());
#endif
	//mciSendString(TEXT("play ../mus/w01_int.wma"), NULL, 0, NULL);
}

void game()
{
	intvcurr = time();
	clock = (intvcurr - clockstart - clockpause) * speed;
	//mciSendString(TEXT("play ../mus/w01_lp.wma repeat"), NULL, 0, NULL);
}

// when am i using this
static int random(int min, int max)
{
	return rand() % max + min;
}

// emulating that dumb thing programmers did to return something
// you didn't want, by returning characters encountered
// instead of the string itself :)
uint_fast16_t chrswap(string &a, size_t b, char c, char d) {
	uint_fast16_t e;
	for (size_t i = 0; i < b; i++)
		if (a[i] == c) {
			++e;
			a[i] = d;
		}
	return e;
}

#pragma endregion

#if _WIN32 || _WIN64 || defined(WIN32) || defined(__NT__)
#pragma region beta windows

static string workingdir(string append)
{
	GetCurrentDirectoryA(strbufsz, strbuf);
	sprintf(strbuf, "%s\\%s", strbuf, append);
	return strbuf;
}

static void workingdir()
{
	GetCurrentDirectoryA(strbufsz, strbuf);
}

static const string __static = "static", button = "button";
static char ofname[MAX_PATH];
static string ini;

static HWND hWndmain, hWndCFG, menu[10], confctrls[20];
static POINT32 center;

DWORD time()
{
	return GetTickCount();
}

USHORT key(int a);

USHORT key(int a)
{
	if (GetActiveWindow() == hWndmain)
		return GetAsyncKeyState(a);
}

void ctrl()
{
	if (mode) {
		//MessageBox(hWndmain, "", "", 0);
		if (key(player.keys[CTRL_START]))
		{

		}
		if (key(player.keys[CTRL_FIRE]))
		{

		}
		if (key(player.keys[CTRL_JUMP]))
		{

		}
		if (key(player.keys[CTRL_LEFT]))
		{
			player.pos.x -= (delta * (player.speed / 8)) - (0.95 * (player.pos.x > 0));//(-64 * player.pos.x > 0);// * (0.53333333333 * player.pos.x > 0);
		}
		if (key(player.keys[CTRL_UP]))
		{

		}
		if (key(player.keys[CTRL_DOWN]))
		{

		}
		if (key(player.keys[CTRL_RIGHT]))
		{
			if (!key(player.keys[CTRL_LEFT]))
				player.pos.x += (delta * (player.speed / 8)) - (0.95 * (player.pos.x < 0));
		}
	}
}

static OPENFILENAME ofn;

#if GFX_ENABLE_D3D9
static LPDIRECT3DTEXTURE9		d3d_textures[4];
static LPD3DXSPRITE				d3d_drawing;
static LPDIRECT3D9				d3d_main;
static LPDIRECT3DDEVICE9		d3d_device;
static LPD3DXFONT				d3d_fonts[2];
static D3DXVECTOR3				d3d_pos[poscount];
//static HFONT hfonts[2];

static void NewTexture(LPCSTR fname, D3DFORMAT fmt, LPDIRECT3DTEXTURE9 *tex);

static void NewTexture(LPCSTR fname, D3DFORMAT fmt, LPDIRECT3DTEXTURE9 *tex)
{
	D3DXCreateTextureFromFileEx(d3d_device, fname, D3DX_DEFAULT_NONPOW2, D3DX_DEFAULT_NONPOW2,
		D3DX_DEFAULT, 0, fmt, D3DPOOL_DEFAULT, D3DX_DEFAULT,
		D3DX_DEFAULT, D3DCOLOR_XRGB(255, 0, 255), NULL, NULL, tex);
}

void gfx_d3d9_init();

void gfx_d3d9_init() {
#if LOGGING
	fprintf(stdout, "%d> Using D3D\n", time());
#endif
	d3d_main = Direct3DCreate9(D3D_SDK_VERSION);
	D3DPRESENT_PARAMETERS d3dpp;
	ZeroMemory(&d3dpp, sizeof(d3dpp));
	d3dpp.Windowed = true;
	d3dpp.SwapEffect = D3DSWAPEFFECT_DISCARD;
	d3dpp.hDeviceWindow = hWndmain;
	//d3dpp.BackBufferFormat = D3DFMT_R8G8B8;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
	d3d_main->CreateDevice(
		D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL,
		hWndmain, D3DCREATE_SOFTWARE_VERTEXPROCESSING |
		D3DCREATE_MULTITHREADED, &d3dpp, &d3d_device);
	d3d_device->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d_device->SetRenderState(D3DRS_ZENABLE, FALSE);
	NewTexture(workingdir("gfx\\player_noa.png"), D3DFMT_A8R8G8B8, &d3d_textures[0]);
	NewTexture(workingdir("gfx\\hud.png"), D3DFMT_A8R8G8B8, &d3d_textures[1]);
	NewTexture(workingdir("gfx\\obj.png"), D3DFMT_A8R8G8B8, &d3d_textures[2]);
	D3DXCreateSprite(d3d_device, &d3d_drawing);
	for (int i = 0; i < 16; i++)
		d3d_pos[i] = D3DXVECTOR3(pos[i].x, pos[i].y, 0);
	//hfonts[0] = CreateFontA(16, 6, 0, 0, 0, false, false, false, 0, 0, 0, 0, 0, "Arial");
	D3DXCreateFontA(d3d_device, 22, 0, 0, 1, 0, DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, NONANTIALIASED_QUALITY, DEFAULT_PITCH || FF_DONTCARE, "Arial", &d3d_fonts[0]);
}

static void drawText(int i, LPSTR text, int left, int top, int right, int bottom, D3DCOLOR COLOR);

static void drawText(int i, LPSTR text, int left, int top, int right, int bottom, D3DCOLOR COLOR)
{
	rect[15].left = left;
	rect[15].right = right;
	rect[15].top = top;
	rect[15].bottom = bottom;
	d3d_fonts[i]->DrawTextA(0, text, -1, &rect[15], NULL, COLOR);
}
#endif

#if SFX_ENABLE_MMS
void playSndF(string fname, byte loop);

void playSndF(string fname, byte loop) {
	PlaySoundA(fname, GetModuleHandle(NULL),
		SND_ASYNC | SND_FILENAME | SND_NOWAIT | (loop * SND_LOOP));
}

void playSndM(byte*data, byte loop);

void playSndM(byte*data, byte loop) {
	PlaySoundA((LPCSTR)data, GetModuleHandle(NULL),
		SND_ASYNC | SND_MEMORY | SND_NOWAIT | (loop * SND_LOOP));
}

#endif

#if LOGGING
static HWND stdoutdisp;
static FILE*logdata[3];
static string logfns[3] = { "in.txt", "out.txt", "err.txt" };
#endif

#define FONTS_ENABLED 0
#if FONTS_ENABLED
HFONT arial;
#endif

#if FONTS_ENABLED
void SetWindowFont(HWND ctrl, HFONT font) {
	SendMessage(ctrl, WM_SETFONT, (LPARAM)font, 1);
}
#endif

void fileAssoc() {
	DWORD disp;
	HKEY regext, regclass, regtemp;
	if (RegCreateKeyEx(HKEY_CLASSES_ROOT, ".klo",
		0, NULL, 0, KEY_WRITE, NULL, &regext, &disp) == ERROR_SUCCESS)
		if (RegSetValue(regext, 0, REG_SZ,
			"Cloneoa.KLO", 12) == ERROR_SUCCESS)
			if (RegCloseKey(regext) != ERROR_SUCCESS)
				fprintf(stderr, "/!\\ %s", "Closing the extension key failed, how weird is that");
			else {}
		else
			fprintf(stderr, "/!\\ %s", "Setting extension value failed");
	else
		fprintf(stderr, "/!\\ %s", "Creating extension key failed");
}

void draw()
{
#if GFX_ENABLE_D3D9
	d3d_device->Clear(0, NULL, D3DCLEAR_TARGET, mode*(D3DCOLOR_ARGB(255, 255, 255, 255)), 0.0f, 0);

	d3d_device->BeginScene();

	d3d_drawing->Begin(0);

	//d3d_drawing->Draw(d3d_textures[0], NULL, NULL, 0, 0, NULL, 0xFFFFFFFF);

	sprintf(strbuf, "FRAME: %llu\nCLOCK: %llu\nPOS: %dX%d\nDELTA: %d", frame, clock, player.pos.x, player.pos.y, delta);
	drawText(0, strbuf, 0, 0, 300, 200, D3DCOLOR_ARGB(255, 0, 255, 0));

	d3d_drawing->Draw(d3d_textures[1], &rect[1], 0, &d3d_pos[1], 0xFFFFFFFF);

	if (res.cx - rect[1].right > 0)
		for (int i = 0; i < res.cx - rect[1].right; i++)
			d3d_drawing->Draw(d3d_textures[1], &rect[2], 0, &D3DXVECTOR3(rect[1].right + i, d3d_pos[2].y, 0), 0xFFFFFFFF);

	d3d_drawing->Draw(d3d_textures[1], &rect[3], 0, &d3d_pos[3], 0xFFFFFFFF);

	d3d_drawing->Draw(d3d_textures[0], &rect[10], 0, &D3DXVECTOR3(player.pos.x, player.pos.y, 0), 0xFFFFFFFF);

	if (key(VK_TAB))
		drawText(0, ">>", res.cx - 20, 0, res.cx + 4, 32, D3DCOLOR_ARGB(127, 255, 0, 0));

	d3d_drawing->End();

	d3d_device->EndScene();

	d3d_device->Present(NULL, NULL, NULL, NULL);
#endif

	++frame;
	//Sleep(interval);

	//if (frame == 120) {
	//playSndF("..\\sfx\\wahoo.wav",0);
	//mciSendString(TEXT("play ../snd/wahoo.wav"), NULL, 0, NULL);
	//exit(0);
	//}
}

void sfx_init()
{
	workingdir();
	sprintf_s(strbuf + (strbufsz / 2), (strbufsz / 2), "open %s/mus/w01_int.wav alias music_start", strbuf);
	chrswap(strbuf, strbufsz, '\\', '/');
	mciSendString(strbuf + (strbufsz / 2), NULL, 0, NULL);
	workingdir();
	sprintf_s(strbuf + (strbufsz / 2), (strbufsz / 2), "open %s/mus/w01_lp.wma alias music_loop", strbuf);
	chrswap(strbuf, strbufsz, '\\', '/');
	mciSendString(strbuf + (strbufsz / 2), NULL, 0, NULL);
}

void sfx() {
#if SFX_ENABLE_MMS
	if (musicpos == 0) {
		mciSendString("status music_start length track 1", strbuf, strbufsz, NULL);
		clockmusicintlen = atoi(strbuf);
		//MessageBox(hWndmain, strbuf, "", 0);
		mciSendString("play music_start", NULL, 0, NULL);
		clockmusicint = clocklast - clockstart;
		//sprintf(strbuf, "%d", clockmusicint + clockmusicintlen);
		//MessageBox(hWndmain, strbuf, "", 0);
		//playSndF("..\\mus\\w01_int.wav", 0);
		musicpos = 1;
	}
	if (clock >= (clockmusicintlen + clockmusicint - 100 - (2400 * musicpos > 1)) * speed && musicpos > 0) {
		//playSndF("..\\mus\\w01_lp.wav", 1);
		clockmusiclpst = clocklast;
		clockmusicint = clock;
		mciSendString("play music_loop from 0", NULL, 0, NULL);
		mciSendString("status music_loop length track 1", strbuf, strbufsz, NULL);
		clockmusicintlen = atoi(strbuf);
		musicpos = 2;
	}
	//if (clocklast >= (clockmusiclpst + clockmusicintlen) && musicpos == 2)
	//{
		//clockmusiclpst = clocklast;
		//mciSendString("play music_loop from 0", NULL, 0, NULL);
		//mciSendString("status music_loop length track 1", strbuf, strbufsz, NULL);
		//clockmusicintlen = atoi(strbuf);
	//}
#endif
}

void showMenu(byte j);

void showMenu(byte j)
{
	for (int i = 0; i < 9; i++)
		ShowWindow(menu[i], SW_SHOW*j);
}

void win_init();

void win_init() {
	showMenu(0);
	{
		pos[1].y = res.cy - 50;
		pos[2].y = pos[1].y;
		pos[3].y = pos[1].y;
		pos[3].x = res.cx - 2;
		rect[1].right = 154;
		rect[1].bottom = 16;
		rect[2].left = 153;
		rect[2].right = 154;
		rect[2].bottom = 16;
		rect[3].left = 154;
		rect[3].right = 162;
		rect[3].bottom = 16;
	}
#if GFX_ENABLE_D3D9
	gfx_d3d9_init();
#endif
#if SFX_ENABLE_MMS
	sfx_init();
#endif
	//playSnd("../mus/file.wav",1);
	//mciSendString(TEXT("play ../mus/file.wma"), NULL, 0, NULL);
	//mciSendString(TEXT("play ../mus/file.wma wait"), NULL, 0, NULL);
	play();

}

LRESULT CALLBACK WindowProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam);
LRESULT CALLBACK WindowProcConf(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam);

int WINAPI WinMain(HINSTANCE hInstance,
	HINSTANCE hPrevInstance,
	LPSTR lpCmdLine,
	int nCmdShow)
{
	static WNDCLASSEX wc, wc2;

	ZeroMemory(&wc, sizeof(WNDCLASSEX));

	wc.cbSize = sizeof(WNDCLASSEX);
	wc.style = CS_HREDRAW | CS_VREDRAW;
	wc.lpfnWndProc = WindowProc;
	wc.hInstance = hInstance;
	wc.hCursor = LoadCursor(NULL, IDC_ARROW);
	wc.hbrBackground = (HBRUSH)5;
	wc.lpszClassName = title;

	RegisterClassEx(&wc);

	workingdir();
	sprintf(strbuf, "%s\\bin\\settings.ini", strbuf);
	//MessageBox(hWndmain, strbuf, "", 0);
	ini = strbuf;

	res.cx = GetPrivateProfileInt("GFX", "ResX", 360, ini);
	res.cy = GetPrivateProfileInt("GFX", "ResY", 320, ini);

	center.x = GetSystemMetrics(SM_CXSCREEN) / 2 - res.cx / 2;
	center.y = GetSystemMetrics(SM_CYSCREEN) / 2 - res.cy / 2;

	hWndmain = CreateWindowExA(NULL, title, title,
		WS_OVERLAPPED | WS_SYSMENU | WS_SIZEBOX | WS_MINIMIZEBOX | WS_MINIMIZE,
		center.x, center.y, res.cx + 6, res.cy + 34, NULL, NULL, hInstance, NULL);

	if (__argc == 1) {
#pragma region freaking menu
		menu[0] = CreateWindowA(__static, "KLONOA\n    CUSTOM LEVEL ENGINE",
			WS_CHILD | WS_VISIBLE, 12, 12, 176, 32, hWndmain,
			0, wc.hInstance, 0);

		menu[1] = CreateWindowA(button, "Load Vision...",
			WS_CHILD | WS_VISIBLE, 20, 64, 104, 24, hWndmain,
			(HMENU)0, wc.hInstance, 0);

		menu[2] = CreateWindowA(button, "Settings...",
			WS_CHILD | WS_VISIBLE, 20, 98, 104, 24, hWndmain,
			(HMENU)1, wc.hInstance, 0);

		menu[3] = CreateWindowA(__static, "Level",
			WS_CHILD | WS_VISIBLE, 25, 137, 37, 16, hWndmain,
			0, wc.hInstance, 0);

		menu[4] = CreateWindowA(button, "Editor",
			WS_CHILD | WS_VISIBLE, 70, 134, 76, 24, hWndmain,
			(HMENU)2, wc.hInstance, 0);

		menu[5] = CreateWindowA(button, "Analyzer",
			WS_CHILD | WS_VISIBLE, 70, 165, 76, 24, hWndmain,
			(HMENU)3, wc.hInstance, 0);

		menu[6] = CreateWindowA(button, "Directory",
			WS_CHILD | WS_VISIBLE, 70, 196, 76, 24, hWndmain,
			(HMENU)4, wc.hInstance, 0);

		menu[7] = CreateWindowA(__static, "developed by donnaken15",
			WS_CHILD | WS_VISIBLE, 0, 0, 0, 0, hWndmain, 0, wc.hInstance, 0);

		sprintf_s(strbuf, strbufsz, "%s | buildtime: %s, %s", version, buildtime[0], buildtime[1]);

		menu[8] = CreateWindowA(__static, strbuf,
			WS_CHILD | WS_VISIBLE, 0, 0, 0, 0, hWndmain, 0, wc.hInstance, 0);

#if FONTS_ENABLED
		arial = CreateFontA(17, 0, 0, 0, 400, 0, 0, 0, 0, 0, 0, 0, 0x20, "Arial");
		for (int i = 0; i < 9; i++)
			SetWindowFont(menu[i], arial);
		// what was previously here was absolutely disgusting
#endif

		ZeroMemory(&ofname, sizeof(ofname));
		ZeroMemory(&ofn, sizeof(ofn));
		ofn.lStructSize = sizeof(ofn);
		ofn.hwndOwner = NULL;  // If you have a window to center over, put its HANDLE here
		ofn.lpstrFilter = "Level File (*.klo)\0*.klo\0All Files (*.*)\0*.*\0";
		ofn.lpstrFile = ofname;
		ofn.nMaxFile = MAX_PATH;
		ofn.lpstrTitle = "Load Level";
		ofn.Flags = OFN_DONTADDTORECENT | OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST;

#pragma region cfg diag
		ZeroMemory(&wc2, sizeof(WNDCLASSEX));

		wc2.cbSize = sizeof(WNDCLASSEX);
		wc2.style = CS_HREDRAW | CS_VREDRAW;
		wc2.lpfnWndProc = WindowProcConf;
		wc2.hInstance = hInstance;
		wc2.hCursor = LoadCursor(NULL, IDC_ARROW);
		wc2.hbrBackground = (HBRUSH)5;
		wc2.lpszClassName = "CloneaConf";

		RegisterClassEx(&wc2);

		hWndCFG = CreateWindowExA(NULL, wc2.lpszClassName,
			"Settings", WS_OVERLAPPED | WS_SYSMENU | WS_DLGFRAME,
			GetSystemMetrics(SM_CXSCREEN) / 2 - 270 / 2,
			GetSystemMetrics(SM_CYSCREEN) / 2 - 300 / 2,
			270, 340, hWndmain, NULL, hInstance, NULL);
		//ShowWindow(hWndCFG, SW_HIDE);
#pragma endregion
#pragma region config *literal* controls
		confctrls[0] = CreateWindowA(__static, "Graphics",
			WS_CHILD | WS_VISIBLE, 12, 12, 176, 17, hWndCFG,
			0, wc.hInstance, 0);
		confctrls[1] = CreateWindowA(__static, "Sound",
			WS_CHILD | WS_VISIBLE, 12, 96, 176, 17, hWndCFG,
			0, wc.hInstance, 0);
		confctrls[2] = CreateWindowA(__static, "System",
			WS_CHILD | WS_VISIBLE, 12, 180, 176, 17, hWndCFG,
			0, wc.hInstance, 0);
		confctrls[3] = CreateWindowA(button, "Write File Associations",
			WS_CHILD | WS_VISIBLE, 16, 208, 166, 26, hWndCFG,
			0, wc.hInstance, 0);
#if FONTS_ENABLED
		SetWindowFont(confctrls[0], arial);
		SetWindowFont(confctrls[1], arial);
		SetWindowFont(confctrls[2], arial);
		SetWindowFont(confctrls[3], arial);
#endif
#pragma endregion
#pragma endregion
	}

	_fullpath(strbuf, __argv[0], strbufsz);
	//MessageBox(hWndmain, strbuf, "", 0);

#if LOGGING
	for (int i = 0; i < 3; i++)
		logdata[i] = freopen(logfns[i], "w", (&__iob_func()[i]));
#endif
	ShowWindow(hWndmain, nCmdShow);

	player.keys[CTRL_LEFT] = VK_LEFT;
	player.keys[CTRL_RIGHT] = VK_RIGHT;
	player.speed = 1;

	if (__argc > 1)
		win_init();

	rect[10].right = 100;
	rect[10].bottom = 100;

	static MSG msg;

	while (TRUE)
	{
		//switch (mode) {
		//case 0:
		while (PeekMessageA(&msg, NULL, 0, 0, PM_REMOVE))
		{
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
		if (key(VK_PAUSE) & 1) {
			mode = !mode;
			switch (musicpos) {
			case 1:
				if (mode)
					mciSendString("play music_start", 0, 0, 0);
				else
					mciSendString("pause music_start", 0, 0, 0);
				break;
			case 2:
				if (mode)
					mciSendString("play music_loop", 0, 0, 0);
				else
					mciSendString("pause music_loop", 0, 0, 0);
				break;
			}
			if (!mode) {
				clockpauselast = time();
				playSndF("sfx\\pause.wav", 0);
				draw();
			}
			else
				clockpause += time() - clockpauselast;
		}
		if (!mode) {
			if (!key(VK_TAB))
				Sleep(13);
		}
		else {
			clocklast = time();
#if !NO_STEPPING_IN_BETWEEN_FRAMES
			lastintv = clocklast;
			if (!key(VK_TAB))
				Sleep(interval);
#endif
			//while (time() - lastintv < interval);
			if (frame > 0) {
				delta = time() - clockstart - clockpause - clock;
				//delta = time() - intvcurr - clockpause;
				//delta = clocklast - clockstart - clockpause - clock;
				//sprintf(strbuf,"%u",delta);
				//MessageBoxA(hWndmain,strbuf,"",0);
				//if (delta < 1)
				//delta = 1;
				//delta = drawintv;
			}
			ctrl();
			sfx();
			game();
			//sprintf(strbuf, "%u - %u = %u", intvcurr, lastintv, intvcurr - lastintv);
			//MessageBox(hWndmain, strbuf, "", 0);
			if (!key(VK_TAB)) {
				//intvcurr -= lastintv;
				//intvcurr = clock - lastintv;
				//sprintf(strbuf, "%u - %u = %u", intvcurr, lastintv, intvcurr - lastintv);
				//MessageBox(hWndmain, strbuf, "", 0);
				//if (drawintv <= time() - lastintv) {
#if NO_STEPPING_IN_BETWEEN_FRAMES
				Sleep(drawintv);
#else
				if (intvcurr - lastintv >= drawintv - interval)
#endif
					draw();
				//intvcurr = 0;
			}
			else draw();
		}
		//GetMessageA(&msg, NULL, 0, 0);
		//game();
		//break;
		//}

		if ((msg.message == WM_QUIT ||
			msg.message == WM_CLOSE ||
			msg.message == WM_DESTROY))
			break;
	}

	exit(0);
	return msg.wParam;
}

LRESULT CALLBACK WindowProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
	case WM_COMMAND:
		switch (wParam) {
		case 0:
			workingdir();
			if (GetOpenFileNameA(&ofn)) {
				chdir(strbuf);
				win_init();
			}
			break;
		case 1:
			ShowWindow(hWndCFG, SW_SHOW);
			EnableWindow(hWndmain, 0);
			break;
		case 2:
			ShellExecute(hWndmain, "open", "enVisioner.exe", 0, 0, SW_SHOW);
			break;
		}
		break;
		/*case WM_CTLCOLORSTATIC:
		SetTextColor((HDC)hWndmain, RGB(255, 255, 255));
		SetBkColor((HDC)hWndmain, RGB(0, 0, 0));
		return (INT_PTR)CreateSolidBrush(RGB(0, 0, 0));
		break;*/
	case WM_GETMINMAXINFO:
		reinterpret_cast<MINMAXINFO*>(lParam)->ptMinTrackSize.x = resmin.cx;
		reinterpret_cast<MINMAXINFO*>(lParam)->ptMinTrackSize.y = resmin.cy;
		reinterpret_cast<MINMAXINFO*>(lParam)->ptMaxTrackSize.x = 10000;
		reinterpret_cast<MINMAXINFO*>(lParam)->ptMaxTrackSize.y = 10000;
		break;
	case WM_PAINT:
		//MessageBoxA(0,"a","b",0);
		break;
	case WM_SIZE:
		if (mode == 0 || !GFX_ENABLE_D3D9) {
			res.cx = LOWORD(lParam) - 6;
			res.cy = HIWORD(lParam) + 34;
		}
		SetWindowPos(menu[7], 0, 12, HIWORD(lParam) - 52, 176, 17, 0);
		SetWindowPos(menu[8], 0, 12, HIWORD(lParam) - 30, 270, 17, 0);
		break;
	case WM_CLOSE:
	case WM_DESTROY:
	case WM_QUIT:
	{
#if LOGGING
		for (int i = 0; i < 3; i++)
			fclose(logdata[i]);
#endif
		exit(0);
		PostQuitMessage(0);
	} break;
	}

	return DefWindowProc(hWnd, message, wParam, lParam);
}

LRESULT CALLBACK WindowProcConf(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
	case WM_COMMAND:
		switch (wParam) {
		case 0:
			fileAssoc();
			break;
		case 1:
			break;
		}
		break;
	case WM_CLOSE:
	{
		EnableWindow(hWndmain, 1);
		ShowWindow(hWndCFG, SW_HIDE);
		return 1;
	} break;
	}

	return DefWindowProc(hWnd, message, wParam, lParam);
}

#pragma endregion

#elif unix || __unix || __unix__ || __linux__ || linux
#pragma region alpha penguin

#pragma endregion

#elif (unix || __unix || __unix__) && (__APPLE__ || __MACH__ || TARGET_OS_MAC)
#pragma region omega apple

#pragma endregion

#else

LPCSTR error = "Either broken preprocessor directive or an unsupported system, nice going, dingus";
int main() {
	puts(error);
	exit(999);
}

#endif