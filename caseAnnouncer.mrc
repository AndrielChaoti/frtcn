;Drill/Training Case Announcer
;; Dialog config
dialog cAnnounce {
  title "Case Announcer Config"
  size -1 -1 145 95
  option dbu

  ; controls:
  text "Set the details for your case below...", 100, 5 4 120 10
  text "Announcing to", 105, 5 12 120 10

  check "Code Red?", 10, 5 20 47 10, left

  text "System:", 101, 5 31 35 10
  edit "", 11, 45 30 90 10, autohs

  text "CMDR Name:", 102, 5 41 35 10
  edit "", 12, 45 40 90 10, autohs

  text "IRC Nick:", 103, 5 51 35 10
  edit "", 13, 45 50 90 10, autohs limit 30

  text "Platform:", 104, 5 61 35 10
  combo 14, 45 60 60 10, sort drop

  button "Send Case", 200, 5 78 45 12, ok
  button "Cancel", 201, 55 78 45 12, cancel
}

;; Events
; On Init
on *:dialog:cAnnounce:init:*: {
  did -ra $dname 105 Announcing to %ca_chan
  did -ra $dname 12,13 $me
  didtok $dname 14 44 PC,XB,PS
  did -c $dname 14 1
  did -f $dname 11
  %ca_sendcase = $false
}


; on Click Send Case
on *:dialog:cAnnounce:sclick:200 {
  %ca_sendcase = $true
}

; On Click Cancel
on *:dialog:cAnnounce:sclick:201 {
  %ca_sendcase = $false
}

; on Close
on *:dialog:cAnnounce:close:* {
  ;get data
  var %ca_cr = $did(10).state
  var %ca_clNick = $did(13)
  var %ca_clName = $did(12)
  var %ca_sys = $did(11)
  var %ca_plat = $did(14)
  ; send annoucement
  if (%ca_sendcase == $true) {
    if (%ca_cr == 1) {
      ;echo -ca info Sending message: !announce --cr %ca_chan $qt(%ca_clName) %ca_clNick %ca_plat %ca_sys
      msg DrillSqueak[BOT] !announce --cr %ca_chan $qt(%ca_clName) %ca_clNick %ca_plat %ca_sys
    } 
    else {
      ;echo -ca info Sending message: !announce %ca_chan $qt(%ca_clName) %ca_clNick %ca_plat %ca_sys
      msg DrillSqueak[BOT] !announce %ca_chan $qt(%ca_clName) %ca_clNick %ca_plat %ca_sys
    }
  } 
  else {
    echo -ca info Cancelled annoucement.
  }
  ; clean up
  unset %ca_*
}

alias cann {
  if (#$1) { %ca_chan = $1 }
  else { %ca_chan = # }

  if (!%ca_chan) { 
    echo -ca notice ERROR: /cann can only be run from a channel window.
    halt 
  }

  ; don't allow announcing to main channels.
  if ((%ca_chan == #fuelrats) || (%ca_chan == #ratchat)) {
    var %str = You've attempted to target an announcement to %ca_chan $+ . Don't. $+ $crlf $+ $crlf $+ The annoucement has been cancelled.
    $input(%str, oghdua, Annouce Failure)
    unset %ca_*
    halt
  }

  ;echo -ca info Sending drill case announce to $+(, %ca_chan, )
  dialog -ma cAnnounce cAnnounce
}
