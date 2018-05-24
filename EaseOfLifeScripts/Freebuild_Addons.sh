## Notify Via Email ##

echo ""
echo "Sending Notification Email..."
echo ""

echo "Weekly Addon Update has started!" | mail -s "FreeBuild Addons Updated" emailhere
echo "Sent To Voxxie"
echo "Weekly Addon Update has started!" | mail -s "FreeBuild Addons Updated" emailhere
echo "Sent To Sola"
echo "Weekly Addon Update has started!" | mail -s "FreeBuild Addons Updated" emailhere

## CD Into Addons ##

echo ""
echo "Moving To Freebuild / Addons..."
echo ""

cd /home/lgsm/GameServers/GarrysMod/FreeBuild/serverfiles/garrysmod/addons

echo "Done"
echo ""

sleep 1

## Pac 3 ##
echo "Deleting Old Pac3 Files..."
echo ""

rm -rf pac3/

echo "Done"
echo ""

sleep 1

echo "Redownloading Pac3..."
echo ""

git clone https://github.com/CapsAdmin/pac3.git

sleep 1

## GCompute ##

echo "Deleting Old Gcompute Dependancies..."
echo ""

rm -rf glib/
rm -rf gooey/
rm -rf vfs/
rm -rf gcodec/
rm -rf gcompute/

echo "Done"
echo ""

sleep 1

echo "Redownloading Gcompute..."
echo ""

git clone https://github.com/notcake/glib.git
git clone https://github.com/notcake/gooey.git
git clone https://github.com/notcake/vfs.git
git clone https://github.com/notcake/gcodec.git
git clone https://github.com/notcake/gcompute.git

sleep 1

## Tools ##

echo "Deleting Old Tools..."
echo ""

rm -rf advdupe2/

echo "Done"
echo ""

sleep 1

echo "Redownloading Tools..."
echo ""

git clone https://github.com/wiremod/advdupe2.git

sleep 1

## Wiremod ##

echo "Deleting Old Wiremod Files..."
echo ""

rm -rf wire/
rm -rf wire-extras/

echo "Done"
echo ""

sleep 1

echo "Redownloading Wiremod..."
echo ""

git clone https://github.com/wiremod/wire.git
git clone https://github.com/wiremod/wire-extras.git

sleep 1

## ACF / Missiles ##

echo "Deleting Old ACF files..."
echo ""

rm -rf acf/
rm -rf acf-missiles/

echo "Done"
echo ""

sleep 1

echo "Redownloading ACF files..."
echo ""

git clone https://github.com/nrlulz/ACF.git
git clone https://github.com/Bubbus/ACF-Missiles.git

sleep 1

echo ""
echo "Renaming ACF Folders..."
echo ""

mv ACF/ acf/
mv ACF-Missiles/ acf-missiles/

echo "Done"
echo ""
