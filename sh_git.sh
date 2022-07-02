
git add .
git status

read -p "Pls make your comment: " DATA1
git commit -m "DATA1"

read -p "Are you ok ? (y/n): " DATA2
case "$DATA2" in
  [yY]) git push origin main ;;
  [nN]) echo processes are stopped by user ;;
  *) echo "Push y or n key.

