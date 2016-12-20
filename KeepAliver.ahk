#SingleInstance, force

Menu, Tray, Icon, KeepAliver.ico

;--- SETTINGS -----------------------------------------------------------------
distance_x_px := 1
check_interval_secs := 60*60*10 ; 9 min
minimum_idle_secs := 60*60*5 ; 5 min

;--- MAIN LOOP ----------------------------------------------------------------
; If the user has been idle for a certain time this script moves
; the mouse pointer left and right by distance_x_px in regular intervals
;
movement_x := distance_x_px
check_interval_millis := check_interval_secs * 1000
minimum_idle_millis := minimum_idle_secs * 1000

Loop {
    Sleep, %check_interval_millis%
    if (A_TimeIdle > minimum_idle_millis) {
        movement_x := -1 * movement_x
        MouseMove, %movement_x%, 0, 0, R
    }
}
