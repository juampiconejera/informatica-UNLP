        ORG 1000H
        MAYUS DB 1
        ORG 2000H
        MOV BX, OFFSET MAYUS
        MOV AL, 255 ; CANTIDAD DE NUMEROS EN ASCII
        MOV AH, 0
        MOV CL, MAYUS
LOOP:   CMP AL, AH
        JZ FIN
        INC BX
        MOV BYTE PTR [BX], 10
        INC BX
        INC CL
        MOV [BX], CL
        INC AH
        JMP LOOP
FIN:    MOV BX, OFFSET MAYUS
        INT 7
        HLT
        END