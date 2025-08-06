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

# Neovim (with Nvchad) setup 
Once the bootsrap.sh script is done running, and the files have been linked with stow.

=> open up neovim and **install** the **lspservers** with **Mason** 

  ```sh
  nvim
  # within neovim  
  :MasonInstallAll
  ```

# Get RDP security check tool
the repo is already cloned in the bootsrao.sh script

=> open up a terminal and run:
 ```sh
 sudo cpan 
 #within cpan
 install Encoding::BER
 exit 
 ```






