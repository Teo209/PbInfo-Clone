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

    shopt -s nullglob
    mkdir -p outputs

    for testfile in tests/test*.txt; do
        num=$(basename "$testfile" .txt)
        num=${num#test}

        outputfile="outputs/output${num}.txt"
        solutionfile="solutions/solution${num}.txt"

        start_ns=$(date +%s%N)   # Starting time in nanoseconde
        ./main < "$testfile" > "$outputfile"  # ./main.exe if on Windows, ./main for Linux
        end_ns=$(date +%s%N)     # End time in nanoseconds

        elapsed_sec=$(awk -v start="$start_ns" -v end="$end_ns" 'BEGIN {printf "%.2f", (end - start)/1000000000}')


        if diff -q "$outputfile" "$solutionfile" >/dev/null; then
            echo -e "\e[32mCorrect!\e[0m  ${elapsed_sec}"
        else
            echo -e "\e[31mWrong!\e[0m"
        fi
    done

    make -s clean
}

testing
verify
