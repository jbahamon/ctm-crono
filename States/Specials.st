;===========================================================================
; Special Moves
;===========================================================================

;Lightning
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1000
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1


[State 200, Explod]
type = Explod
trigger1 = Time < 50
trigger1 = GameTime % 5 = 0
anim = 7102
ID = 1000
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,-1 + (Random/1000.0)*0.7
accel = 0,-0.3
random = 27,7
sprpriority = 2
removetime = -2
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "qcfc", 2, IfElse(command = "qcfb", 1, 0))

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,1
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 3
name = "Lightning"
ID = 1000
stateno = 1001
pos = 50 + 50 * Var(0), 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = Time > 60
value = 0
ctrl = 1

;The Lightning
[Statedef 1001]
type = A
physics = N
movetype = A
anim = 7100
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1002, Strength]
type = VarSet
trigger1 = !time
var(0) = (root, var(0))

[State 1001, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1.2, 0.7
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1001, hitdef]
type = HitDef
triggerall = !MoveContact
triggerall = !MoveReversed
trigger1 = Time > 0
priority = 6, Hit
attr = A,SP
damage = Floor(Parent, FVar(39)*40), 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4, 30
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -0.4,0
air.velocity  = -0.4, 4
air.fall = 1
p2facing = 1
palfx.invertall = 1
palfx.color = 0
palfx.add = 120, 120, 20
palfx.time = 12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 1001, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1000, burst]
type = Trans
trigger1 = AnimElemTime(6) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(6), 256
ignorehitpause = 1

[State 1001, burst]
type = DestroySelf
trigger1 = AnimElemTime(6) > 32
trigger2 = MoveReversed
ignorehitpause = 1

;---------------------------------------------------------------------------
; Cyclone
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1010
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcbc", 2, ifelse(command = "qcbb", 1, 0))

[State 1100, nothitby]
type = nothitby
trigger1 = animelemtime(1) < 6
value = SCA
time = 1
ignorehitpause = 1

[State 1010, Jump]
type = VelSet
trigger1 = AnimElemNo(0) > 1
X = 0.3 + 0.9*Var(0)
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = AnimElemTime(2) = 0 || AnimTime = 0
anim = 7110
ID = 1011
pos = 15, -15
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 220, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 7111
ID = 1011
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 7110
ID = 1011
pos = -15, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7111
ID = 1011
pos = 5, -28
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = -1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 1250, Hit]
type = HitDef
trigger1 = AnimElem = 2 || !AnimTime
attr = S, SA
damage = IfElse(var(0) = 2, 35, IfElse(var(0) = 1, 31, 25)), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 7, 7
sparkno = -1
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -0.7, -1
air.type = Low
air.velocity = -0.7, -1
guard.cornerpush.veloff = 0;-12.74
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 24, 48)), IfElse(Var(21) > 0, 0, 12)
givepower = 12, 12
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.3
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
palfx.color = 0
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 10

[State 1040, End]
type = ChangeState
trigger1 = Time > 60 && !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;Volt Hit
[Statedef 1020]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 1020
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, -72)
facep2 = 1

[State 200, Explod]
type = Explod
trigger1 = Time < 70
trigger1 = GameTime % 5 = 0
anim = 7102
ID = 1000
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,-1 + (Random/1000.0)*0.7
accel = 0,-0.3
random = 27,7
sprpriority = 2
removetime = -2
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,1
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 3
name = "Self Lightning"
ID = 1021
stateno = 1021
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1000, Pawnch]
type = Helper
trigger1 = Var(22) > 0
name = "Volt Spark"
ID = 1020
stateno = 1022
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = NumHelper(1020)
value = 0
ctrl = 1

;Self Lightning
[Statedef 1021]
type = A
physics = N
movetype = A
anim = 7100
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1002, Strength]
type = VarSet
trigger1 = !time
var(0) = (root, var(0))

[State 1001, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
pos = 0, 7
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 7,12
removetime = -2
scale = 0.7, 0.7
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
pos = 5, -18
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 7,12
removetime = -2
scale = 0.7, 0.7
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
pos = -7, -13
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 7,12
removetime = -2
scale = 0.7, 0.7
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = AnimElem = 6
var(22) = 600
persistent = 0
ignorehitpause = 1

[State 1000, burst]
type = Trans
trigger1 = AnimElemTime(6) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(6), 256
ignorehitpause = 1

[State 1001, burst]
type = DestroySelf
trigger1 = AnimElemTime(6) > 32
trigger2 = MoveReversed
ignorehitpause = 1

;Volt Spark
[Statedef 1022]
type = A
physics = N
movetype = I
anim = 7121
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1022, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X - 17 * Parent, Facing)/5.0 
Y = (ParentDist Y - 30 + 10 * Sin(GameTime/20.0))/5.0
ignorehitpause = 1

[State 1022, FollowPlayer]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1022, FollowPlayer]
type = DestroySelf
trigger1 = Root, Var(22) <= 0
ignorehitpause = 1

;---------------------------------------------------------------------------
; Black Hole
[Statedef 1030]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1030
sprpriority = 2
facep2 = 1
velset = 0,0
poweradd = -500

[State 1030, Jump]
type = PlaySnd
trigger1 = !Time
value = 7010,1

[State 1030, Jump]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 1030, Wave]
type = Helper
trigger1 = AnimElem = 5
name = "Black Hole"
ID = 1030
stateno = 1031
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1030, Hit]
type = HitDef
trigger1 = AnimElem = 5
attr = A, ST 
hitflag = M-
priority = 2, Miss
sparkno = -1
hitsound = s7010, 0
p1stateno = 1034
p2stateno = 1036
guard.dist = 0
ground.velocity = 0,0
fall = 1
fall.recover = 1
fall.recovertime = 120
persistent = 0
ID = 1030
nochainID = 1030

[State 1030, End]
type = ChangeState
trigger1 = AnimElemNo(0) >= 5 && !NumHelper(1030) && !NumHelper(1031)
value = 0
ctrl = 1

; The Black Hole
[Statedef 1031]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 7050
sprpriority = -1

[State 1030, Wave]
type = Helper
trigger1 = Time = 35
name = "Black Hole"
ID = 1031
stateno = 1032
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1031, Scale]
type = AngleDraw
trigger1 = Time = [0, 35]
scale = 0.7 * Time /35.0 , 0.35 * Time /35.0 

[State 1031, Scale]
type = AngleDraw
trigger1 = Time > 35
scale = 0.7 , 0.35

[State 7010, Appear]
type = trans
trigger1 = 1
trans = addalpha
alpha = 128, 128
ignorehitpause = 1

[State 7010, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1031, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , NT, ST, HT
ignorehitpause = 1

[State 1031, End]
type = DestroySelf
trigger1 = Time > 80 || !(Parent, StateNo = 1030 || Parent, StateNo = 1034)

; Black Hole second layer
[Statedef 1032]
type    = S
movetype= I
physics = N
ctrl = 0
anim = 7050
sprpriority = 0

[State 1031, Scale]
type = VarSet
trigger1 = Time <= 35
V = 0
value = Time
ignorehitpause = 1

[State 1031, Scale]
type = AngleDraw
trigger1 = Time = [0, 35]
scale = 0.7 * Time /35.0 , 0.35 * Time /35.0 

[State 1031, Scale]
type = ChangeState
trigger1 = Time > 70
trigger2 = Root, StateNo != 1030 
trigger2 = Root, StateNo != 1034
trigger2 = Var(0) > 0 
value = 1033

[State 1031, Scale]
type = AngleDraw
trigger1 = Time > 35
scale = 0.7 , 0.35

[State 1031, Pal]
type = PalFX
trigger1 = 1
invertall = 1
time = 1

[State 7010, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

; Black Hole End
[Statedef 1033]
type    = S
movetype= I
physics = N
ctrl = 0

[State 1031, Scale]
type = AngleDraw
trigger1 = !Time
scale = 0.7, 0.35

[State 1031, Scale]
type = AngleDraw
trigger1 = Time
scale = 0.7 * Var(0)/35.0 , 0.35 * Var(0)/35.0

[State 1031, Scale]
type = VarAdd
trigger1 = 1
V = 0
value = -1

[State 1031, Pal]
type = PalFX
trigger1 = 1
invertall = 1
time = 1

[State 7010, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1031, End]
type = DestroySelf
trigger1 = !Var(0)
ignorehitpause = 1

;Black Hole - Success
[Statedef 1034]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1031
sprpriority = 2
poweradd = 0
velset = 0,0

[State 1034, FollowPlayer]
type = VarSet
trigger1 = !Time
FV = 0
value = Facing * (Target, ScreenPos X - ScreenPos X)
ignorehitpause = 1

[State 1034, Life]
type = TargetLifeAdd
trigger1 = !NumHelper(1030) && !NumHelper(1031)
value = Floor(-110*FVar(39))
ignorehitpause = 1

[State 1034, Super Pause]
type = VarSet
trigger1 = NumHelper(1031)
trigger1 = Helper(1031), StateNo = 1033
FV = 0
value = FVar(0) * 0.95
ignorehitpause = 1

[State 1034, Super Pause]
type = TargetState
trigger1 = NumHelper(1031)
trigger1 = Helper(1031), StateNo = 1033
value = 1037
ignorehitpause = 1
persistent = 0

[State 1034, Super Pause]
type = TargetBind
trigger1 = NumTarget
pos  = FVar(0), 0
ignorehitpause = 1

[State 1034, End]
type = ChangeState
trigger1 = !NumHelper(1030) && !NumHelper(1031)
value = 1035
ctrl = 0
ignorehitpause = 1

;Black Hole End
[Statedef 1035]
type    = S
movetype= A
physics = N
ctrl = 0
sprpriority = 2
poweradd = 0
velset = 0,0

[State 1035, Super Pause]
type = TargetBind
trigger1 = 1
pos  = 50, -40
ignorehitpause = 1

[State 1035, End]
type = ChangeState
trigger1 = Time > 64
value = 0
ctrl = 1
ignorehitpause = 1

; Black Hole - Hit
[Statedef 1036]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2023
ignorehitpause = 1

; Black Hole - Dragged
[Statedef 1037]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2023
ignorehitpause = 1

[State 802, Exit]
type = Trans 
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 256 - 16 * Time, 16* Time

[State 802, Exit]
type = Trans 
trigger1 = Time > 16
trans = addalpha
alpha = 0, 256

[State 802, Exit]
type = AngleDraw
trigger1 = Time = [0, 16]
scale = 1 - Time/16.0, 1 - Time/16.0