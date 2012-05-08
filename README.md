.vim
=====

This is my vim setup -- basically pathogen with plugins installed as submodules. 

Installing
----------

In Ubuntu the full vim install is spread accross several packages. 
I find that it's easier to purge those packages and then install from source.
You can find out which vim packages you have installed by running:

    $ dpkg --get-selections | grep vim

To build vim run:

    $ sudo apt-get purge vim
    $ sudo apt-get install mercurial
    $ cd usr/local/src
    $ hg clone https://vim.googlecode.com/hg/ vim
    $ cd vim
    $ sudo ./configure \ 
           --with-features=huge \
           --enable-rubyinterp \
           --enable-multibyte \
           --enable-pythoninterp \
           --enable-perlinterp
    $ sudo make
    $ sudo checkinstall

This will requires the "checkinstall" package.

Installing Plugins
------------------

    $ mkdir -p .vim/{autoload,bundle}
    $ cd .vim
    $ git init
    $ git submodule add https://github.com/tpope/vim-pathogen.git bundle/pathogen
    $ ln -s '../bundle/pathogen/autoload/pathogen.vim' autoload/pathogen.vim 
    $ ln -s './.vim/.vimrc' ~/.vimrc

To add any further submodules just run:
    $ git submodule add [git url] bundle/[plugin name]

Then run:
    $ git submodule init
    $ git submodule update
    $ git submodule foreach git submodule init
    $ git submodule foreach git submodule update
