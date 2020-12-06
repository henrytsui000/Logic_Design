# compile

Ubuntu:

    iverilog -o 輸出檔名 [file1.v] [file2.v] [file3.v] ...
    
windows: 

    iverilog.exe -o a .\[name].v .\[t_name].v
    
# excute

Ubuntu:

    ./輸出檔名.out
    
windows:

    vvp.exe .\a

# show wave

Ubuntu:

    gtkwave *.vcd
    
Windoes:

    gtkwave.exe .\[name].vcd
