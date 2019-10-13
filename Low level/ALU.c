
#include "ALU.h"

bool ALU_execute_instruction(uint32_t A, uint32_t B, uint8_t instruction, uint32_t* reg){
    switch (instruction){
    case 0:
        if (A >= B){
            *reg = A-B;
        }
        else{
            *reg = A;
        }
        break;
    case 1:
        *reg =  A << 1;
        break;
    case 2:
        *reg =  (A << 1) + B;
        break;
    case 3:
        return A >> B & 0b1;
        break;
    case 4:
        return A == B;
        break;
    case 5:
        *reg = A - 1;
        break;
    case 6:
        *reg = A + 1;
        break;
    case 7:
        *reg = A;
        break;
    case 8:
        *reg = 0;
        break;
    case 9:
        *reg = 1;
        break;
    case 10:
        *reg = 31;
        break;
    }
    return false;
}