-- Developed by BabyDrill#2788
ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("wolfdev:stress")
AddEventHandler("wolfdev:stress", function(animazione, effetto)
    if animazione.enable then 
        RequestAnimDict(animazione.lib)
        while (not HasAnimDictLoaded(animazione.lib)) do Citizen.Wait(0) end
        TaskPlayAnim(PlayerPedId(),animazione.lib,animazione.anim,8.0, 8.0, -1, 80, 0, 0, 0, 0)
    end
    if Config.rprogress then 
        exports.rprogress:Start("", animazione.time*1000)
    else
        Citizen.Wait(animazione.time*1000)
    end
    ClearPedTasks(PlayerPedId())
    if effetto.enable then 
        if effetto.livel == 1 then 
            ClearPedTasksImmediately(GetPlayerPed(-1))
            SetPedMotionBlur(GetPlayerPed(-1), true)
            SetPedMovementClipset(GetPlayerPed(-1), "move_m@drunk@slightlydrunk", true)
            SetPedIsDrunk(GetPlayerPed(-1), true)
            SetTimecycleModifier("spectator5")
            AnimpostfxPlay("SuccessMichael", 10000001, true)
            ShakeGameplayCam("DRUNK_SHAKE", 1.5)
        elseif effetto.livel == 2 then 
            ClearPedTasksImmediately(GetPlayerPed(-1))
            SetPedMotionBlur(GetPlayerPed(-1), true)
            SetPedMovementClipset(GetPlayerPed(-1), "move_m@buzzed", true)
            SetPedIsDrunk(GetPlayerPed(-1), true)
            SetTimecycleModifier("spectator5")
            AnimpostfxPlay("Rampage", 10000001, true)
            ShakeGameplayCam("DRUNK_SHAKE", 1.5)
        elseif effetto.livel == 3 then 
            ClearPedTasksImmediately(GetPlayerPed(-1))
            SetTimecycleModifier("spectator3")
            SetPedMotionBlur(GetPlayerPed(-1), true)
            SetPedMovementClipset(GetPlayerPed(-1), "move_m@hobo@a", true)
            SetPedIsDrunk(GetPlayerPed(-1), true)
            AnimpostfxPlay("HeistCelebPass", 10000001, true)
            ShakeGameplayCam("DRUNK_SHAKE", 3.0)
        elseif effetto.livel == 4 then 
            ClearPedTasksImmediately(GetPlayerPed(-1))
            SetTimecycleModifier("spectator6")
            SetPedMotionBlur(GetPlayerPed(-1), true)
            SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", true)
            SetPedIsDrunk(GetPlayerPed(-1), true)
            AnimpostfxPlay("ChopVision", 10000001, true)
            ShakeGameplayCam("DRUNK_SHAKE", 1.0)
        elseif effetto.livel == 5 then 
            ClearPedTasksImmediately(GetPlayerPed(-1))
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(GetPlayerPed(-1), true)
            SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@QUICK", true)
            SetPedIsDrunk(GetPlayerPed(-1), true)
            SetPedMoveRateOverride(PlayerId(),10.0)
            SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
            AnimpostfxPlay("DrugsMichaelAliensFight", 10000001, true)
            ShakeGameplayCam("DRUNK_SHAKE", 3.0)
        end
        Citizen.Wait(effetto.duration*1000)
        SetPedMoveRateOverride(PlayerId(),1.0)
        SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
        SetPedIsDrunk(GetPlayerPed(-1), false)		
        SetPedMotionBlur(PlayerPedId(), false)
        ResetPedMovementClipset(GetPlayerPed(-1))
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetTimecycleModifierStrength(0.0)
    end
end)
-- Developed by BabyDrill#2788