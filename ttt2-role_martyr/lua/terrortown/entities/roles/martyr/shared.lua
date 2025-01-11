if SERVER then
	AddCSLuaFile()
	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_mtr.vmt")
end

function ROLE:PreInitialize()
  self.color = Color(54, 71, 40, 255)

  self.abbr = "mtr" -- abbreviation
  self.surviveBonus = 0 -- bonus multiplier for every survive while another player was killed
  self.scoreKillsMultiplier = 2 -- multiplier for kill of player of another team
  self.scoreTeamKillsMultiplier = -8 -- multiplier for teamkill
  self.unknownTeam = true

  self.defaultTeam = TEAM_INNOCENT

  self.conVarData = {
    pct = 0.17, -- necessary: percentage of getting this role selected (per player)
    maximum = 1, -- maximum amount of roles in a round
    minPlayers = 6, -- minimum amount of players until this role is able to get selected
    credits = 0, -- the starting credits of a specific role
    togglable = true, -- option to toggle a role for a client if possible (F1 menu)
    random = 33,
    traitorButton = 0, -- can use traitor buttons
    shopFallback = SHOP_DISABLED
  }
end

-- now link this subrole with its baserole
function ROLE:Initialize()
  roles.SetBaseRole(self, ROLE_INNOCENT)
end

if SERVER then
   -- Give Loadout on respawn and rolechange
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		ply:GiveEquipmentWeapon("martyr_revive")
	end

	-- Remove Loadout on death and rolechange
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		ply:StripWeapon("martyr_revive")
	end
end

--CVARS--
	CreateConVar("ttt_mtr_defibrillator_revive_braindead", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
    CreateConVar("ttt_mtr_defibrillator_play_sounds", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
    CreateConVar("ttt_mtr_defibrillator_revive_time", "3.0", {FCVAR_ARCHIVE, FCVAR_NOTIFY})
    CreateConVar("ttt_mtr_defibrillator_error_time", "1.5", {FCVAR_ARCHIVE, FCVAR_NOTIFY})
    CreateConVar("ttt_mtr_defibrillator_success_chance", 75, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
    CreateConVar("ttt_mtr_defibrillator_reset_confirm", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
    CreateConVar("ttt_mtr_defibrillator_revival_health", 100, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
    CreateConVar("ttt_mtr_defibrillator_revival_max_health", 100, {FCVAR_ARCHIVE, FCVAR_NOTIFY})


