transcrip off
echo "something"
onerror abort
restart -force
noview *
add wave *
force RESETN 0 , 1 100 ns
force CLK 0, 1 50ns -r 100ns
force TURBO 0 0
run 1us
force TURBO 1 0
run 1us

echo "finito"
