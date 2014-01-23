;===========================================================================
; Helpers and other States
;===========================================================================

;SuperPause Helper
[Statedef 7000]
type = S
physics = N
movetype = I
anim = 7300

[State 7000, Var]
type = VarSet
trigger1 = !Time
var(0) = (Parent, StateNo = 2100)

[State 7000, Pal Down]
type = BGPalFX
trigger1 = time <= 10 ;&& root, var(10) = 5
time = 1
mul = 256 - floor(19.2 * time), 256 -floor(25.6 * time), 256
color = 256 -floor(25.6 * time)

[State 7000, Pal Static]
type = BGPalFX
trigger1 = (time = [11, 39]); && root, var(10) = 5
time = 1
mul = 64, 0, 256
color = 0

[State 7000, Pal Up]
type = BGPalFX
trigger1 = time >= 40 
time = 1
mul = ceil(38.4 * (time - 40)), ceil(51.2 * (time - 40)), 256
color = floor(51.2 * (time - 40))

[State 7000, End]
type = DestroySelf
trigger1 = Time >= 45

; Super Armor :)
[StateDef 11777]
Type = A
MoveType = I
Physics = N
ctrl=0

[State 11777]
Type=StateTypeSet ; You want to mimic the statetype of the player, to let the correct types of attacks hit only
Trigger1 = root,statetype = A
Trigger1 = statetype != A
Statetype = A

[State 11777]
Type=StateTypeSet
Trigger1 = root,statetype = C
trigger1 = statetype != C
Statetype = C

[State 11777]
Type = StateTypeSet
Trigger1 = root,statetype = S
trigger1 = statetype != S
Statetype=S

[State 11777]
Type = StateTypeSet
Trigger1 = root,statetype = L
trigger1 = statetype != L
Statetype =L

[State 6965]
Type=ChangeAnim ; Helper copies the animation of the player.
Trigger1=anim!=Root,anim
value=Root,anim
ignorehitpause=1

[State 6965]
Type=Assertspecial ; But is invisible
Trigger1=1
flag=invisible
flag2=noshadow
ignorehitpause=1

[State 6965, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA, AA, AP , AT
StateNo = 11777
Time = 1
ForceAir = 0
ignorehitpause=1

[State 6965, BindToRoot]
Type = BindToRoot
Trigger1 = 1
Time = 1
Facing = 1
Pos = 0, 0
ignorehitpause=1

[State 6966, ParentVarAdd]
Type = ParentVarAdd
Trigger1 = Time = 0
fV = 29
Value = GetHitVar(damage)
ignorehitpause=1

[State 6966, ParentVarAdd]
Type=Hitfallset
Trigger1=1
value=0

[State 6965, Var]
Type = ParentVarSet
Trigger1 = GetHitVar(damage) > 0
var(22) = 1
ignorehitpause=1

[State 6965, DestroySelf]
Type = DestroySelf
Trigger1 = !(Root, NumHelper(1020))
ignorehitpause=1