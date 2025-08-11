# Offsec dotfiles 👻
Dotfiles for my offensive secuirty environment, using **i3 wm** on **Kali Linux**.Using **GNU stow** to manage the files. 

👀:
![image](https://github.com/6poiint9/offsec-dots/blob/main/pics/gitpic.png) 
 
# Installation 
Ideally install it on a Kali Linux base installation.
1) **copy** the **contents** of [bootstrap.sh](https://github.com/6poiint9/offsec-dots/blob/main/bootsrap.sh)  into any file for example set_up.sh
2) **give** the file **execution** permissions and **run** it:  
    ```sh
    chmod u+x set_up.sh 
    ./set_up.sh 
    ```
3) **log out** and in the lightdm login-screen **choose i3** and log in again
4) Do the **additional steps** noted at the **bottom** of the **script** to finalize the setup
   
   => mainly **link the files** 
   ```sh 
      cd $HOME/.dotfiles 
      stow .
   ``` 
   resolve the possible **errors** by **renaming the file** or running
 
   ```sh 
   stow --adapt . 
   ``` 
# Some manual-steps 👷 :



# Get Nessus
1) Visit https://www.tenable.com/downloads/nessus and install the .deb package
2) Install the package 
   ```sh
   sudo dpkg -i Nessus-<version>-debian9_amd64.deb
   ```
3) Go to https://localhost:8834 and complete the setup 

4) To start using it run 
   ```sh
   sudo systemctl start nessusd
   ```

# Get OpenVAS 
1) Download packages (note down the username and password while installation!):
   ```sh
   sudo apt install gvm openvas
   ```
2) Start it up with:
   ```sh
   sudo gvm-start
   ```
3) Login to https://127.0.0.1:9392/ and use it. If you **forgot to note down the password**
   set up a new one:
   ```sh
   sudo -E -u gvm -g  gvm gvmd —user=admin —new-password=NEW_PASSWD
   ```
4) After usage close it:
   ```sh
   sudo gvm-stop
   ```

# Neovim (with Nvchad) setup 
Once the bootsrap.sh script is done running, and the files have been linked with stow.

=> open up neovim and **install** the **lspservers** with **Mason** 

  ```sh
  nvim
  # within neovim  
  :MasonInstallAll
  ```

# Get RDP security check tool
the repo is already cloned in the bootsrap.sh script

=> open up a terminal and run:
 ```sh
 sudo cpan 
 #within cpan
 install Encoding::BER
 exit 
 ```






