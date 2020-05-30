#SingleInstance force
SetCapsLockState, AlwaysOff
Capslock::Esc
;Esc::Capslock

; vim mode
CapsLock & h::Send, {Left}
CapsLock & j::Send, {Down}
CapsLock & k::Send, {Up}
CapsLock & l::Send, {Right}
CapsLock & v::Send ^v

; left alt as left ctrl
; RAlt::RControl

; mock mouse
CapsLock & w:: Send,{WheelUp}
CapsLock & s:: Send,{WheelDown}
CapsLock & n:: Send,{PageUp}
CapsLock & p:: Send,{PageDown}

