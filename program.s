.text
# $s3=a(n+1), $s2=a(n), $s1=a(n-1)
        addi $s1, $zero, 1      # $s1=1 :a(n-1)  
        addi $s2, $zero, 1      # $s2=1 :a(n)
        addi $s0, $zero, 1      # $s0=1 :第何項
        addi $s6, $zero, 31     # 31(0x1f)項目を求める
loop:   addi $s0, $s0, 1        # 項数++
        add  $t5, $s2, $s1      # $t5=a(n)+a(n-1)   2=1+1
        addi $s1, $s2, 0        # a(n-1)を前回のa(n)にする  
        addi $s2, $t5, 0        # a(n)を前回のa(n+1)にする
        # 項数が31になったら次の命令、項数が31でないなら4つ前に戻る
        bne $s0, $s6, loop
        add $t6, $s2, $s1       # 32項目を求める
        sw $t5, 0x2040($zero)   # 0x00002040に$t5の値を格納
        sw $t6, 0x2044($zero)   # 0x00002044に$t6の値を格納      
stop:   beq $zero, $zero, stop
.end