//hellolaunch

function parachute_test_zone {
    RETURN (ship:altitude > 5000)
    and (ship:altitude < 9999) 
    and (ship:verticalSpeed > 30) 
    and (ship:verticalSpeed < 160).
}

function chute_zone {
    RETURN (ship:altitude < 5000).
}

function launch {
    CLEARSCREEN.
    LOCK THROTTLE TO 1.0.   // 1.0 is the max, 0.0 is idle.
    PRINT "Counting down:".
    LOCK STEERING TO UP.
    FROM {local countdown is 5.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
        PRINT "..." + countdown.
        WAIT 1. // pauses the script here for 1 second.
    }
    // Launch
    PRINT "Launching!!!".
    STAGE.
}

function vacuum_explorer {
    launch.
    wait until maxThrust = 0.
    stage.
    wait until chute_zone.
    stage.
}

vacuum_explorer.


// launch.

// WAIT UNTIL maxThrust = 0.

// STAGE.
// PRINT "DROPPING TANKS!!!".

// WAIT UNTIL parachute_test_zone.

// STAGE.
// PRINT "STAGE SEPARATION!!!".

// STAGE.
// PRINT "DROGUE CHUTES!!!".

// WAIT 5.

// STAGE.
// PRINT "MAIN CHUTES!!!".

// // NOTE that it is vital to not just let the script end right away
// // here.  Once a kOS script just ends, it releases all the controls
// // back to manual piloting so that you can fly the ship by hand again.
// // If the program just ended here, then that would cause the throttle
// // to turn back off again right away and nothing would happen.


