// has the music playing shit

// todo
//  make sure this plays for all players
//  fix audio being hella quiet

::CurrentlyPlayingSound <- null
::QueuedSounds <- {}

::TimeLastSoundPlayed <- 0

::AudioPrecached <- false // set to true if audio comes from map soundscript

// rawfile or soundscript works
function PlaySound(soundName)
{
	if (Time() > TimeLastSoundPlayed + MINIMUM_TIME_BEFORE_NEXT_TRIGGER)
	{
		local nextSound = {
			sound_name  = soundName,
			channel     = -1, // CHAN_REPLACE 
		}

		// TODO: work on queue
		TimeLastSoundPlayed <- Time()
		EmitSoundEx(nextSound)
	}
}

// play a random song from a table of songs
function PlayRandomSoundFrom(songTable)
{
	local length = songTable.len() - 1
	local playIndex = length

	if (playIndex != 0)
		playIndex = RandomInt(0, length)

	if (songTable[playIndex].tostring())
	PlaySound(songTable[playIndex])
}

function PlayRandomClassTune(classNum)
{
	if (classNum == 1)
		PlayRandomSoundFrom(SCOUT_TUNES)
	if (classNum == 2)
		PlayRandomSoundFrom(SNIPER_TUNES)
	if (classNum == 3)
		PlayRandomSoundFrom(SOLDIER_TUNES)
	if (classNum == 4)
		PlayRandomSoundFrom(DEMO_TUNES)
	if (classNum == 5)
		PlayRandomSoundFrom(MEDIC_TUNES)
	if (classNum == 6)
		PlayRandomSoundFrom(HEAVY_TUNES)
	if (classNum == 7)
		PlayRandomSoundFrom(PYRO_TUNES)
	if (classNum == 8)
		PlayRandomSoundFrom(SPY_TUNES)
	if (classNum == 9)
		PlayRandomSoundFrom(ENGIE_TUNES)
}

function PlayRandomTune()
{
	PlayRandomClassTune(RandomInt(1, 9))
}