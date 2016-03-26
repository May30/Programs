echo "Install tmux"
sudo apt-get install tmux

echo "Install git"
sudo apt-get install git

echo "Install vim"
sudo apt-get install vim

echo "vim plugins - START"
echo "Install Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle

echo "Install sensible"
git clone git://github.com/tpope/vim-sensible.git

echo "Check to see for python support and install Ulti"
echo "vim --version | grep python"
git clone https://github.com/SirVer/ultisnips.git

echo " Install NERDTree"
git clone https://github.com/scrooloose/nerdtree

echo "Install Airline"
git clone https://github.com/vim-airline/vim-airline

echo "Install CtrlP"
git clone https://github.com/ctrlpvim/ctrlp.vim.git

echo "Install syntastic"
git clone https://github.com/scrooloose/syntastic.git

echo "Install Scala syntax"
git clone https://github.com/derekwyatt/vim-scala.git
echo "vim plugins - START"
