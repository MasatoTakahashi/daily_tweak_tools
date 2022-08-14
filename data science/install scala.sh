curl -fLo cs https://git.io/coursier-cli-"$(uname | tr LD ld)"
chmod +x cs
./cs install scala3-compiler
./cs install scala3-repl
echo "export PATH="$PATH:/root/.local/share/coursier/bin"" >> ~/.profile
source ~/.profile
wget https://ftp.jaist.ac.jp/pub/apache/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
tar xvf spark-3.1.2-bin-hadoop3.2.tgz
