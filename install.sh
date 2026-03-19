vps_panels_menu() {

while true; do
clear

echo "================================="
echo "      CUBE CLOUD HOST PANEL"
echo "================================="
echo "         VPS PANEL MENU"
echo "================================="
echo
echo "1. HVM & VPS Bot"
echo "2. SVM Panel"
echo
echo "0. Back / Exit"
echo

read -p "Select option: " vps_choice

case $vps_choice in

1)
echo "Launching HVM Installer..."
sleep 1
bash <(curl -fsSL https://raw.githubusercontent.com/DreamHost2ws/HVM5.1/main/LP-Hvm-Installer.sh)
;;

2)
echo "Installing SVM Panel..."
sleep 1

# Dependencies install
apt update -y
apt install git unzip python3 -y

# Clean old files
rm -rf lol

# Clone repo
git clone https://github.com/AnkitKing7/lol

cd lol || { echo "Failed to enter directory!"; exit 1; }

# Run installer
bash install.sh

echo "Extracting SVM..."
unzip -o Svm-v5.zip

echo "Starting SVM..."
python3 svm.py
;;

0)
echo "Exiting..."
sleep 1
break
;;

*)
echo "Invalid option!"
sleep 1
;;

esac

done

}

# Run menu
vps_panels_menu
