#!/usr/bin/env bash

bkmk_func() {
        BKMK_PATH=$HOME/.bkmkrc
        if [ ! -d $BKMK_PATH ]; then
                mkdir -p $BKMK_PATH
        fi
        if [[ "$1" == "+" ]]; then
                BKMK=$2
                echo $PWD > $BKMK_PATH/$BKMK
        elif [[ "$1" == "-" ]]; then
                BKMK=$2
                rm -f $BKMK_PATH/$BKMK
        else
                BKMK=$1
                BKMK_FILE=$(find $BKMK_PATH -type f -iname $BKMK -maxdepth 1 | head -n1)
                if [ ! -z $BKMK_FILE ] && [ -f $BKMK_FILE ]; then
                        cd $(cat $BKMK_FILE)
                fi
        fi
}
alias bkmk=bkmk_func

