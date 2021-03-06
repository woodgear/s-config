cd ~/sm/lab
sudo apt remove systemtap
sudo apt install g++ make git libelf-dev libdw-dev

git clone git://sourceware.org/git/systemtap.git
cd systemtap/
./configure && make         // no errors
sudo make install

sudo stap -e 'probe begin { printf("Hello, World!\n"); exit() }'