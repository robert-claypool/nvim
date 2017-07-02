read -p "This script assumes your repo is at ~/git/nvim ... Continue? [y,N] " answer
case $answer in
    y|Y) ;;
    *)   echo "Cancelled." & exit 0 ;;
esac

ln -s ~/git/nvim ~/.config/nvim
mkdir --parents ~/.local/share/nvim/plugged

echo "Done."
