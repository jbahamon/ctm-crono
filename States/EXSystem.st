; Stand
[Statedef 0]
type = S
physics = S
sprpriority = 0

[State -3, Landing Sound]
type = ChangeAnim
triggerall = PalNo = 12
trigger1 = Anim = 5 || Anim = 6
value = Anim + 10000

[State 0, 1]
type = ChangeAnim
triggerall = PalNo != 12
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = 0

[State 0, 1]
type = ChangeAnim
triggerall = PalNo = 12
trigger1 = Anim != 10000 && Anim != 10005
trigger2 = Anim = 10005 && AnimTime = 0 ;Turn anim over
value = 10000

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < Const(movement.stand.friction.threshold)
trigger2 = Time = 4
x = 0

[State 0, 4] ;Are you dead?
type = ChangeState
trigger1 = !alive
value = 5050
ctrl = 0


;---------------------------------------------------------------------------
; Stand to Crouch
[Statedef 10]
type    = C
physics = C
anim = 10 + 10000 * (PalNo = 12)

[State 10, 1]
type = VelMul
trigger1 = Time = 0
x = .75

[State 10, 2] ;Stop moving if low velocity
type = VelSet
trigger1 = abs(vel x) < Const(movement.crouch.friction.threshold)
x = 0

[State 10, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11

;---------------------------------------------------------------------------
; Crouching
[Statedef 11]
type    = C
physics = C
anim = 11 + 10000 * (PalNo = 12)
sprpriority = 0


[State -3, Landing Sound]
type = ChangeAnim
triggerall = PalNo = 12
trigger1 = Anim = 5 || Anim = 6
value = Anim + 10000
,

[State 11, 1] ;Change from turning animation
type = ChangeAnim
trigger1 = Anim = 6 && AnimTime = 0 && Anim != 12
trigger2 = Anim = 10006 && AnimTime = 0 && Anim = 12
value = 11 + 10000 * (PalNo = 12)

[State 11, 2] ;Stop moving if low velocity
type = VelSet
trigger1 = abs(vel x) < Const(movement.crouch.friction.threshold)
x = 0

;---------------------------------------------------------------------------
; Crouch to Stand
[Statedef 12]
type    = S
physics = S
anim = 12 + 10000 * (PalNo = 12)

[State 12, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;---------------------------------------------------------------------------
; Jump Start
[Statedef 40]
type    = S
physics = S
anim = 40 + 10000 * (PalNo = 12)
ctrl = 0
sprpriority = 1
facep2 = 1

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 40, 3]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 5]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = prevstateno = 100 ;RUN_FWD
trigger1 = sysvar(1) = 1
x = const(velocity.runjump.fwd.x)

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; AirJump Start
[Statedef 45]
type    = A
physics = N
ctrl = 0
velset = 0,0

[State 45, 1]
type = ChangeAnim
trigger1 = SelfAnimExist(44 + 10000 * (PalNo = 12))
value = 44 + 10000 * (PalNo = 12)

[State 45, 2]
type = ChangeAnim
trigger1 = !SelfAnimExist(44 + 10000 * (PalNo = 12))
value = 41  + 10000 * (PalNo = 12)

[State 45, 3]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 45, 4]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 45, 5]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 45, 6]
type = VelSet
trigger1 = Time = 2
x = ifelse(sysvar(1)=0, const(velocity.airjump.neu.x), ifelse(sysvar(1)=1, const(velocity.airjump.fwd.x), const(velocity.airjump.back.x)))
y = const(velocity.airjump.y)

[State 45, 7]
type = ChangeState
trigger1 = Time = 2
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Jump Up
[Statedef 50]
type    = A
physics = A

[State 50, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43)) + 10000 * (PalNo = 12)

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > Const720p(-8)
trigger1 = SelfAnimExist(anim + 3)
trigger1 = anim >= (41 + 10000 * (PalNo = 12)) && anim <= (43 + 10000 * (PalNo = 12))
persistent = 0
value = Anim + 3

;---------------------------------------------------------------------------
; Jump Down (empty state for compatibility)
[Statedef 51]
type    = A
physics = A

[State 51, 1]
type = Null
trigger1 = 1

;---------------------------------------------------------------------------
; Jump Land
[Statedef 52]
type    = S
physics = S
ctrl = 0
anim = 47 + 10000 * (PalNo = 12)

[State 52, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, 3]
type = CtrlSet
trigger1 = Time = 3
value = 1

[State 52, 4]
type = VelSet
trigger1 = abs(vel x) < Const(movement.stand.friction.threshold)
x = 0

[State 52, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Hop backwards
[Statedef 105]
type    = A
physics = A
ctrl = 0
anim = 105 + 10000 * (PalNo = 12)
sprpriority = 1

[State 105, 1]
type = VelSet
trigger1 = Time = 0
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, 2]
type = CtrlSet
trigger1 = Time = 2
value = 1

[State 105, 3]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 106


;---------------------------------------------------------------------------
; Hop backwards (land)
[Statedef 106]
type    = S
physics = S
ctrl = 0
anim = 47 + 10000 * (PalNo = 12)

[State 106, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 106, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 106, 3]
type = MakeDust
trigger1 = Time = 2
pos = 0, 0
spacing = 1

[State 106, 4]
type = VelSet
trigger1 = abs(vel x) < Const(movement.stand.friction.threshold)
x = 0

[State 106, 5]
type = ChangeState
trigger1 = Time = 7
value = 0
ctrl = 1