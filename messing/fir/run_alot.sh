for i in {0..50}
do
  swim clean 1>/dev/null
  time swim pnr 2>&1 | rg "Place and route components:$" -A 50
done
