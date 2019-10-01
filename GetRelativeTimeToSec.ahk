; A timestamp such as "2h" would return 7200 seconds. Meaning 2h will be in 7200 from now on.
; Absurd timestamps such as "2d3d90h20s20m10d" are also possible

GetRelativeTimeToSec(sTime) {
    if(RegExMatch(sTime, "i)((?:\d+\.)?\d+(?:s|m|h|d)\s?)+") <= 0) {
        return 0
    }

    in_seconds := 0
    while(RegExMatch(sTime, "i)\s*((?:\d+\.)?\d+)(s|m|h|d)\s*", args) == 1) {
        sTime := StrReplace(sTime, args1 "" args2, "",,1)
        multiplier := 0
        multiplier := args2 = "s" ? 1 : multiplier
        multiplier := args2 = "m" ? 60 : multiplier
        multiplier := args2 = "h" ? 3600 : multiplier
        multiplier := args2 = "d" ? 86400 : multiplier

        in_seconds += multiplier * args1
    }
    return Floor(in_seconds)
}
