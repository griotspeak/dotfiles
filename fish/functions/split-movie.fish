
for f in (seq 17)
  HandBrakeCLI -c $f -i "~/Movies/Stick/LESSONS_ON_THE_STICK_VOL_1.m4v" -o $f.mp4  
end

