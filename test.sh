#!/bin/bash

testing() {
    for i in 1 2 3 4; do
        dots=$(printf "%.${i}s" "...")
        echo -ne "\rTesting$dots"
        sleep 0.1
    done
    echo
}


verify() {
    make -s || { echo -e "\n\e[1;31mCompilation failed!\e[0m"; return 1; }
    for testfile in tests/input*.txt; do
        outputfile="outputs/$(basename "$testfile" .txt).out"
        ./main < "$testfile" > "$outputfile" #./main.exe > output.txt if Windows

        if diff -q "$outputfile" solutions/$(basename "$testfile" .txt).txt >/dev/null; then
            echo -e "\e[32mCorrect!\e[0m"
        else
            echo -e "\e[31mWrong!\e[0m"
        fi
    done

    make -s clean
}

testing
verify
