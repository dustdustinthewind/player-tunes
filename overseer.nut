// then queues appropriate music using dj.nut

// todo
//  lavender: Also if possible stick to playing through the music audio channel so players can control volume easy
//   ^ idk if possible

::playersAndPoints <- {}

// everytime someone dies, reset their points that life to 0
// then we check the points of the killer and assister and see if they deserve a tune
function OnGameEvent_player_death(params)
{
	if (!InMatchStartCountdown()) // lavender: also make sure it doesnt do it before setup ends.
	{
		// killed
		checkPlayer(params.userid)
		local died = playersAndPoints[params.userid]
		local diedPoints = NetProps.GetPropInt(GetPlayerFromUserID(params.userid), "m_Shared.tfsharedlocaldata.m_ScoreData.m_iPoints")
		if (playersAndPoints[params.userid] != -1)
			::playersAndPoints[params.userid] <- diedPoints

		// killer
		checkPlayer(params.attacker)
		local killerPoints = -1
		if (params.attacker != -1 && playersAndPoints[params.attacker] != null)
			killerPoints = NetProps.GetPropInt(GetPlayerFromUserID(params.attacker), "m_Shared.tfsharedlocaldata.m_ScoreData.m_iPoints")

		// assister
		checkPlayer(params.assister)
		local assisterPoints = -1
		if (params.assister != -1 && playersAndPoints[params.assister] != -1)
			assisterPoints = NetProps.GetPropInt(GetPlayerFromUserID(params.assister), "m_Shared.tfsharedlocaldata.m_ScoreData.m_iPoints")
	
		// player killer or assister tune if they reached point threshold
		if (killerPoints >= playersAndPoints[params.attacker] + POINT_THRESHOLD)
		{
			PlayRandomClassTune(GetPlayerFromUserID(params.attacker).GetPlayerClass())
			::playersAndPoints[params.attacker] <- killerPoints
		}
		else if (assisterPoints > playersAndPoints[params.assister] + POINT_THRESHOLD)
		{
			PlayRandomClassTune(GetPlayerFromUserID(params.assister).GetPlayerClass())
			::playersAndPoints[params.asssister] <- assisterPoints
		}
	}
}
	__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener)

function checkPlayer(userid)
{
	if (userid != null && !(userid in playersAndPoints))
		::playersAndPoints[userid] <- NetProps.GetPropInt(GetPlayerFromUserID(userid), "m_Shared.tfsharedlocaldata.m_ScoreData.m_iPoints")
}