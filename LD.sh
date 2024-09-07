#!/system/bin/sh

echo "Bem-vindo ao Linux Droid"

arquiv=""
dit="Linuxdroid/main"
vers="[0,0,1] Linux droid"

cat_func() {
    echo "$arquiv"
}

hist_func(){
 History                                          }
}
list_dir() {
    p="/sdcard"

    if [ ! -e "$p" ]; then
        echo "$p not found"
        exit 1
    fi

    if [ ! -d "$p" ]; then
        echo "$p is not a directory"
        exit 1
    fi

    for d in "$p"/*; do
        echo "$d"
    done
}

top_func() {
    echo "Uso da CPU"
    top -bn1 | grep "Cpu(s)"
    lscpu
}

ram_func() {
    echo "Memória RAM total:"
    free -h | awk '/Mem:/ {print $2}'

    echo "Memória livre:"
    free -h | awk '/Mem:/ {print $4}'
}

shell_func() {
    echo "Digite seu comando Shell script:"
    read -r comando
    eval "$comando"
}

nano_func()  {
    read -r text
    arquiv="$text"
}

proo() {
    echo "Modelo do processador:"
    grep "model name" /proc/cpuinfo | uniq
    echo "Número de núcleos:"
    grep "cpu cores" /proc/cpuinfo | uniq
}

rm_arquiv() {
    arquiv=""
    echo "Arquivo apagado."
}

info() {
    echo ""
    echo "EMULADOR DE TERMINAL LINUX"
    echo "GitHub|em breve"
    echo "Criador|evan"
    echo "$vers"
}

err() {
eval"$input"
   }

info_g() {
    echo "Informações do Sistema:"
    uname -a

    echo "Distribuição do Linux:"
    lsb_release -a

    echo "Uso da Memória:"
    free -h

    echo "Uso do Disco:"
    df -h

    echo "Informações do Hardware:"
    sudo lshw

    echo "Informações do Processador:"
    lscpu

    echo "Dispositivos PCI:"
    lspci

    echo "Dispositivos USB:"
    lsusb
}

USB() {
    echo "Dispositivos USB:"
    lsusb
}

dat() {
    date
}

sys() {
    echo "Informações do Sistema:"
    uname -a
}

ha() {
    echo "Informações do Hardware:"
    sudo lshw
}

dic() {
    echo "Uso do Disco:"
    df -h
}

nano30_func() {
    for i in {1..30}; do
        read -r text
        arquiv="$text"
    done
}

cd_func() {
    echo "Digite o caminho para o diretório:"
    read -r caminho
    if [ -d "$caminho" ]; then
        cd "$caminho" || exit
        echo "Você está na pasta $(pwd)"
    else
        echo "Diretório não encontrado."
    fi
}

while true; do
    read -r input

    case "$input" in
        cat)
            cat_func
            ;;
        nano)
            nano
            ;;
        /info)
            info
            ;;
        rm)
            rm_arquiv
            ;;
        shell)
            shell_func
            ;;
          clear)
          clear
          echo "bem vindo ao Linuxdroid"
          ;;
        ls)
            list_dir
            ;;
          History)
         hist
     ;;

        nano30)
            nano30_func
            ;;
        date)
            dat
            ;;
        cd)
            cd_func
            ;;
        top-cpu)
            top_func
            ;;
        top-ram)
            ram_func
            ;;
        top-g)
            info_g
            ;;
        top-disc)
            dic
            ;;
        top-usb)
            USB
            ;;
        top-proo)
            proo
            ;;
        top-hac)
            ha
            ;;
        top-sys)
            sys
            ;;
        man_nano)
            echo "EDITOR DE TEXTO NANO"
            ;;
        exit)
            echo "Saindo..."
            break
            ;;
        *)
            err
            ;;
    esac
done
