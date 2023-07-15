// how to
//  drag n drop this folder into `/tf/scripts/vscripts/`
//  to add this to a map, make an entity with "vscripts" keyvalue, and place `player_tunes/master.nut` as the parameter
//  or type into console after map load: `script_execute player_tunes/master`

// what do
//  when a player reaches POINT_THRESHOLD points within a single life 


// change the following as you see fit
//::TRIGGER_ON_STREAK <- true // (UNUSED) do we trigger on a streak in a single life?
::POINT_THRESHOLD <- 20 // how many points to trigger a tune

// in console:
//  script ChangePointThreshold(30.0)
function ChangePointThreshold(change)
{
	::POINT_THRESHOLD <- change
}

//::TIME_THRESHOLD <- 60 // (UNUSED) over how much time (in seconds) (unused if TRIGGER_ON_STREAK is true)

::MINIMUM_TIME_BEFORE_NEXT_TRIGGER <- 30.0 // how much time do we wait before we allow another song to interrupt the previously playing one

// in console:
//  script ChangeTimeBetweenTriggers(30.0)
function ChangeTimeBetweenTriggers(change)
{
	::MINIMUM_TIME_BEFORE_NEXT_TRIGGER <- change
}

//
function PrecacheAllSongsInTable(songTable)
{
	for (local i = 0; i < songTable.len(); i++)
		// if we find .mp3 or .wav file, its prolly raw audio 
		if (songTable[i].tostring().find(".mp3") || songTable[i].tostring().find(".wav"))
			PrecacheSound(songTable[i])
		// otherwise assume its a soundscript
		/*else if (songTable[i].tostring() != "0" && songTable[i].tostring() != "null")
			Entities.FindByClassname(null, "player").PrecacheSoundScript(songTable[i])*/
}

// tunes
// you can change these to other tf2 vanilla soundfiles (use gcfscape to view tf2_misc_dir.vpk) or soundscripts (soundscripts NOT SUPPORTED YET)
// or change them to a custom map's packed soundfiles

::SCOUT_TUNES <-
[
	"ui/gamestartup5.mp3", // faster than a speeding bullet (meh?)
]
PrecacheAllSongsInTable(SCOUT_TUNES)

::SOLDIER_TUNES <-
[
	"ui/gamestartup3.mp3", // rocket jump waltz
	"ui/gamestartup4.mp3", // the art of war (meh?)
]
PrecacheAllSongsInTable(SOLDIER_TUNES)

::PYRO_TUNES <-
[
	"ui/gamestartup14.mp3", // dreams of cruelty
]
PrecacheAllSongsInTable(PYRO_TUNES)

::DEMO_TUNES <-
[
	"ui/gamestartup9.mp3", // drunken pipe bomb (meh?)
]
PrecacheAllSongsInTable(DEMO_TUNES)

::HEAVY_TUNES <-
[
	"ui/gamestartup1.mp3", // team fortress 2 (used in meet the heavy but not explicitly heavy i think)
	"ui/gamestartup8.mp3", // intruder alert (feels heavy ish idfk)
]
PrecacheAllSongsInTable(HEAVY_TUNES)

::ENGIE_TUNES <-
[
	"ui/gamestartup10.mp3", // More Gun (meh)
]
PrecacheAllSongsInTable(ENGIE_TUNES)

::MEDIC_TUNES <-
[
	"ui/gamestartup11.mp3", // a little heart to heart (meh?)
	"ui/gamestartup12.mp3", // dust (Voice): MEDIC!
	//"Taunt.MedicHeroic", // meet the medic taunt (found in tf2_misc_dir.vpk/game_sounds_player.txt)
]
PrecacheAllSongsInTable(MEDIC_TUNES)

::SNIPER_TUNES <-
[
	// uh
	// WHERES MEET THE SNIPER MUSIC?
	// apparently its too close to a tv show (which it was paying homage to) theme rip

	// (meh...)
	//"sniper.killer_solo_music", //saxophone taunt (found in tf2_misc_dir.vpk/game_sounds_taunt_workshop.txt)
	// player/taunt_didgeridoo_start followed by player/taunt_didgeridoo_stop

	"ui/gamestartup19.mp3", // red bread (fuck it, they both start similarly with a car driving by camera)
]
PrecacheAllSongsInTable(SNIPER_TUNES)

::SPY_TUNES <-
[
	"ui/gamestartup6.mp3", // petite chou-fleur
	"ui/gamestartup7.mp3", // right behind you (meh?)
]
PrecacheAllSongsInTable(SPY_TUNES)

IncludeScript("player_tunes/dj.nut")
IncludeScript("player_tunes/overseer.nut")