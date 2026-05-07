-- ==========================================
-- Bowling Mega Mix Compatibility Mod
-- ==========================================

local total_game_score = 0
local mode_names = {
    [0] = "10 PIN",
    [1] = "DUCKPIN",
    [2] = "CANDLEPIN",
    [3] = "HOLY 9 PIN",
    [4] = "TEXAS 9 PIN",
    [5] = "5 PIN"
}

-- Triggered when game starts or mode changes (Key X)
function on_update(mode_index)
    total_game_score = 0
    local name = mode_names[mode_index] or "Unknown"
    print("\n[MOD] Game Mode: " .. name)
    print("[MOD] Session started. Total score reset to 0.")
end

-- Triggered when player launches the ball (Key Z)
function on_ball_launched(mode_index, roll)
    print("[MOD] Ball Launched! (Roll " .. roll .. ")")
end

-- Triggered when a frame ends
function on_frame_scored(mode_index, frame, score)
    local name = mode_names[mode_index] or "UNKNOWN"
    total_game_score = total_game_score + score
    
    print("\n--- [MOD] FRAME REPORT ---")
    print("Mode:       " .. name)
    print("Frame:      " .. frame)
    print("Frame Score: " .. score)
    print("Total Game: " .. total_game_score)
    print("--------------------------\n")
    
    -- Reward logic
    if score >= 10 then
        print("[MOD] EXCELLENT FRAME!")
    end
end
