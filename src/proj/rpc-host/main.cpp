#include "discord_rpc.h"
#include "discord_register.h"
#include <Windows.h>
#include <tlhelp32.h>
#include <fstream>
#include <time.h>

#pragma comment (lib, "discord-rpc.lib")

//using namespace std;

//TODO: MAKE PRESENCE UPDATER USING TEMP FILE

HANDLE parent;

DWORD ppid(DWORD pid)
{
	HANDLE h = NULL;
	PROCESSENTRY32 pe = { 0 };
	DWORD ppid = 0;
	pe.dwSize = sizeof(PROCESSENTRY32);
	h = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
	if (Process32First(h, &pe))
	{
		do
		{
			if (pe.th32ProcessID == pid)
			{
				ppid = pe.th32ParentProcessID;
				break;
			}
		} while (Process32Next(h, &pe));
	}
	CloseHandle(h);
	return (ppid);
}

//char TMP[_MAX_PATH],
//char TMPF[_MAX_PATH], RPC_CMD[256];

int main(int argc, char*argv[])
{
	Discord_Initialize("799293309452288043", 0, 1, 0);

	DiscordRichPresence rpc;
	memset(&rpc, 0, sizeof(rpc));
	//rpc.details = "";
	//rpc.state = "";
	rpc.details = argv[1];
	rpc.state = "Playing Level";
	rpc.startTimestamp = time(0);
	rpc.instance = 1;
	//GetTempPath(_MAX_PATH, TMPF);
	///strncpy(TMPF, TMP, _MAX_PATH);
	//strcat(TMPF, "KLO-RPC-CMD");
	//ifstream file;
	Discord_UpdatePresence(&rpc);
	parent = OpenProcess(PROCESS_ALL_ACCESS, TRUE, ppid(GetCurrentProcessId()));
	while (1) {
		if (WaitForSingleObject(parent, 200) != WAIT_TIMEOUT) {
			Discord_Shutdown();
			break;
		}
		/*file.open(TMPF, ios::in | ios::binary);
		if (!file)
		{
			file.seekg(0);
			//file.read();
			//remove(TMPF);
		}*/
		//remove();
		//Discord_UpdatePresence(&rpc);
	}
	//Discord_Shutdown();
}

/*
int main(int argc, char** argv)
{
	struct DiscordCreateParams params;
	DiscordCreateParamsSetDefault(&params);
	params.client_id = 799293309452288043;
	params.flags = DiscordCreateFlags_Default;
	
	DISCORD_REQUIRE(DiscordCreate(DISCORD_VERSION, &params, &core));
	display = new DiscordActivity();
	strncpy(display->name, "Cloneoa", 128);
	strncpy(display->state, "Playing Level", 128);
	strncpy(display->details, "\"klex01\" (0 / 3)", 128);
	display->type = DiscordActivityType_Playing;
	display->instance = 1;
	
	for (;;) {
		DISCORD_REQUIRE(core->run_callbacks(core));
		manager->update_activity(manager, display, 0, 0);

		Sleep(160);
	}

	return 0;
}*/
