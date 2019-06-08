read -p "This script assumes your repo is at ~/git/nvim ... Continue? [y,N] " answer
case $answer in
    y|Y) ;;
    *)   echo "Canceled." & exit 0 ;;
esac

mkdir -p ~/.local/share/nvim/plugged
mkdir -p ~/.config
ln -s ~/git/nvim ~/.config/nvim

echo "Done."
echo "See README.md for plugin installation instructions."
